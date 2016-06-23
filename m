Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 32D9F602D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 19:04:25 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Jun 2016 12:04:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,518,1459839600"; d="scan'208";a="834070116"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Jun 2016 12:03:59 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jun 2016 22:03:47 +0300
Message-Id: <1466708628-25003-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] security_flags.inc: enable PIE for a few recipes
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
X-List-Received-Date: Thu, 23 Jun 2016 19:04:26 -0000

They used to fail with PIE enabled, but no longer do.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/security_flags.inc | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index a7be185..83b9dc0 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -29,10 +29,8 @@ SECURITY_CFLAGS_pn-libmatchbox_powerpc = ""
 SECURITY_CFLAGS_pn-lttng-tools_arm = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-aspell = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-beecrypt = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-blktrace = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-coreutils = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-cups = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-db = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-directfb = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-glibc = ""
 SECURITY_CFLAGS_pn-glibc-initial = ""
@@ -40,7 +38,6 @@ SECURITY_CFLAGS_pn-elfutils = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-enchant = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-expect = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-flac = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-flex = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gcc = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gcc-runtime = ""
 SECURITY_CFLAGS_pn-gcc-sanitizers = "${SECURITY_NO_PIE_CFLAGS}"
@@ -53,8 +50,6 @@ SECURITY_CFLAGS_pn-grub-efi-native = ""
 SECURITY_CFLAGS_pn-grub-efi-x86-native = ""
 SECURITY_CFLAGS_pn-grub-efi-i586-native = ""
 SECURITY_CFLAGS_pn-grub-efi-x86-64-native = ""
-SECURITY_CFLAGS_pn-gst-plugins-bad = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-gst-plugins-gl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gstreamer1.0-plugins-bad = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gstreamer1.0-plugins-good = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-harfbuzz = "${SECURITY_NO_PIE_CFLAGS}"
@@ -64,19 +59,15 @@ SECURITY_CFLAGS_pn-libaio = "${SECURITY_NO_PIE_CFLAGS}"
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
 SECURITY_CFLAGS_pn-openssl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-opensp = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-ppp = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-python = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python-pycurl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python-smartpm = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python-numpy = "${SECURITY_NO_PIE_CFLAGS}"
@@ -85,7 +76,6 @@ SECURITY_CFLAGS_pn-python3-pycairo = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python3 = "${SECURITY_NO_PIE_CFLAGS}"
 # Revert RPM to using internally supported values
 SECURITY_CFLAGS_pn-rpm = "${lcl_maybe_fortify} -fstack-protector"
-SECURITY_CFLAGS_pn-syslinux = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-tcl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-tiff = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-uclibc = ""
@@ -93,10 +83,6 @@ SECURITY_CFLAGS_pn-uclibc-initial = ""
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


