Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SoHXV-00063A-HS
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:14:25 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jul 2012 10:03:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190326805"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.244])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 10:03:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 18:03:09 +0100
Message-Id: <75c1c73ddeb6a48a0c004185e8fa3d32d2806ebe.1341853333.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1341853333.git.paul.eggleton@linux.intel.com>
References: <cover.1341853333.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1341853333.git.paul.eggleton@linux.intel.com>
References: <cover.1341853333.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] core-image-*: remove copyright notices
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
X-List-Received-Date: Mon, 09 Jul 2012 17:14:25 -0000

These image recipes are meant to be examples that people can copy and
modify completely for their own purposes, and most of them are so
trivial they don't really need copyright notices anyway, so trim them
off.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/images/core-image-base.bb        |    3 ---
 meta/recipes-core/images/core-image-core.bb        |    3 ---
 meta/recipes-core/images/core-image-minimal-dev.bb |    3 ---
 .../images/core-image-minimal-mtdutils.bb          |    3 ---
 meta/recipes-core/images/core-image-minimal.bb     |    3 ---
 meta/recipes-rt/images/core-image-rt-sdk.bb        |    3 ---
 meta/recipes-rt/images/core-image-rt.bb            |    3 ---
 meta/recipes-sato/images/core-image-sato-dev.bb    |    3 ---
 meta/recipes-sato/images/core-image-sato-sdk.bb    |    3 ---
 meta/recipes-sato/images/core-image-sato.bb        |    3 ---
 10 files changed, 30 deletions(-)

diff --git a/meta/recipes-core/images/core-image-base.bb b/meta/recipes-core/images/core-image-base.bb
index 71ff3b9..30c8dd1 100644
--- a/meta/recipes-core/images/core-image-base.bb
+++ b/meta/recipes-core/images/core-image-base.bb
@@ -1,6 +1,3 @@
-#
-# Copyright (C) 2007 OpenedHand Ltd.
-#
 DESCRIPTION = "A console-only image that fully supports the target device \
 hardware."
 
diff --git a/meta/recipes-core/images/core-image-core.bb b/meta/recipes-core/images/core-image-core.bb
index ae32be8..ed33e12 100644
--- a/meta/recipes-core/images/core-image-core.bb
+++ b/meta/recipes-core/images/core-image-core.bb
@@ -1,6 +1,3 @@
-#
-# Copyright (C) 2007 OpenedHand Ltd.
-#
 DESCRIPTION = "An X11 image with simple applications such as terminal, editor, \
 and file manager."
 
diff --git a/meta/recipes-core/images/core-image-minimal-dev.bb b/meta/recipes-core/images/core-image-minimal-dev.bb
index 4e9cb35..93ead20 100644
--- a/meta/recipes-core/images/core-image-minimal-dev.bb
+++ b/meta/recipes-core/images/core-image-minimal-dev.bb
@@ -1,6 +1,3 @@
-#
-# Copyright (C) 2007 OpenedHand Ltd.
-#
 require core-image-minimal.bb
 
 DESCRIPTION = "A small image just capable of allowing a device to boot and \
diff --git a/meta/recipes-core/images/core-image-minimal-mtdutils.bb b/meta/recipes-core/images/core-image-minimal-mtdutils.bb
index 331f16c..c92234c 100644
--- a/meta/recipes-core/images/core-image-minimal-mtdutils.bb
+++ b/meta/recipes-core/images/core-image-minimal-mtdutils.bb
@@ -1,6 +1,3 @@
-#
-# Copyright (C) 2008 OpenedHand Ltd.
-#
 require core-image-minimal.bb
 
 DESCRIPTION = "Small image capable of booting a device with support for the \
diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
index 7953b80..089a728 100644
--- a/meta/recipes-core/images/core-image-minimal.bb
+++ b/meta/recipes-core/images/core-image-minimal.bb
@@ -1,6 +1,3 @@
-#
-# Copyright (C) 2007 OpenedHand Ltd.
-#
 DESCRIPTION = "A small image just capable of allowing a device to boot."
 
 IMAGE_INSTALL = "task-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${CORE_IMAGE_EXTRA_INSTALL}"
diff --git a/meta/recipes-rt/images/core-image-rt-sdk.bb b/meta/recipes-rt/images/core-image-rt-sdk.bb
index 29512e3..f994a04 100644
--- a/meta/recipes-rt/images/core-image-rt-sdk.bb
+++ b/meta/recipes-rt/images/core-image-rt-sdk.bb
@@ -1,6 +1,3 @@
-#
-# Copyright (C) 2011 Intel Corporation.
-#
 require recipes-core/images/core-image-minimal.bb
 
 DESCRIPTION = "Small image capable of booting a device with a test suite and \
diff --git a/meta/recipes-rt/images/core-image-rt.bb b/meta/recipes-rt/images/core-image-rt.bb
index 9b816bb..f749bfe 100644
--- a/meta/recipes-rt/images/core-image-rt.bb
+++ b/meta/recipes-rt/images/core-image-rt.bb
@@ -1,6 +1,3 @@
-#
-# Copyright (C) 2010 Intel Corporation.
-#
 require recipes-core/images/core-image-minimal.bb
 
 DESCRIPTION = "A small image just capable of allowing a device to boot plus a \
diff --git a/meta/recipes-sato/images/core-image-sato-dev.bb b/meta/recipes-sato/images/core-image-sato-dev.bb
index bd31727..5ee9a04 100644
--- a/meta/recipes-sato/images/core-image-sato-dev.bb
+++ b/meta/recipes-sato/images/core-image-sato-dev.bb
@@ -1,6 +1,3 @@
-#
-# Copyright (C) 2007 OpenedHand Ltd.
-#
 DESCRIPTION = "Image with Sato for development work. It includes everything \
 within core-image-sato plus a native toolchain, application development and \
 testing libraries, profiling and debug symbols."
diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recipes-sato/images/core-image-sato-sdk.bb
index 39742ef..bc942ad 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
@@ -1,6 +1,3 @@
-#
-# Copyright (C) 2007 OpenedHand Ltd.
-#
 DESCRIPTION = "Image with Sato support that includes everything within \
 core-image-sato plus meta-toolchain, development headers and libraries to \
 form a standalone SDK."
diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index b6c51fb..c228a35 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -1,6 +1,3 @@
-#
-# Copyright (C) 2007 OpenedHand Ltd.
-#
 DESCRIPTION = "Image with Sato, a mobile environment and visual style for \
 mobile devices. The image supports X11 with a Sato theme, Pimlico \
 applications, and contains terminal, editor, and file manager."
-- 
1.7.9.5



