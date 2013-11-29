Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 146D36D77B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 10:56:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rATAuaSk009082
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 02:56:36 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 29 Nov 2013 02:56:35 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Nov 2013 18:56:34 +0800
Message-ID: <1385722594-3602-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
MIME-Version: 1.0
Subject: [PATCH] apmd: add status command
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Nov 2013 10:56:37 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 meta/recipes-bsp/apmd/apmd-3.2.2-14/init | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/apmd/apmd-3.2.2-14/init b/meta/recipes-bsp/apmd/apmd-3.2.2-14/init
index 268d4b2..c0b41aa 100755
--- a/meta/recipes-bsp/apmd/apmd-3.2.2-14/init
+++ b/meta/recipes-bsp/apmd/apmd-3.2.2-14/init
@@ -8,6 +8,9 @@
 # Short-Description: Advanced Power Management daemon
 ### END INIT INFO
 
+# Source function library.
+. /etc/init.d/functions
+
 PATH=/bin:/usr/bin:/sbin:/usr/sbin
 
 [ -f /etc/default/rcS ] && . /etc/default/rcS
@@ -30,13 +33,17 @@ case "$1" in
 		-x /usr/sbin/apmd
 	echo "apmd."
 	;;
+    status)
+	status /usr/sbin/apmd;
+	exit $?
+	;;
     restart|force-reload) 
 	$0 stop
 	$0 start
 	exit
 	;;
     *)
-	echo "Usage: /etc/init.d/apmd {start|stop|restart|force-reload}"
+	echo "Usage: /etc/init.d/apmd {start|stop|status|restart|force-reload}"
 	exit 1
 	;;
 esac
-- 
1.8.3


