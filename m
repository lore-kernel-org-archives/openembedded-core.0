Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoPL-0000Cj-St
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:53:56 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115475"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:42:23 -0700
Message-Id: <4a121131a397828f76a5540e6bbf86e0e0f61428.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 44/45] binutils: Drop old/stale/broken csl recipe
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
X-List-Received-Date: Fri, 25 May 2012 06:53:58 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The patches this recipe refers to don't exist so nobody can have
been using this so lets just remove it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../binutils/binutils-cross_csl-arm-2008q1.bb      |    3 --
 .../binutils/binutils_csl-arm-2008q1.bb            |   25 --------------------
 2 files changed, 0 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-devtools/binutils/binutils-cross_csl-arm-2008q1.bb
 delete mode 100644 meta/recipes-devtools/binutils/binutils_csl-arm-2008q1.bb

diff --git a/meta/recipes-devtools/binutils/binutils-cross_csl-arm-2008q1.bb b/meta/recipes-devtools/binutils/binutils-cross_csl-arm-2008q1.bb
deleted file mode 100644
index 8ab1e7f..0000000
--- a/meta/recipes-devtools/binutils/binutils-cross_csl-arm-2008q1.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require binutils_csl-arm-2008q1.bb
-require binutils-cross.inc
-PR = "r1"
diff --git a/meta/recipes-devtools/binutils/binutils_csl-arm-2008q1.bb b/meta/recipes-devtools/binutils/binutils_csl-arm-2008q1.bb
deleted file mode 100644
index 182b01f..0000000
--- a/meta/recipes-devtools/binutils/binutils_csl-arm-2008q1.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-require binutils.inc
-
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "\
-     http://www.codesourcery.com/gnu_toolchains/arm/portal/package2553/public/arm-none-eabi/arm-2008q1-126-arm-none-eabi.src.tar.bz2 \
-     file://binutils-2.16.91.0.6-objcopy-rename-errorcode.patch \
-     file://binutils-uclibc-100-uclibc-conf.patch \
-     file://110-arm-eabi-conf.patch \
-     file://binutils-uclibc-300-001_ld_makefile_patch.patch \
-     file://binutils-uclibc-300-006_better_file_error.patch \
-     file://binutils-uclibc-300-012_check_ldrunpath_length.patch \
-     file://docs_hack2.patch \
-     "
-
-PV = "2.18+csl-arm-2008q1-126"
-
-S = "${WORKDIR}/binutils-stable"
-
-do_unpack2() {
-	cd ${WORKDIR}
-	tar -xvjf ./arm-2008q1-126-arm-none-eabi/binutils-2008q1-126.tar.bz2
-}
-
-addtask unpack2 after do_unpack before do_patch
-- 
1.7.7.6



