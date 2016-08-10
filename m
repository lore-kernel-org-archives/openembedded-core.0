Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8ECCC7720F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 09:29:41 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 10 Aug 2016 02:29:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,499,1464678000"; d="scan'208";a="153537090"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 10 Aug 2016 02:29:42 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 726866A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 02:29:27 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Aug 2016 12:30:25 +0300
Message-Id: <1470821429-6094-7-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1470821429-6094-1-git-send-email-maxin.john@intel.com>
References: <1470821429-6094-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 06/10] pointercal: remove recipe
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
X-List-Received-Date: Wed, 10 Aug 2016 09:29:41 -0000

Remove pointercal recipe along with xtscal since we replace it with
xinput-calibrator

[YOCTO #9365]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-bsp/pointercal/pointercal/COPYING     |   2 --
 meta/recipes-bsp/pointercal/pointercal/pointercal  |   0
 .../pointercal/pointercal/qemuarm/pointercal       |   1 -
 .../pointercal/pointercal/qemuarmv6/pointercal     |   1 -
 .../pointercal/pointercal/qemuarmv7/pointercal     |   1 -
 .../pointercal/pointercal/qemumips/pointercal      |   1 -
 .../pointercal/pointercal/qemuppc/pointercal       | Bin 36 -> 0 bytes
 .../pointercal/pointercal/qemux86-64/pointercal    |   1 -
 .../pointercal/pointercal/qemux86/pointercal       |   1 -
 meta/recipes-bsp/pointercal/pointercal_0.0.bb      |  22 ---------------------
 10 files changed, 30 deletions(-)
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/COPYING
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemuarm/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemuarmv6/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemuarmv7/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemumips/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemuppc/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemux86-64/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal/qemux86/pointercal
 delete mode 100644 meta/recipes-bsp/pointercal/pointercal_0.0.bb

diff --git a/meta/recipes-bsp/pointercal/pointercal/COPYING b/meta/recipes-bsp/pointercal/pointercal/COPYING
deleted file mode 100644
index 63f5293..0000000
--- a/meta/recipes-bsp/pointercal/pointercal/COPYING
+++ /dev/null
@@ -1,2 +0,0 @@
-This is a blank COPYING file, and should be filled in by original author in future.
-
diff --git a/meta/recipes-bsp/pointercal/pointercal/pointercal b/meta/recipes-bsp/pointercal/pointercal/pointercal
deleted file mode 100644
index e69de29..0000000
diff --git a/meta/recipes-bsp/pointercal/pointercal/qemuarm/pointercal b/meta/recipes-bsp/pointercal/pointercal/qemuarm/pointercal
deleted file mode 100644
index abd84ca..0000000
--- a/meta/recipes-bsp/pointercal/pointercal/qemuarm/pointercal
+++ /dev/null
@@ -1 +0,0 @@
-8313 4 -8526 7 8334 -82604 65536
diff --git a/meta/recipes-bsp/pointercal/pointercal/qemuarmv6/pointercal b/meta/recipes-bsp/pointercal/pointercal/qemuarmv6/pointercal
deleted file mode 100644
index abd84ca..0000000
--- a/meta/recipes-bsp/pointercal/pointercal/qemuarmv6/pointercal
+++ /dev/null
@@ -1 +0,0 @@
-8313 4 -8526 7 8334 -82604 65536
diff --git a/meta/recipes-bsp/pointercal/pointercal/qemuarmv7/pointercal b/meta/recipes-bsp/pointercal/pointercal/qemuarmv7/pointercal
deleted file mode 100644
index abd84ca..0000000
--- a/meta/recipes-bsp/pointercal/pointercal/qemuarmv7/pointercal
+++ /dev/null
@@ -1 +0,0 @@
-8313 4 -8526 7 8334 -82604 65536
diff --git a/meta/recipes-bsp/pointercal/pointercal/qemumips/pointercal b/meta/recipes-bsp/pointercal/pointercal/qemumips/pointercal
deleted file mode 100644
index abd84ca..0000000
--- a/meta/recipes-bsp/pointercal/pointercal/qemumips/pointercal
+++ /dev/null
@@ -1 +0,0 @@
-8313 4 -8526 7 8334 -82604 65536
diff --git a/meta/recipes-bsp/pointercal/pointercal/qemuppc/pointercal b/meta/recipes-bsp/pointercal/pointercal/qemuppc/pointercal
deleted file mode 100644
index c2d6e37bf0c0d956ba17ba9955613c4cee5a147a..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 36
mcmXpsFt#*Q&;=n=3lPgl!O+0i%uK=9!qiZ~%+%D_i~#_8+XjmO

diff --git a/meta/recipes-bsp/pointercal/pointercal/qemux86-64/pointercal b/meta/recipes-bsp/pointercal/pointercal/qemux86-64/pointercal
deleted file mode 100644
index 640053d..0000000
--- a/meta/recipes-bsp/pointercal/pointercal/qemux86-64/pointercal
+++ /dev/null
@@ -1 +0,0 @@
-1280 0 1002 0 960 328 65536
diff --git a/meta/recipes-bsp/pointercal/pointercal/qemux86/pointercal b/meta/recipes-bsp/pointercal/pointercal/qemux86/pointercal
deleted file mode 100644
index 640053d..0000000
--- a/meta/recipes-bsp/pointercal/pointercal/qemux86/pointercal
+++ /dev/null
@@ -1 +0,0 @@
-1280 0 1002 0 960 328 65536
diff --git a/meta/recipes-bsp/pointercal/pointercal_0.0.bb b/meta/recipes-bsp/pointercal/pointercal_0.0.bb
deleted file mode 100644
index df735a5..0000000
--- a/meta/recipes-bsp/pointercal/pointercal_0.0.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Touchscreen calibration data"
-SECTION = "base"
-PR = "r11"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4b5fcfc87fb615860d398b5e38685edf"
-
-SRC_URI = "file://pointercal \
-           file://COPYING"
-
-S = "${WORKDIR}"
-
-do_install() {
-	# Only install file if it has a contents
-	if [ -s ${S}/pointercal ]; then
-	        install -d ${D}${sysconfdir}/
-	        install -m 0644 ${S}/pointercal ${D}${sysconfdir}/
-	fi
-}
-
-ALLOW_EMPTY_${PN} = "1"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-INHIBIT_DEFAULT_DEPS = "1"
-- 
2.4.0


