Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id C962377BD3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:40:26 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 21 Apr 2017 05:40:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,229,1488873600"; d="scan'208";a="251889272"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2017 05:40:27 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 15:39:59 +0300
Message-Id: <f48b227d578d9b712347d7329714105a33e54bd8.1492777818.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1492777818.git.alexander.kanavin@linux.intel.com>
References: <cover.1492777818.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/11] libunwind: update to 1.2
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
X-List-Received-Date: Fri, 21 Apr 2017 12:40:27 -0000

Switch to using tarballs as git is unreliable (not responding right now).

LICENSE file is gone; COPYING has an additional line on top with
copyright attribution, the license text that follows has not changed.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/libunwind/libunwind.inc                     | 2 +-
 .../libunwind/{libunwind_git.bb => libunwind_1.2.bb}             | 9 +++------
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-support/libunwind/{libunwind_git.bb => libunwind_1.2.bb} (81%)

diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
index e4ae8df278f..4f64ad7f875 100644
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -2,7 +2,7 @@ SUMMARY = "Library for obtaining the call-chain of a program"
 DESCRIPTION = "a portable and efficient C programming interface (API) to determine the call-chain of a program"
 HOMEPAGE = "http://www.nongnu.org/libunwind"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3fced11d6df719b47505837a51c16ae5"
+LIC_FILES_CHKSUM = "file://COPYING;beginline=3;md5=3fced11d6df719b47505837a51c16ae5"
 DEPENDS += "libatomic-ops"
 
 inherit autotools
diff --git a/meta/recipes-support/libunwind/libunwind_git.bb b/meta/recipes-support/libunwind/libunwind_1.2.bb
similarity index 81%
rename from meta/recipes-support/libunwind/libunwind_git.bb
rename to meta/recipes-support/libunwind/libunwind_1.2.bb
index b637c5c4482..a398d332e2c 100644
--- a/meta/recipes-support/libunwind/libunwind_git.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.2.bb
@@ -1,10 +1,9 @@
 require libunwind.inc
 
-PV = "1.1+git${SRCPV}"
+SRC_URI[md5sum] = "eefcb5d7f78fdc8f1ed172a26ea4202f"
+SRC_URI[sha256sum] = "1de38ffbdc88bd694d10081865871cd2bfbb02ad8ef9e1606aee18d65532b992"
 
-SRCREV = "bc8698fd7ed13a629a8ec3cb2a89bd74f9d8b5c0"
-
-SRC_URI = "git://git.sv.gnu.org/libunwind.git \
+SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV}.tar.gz \
            file://Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch \
            file://0001-backtrace-Use-only-with-glibc-and-uclibc.patch \
            file://0001-x86-Stub-out-x86_local_resume.patch \
@@ -25,6 +24,4 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 SECURITY_CFLAGS_remove_aarch64 = "-fpie"
 SECURITY_CFLAGS_append_aarch64 = " -fPIE"
 
-S = "${WORKDIR}/git"
-
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
-- 
2.11.0


