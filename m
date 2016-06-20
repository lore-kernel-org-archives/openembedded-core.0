Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 69220731AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 12:57:07 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 20 Jun 2016 05:57:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,498,1459839600"; d="scan'208";a="125284276"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 20 Jun 2016 05:57:05 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jun 2016 15:56:45 +0300
Message-Id: <1466427408-31744-3-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466427408-31744-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1466427408-31744-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/6] security_flags.inc: enable PIE for a few recipes
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
X-List-Received-Date: Mon, 20 Jun 2016 12:57:07 -0000

They used to fail with PIE enabled, but no longer do.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/security_flags.inc | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index a7be185..f3e4bf0 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -29,10 +29,7 @@ SECURITY_CFLAGS_pn-libmatchbox_powerpc = ""
 SECURITY_CFLAGS_pn-lttng-tools_arm = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-aspell = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-beecrypt = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-blktrace = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-coreutils = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-cups = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-db = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-directfb = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-glibc = ""
 SECURITY_CFLAGS_pn-glibc-initial = ""
@@ -40,7 +37,6 @@ SECURITY_CFLAGS_pn-elfutils = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-enchant = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-expect = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-flac = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-flex = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gcc = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gcc-runtime = ""
 SECURITY_CFLAGS_pn-gcc-sanitizers = "${SECURITY_NO_PIE_CFLAGS}"
@@ -53,8 +49,6 @@ SECURITY_CFLAGS_pn-grub-efi-native = ""
 SECURITY_CFLAGS_pn-grub-efi-x86-native = ""
 SECURITY_CFLAGS_pn-grub-efi-i586-native = ""
 SECURITY_CFLAGS_pn-grub-efi-x86-64-native = ""
-SECURITY_CFLAGS_pn-gst-plugins-bad = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-gst-plugins-gl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gstreamer1.0-plugins-bad = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gstreamer1.0-plugins-good = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-harfbuzz = "${SECURITY_NO_PIE_CFLAGS}"
@@ -64,19 +58,14 @@ SECURITY_CFLAGS_pn-libaio = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libcap = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libgcc = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libid3tag = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-libnewt = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libnewt-python = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libglu = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libpcap = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libpcre = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libproxy = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-lttng-ust = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-mesa = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-mesa-gl = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-openssl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-opensp = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-ppp = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-python = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python-pycurl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python-smartpm = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python-numpy = "${SECURITY_NO_PIE_CFLAGS}"
@@ -85,7 +74,6 @@ SECURITY_CFLAGS_pn-python3-pycairo = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python3 = "${SECURITY_NO_PIE_CFLAGS}"
 # Revert RPM to using internally supported values
 SECURITY_CFLAGS_pn-rpm = "${lcl_maybe_fortify} -fstack-protector"
-SECURITY_CFLAGS_pn-syslinux = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-tcl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-tiff = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-uclibc = ""
@@ -93,10 +81,6 @@ SECURITY_CFLAGS_pn-uclibc-initial = ""
 SECURITY_CFLAGS_pn-valgrind = ""
 SECURITY_CFLAGS_pn-zlib = "${SECURITY_NO_PIE_CFLAGS}"
 
-# These 2 have text relco errors with the pie options enabled
-SECURITY_CFLAGS_pn-ltp = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-pulseaudio = "${SECURITY_NO_PIE_CFLAGS}"
-
 # Recipes which fail to compile when elevating -Wformat-security to an error
 SECURITY_STRINGFORMAT_pn-busybox = ""
 SECURITY_STRINGFORMAT_pn-console-tools = ""
-- 
2.8.1


