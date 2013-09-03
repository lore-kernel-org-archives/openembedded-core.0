Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D8C266BEF3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 05:19:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r835JGn2029526
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Sep 2013 22:19:16 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 2 Sep 2013 22:19:15 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Sep 2013 13:19:23 +0800
Message-ID: <57af6c0254630ff3b483a1f58366af931b5e9d12.1378185423.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1378185423.git.rongqing.li@windriver.com>
References: <cover.1378185423.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] distcc: add init.d/distcc status command for LSB compliance
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
X-List-Received-Date: Tue, 03 Sep 2013 05:19:16 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/distcc/files/distcc |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/distcc/files/distcc b/meta/recipes-devtools/distcc/files/distcc
index 513bc48..c7c414d 100755
--- a/meta/recipes-devtools/distcc/files/distcc
+++ b/meta/recipes-devtools/distcc/files/distcc
@@ -35,6 +35,9 @@ test -x $DAEMON || exit 0
 
 set -e
 
+# Source function library.
+. /etc/init.d/functions
+
 # construct access list
 ALLOW=""
 for net in $ALLOWEDNETS
@@ -94,9 +97,14 @@ case "$1" in
 	}
 	echo "."
 	;;
+
+   status)
+	status $DAEMON
+	exit $?
+	;;
   *)
 	N=/etc/init.d/$NAME
-	echo "Usage: $N {start|stop|restart|force-reload}" >&2
+	echo "Usage: $N {start|stop|restart|force-reload|status}" >&2
 	exit 1
 	;;
 esac
-- 
1.7.10.4


