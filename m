Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROPOH-0005br-AB
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 08:49:42 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 23:43:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="83351210"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 23:43:20 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 23:42:56 -0800
Message-Id: <cdcba8eec6fff45124af77d9040b8a9108ef0f35.1320910946.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (v2) 14/33] task-core-x11: use VIRTUAL-RUNTIME variables for xserver_common and graphical_init_manager
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Nov 2011 07:49:43 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-sato/tasks/task-core-x11.bb |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/tasks/task-core-x11.bb b/meta/recipes-sato/tasks/task-core-x11.bb
index 26d550a..106bc0f 100644
--- a/meta/recipes-sato/tasks/task-core-x11.bb
+++ b/meta/recipes-sato/tasks/task-core-x11.bb
@@ -30,6 +30,12 @@ ALLOW_EMPTY = "1"
 FILEMANAGER ?= "pcmanfm"
 FILEMANAGER_mips ?= ""
 
+# xserver-common, x11-common
+VIRTUAL-RUNTIME_xserver_common ?= "x11-common"
+
+# elsa, xserver-nodm-init
+VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
+
 
 RDEPENDS_task-core-x11-base = "\
     dbus \
@@ -42,8 +48,8 @@ RDEPENDS_task-core-x11-base = "\
     matchbox-desktop \
     matchbox-session \
     ${XSERVER} \
-    x11-common \
-    xserver-nodm-init \
+    ${VIRTUAL-RUNTIME_xserver_common} \
+    ${VIRTUAL-RUNTIME_graphical_init_manager} \
     liberation-fonts \
     xauth \
     xhost \
-- 
1.7.6.4



