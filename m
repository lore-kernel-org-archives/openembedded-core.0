Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 376526D681
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 10:18:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAQAISTd013973
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 02:18:28 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 26 Nov 2013 02:18:28 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Nov 2013 18:18:26 +0800
Message-ID: <1385461106-9117-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
MIME-Version: 1.0
Subject: [PATCH] xinetd: add status of init.d command
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
X-List-Received-Date: Tue, 26 Nov 2013 10:18:29 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 meta/recipes-extended/xinetd/xinetd/xinetd.init | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/xinetd/xinetd/xinetd.init b/meta/recipes-extended/xinetd/xinetd/xinetd.init
index 26dbea7..777c2c8 100644
--- a/meta/recipes-extended/xinetd/xinetd/xinetd.init
+++ b/meta/recipes-extended/xinetd/xinetd/xinetd.init
@@ -2,6 +2,9 @@
 #
 # /etc/init.d/xinetd  --  script to start and stop xinetd.
 
+# Source function library.
+. /etc/init.d/functions
+
 if test -f /etc/default/xinetd; then
 	. /etc/default/xinetd
 fi
@@ -33,6 +36,10 @@ case "$1" in
 	start-stop-daemon --stop --signal 3 --quiet --exec /usr/sbin/xinetd
 	echo "."
 	;;
+    status)
+	status /usr/sbin/xinetd;
+	exit $?
+	;;
     reload)
 	echo -n "Reloading internet superserver configuration: xinetd"
 	start-stop-daemon --stop --signal 1 --quiet --exec /usr/sbin/xinetd
@@ -49,7 +56,7 @@ case "$1" in
 	$0 start
 	;;
     *)
-	echo "Usage: /etc/init.d/xinetd {start|stop|reload|force-reload|restart}"
+	echo "Usage: /etc/init.d/xinetd {start|stop|status|reload|force-reload|restart}"
 	exit 1
 	;;
 esac
-- 
1.8.3


