Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6717F6B88D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 06:17:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7M6HL4C021801
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 23:17:21 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 21 Aug 2013 23:17:20 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Aug 2013 14:17:09 +0800
Message-ID: <2b81ec141f73dadea394faaa0f4204f31200a94c.1377151850.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1377151850.git.jackie.huang@windriver.com>
References: <cover.1377151850.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] dbus: add init.d/dbus-1 status command for LSB compliance
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
X-List-Received-Date: Thu, 22 Aug 2013 06:17:20 -0000
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


