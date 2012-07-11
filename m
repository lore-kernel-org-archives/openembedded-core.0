Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1SowhW-0000Wu-PT
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 15:11:30 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Jul 2012 06:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="164249595"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.145])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2012 06:00:17 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2012 16:02:19 +0300
Message-Id: <1342011739-6416-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] linux-libc-headers: updated to 3.4.3
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
X-List-Received-Date: Wed, 11 Jul 2012 13:11:31 -0000

Tested by building core-image-sato-sdk.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
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
1.7.9.5



