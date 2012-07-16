Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SqnhN-0006t0-NK
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 17:59:02 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2012 08:47:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193443322"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2012 08:47:39 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 08:47:15 -0700
Message-Id: <d67e47bd457de90b19428245644dc64ecf4ba11a.1342453118.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/30] linux-libc-headers: updated to 3.4.3
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
X-List-Received-Date: Mon, 16 Jul 2012 15:59:04 -0000

From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>

Tested by building core-image-sato-sdk.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 .../linux-libc-headers/linux-libc-headers_3.4.3.bb |    6 ++++++
 .../linux-libc-headers/linux-libc-headers_3.4.bb   |    6 ------
 3 files changed, 7 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index f11e687..0a068be 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.22"
 EGLIBCVERSION ?= "2.15"
 UCLIBCVERSION ?= "0.9.33"
-LINUXLIBCVERSION ?= "3.4"
+LINUXLIBCVERSION ?= "3.4.3"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
new file mode 100644
index 0000000..6f8d9e8
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
@@ -0,0 +1,6 @@
+require linux-libc-headers.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "3aefa02db55715d627ed23a01667057d"
+SRC_URI[sha256sum] = "17f1256daa289dde1a0a587c9753556d37a52770f7c4efcf2666fd4796a6eacc"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
deleted file mode 100644
index 9e8c88f..0000000
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require linux-libc-headers.inc
-
-PR = "r0"
-
-SRC_URI[md5sum] = "146af0160fc7a60cf9acf44aec13482b"
-SRC_URI[sha256sum] = "a797a15d0b6228381507c14ecf4eec4a6cc5c77cfd521ba3b3e1325e85b5b16d"
-- 
1.7.7.6



