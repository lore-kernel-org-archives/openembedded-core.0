Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484C8C2BBE8
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:54 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web08.944.1657900669127695186
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=a0kZn4O3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010182029494b4-f1717658-0627-48dc-aa3a-c1f2a2a76d43-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900668;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mwd+vkmXtemmcQJHW2O+WmqdRdo+kuk1444XM7qeOXo=;
	b=a0kZn4O3ErDeRoTx8ZHi/MO17PkC9ZC+fmbsL6Rs96JboVPdC/awXBw9/FGuMCrH
	XUWHCtfGXvfxOMZZBW1nP+c3uoVrzrnhiL3wK5aNig0IOJ4DywyuU8V2tFCREnUO3JO
	DtYiesJ07Fl4OWxvREtC/HqCqslMgyYChii26Sns=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900668;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mwd+vkmXtemmcQJHW2O+WmqdRdo+kuk1444XM7qeOXo=;
	b=UZ23RIriOyDiTDEYeNLIlLAdxqvWHnyppQwlt1P/GDwKFWKsWU0Cys5GBnjkSntz
	BH5kAf8PA2tndpznyHN9K36cQET/wLnxOVOi9Jl0lmOm8jJCpja568t9X/UpYPPVXIX
	NcKeJtDTwDHtOWGBhkLO3VWzgVKY/0cCR/VIxB+Y=
Content-Type: multipart/mixed; boundary="===============8583420232959527680=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva-initial: upgrading to 2.15.0 FAILED
Message-ID: 
 <01010182029494b4-f1717658-0627-48dc-aa3a-c1f2a2a76d43-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:48 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168099

--===============8583420232959527680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva-initial* to *2.15.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f libva-initial /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1660 entries from dependency cache.
Parsing recipes...done.
Parsing of 890 .bb files complete (889 cached, 1 parsed). 1663 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.

INFO: No patches or local source files needed updating
INFO: Cleaning sysroot for recipe libva-initial...
ERROR: Command 'bitbake -c clean libva-initial' failed, output:
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1663 entries from dependency cache.
Parsing recipes...
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.

If you wish, you may specify -n/--no-clean to skip running this command when resetting


Next steps:
    - apply the patch: git am 0001-libva-initial-upgrade-2.14.0-2.15.0.patch
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
--===============8583420232959527680==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libva-initial-upgrade-2.14.0-2.15.0.patch"

From 819d29cce274a2be065038e5668109f19a490c52 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 12:03:37 +0000
Subject: [PATCH] libva-initial: upgrade 2.14.0 -> 2.15.0

---
 .../libva/libva-initial_2.14.0.bb             |  8 ----
 meta/recipes-graphics/libva/libva.inc         | 37 -------------------
 2 files changed, 45 deletions(-)
 delete mode 100644 meta/recipes-graphics/libva/libva-initial_2.14.0.bb
 delete mode 100644 meta/recipes-graphics/libva/libva.inc

diff --git a/meta/recipes-graphics/libva/libva-initial_2.14.0.bb b/meta/recipes-graphics/libva/libva-initial_2.14.0.bb
deleted file mode 100644
index 453096822f..0000000000
--- a/meta/recipes-graphics/libva/libva-initial_2.14.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require libva.inc
-
-PACKAGECONFIG ?= ""
-
-do_install:append () {
-	rm -f ${D}${libdir}/*.so*
-}
-
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
deleted file mode 100644
index 148bb03b5f..0000000000
--- a/meta/recipes-graphics/libva/libva.inc
+++ /dev/null
@@ -1,37 +0,0 @@
-SUMMARY = "Video Acceleration (VA) API for Linux"
-DESCRIPTION = "Video Acceleration API (VA API) is a library (libVA) \
-and API specification which enables and provides access to graphics \
-hardware (GPU) acceleration for video processing on Linux and UNIX \
-based operating systems. Accelerated processing includes video \
-decoding, video encoding, subpicture blending and rendering. The \
-specification was originally designed by Intel for its GMA (Graphics \
-Media Accelerator) series of GPU hardware, the API is however not \
-limited to GPUs or Intel specific hardware, as other hardware and \
-manufacturers can also freely use this API for hardware accelerated \
-video decoding."
-
-HOMEPAGE = "https://01.org/linuxmedia/vaapi"
-BUGTRACKER = "https://github.com/intel/libva/issues"
-
-SECTION = "x11"
-LICENSE = "MIT"
-
-SRC_URI = "https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "511e9a74d1ccfb548bc192290603082c11074ac59b17aadfd5d56a3f93e58454"
-
-S = "${WORKDIR}/libva-${PV}"
-
-UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
-
-DEPENDS = "libdrm"
-
-inherit meson pkgconfig
-
-PACKAGECONFIG[x11] = "-Dwith_x11=yes,-Dwith_x11=no,virtual/libx11 libxext libxfixes"
-PACKAGECONFIG[glx] = "-Dwith_glx=yes,-Dwith_glx=no,virtual/mesa"
-
-PACKAGECONFIG[wayland] = "-Dwith_wayland=yes,-Dwith_wayland=no,wayland-native wayland"
-
-BBCLASSEXTEND = "native nativesdk"
-
-- 
2.31.1


--===============8583420232959527680==--

