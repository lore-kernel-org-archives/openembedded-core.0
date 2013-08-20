Return-Path: <Jackie.Huang@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 368F16B89E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 03:25:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7K3PoEC001308
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 23:25:51 -0400 (EDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 19 Aug 2013 20:25:49 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Aug 2013 11:25:41 +0800
Message-ID: <0cc2d3a386e21db51d60ccf5dbfbd309329e7473.1376968627.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1376968627.git.jackie.huang@windriver.com>
References: <cover.1376968627.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] dbus: add init.d/dbus-1 status command for LSB compliance
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
X-List-Received-Date: Tue, 20 Aug 2013 03:25:52 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init b/meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init
index 0351190..04025e6 100644
--- a/meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init
+++ b/meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init
@@ -16,6 +16,9 @@
 
 set -e
 
+# Source function library.
+. /etc/init.d/functions
+
 DAEMON=@bindir@/dbus-daemon
 NAME=dbus
 DAEMONUSER=messagebus           # must match /etc/dbus-1/system.conf
@@ -99,6 +102,10 @@ case "$1" in
   stop)
     shut_it_down
   ;;
+  status)
+    status $DAEMON
+    exit $?
+  ;;
   reload|force-reload)
     reload_it
   ;;
@@ -108,7 +115,7 @@ case "$1" in
     start_it_up
   ;;
   *)
-    echo "Usage: /etc/init.d/$NAME {start|stop|restart|reload|force-reload}" >&2
+    echo "Usage: /etc/init.d/$NAME {start|stop|status|restart|reload|force-reload}" >&2
     exit 1
   ;;
 esac
-- 
1.7.4.1


