Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD892E63C8C
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:55 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29054.1769951566800293945
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Db0Ze5om;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=cR3YDRDY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019c19559939-c2eafc50-a326-4a53-8a8c-f5befac7f520-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951566;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=89oTXnH7AG4DCwb6YjEv4fPKIzucA7vuBeUgiGDfwIY=;
	b=Db0Ze5omrBFmRmWy7m7TcBYzaiIDAZUJ6tpOvTDwa2SicmyDlUn1SWr0T5KS0CiC
	KZwtuTgv9fMOVXfdFyWqGp06fTBdNqesTDhr4mUzkzmCW9pzrcjW876uGLYpgw7qD1n
	kVA+LAS72r7D5VYMO8pStkgcXQlah9Abls4UO1Dw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951566;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=89oTXnH7AG4DCwb6YjEv4fPKIzucA7vuBeUgiGDfwIY=;
	b=cR3YDRDYLKkEmbJFgfaVrxhqei/49xMNLx5UNF8gk2CQXTs+jJ7iJcNPlVqwQ1ew
	M3K94U6mm1GF19DHGFutAYnemdPKwFi8UQkxonjqRik2ubpcwHkbIFVnP7RCo5XC3Go
	fkbbOlIsZdhTv29e5rmlj5gp0i3JMiSA/SjCgYPw=
Content-Type: multipart/mixed; boundary="===============7835055325563685355=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH]
 libxxf86vm,libxdamage,libxmu,libxpm,libxext,libxrandr,libxinerama,libxkbfile,libxcomposite,libxvmc:
 upgrading to 1.1.7,1.1.7,1.3.1,3.5.18,1.3.7,1.5.5,1.1.6,1.2.0,0.4.7,1.0.15
 FAILED
Message-ID: <0101019c19559939-c2eafc50-a326-4a53-8a8c-f5befac7f520-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230267

--===============7835055325563685355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxxf86vm,libxdamage,libxmu,libxpm,libxext,libxrandr,libxinerama,libxkbfile,libxcomposite,libxvmc* to *1.1.7,1.1.7,1.3.1,3.5.18,1.3.7,1.5.5,1.1.6,1.2.0,0.4.7,1.0.15* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libxxf86vm-libxdamage-libxmu-libxpm-libxext-libxrand.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From acc3bd02fe059e16f9533a9c93c88863dbad9ced Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 06:48:26 +0000
Subject: [PATCH] 
 libxxf86vm,libxdamage,libxmu,libxpm,libxext,libxrandr,libxinerama,libxkbfile,libxcomposite,libxvmc:
 upgrade 1.1.6 -> 1.1.7,1.1.6 -> 1.1.7,1.2.1 -> 1.3.1,3.5.17 -> 3.5.18,1.3.6
 -> 1.3.7,1.5.4 -> 1.5.5,1.1.5 -> 1.1.6,1.1.3 -> 1.2.0,0.4.6 -> 0.4.7,1.0.14
 -> 1.0.15

---
 ...posite_0.4.6.bb => libxcomposite_0.4.7.bb} | 26 +++++++++++++++++--
 ...ibxdamage_1.1.6.bb => libxdamage_1.1.7.bb} |  2 +-
 .../{libxext_1.3.6.bb => libxext_1.3.7.bb}    |  2 +-
 ...xinerama_1.1.5.bb => libxinerama_1.1.6.bb} | 26 ++++++++++++++++---
 ...ibxkbfile_1.1.3.bb => libxkbfile_1.2.0.bb} |  2 +-
 .../{libxmu_1.2.1.bb => libxmu_1.3.1.bb}      |  2 +-
 .../{libxpm_3.5.17.bb => libxpm_3.5.18.bb}    |  2 +-
 ...{libxrandr_1.5.4.bb => libxrandr_1.5.5.bb} |  2 +-
 .../{libxvmc_1.0.14.bb => libxvmc_1.0.15.bb}  |  2 +-
 ...ibxxf86vm_1.1.6.bb => libxxf86vm_1.1.7.bb} |  2 +-
 10 files changed, 55 insertions(+), 13 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxcomposite_0.4.6.bb => libxcomposite_0.4.7.bb} (45%)
 rename meta/recipes-graphics/xorg-lib/{libxdamage_1.1.6.bb => libxdamage_1.1.7.bb} (91%)
 rename meta/recipes-graphics/xorg-lib/{libxext_1.3.6.bb => libxext_1.3.7.bb} (89%)
 rename meta/recipes-graphics/xorg-lib/{libxinerama_1.1.5.bb => libxinerama_1.1.6.bb} (34%)
 rename meta/recipes-graphics/xorg-lib/{libxkbfile_1.1.3.bb => libxkbfile_1.2.0.bb} (81%)
 rename meta/recipes-graphics/xorg-lib/{libxmu_1.2.1.bb => libxmu_1.3.1.bb} (89%)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.17.bb => libxpm_3.5.18.bb} (88%)
 rename meta/recipes-graphics/xorg-lib/{libxrandr_1.5.4.bb => libxrandr_1.5.5.bb} (87%)
 rename meta/recipes-graphics/xorg-lib/{libxvmc_1.0.14.bb => libxvmc_1.0.15.bb} (85%)
 rename meta/recipes-graphics/xorg-lib/{libxxf86vm_1.1.6.bb => libxxf86vm_1.1.7.bb} (85%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb
similarity index 45%
rename from meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb
rename to meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb
index 881f579695..5794b04d37 100644
--- a/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb
@@ -1,3 +1,25 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -19,7 +19,7 @@
+#  TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
+#  PERFORMANCE OF THIS SOFTWARE.
+#  
+# -Copyright (c) 2006, 2007, Oracle and/or its affiliates. All rights reserved.
+# +Copyright (c) 2006, 2007, Oracle and/or its affiliates.
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a
+#  copy of this software and associated documentation files (the "Software"),
+# 
+#
+
 SUMMARY = "Xcomposite: X Composite extension library"
 
 DESCRIPTION = "The composite extension provides three related \
@@ -12,7 +34,7 @@ compositing transformations through a client."
 require xorg-lib-common.inc
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3f2907aad541f6f226fbc58cc1b3cdf1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=51f7b67ceb9dc21dd53952d0b7727b4e"
 
 DEPENDS += " xorgproto virtual/libx11 libxfixes libxext"
 PROVIDES = "xcomposite"
@@ -22,4 +44,4 @@ PE = "1"
 
 XORG_PN = "libXcomposite"
 
-SRC_URI[sha256sum] = "fe40bcf0ae1a09070eba24088a5eb9810efe57453779ec1e20a55080c6dc2c87"
+SRC_URI[sha256sum] = "8bdf310967f484503fa51714cf97bff0723d9b673e0eecbf92b3f97c060c8ccb"
diff --git a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb
similarity index 91%
rename from meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb
rename to meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb
index 279d6c33dc..2602ee4680 100644
--- a/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb
@@ -23,6 +23,6 @@ PE = "1"
 
 XORG_PN = "libXdamage"
 
-SRC_URI[sha256sum] = "52733c1f5262fca35f64e7d5060c6fcd81a880ba8e1e65c9621cf0727afb5d11"
+SRC_URI[sha256sum] = "127067f521d3ee467b97bcb145aeba1078e2454d448e8748eb984d5b397bde24"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb b/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb
rename to meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb
index 275926a885..3f28d78bdf 100644
--- a/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb
@@ -21,4 +21,4 @@ PE = "1"
 XORG_PN = "libXext"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "edb59fa23994e405fdc5b400afdf5820ae6160b94f35e3dc3da4457a16e89753"
+SRC_URI[sha256sum] = "6c643c7035cdacf67afd68f25d01b90ef889d546c9fcd7c0adf7c2cf91e3a32d"
diff --git a/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb b/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb
similarity index 34%
rename from meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb
rename to meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb
index 421b64e68d..656c0937bf 100644
--- a/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb
@@ -1,3 +1,22 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,4 +1,4 @@
+# -Copyright (c) 2007, Oracle and/or its affiliates. All rights reserved.
+# +Copyright (c) 2007, 2025, Oracle and/or its affiliates.
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a
+#  copy of this software and associated documentation files (the "Software"),
+# 
+#
+
 require xorg-lib-common.inc
 
 SUMMARY = "Xinerama: Xinerama extension library"
@@ -7,14 +26,15 @@ Xinerama Extension for retrieving information about physical output \
 devices which may be combined into a single logical X screen."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6f4f634d1643a2e638bba3fcd19c2536 \
-                    file://src/Xinerama.c;beginline=2;endline=25;md5=fcef273bfb66339256411dd06ea79c02"
+LIC_FILES_CHKSUM = "file://COPYING;md5=68f2159f2eadc772815f13d9565b453d \
+                    file://src/Xinerama.c;beginline=2;endline=25;md5=fcef273bfb66339256411dd06ea79c02 \
+                    "
 
 DEPENDS += "libxext xorgproto"
 PROVIDES = "xinerama"
 PE = "1"
 
 XORG_PN = "libXinerama"
-SRC_URI[sha256sum] = "5094d1f0fcc1828cb1696d0d39d9e866ae32520c54d01f618f1a3c1e30c2085c"
+SRC_URI[sha256sum] = "d00fc1599c303dc5cbc122b8068bdc7405d6fcb19060f4597fc51bd3a8be51d7"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb
rename to meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb
index aab6284384..f08339f906 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb
@@ -13,4 +13,4 @@ DEPENDS += "virtual/libx11 xorgproto"
 PE = "1"
 
 BBCLASSEXTEND = "native"
-SRC_URI[sha256sum] = "a9b63eea997abb9ee6a8b4fbb515831c841f471af845a09de443b28003874bec"
+SRC_URI[sha256sum] = "7f71884e5faf56fb0e823f3848599cf9b5a9afce51c90982baeb64f635233ebf"
diff --git a/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb b/meta/recipes-graphics/xorg-lib/libxmu_1.3.1.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb
rename to meta/recipes-graphics/xorg-lib/libxmu_1.3.1.bb
index 51faf170bf..9f0c65ee94 100644
--- a/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxmu_1.3.1.bb
@@ -27,4 +27,4 @@ FILES:libxmuu = "${libdir}/libXmuu.so.*"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[sha256sum] = "fcb27793248a39e5fcc5b9c4aec40cc0734b3ca76aac3d7d1c264e7f7e14e8b2"
+SRC_URI[sha256sum] = "81a99e94c4501e81c427cbaa4a11748b584933e94b7a156830c3621256857bc4"
diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb
index 8e15ecc0d4..94bf28232e 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb
@@ -22,6 +22,6 @@ PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
-SRC_URI[sha256sum] = "64b31f81019e7d388c822b0b28af8d51c4622b83f1f0cb6fa3fc95e271226e43"
+SRC_URI[sha256sum] = "b4ed79bfc718000edee837d551c35286f0b84576db0ce07bbbebe60a4affa1e4"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb
rename to meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb
index 3e2825b916..8696d11025 100644
--- a/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb
@@ -19,4 +19,4 @@ XORG_PN = "libXrandr"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "1ad5b065375f4a85915aa60611cc6407c060492a214d7f9daf214be752c3b4d3"
+SRC_URI[sha256sum] = "72b922c2e765434e9e9f0960148070bd4504b288263e2868a4ccce1b7cf2767a"
diff --git a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.15.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb
rename to meta/recipes-graphics/xorg-lib/libxvmc_1.0.15.bb
index af18afc62d..8fe205b387 100644
--- a/meta/recipes-graphics/xorg-lib/libxvmc_1.0.14.bb
+++ b/meta/recipes-graphics/xorg-lib/libxvmc_1.0.15.bb
@@ -16,4 +16,4 @@ PE = "1"
 
 XORG_PN = "libXvMC"
 
-SRC_URI[sha256sum] = "e4be9eb6b6bafdbbf81f47f7163047215376e45e2dc786d0ea6181c930725ed9"
+SRC_URI[sha256sum] = "4f518afde3d7fd435346af7b368d2f73517f3d5f82647c962caf3f7bb8ff7078"
diff --git a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb
rename to meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb
index bde3ad3ad3..9afc3ef809 100644
--- a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb
@@ -15,6 +15,6 @@ DEPENDS += "libxext xorgproto"
 PE = "1"
 
 XORG_PN = "libXxf86vm"
-SRC_URI[sha256sum] = "96af414c73ce1d5449ad04be7f9f27fa8330f844b6dda843ef22e3e1befb3ee3"
+SRC_URI[sha256sum] = "ae50c0f669e0af5a67cc4cd0f54f21d64a64d2660af883e80e95d3fe51b945d8"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============7835055325563685355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1957 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-04dbcc20ff51c4f6e06ea7cd2565cea31cfac25c"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:04dbcc20ff51c4f6e06ea7cd2565cea31cfac25c"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 253 Local 129 Mirrors 0 Missed 124 Current 383 (50% match, 80% complete)
done.
Removing 2 stale sstate objects for arch x86-64-v3...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 565 of 636 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 566 of 636 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 624 of 636 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1249 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa)
NOTE: Running task 1339 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxvmc_1.0.15.bb:do_recipe_qa)
NOTE: Running task 1340 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_recipe_qa)
NOTE: Running task 1341 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_recipe_qa)
NOTE: Running task 1342 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_recipe_qa)
NOTE: Running task 1343 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa)
NOTE: Running task 1344 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb:do_recipe_qa)
NOTE: Running task 1345 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxmu_1.3.1.bb:do_recipe_qa)
NOTE: Running task 1346 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_recipe_qa)
NOTE: Running task 1347 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_recipe_qa)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa: Started
NOTE: recipe libxvmc-1_1.0.15-r0: task do_recipe_qa: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_recipe_qa: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_recipe_qa: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa: Started
NOTE: recipe libxpm-1_3.5.18-r0: task do_recipe_qa: Started
NOTE: recipe libxmu-1_1.3.1-r0: task do_recipe_qa: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa: Started
NOTE: recipe libxv-1.0.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1439 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_fetch)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxv-1.0.13-r0: task do_fetch: Started
NOTE: recipe libxmu-1_1.3.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxvmc-1_1.0.15-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1466 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxmu_1.3.1.bb:do_fetch)
NOTE: Running task 1467 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_fetch)
NOTE: Running task 1468 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxvmc_1.0.15.bb:do_fetch)
NOTE: Running task 1469 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_fetch)
NOTE: recipe libxmu-1_1.3.1-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_fetch: Started
NOTE: recipe libxvmc-1_1.0.15-r0: task do_fetch: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_fetch: Started
NOTE: recipe libxmu-1_1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_fetch: Succeeded
NOTE: recipe libxvmc-1_1.0.15-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1470 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxmu_1.3.1.bb:do_unpack)
NOTE: Running task 1471 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_unpack)
NOTE: Running task 1472 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxvmc_1.0.15.bb:do_unpack)
NOTE: Running task 1473 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_unpack)
NOTE: Running task 1474 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1475 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_fetch)
NOTE: recipe libxpm-1_3.5.18-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1476 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb:do_fetch)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1477 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_fetch)
NOTE: Running task 1478 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_fetch)
NOTE: recipe libxmu-1_1.3.1-r0: task do_unpack: Started
NOTE: recipe libxvmc-1_1.0.15-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 1479 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_fetch)
NOTE: recipe libxpm-1_3.5.18-r0: task do_fetch: Started
NOTE: Running task 1480 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_unpack)
NOTE: Running task 1481 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_fetch: Started
NOTE: Running task 1482 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_fetch)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxpm-1_3.5.18-r0: task do_fetch: Succeeded
NOTE: Running task 1483 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 1484 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_unpack)
NOTE: Running task 1485 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_unpack)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1486 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_patch)
NOTE: recipe libxvmc-1_1.0.15-r0: task do_unpack: Succeeded
NOTE: Running task 1487 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_collect_spdx_deps)
NOTE: recipe libxmu-1_1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_unpack: Started
NOTE: Running task 1488 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxvmc_1.0.15.bb:do_patch)
NOTE: Running task 1489 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_patch)
NOTE: Running task 1490 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxmu_1.3.1.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_fetch: Started
NOTE: Running task 1491 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_unpack)
NOTE: Running task 1492 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxpm-1_3.5.18-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: Running task 1493 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxvmc-1_1.0.15-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_patch: Started
NOTE: recipe libxmu-1_1.3.1-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_unpack: Started
NOTE: Running task 1494 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_patch)
NOTE: Running task 1495 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_collect_spdx_deps)
NOTE: recipe libxvmc-1_1.0.15-r0: task do_patch: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_patch: Succeeded
NOTE: recipe libxmu-1_1.3.1-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1496 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxvmc_1.0.15.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 1497 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxpm-1_3.5.18-r0: task do_unpack: Succeeded
NOTE: Running task 1498 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_patch)
NOTE: Running task 1499 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxmu_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1500 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_patch)
NOTE: Running task 1501 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb:do_patch)
NOTE: recipe libxext-1_1.3.7-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1502 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxvmc_1.0.15.bb:do_populate_lic)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1503 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_patch)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxvmc-1_1.0.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libxmu-1_1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1504 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_patch: Started
NOTE: Running task 1505 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxpm-1_3.5.18-r0: task do_patch: Started
NOTE: Running task 1506 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_patch: Succeeded
NOTE: Running task 1507 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1508 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxpm-1_3.5.18-r0: task do_patch: Succeeded
NOTE: recipe libxvmc-1_1.0.15-r0: task do_populate_lic: Started
NOTE: Running task 1509 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1510 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_populate_lic)
NOTE: recipe libxext-1_1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 1511 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_patch: Succeeded
NOTE: Running task 1512 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_populate_lic)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1513 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxpm-1_3.5.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_lic: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxmu-1_1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_patch: Succeeded
NOTE: Running task 1514 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_populate_lic)
NOTE: Running task 1515 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_populate_lic: Started
NOTE: Running task 1516 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_lic)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxvmc-1_1.0.15-r0: task do_populate_lic: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1517 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_lic)
NOTE: Running task 1518 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxpm_3.5.18.bb:do_populate_lic)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_populate_lic: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_lic: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_lic: Started
NOTE: recipe libxpm-1_3.5.18-r0: task do_populate_lic: Started
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1519 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1520 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxmu_1.3.1.bb:do_populate_lic)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_configure: Started
NOTE: Running task 1521 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_lic)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_lic: Succeeded
NOTE: Running task 1522 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_lic)
NOTE: recipe libxmu-1_1.3.1-r0: task do_populate_lic: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxpm-1_3.5.18-r0: task do_populate_lic: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_lic: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1523 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_configure)
NOTE: Running task 1524 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_lic: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_lic: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_lic: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxpm-1_3.5.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_populate_lic: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_configure: Started
NOTE: recipe libxvmc-1_1.0.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_lic: Succeeded
NOTE: recipe libxmu-1_1.3.1-r0: task do_populate_lic: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_lic: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_fetch: Succeeded
NOTE: Running task 1525 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_unpack)
NOTE: recipe libxv-1.0.13-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.13-r0: task do_unpack: Succeeded
NOTE: Running task 1526 of 1677 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_patch)
NOTE: recipe libxv-1.0.13-r0: task do_patch: Started
NOTE: recipe libxv-1.0.13-r0: task do_patch: Succeeded
NOTE: recipe libxkbfile-1_1.2.0-r0: task do_configure: Failed
NOTE: recipe libxdamage-1_1.1.7-r0: task do_configure: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1527 tasks of which 1455 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201064808.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201064808.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libxkbfile/1.2.0/temp/log.do_configure.2829286
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libxkbfile-1_1.2.0-r0 do_configure: no configure script found at ../sources/libxkbfile-1.2.0/configure
ERROR: libxkbfile-1_1.2.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libxkbfile/1.2.0/temp/run.do_configure.2829286' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/libxkbfile/1.2.0/temp/log.do_configure.2829286
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbfile_1.2.0.bb:do_configure) failed with exit code '1'

--===============7835055325563685355==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxxf86vm-libxdamage-libxmu-libxpm-libxext-libxrand.patch"

RnJvbSBhY2MzYmQwMmZlMDU5ZTE2Zjk1MzNhOWM5M2M4ODg2M2RiYWQ5Y2VkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwNjo0ODoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIAog
bGlieHhmODZ2bSxsaWJ4ZGFtYWdlLGxpYnhtdSxsaWJ4cG0sbGlieGV4dCxsaWJ4cmFuZHIsbGli
eGluZXJhbWEsbGlieGtiZmlsZSxsaWJ4Y29tcG9zaXRlLGxpYnh2bWM6CiB1cGdyYWRlIDEuMS42
IC0+IDEuMS43LDEuMS42IC0+IDEuMS43LDEuMi4xIC0+IDEuMy4xLDMuNS4xNyAtPiAzLjUuMTgs
MS4zLjYKIC0+IDEuMy43LDEuNS40IC0+IDEuNS41LDEuMS41IC0+IDEuMS42LDEuMS4zIC0+IDEu
Mi4wLDAuNC42IC0+IDAuNC43LDEuMC4xNAogLT4gMS4wLjE1CgotLS0KIC4uLnBvc2l0ZV8wLjQu
Ni5iYiA9PiBsaWJ4Y29tcG9zaXRlXzAuNC43LmJifSB8IDI2ICsrKysrKysrKysrKysrKysrLS0K
IC4uLmlieGRhbWFnZV8xLjEuNi5iYiA9PiBsaWJ4ZGFtYWdlXzEuMS43LmJifSB8ICAyICstCiAu
Li4ve2xpYnhleHRfMS4zLjYuYmIgPT4gbGlieGV4dF8xLjMuNy5iYn0gICAgfCAgMiArLQogLi4u
eGluZXJhbWFfMS4xLjUuYmIgPT4gbGlieGluZXJhbWFfMS4xLjYuYmJ9IHwgMjYgKysrKysrKysr
KysrKysrKy0tLQogLi4uaWJ4a2JmaWxlXzEuMS4zLmJiID0+IGxpYnhrYmZpbGVfMS4yLjAuYmJ9
IHwgIDIgKy0KIC4uLi97bGlieG11XzEuMi4xLmJiID0+IGxpYnhtdV8xLjMuMS5iYn0gICAgICB8
ICAyICstCiAuLi4ve2xpYnhwbV8zLjUuMTcuYmIgPT4gbGlieHBtXzMuNS4xOC5iYn0gICAgfCAg
MiArLQogLi4ue2xpYnhyYW5kcl8xLjUuNC5iYiA9PiBsaWJ4cmFuZHJfMS41LjUuYmJ9IHwgIDIg
Ky0KIC4uLi97bGlieHZtY18xLjAuMTQuYmIgPT4gbGlieHZtY18xLjAuMTUuYmJ9ICB8ICAyICst
CiAuLi5pYnh4Zjg2dm1fMS4xLjYuYmIgPT4gbGlieHhmODZ2bV8xLjEuNy5iYn0gfCAgMiArLQog
MTAgZmlsZXMgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3tsaWJ4Y29tcG9zaXRlXzAuNC42LmJi
ID0+IGxpYnhjb21wb3NpdGVfMC40LjcuYmJ9ICg0NSUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3hvcmctbGliL3tsaWJ4ZGFtYWdlXzEuMS42LmJiID0+IGxpYnhkYW1hZ2VfMS4xLjcu
YmJ9ICg5MSUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3tsaWJ4ZXh0
XzEuMy42LmJiID0+IGxpYnhleHRfMS4zLjcuYmJ9ICg4OSUpCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmctbGliL3tsaWJ4aW5lcmFtYV8xLjEuNS5iYiA9PiBsaWJ4aW5lcmFtYV8x
LjEuNi5iYn0gKDM0JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIve2xp
YnhrYmZpbGVfMS4xLjMuYmIgPT4gbGlieGtiZmlsZV8xLjIuMC5iYn0gKDgxJSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIve2xpYnhtdV8xLjIuMS5iYiA9PiBsaWJ4bXVf
MS4zLjEuYmJ9ICg4OSUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3ts
aWJ4cG1fMy41LjE3LmJiID0+IGxpYnhwbV8zLjUuMTguYmJ9ICg4OCUpCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3tsaWJ4cmFuZHJfMS41LjQuYmIgPT4gbGlieHJhbmRy
XzEuNS41LmJifSAoODclKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi97
bGlieHZtY18xLjAuMTQuYmIgPT4gbGlieHZtY18xLjAuMTUuYmJ9ICg4NSUpCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL3tsaWJ4eGY4NnZtXzEuMS42LmJiID0+IGxpYnh4
Zjg2dm1fMS4xLjcuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3hvcmctbGliL2xpYnhjb21wb3NpdGVfMC40LjYuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
eG9yZy1saWIvbGlieGNvbXBvc2l0ZV8wLjQuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDQ1JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieGNvbXBvc2l0ZV8wLjQu
Ni5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhjb21wb3Np
dGVfMC40LjcuYmIKaW5kZXggODgxZjU3OTY5NS4uNTc5NGIwNGQzNyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhjb21wb3NpdGVfMC40LjYuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhjb21wb3NpdGVfMC40LjcuYmIKQEAg
LTEsMyArMSwyNSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUg
YmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRo
ZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisj
IFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXpl
IHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRl
OicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBk
YXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcKKyMgKysrIENPUFlJ
TkcKKyMgQEAgLTE5LDcgKzE5LDcgQEAKKyMgIFRPUlRJT1VTIEFDVElPTiwgQVJJU0lORyBPVVQg
T0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBVU0UgT1IKKyMgIFBFUkZPUk1BTkNFIE9GIFRI
SVMgU09GVFdBUkUuCisjICAKKyMgLUNvcHlyaWdodCAoYykgMjAwNiwgMjAwNywgT3JhY2xlIGFu
ZC9vciBpdHMgYWZmaWxpYXRlcy4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgK0NvcHlyaWdodCAo
YykgMjAwNiwgMjAwNywgT3JhY2xlIGFuZC9vciBpdHMgYWZmaWxpYXRlcy4KKyMgIAorIyAgUGVy
bWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24g
b2J0YWluaW5nIGEKKyMgIGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1
bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksCisjIAorIworCiBTVU1NQVJZID0gIlhj
b21wb3NpdGU6IFggQ29tcG9zaXRlIGV4dGVuc2lvbiBsaWJyYXJ5IgogCiBERVNDUklQVElPTiA9
ICJUaGUgY29tcG9zaXRlIGV4dGVuc2lvbiBwcm92aWRlcyB0aHJlZSByZWxhdGVkIFwKQEAgLTEy
LDcgKzM0LDcgQEAgY29tcG9zaXRpbmcgdHJhbnNmb3JtYXRpb25zIHRocm91Z2ggYSBjbGllbnQu
IgogcmVxdWlyZSB4b3JnLWxpYi1jb21tb24uaW5jCiAKIExJQ0VOU0UgPSAiTUlUIgotTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9M2YyOTA3YWFkNTQxZjZmMjI2ZmJjNThj
YzFiM2NkZjEiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT01MWY3YjY3
Y2ViOWRjMjFkZDUzOTUyZDBiNzcyN2I0ZSIKIAogREVQRU5EUyArPSAiIHhvcmdwcm90byB2aXJ0
dWFsL2xpYngxMSBsaWJ4Zml4ZXMgbGlieGV4dCIKIFBST1ZJREVTID0gInhjb21wb3NpdGUiCkBA
IC0yMiw0ICs0NCw0IEBAIFBFID0gIjEiCiAKIFhPUkdfUE4gPSAibGliWGNvbXBvc2l0ZSIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImZlNDBiY2YwYWUxYTA5MDcwZWJhMjQwODhhNWViOTgxMGVm
ZTU3NDUzNzc5ZWMxZTIwYTU1MDgwYzZkYzJjODciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGJk
ZjMxMDk2N2Y0ODQ1MDNmYTUxNzE0Y2Y5N2JmZjA3MjNkOWI2NzNlMGVlY2JmOTJiM2Y5N2MwNjBj
OGNjYiIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4ZGFt
YWdlXzEuMS42LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhkYW1hZ2Vf
MS4xLjcuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3hvcmctbGliL2xpYnhkYW1hZ2VfMS4xLjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLWxpYi9saWJ4ZGFtYWdlXzEuMS43LmJiCmluZGV4IDI3OWQ2YzMzZGMu
LjI2MDJlZTQ2ODAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9s
aWJ4ZGFtYWdlXzEuMS42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9s
aWJ4ZGFtYWdlXzEuMS43LmJiCkBAIC0yMyw2ICsyMyw2IEBAIFBFID0gIjEiCiAKIFhPUkdfUE4g
PSAibGliWGRhbWFnZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjUyNzMzYzFmNTI2MmZjYTM1
ZjY0ZTdkNTA2MGM2ZmNkODFhODgwYmE4ZTFlNjVjOTYyMWNmMDcyN2FmYjVkMTEiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMTI3MDY3ZjUyMWQzZWU0NjdiOTdiY2IxNDVhZWJhMTA3OGUyNDU0ZDQ0
OGU4NzQ4ZWI5ODRkNWIzOTdiZGUyNCIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZl
c2RrIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhleHRf
MS4zLjYuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieGV4dF8xLjMuNy5i
YgpzaW1pbGFyaXR5IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
eG9yZy1saWIvbGlieGV4dF8xLjMuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3hvcmctbGliL2xpYnhleHRfMS4zLjcuYmIKaW5kZXggMjc1OTI2YTg4NS4uM2YyOGQ3OGJkZiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhleHRfMS4zLjYu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhleHRfMS4zLjcuYmIK
QEAgLTIxLDQgKzIxLDQgQEAgUEUgPSAiMSIKIFhPUkdfUE4gPSAibGliWGV4dCIKIEJCQ0xBU1NF
WFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImVkYjU5
ZmEyMzk5NGU0MDVmZGM1YjQwMGFmZGY1ODIwYWU2MTYwYjk0ZjM1ZTNkYzNkYTQ0NTdhMTZlODk3
NTMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmM2NDNjNzAzNWNkYWNmNjdhZmQ2OGYyNWQwMWI5
MGVmODg5ZDU0NmM5ZmNkN2MwYWRmN2MyY2Y5MWUzYTMyZCIKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4aW5lcmFtYV8xLjEuNS5iYiBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLWxpYi9saWJ4aW5lcmFtYV8xLjEuNi5iYgpzaW1pbGFyaXR5IGluZGV4
IDM0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieGluZXJh
bWFfMS4xLjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4
aW5lcmFtYV8xLjEuNi5iYgppbmRleCA0MjFiNjRlNjhkLi42NTZjMDkzN2JmIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieGluZXJhbWFfMS4xLjUuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhpbmVyYW1hXzEuMS42LmJiCkBA
IC0xLDMgKzEsMjIgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZl
IGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0
aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0Lgor
IyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6
ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0
ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVw
ZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBDT1BZSU5HCisjICsrKyBDT1BZ
SU5HCisjIEBAIC0xLDQgKzEsNCBAQAorIyAtQ29weXJpZ2h0IChjKSAyMDA3LCBPcmFjbGUgYW5k
L29yIGl0cyBhZmZpbGlhdGVzLiBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyArQ29weXJpZ2h0IChj
KSAyMDA3LCAyMDI1LCBPcmFjbGUgYW5kL29yIGl0cyBhZmZpbGlhdGVzLgorIyAgCisjICBQZXJt
aXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBv
YnRhaW5pbmcgYQorIyAgY29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3Vt
ZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwKKyMgCisjCisKIHJlcXVpcmUgeG9yZy1s
aWItY29tbW9uLmluYwogCiBTVU1NQVJZID0gIlhpbmVyYW1hOiBYaW5lcmFtYSBleHRlbnNpb24g
bGlicmFyeSIKQEAgLTcsMTQgKzI2LDE1IEBAIFhpbmVyYW1hIEV4dGVuc2lvbiBmb3IgcmV0cmll
dmluZyBpbmZvcm1hdGlvbiBhYm91dCBwaHlzaWNhbCBvdXRwdXQgXAogZGV2aWNlcyB3aGljaCBt
YXkgYmUgY29tYmluZWQgaW50byBhIHNpbmdsZSBsb2dpY2FsIFggc2NyZWVuLiIKIAogTElDRU5T
RSA9ICJNSVQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT02ZjRmNjM0
ZDE2NDNhMmU2MzhiYmEzZmNkMTljMjUzNiBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9z
cmMvWGluZXJhbWEuYztiZWdpbmxpbmU9MjtlbmRsaW5lPTI1O21kNT1mY2VmMjczYmZiNjYzMzky
NTY0MTFkZDA2ZWE3OWMwMiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1
PTY4ZjIxNTlmMmVhZGM3NzI4MTVmMTNkOTU2NWI0NTNkIFwKKyAgICAgICAgICAgICAgICAgICAg
ZmlsZTovL3NyYy9YaW5lcmFtYS5jO2JlZ2lubGluZT0yO2VuZGxpbmU9MjU7bWQ1PWZjZWYyNzNi
ZmI2NjMzOTI1NjQxMWRkMDZlYTc5YzAyIFwKKyAgICAgICAgICAgICAgICAgICAgIgogCiBERVBF
TkRTICs9ICJsaWJ4ZXh0IHhvcmdwcm90byIKIFBST1ZJREVTID0gInhpbmVyYW1hIgogUEUgPSAi
MSIKIAogWE9SR19QTiA9ICJsaWJYaW5lcmFtYSIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1MDk0
ZDFmMGZjYzE4MjhjYjE2OTZkMGQzOWQ5ZTg2NmFlMzI1MjBjNTRkMDFmNjE4ZjFhM2MxZTMwYzIw
ODVjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQwMGZjMTU5OWMzMDNkYzVjYmMxMjJiODA2OGJk
Yzc0MDVkNmZjYjE5MDYwZjQ1OTdmYzUxYmQzYThiZTUxZDciCiAKIEJCQ0xBU1NFWFRFTkQgPSAi
bmF0aXZlIG5hdGl2ZXNkayIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LWxpYi9saWJ4a2JmaWxlXzEuMS4zLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGli
L2xpYnhrYmZpbGVfMS4yLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4MSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhrYmZpbGVfMS4xLjMuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4a2JmaWxlXzEuMi4wLmJiCmluZGV4
IGFhYjYyODQzODQuLmYwODMzOWY5MDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLWxpYi9saWJ4a2JmaWxlXzEuMS4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLWxpYi9saWJ4a2JmaWxlXzEuMi4wLmJiCkBAIC0xMyw0ICsxMyw0IEBAIERFUEVORFMg
Kz0gInZpcnR1YWwvbGlieDExIHhvcmdwcm90byIKIFBFID0gIjEiCiAKIEJCQ0xBU1NFWFRFTkQg
PSAibmF0aXZlIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImE5YjYzZWVhOTk3YWJiOWVlNmE4YjRm
YmI1MTU4MzFjODQxZjQ3MWFmODQ1YTA5ZGU0NDNiMjgwMDM4NzRiZWMiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiN2Y3MTg4NGU1ZmFmNTZmYjBlODIzZjM4NDg1OTljZjliNWE5YWZjZTUxYzkwOTgy
YmFlYjY0ZjYzNTIzM2ViZiIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LWxpYi9saWJ4bXVfMS4yLjEuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGli
eG11XzEuMy4xLmJiCnNpbWlsYXJpdHkgaW5kZXggODklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLWxpYi9saWJ4bXVfMS4yLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLWxpYi9saWJ4bXVfMS4zLjEuYmIKaW5kZXggNTFmYWYxNzBiZi4uOWYw
YzY1ZWU5NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnht
dV8xLjIuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieG11XzEu
My4xLmJiCkBAIC0yNyw0ICsyNyw0IEBAIEZJTEVTOmxpYnhtdXUgPSAiJHtsaWJkaXJ9L2xpYlht
dXUuc28uKiIKIAogQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUiCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJmY2IyNzc5MzI0OGEzOWU1ZmNjNWI5YzRhZWM0MGNjMDczNGIzY2E3NmFhYzNkN2QxYzI2
NGU3ZjdlMTRlOGIyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjgxYTk5ZTk0YzQ1MDFlODFjNDI3
Y2JhYTRhMTE3NDhiNTg0OTMzZTk0YjdhMTU2ODMwYzM2MjEyNTY4NTdiYzQiCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieHBtXzMuNS4xNy5iYiBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4cG1fMy41LjE4LmJiCnNpbWlsYXJpdHkgaW5k
ZXggODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4cG1f
My41LjE3LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieHBt
XzMuNS4xOC5iYgppbmRleCA4ZTE1ZWNjMGQ0Li45NGJmMjgyMzJlIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieHBtXzMuNS4xNy5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieHBtXzMuNS4xOC5iYgpAQCAtMjIsNiArMjIsNiBA
QCBQQUNLQUdFUyA9KyAic3hwbSBjeHBtIgogRklMRVM6Y3hwbSA9ICIke2JpbmRpcn0vY3hwbSIK
IEZJTEVTOnN4cG0gPSAiJHtiaW5kaXJ9L3N4cG0iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2
NGIzMWY4MTAxOWU3ZDM4OGM4MjJiMGIyOGFmOGQ1MWM0NjIyYjgzZjFmMGNiNmZhM2ZjOTVlMjcx
MjI2ZTQzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImI0ZWQ3OWJmYzcxODAwMGVkZWU4MzdkNTUx
YzM1Mjg2ZjBiODQ1NzZkYjBjZTA3YmJiZWJlNjBhNGFmZmExZTQiCiAKIEJCQ0xBU1NFWFRFTkQg
PSAibmF0aXZlIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xp
YnhyYW5kcl8xLjUuNC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4cmFu
ZHJfMS41LjUuYmIKc2ltaWxhcml0eSBpbmRleCA4NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmctbGliL2xpYnhyYW5kcl8xLjUuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnhyYW5kcl8xLjUuNS5iYgppbmRleCAzZTI4MjViOTE2
Li44Njk2ZDExMDI1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIv
bGlieHJhbmRyXzEuNS40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9s
aWJ4cmFuZHJfMS41LjUuYmIKQEAgLTE5LDQgKzE5LDQgQEAgWE9SR19QTiA9ICJsaWJYcmFuZHIi
CiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjFhZDViMDY1Mzc1ZjRhODU5MTVhYTYwNjExY2M2NDA3YzA2MDQ5MmEyMTRkN2Y5ZGFm
MjE0YmU3NTJjM2I0ZDMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzJiOTIyYzJlNzY1NDM0ZTll
OWYwOTYwMTQ4MDcwYmQ0NTA0YjI4ODI2M2UyODY4YTRjY2NlMWI3Y2YyNzY3YSIKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4dm1jXzEuMC4xNC5iYiBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4dm1jXzEuMC4xNS5iYgpzaW1pbGFyaXR5
IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGli
eHZtY18xLjAuMTQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9s
aWJ4dm1jXzEuMC4xNS5iYgppbmRleCBhZjE4YWZjNjJkLi44ZmUyMDViMzg3IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvbGlieHZtY18xLjAuMTQuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnh2bWNfMS4wLjE1LmJiCkBAIC0xNiw0
ICsxNiw0IEBAIFBFID0gIjEiCiAKIFhPUkdfUE4gPSAibGliWHZNQyIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImU0YmU5ZWI2YjZiYWZkYmJmODFmNDdmNzE2MzA0NzIxNTM3NmU0NWUyZGM3ODZk
MGVhNjE4MWM5MzA3MjVlZDkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNGY1MThhZmRlM2Q3ZmQ0
MzUzNDZhZjdiMzY4ZDJmNzM1MTdmM2Q1ZjgyNjQ3Yzk2MmNhZjNmN2JiOGZmNzA3OCIKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4eGY4NnZtXzEuMS42LmJi
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctbGliL2xpYnh4Zjg2dm1fMS4xLjcuYmIKc2lt
aWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
bGliL2xpYnh4Zjg2dm1fMS4xLjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLWxpYi9saWJ4eGY4NnZtXzEuMS43LmJiCmluZGV4IGJkZTNhZDNhZDMuLjlhZmMzZWY4MDkg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4eGY4NnZtXzEu
MS42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9saWJ4eGY4NnZtXzEu
MS43LmJiCkBAIC0xNSw2ICsxNSw2IEBAIERFUEVORFMgKz0gImxpYnhleHQgeG9yZ3Byb3RvIgog
UEUgPSAiMSIKIAogWE9SR19QTiA9ICJsaWJYeGY4NnZtIgotU1JDX1VSSVtzaGEyNTZzdW1dID0g
Ijk2YWY0MTRjNzNjZTFkNTQ0OWFkMDRiZTdmOWYyN2ZhODMzMGY4NDRiNmRkYTg0M2VmMjJlM2Ux
YmVmYjNlZTMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWU1MGMwZjY2OWUwYWY1YTY3Y2M0Y2Qw
ZjU0ZjIxZDY0YTY0ZDI2NjBhZjg4M2U4MGU5NWQzZmU1MWI5NDVkOCIKIAogQkJDTEFTU0VYVEVO
RCA9ICJuYXRpdmUgbmF0aXZlc2RrIgotLSAKMi40Ny4xCgo=

--===============7835055325563685355==--

