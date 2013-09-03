Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F176F6BCA9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 05:19:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r835JIh4015181
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Sep 2013 22:19:18 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 2 Sep 2013 22:19:17 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Sep 2013 13:19:24 +0800
Message-ID: <dab1b5bca3fb63e0731aa7520d22d6504bc8e0b0.1378185423.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1378185423.git.rongqing.li@windriver.com>
References: <cover.1378185423.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] irda-utils: add init.d/irattach status command for LSB compliance
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
X-List-Received-Date: Tue, 03 Sep 2013 05:19:17 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/init |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/init b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/init
index 14efb94..b8038e0 100755
--- a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/init
+++ b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/init
@@ -8,6 +8,9 @@
 # Short-Description: Infrared port support
 ### END INIT INFO
 
+# Source function library.
+. /etc/init.d/functions
+
 module_id() {
         awk 'BEGIN { FS=": " } /Hardware/ { print $2 } ' </proc/cpuinfo
 }
@@ -62,9 +65,13 @@ case "$1" in
 		killall irattach > /dev/null 2>&1
         echo "$NAME."
         ;;
+  status)
+	status irattach
+	exit $?
+	;;
   *)
         N=/etc/init.d/$NAME
-        echo "Usage: $N {start|stop|restart|force-reload}" >&2
+        echo "Usage: $N {start|stop|restart|force-reload|status}" >&2
         exit 1
         ;;
 esac
-- 
1.7.10.4


