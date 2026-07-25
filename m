Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E41C54EFC
	for <webhook@archiver.kernel.org>; Sat, 25 Jul 2026 05:53:15 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34891.1784958788272512404
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 22:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=abk6Rrf+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cLFcN3+k;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019f97d59e75-11c8b344-ed3a-4f00-b02e-fe60ec57a2ad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784958787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=h9pOBpN+GW2kZqGMkCIMYcOsqHTxWsEgCF67SlF2vYA=;
	b=abk6Rrf+pjr4Zir4EQ675SExHYC6AgMvilKnfzJ6hpMnfrKEIzyosYUdhPxjQI1s
	nrZ34TBaf08EnSrj94Tay2X8nd8yPNBSyYjck6H9IXKunACWbha3PA8aZViTtm9gVeJ
	AvN3bNdj0CoJfSOiF0g0ElCR+SNgT2OOwY9pYb8E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784958787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=h9pOBpN+GW2kZqGMkCIMYcOsqHTxWsEgCF67SlF2vYA=;
	b=cLFcN3+kTQI0SVTA4zZC54R9YMKkG5mUn8i0mhdqecPV/lgDpBU2tDjcDempnWc9
	SKI1/0jrWb3nlhCFeEuUa0YA8j5GSPXPFiILVNp+k/q2oMiEAUbgHaj3wHObYoub8ce
	811GJrMT1oDOu1D60KVGUNtf19y+3fp9EtknRLfY=
Content-Type: multipart/mixed; boundary="===============4475290280797304493=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu-native,qemu,qemu-system-native: upgrading to
 11.0.3,11.0.3,11.0.3 SUCCEEDED
Message-ID: <0101019f97d59e75-11c8b344-ed3a-4f00-b02e-fe60ec57a2ad-000000@us-west-2.amazonses.com>
Date: Sat, 25 Jul 2026 05:53:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.25-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 05:53:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241959

--===============4475290280797304493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *qemu-native,qemu,qemu-system-native* to *11.0.3,11.0.3,11.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-qemu-native-qemu-qemu-system-native-upgrade-11.0.2-1.patch
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
From aeb7557752eaae7b6a9a69213488fe26036d5620 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 25 Jul 2026 05:32:07 +0000
Subject: [PATCH] qemu-native,qemu,qemu-system-native: upgrade 11.0.2 ->
 11.0.3,11.0.2 -> 11.0.3,11.0.2 -> 11.0.3

---
 .../qemu/{qemu-native_11.0.2.bb => qemu-native_11.0.3.bb}     | 1 +
 ...u-system-native_11.0.2.bb => qemu-system-native_11.0.3.bb} | 1 +
 meta/recipes-devtools/qemu/qemu.inc                           | 2 +-
 ...qemu-Add-addition-environment-space-to-boot-loader-q.patch | 2 +-
 ...ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch | 2 +-
 .../qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch        | 2 +-
 .../qemu/0004-qemu-Do-not-include-file-if-not-exists.patch    | 4 ++--
 ...qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch | 2 +-
 .../qemu/qemu/0006-qemu-Determinism-fixes.patch               | 2 +-
 ...tests-meson.build-use-relative-path-to-refer-to-file.patch | 2 +-
 ...Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch | 2 +-
 .../qemu/0010-configure-lookup-meson-exutable-from-PATH.patch | 2 +-
 ...qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch | 2 +-
 .../0012-meson-fix-close_range-detection-on-older-glibc.patch | 4 ++--
 ...si-include-standard-headers-for-vhost-worker-structs.patch | 2 +-
 meta/recipes-devtools/qemu/{qemu_11.0.2.bb => qemu_11.0.3.bb} | 0
 16 files changed, 17 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_11.0.2.bb => qemu-native_11.0.3.bb} (99%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_11.0.2.bb => qemu-system-native_11.0.3.bb} (99%)
 rename meta/recipes-devtools/qemu/{qemu_11.0.2.bb => qemu_11.0.3.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_11.0.2.bb b/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb
similarity index 99%
rename from meta/recipes-devtools/qemu/qemu-native_11.0.2.bb
rename to meta/recipes-devtools/qemu/qemu-native_11.0.3.bb
index a77953529b..26fa84c180 100644
--- a/meta/recipes-devtools/qemu/qemu-native_11.0.2.bb
+++ b/meta/recipes-devtools/qemu/qemu-native_11.0.3.bb
@@ -7,3 +7,4 @@ require qemu-native.inc
 EXTRA_OECONF:append = " --target-list=${@get_qemu_usermode_target_list(d)} --disable-tools --disable-install-blobs --disable-guest-agent"
 
 PACKAGECONFIG ??= "pie"
+
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_11.0.2.bb b/meta/recipes-devtools/qemu/qemu-system-native_11.0.3.bb
similarity index 99%
rename from meta/recipes-devtools/qemu/qemu-system-native_11.0.2.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_11.0.3.bb
index 7947499c5f..62e8a0a83b 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_11.0.2.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_11.0.3.bb
@@ -26,3 +26,4 @@ do_install:append() {
     rm -rf ${D}${datadir}/icons/
     rm -rf ${D}${includedir}/qemu-plugin.h
 }
+
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 6fca6bc499..e440d748b2 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -42,7 +42,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "3745f6ea88e2e87fe0dc838b2b1d4e0a770bf48e01a1d5a186842a1fff76ccf5"
+SRC_URI[sha256sum] = "da5fcffc32762820568b828ed430a728864d34d50b6d2f30358597760cbb0523"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index 94f23558bc..3750eaef0c 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From 4c030fef6b75bfc9aed21099b12648f13f7626a6 Mon Sep 17 00:00:00 2001
+From 912b45b2d74cfaeee120110c62e55ce3ab5bdb34 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
 Subject: [PATCH] qemu: Add addition environment space to boot loader
diff --git a/meta/recipes-devtools/qemu/qemu/0001-ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch b/meta/recipes-devtools/qemu/qemu/0001-ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch
index a49710c86d..d34dab9620 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch
@@ -1,4 +1,4 @@
-From 0a029de8c4c31507cae542b5413491283569467c Mon Sep 17 00:00:00 2001
+From 76fd795492dd9c12c7a8af52a31a36e261fb4f44 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 10 Jun 2026 15:00:26 +0200
 Subject: [PATCH] ui/sdl2.c: force-disable SDL_HINT_VIDEO_X11_FORCE_EGL,
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
index fe9ca05614..3dceb7428b 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,4 +1,4 @@
-From eb7f727c64b09337b39b231be65360134e2065e8 Mon Sep 17 00:00:00 2001
+From 42e2e4d4cf65ec23e2de6aa66c5fe0b7b0cc59f2 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
index a4150620d6..3b2c028d63 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,4 +1,4 @@
-From 33940327a10cd5dda9d417cceef47fc34e9e269d Mon Sep 17 00:00:00 2001
+From 3bea676520f2daf79cd94820e9948ce0bd6aa2ca Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
 Subject: [PATCH] qemu: Do not include file if not exists
@@ -16,7 +16,7 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 11d3b41df..2c36df57f 100644
+index ec249806b..b85f7360c 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
 @@ -117,7 +117,9 @@
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index 28988146a8..dd111c18b0 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From 072e2a2a97e0376e56d975c984db3f8584022849 Mon Sep 17 00:00:00 2001
+From e5d385d651999650d711528585bfe2958b72ef15 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
 Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 32 bit
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index 7a81278537..ba3306d4e5 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From 2267fcad1416f1ceef88ab052f9d69efe26f7d58 Mon Sep 17 00:00:00 2001
+From 59d587bd4c5127483e973bcab73f7e76004ffc12 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
 Subject: [PATCH] qemu: Determinism fixes
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
index 61d7924969..babf1bf8fd 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From 3d7bf86f69b5ff80dbe54dc2b3bd3dba0971e0ac Mon Sep 17 00:00:00 2001
+From c0888e77aed7eb9d9edb22da14e21e9435894858 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 480e1c6a07..2bcb6e971e 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From 02ad3d36cfd395d05609540e23048e171da779ba Mon Sep 17 00:00:00 2001
+From 2bf5ea71a4ea4d3c03966ead1113516d18c6d3d3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index 7043c942b2..061595ab50 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,4 +1,4 @@
-From ef9ea8e83468ce974079964a5104df170beba85b Mon Sep 17 00:00:00 2001
+From 650261d82d1960db5ecee7c38c07fcaebe212194 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Wed, 22 May 2024 14:02:55 +0200
 Subject: [PATCH] configure: lookup meson exutable from PATH
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index bb4398f474..8a67e3f5b3 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From d62f78fea47f4b32fd0f48c46253f161cf305547 Mon Sep 17 00:00:00 2001
+From 8fe9384c78564d4f7f79272064ddea20d4d05f96 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 22 May 2024 13:58:23 +0200
 Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for meson
diff --git a/meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch b/meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch
index ccef853c3b..db96b18e44 100644
--- a/meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch
+++ b/meta/recipes-devtools/qemu/qemu/0012-meson-fix-close_range-detection-on-older-glibc.patch
@@ -1,4 +1,4 @@
-From b2b9a9e38f20fb8aa6ed26a3c38962651e3a9eae Mon Sep 17 00:00:00 2001
+From a3129d71234f57ca131d0c92952d674d0bf263b5 Mon Sep 17 00:00:00 2001
 From: Quan Sun <Quan.Sun@windriver.com>
 Date: Fri, 5 Jun 2026 11:54:57 +0000
 Subject: [PATCH] meson: fix close_range detection on older glibc
@@ -24,7 +24,7 @@ Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 51f5f2851..4353200db 100644
+index c55f601d6..6e170adb6 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -2637,7 +2637,8 @@ if host_os == 'windows'
diff --git a/meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch b/meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch
index d157ce0652..7c441e9843 100644
--- a/meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch
+++ b/meta/recipes-devtools/qemu/qemu/0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch
@@ -1,4 +1,4 @@
-From b8736798a109e2b3a4d5c02f5fd833bf870ba771 Mon Sep 17 00:00:00 2001
+From 061b0d99b2db408641dd6e0970b986de33cfb018 Mon Sep 17 00:00:00 2001
 From: Quan Sun <Quan.Sun@windriver.com>
 Date: Fri, 5 Jun 2026 11:54:58 +0000
 Subject: [PATCH] hw/scsi/vhost-scsi: fix build with older kernel headers
diff --git a/meta/recipes-devtools/qemu/qemu_11.0.2.bb b/meta/recipes-devtools/qemu/qemu_11.0.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_11.0.2.bb
rename to meta/recipes-devtools/qemu/qemu_11.0.3.bb
-- 
2.47.1


--===============4475290280797304493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 953 .bb files complete (0 cached, 953 parsed). 1981 targets, 63 skipped, 0 masked, 0 errors.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'qemu'
qemu was skipped: incompatible with host arm-poky-linux-gnueabi (not in COMPATIBLE_HOST)
qemu was skipped: incompatible with host arm-poky-linux-musleabi (not in COMPATIBLE_HOST)

--===============4475290280797304493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/qemu: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu: SRC_URI changed from "https://download.qemu.org/qemu-11.0.2.tar.xz file://powerpc_rom.bin file://run-ptest file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch file://0002-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://0012-meson-fix-close_range-detection-on-older-glibc.patch file://0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev file://0001-ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch" to "https://
 download.qemu.org/qemu-11.0.3.tar.xz file://powerpc_rom.bin file://run-ptest file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch file://0002-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://0012-meson-fix-close_range-detection-on-older-glibc.patch file://0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev file://0001-ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch"
packages/x86-64-v3-poky-linux/qemu/qemu-common: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-common: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: PKGSIZE changed from 1952047392 to 1952212904 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-dev: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-dev: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-doc: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-doc: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-guest-agent: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-guest-agent: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-locale: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-locale: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: PKGSIZE changed from 195818241 to 195826433 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-src: PKGSIZE changed from 85221682 to 85249608 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-src: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-src: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-src: FILELIST: directory renamed /usr/src/debug/qemu/11.0.2/include/hw/mips -> /usr/src/debug/qemu/11.0.3/include/hw/mips, directory renamed /usr/src/debug/qemu/11.0.2/target/loongarch/tcg/insn_trans -> /usr/src/debug/qemu/11.0.3/target/loongarch/tcg/insn_trans, directory renamed /usr/src/debug/qemu/11.0.2/hw/uefi -> /usr/src/debug/qemu/11.0.3/hw/uefi, directory renamed /usr/src/debug/qemu/11.0.2/include/authz -> /usr/src/debug/qemu/11.0.3/include/authz, directory renamed /usr/src/debug/qemu/11.0.2/linux-user/arm/nwfpe -> /usr/src/debug/qemu/11.0.3/linux-user/arm/nwfpe, directory renamed /usr/src/debug/qemu/11.0.2/accel/kvm -> /usr/src/debug/qemu/11.0.3/accel/kvm, directory renamed /usr/src/debug/qemu/11.0.2/target/mips -> /usr/src/debug/qemu/11.0.3/target/mips, directory renamed /usr/src/debug/qemu/11.0.2/linux-user/ppc -> /usr/src/debug/qemu/11.0.3/linux-user/ppc, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-ppc64-linux-user.a.p -> /u
 sr/src/debug/qemu/11.0.3/libqemu-ppc64-linux-user.a.p, directory renamed /usr/src/debug/qemu/11.0.2/linux-user/arm -> /usr/src/debug/qemu/11.0.3/linux-user/arm, directory renamed /usr/src/debug/qemu/11.0.2/include/standard-headers/asm-x86 -> /usr/src/debug/qemu/11.0.3/include/standard-headers/asm-x86, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/acpi -> /usr/src/debug/qemu/11.0.3/include/hw/acpi, directory renamed /usr/src/debug/qemu/11.0.2/hw/sensor -> /usr/src/debug/qemu/11.0.3/hw/sensor, directory renamed /usr/src/debug/qemu/11.0.2/accel/tcg -> /usr/src/debug/qemu/11.0.3/accel/tcg, directory renamed /usr/src/debug/qemu/11.0.2/subprojects/libvduse -> /usr/src/debug/qemu/11.0.3/subprojects/libvduse, directory renamed /usr/src/debug/qemu/11.0.2/include/ui -> /usr/src/debug/qemu/11.0.3/include/ui, directory renamed /usr/src/debug/qemu/11.0.2/gdbstub -> /usr/src/debug/qemu/11.0.3/gdbstub, directory renamed /usr/src/debug/qemu/11.0.2/accel/mshv -> /usr/src/debug/qemu/11.0.3/
 accel/mshv, directory renamed /usr/src/debug/qemu/11.0.2/hw/misc/macio -> /usr/src/debug/qemu/11.0.3/hw/misc/macio, directory renamed /usr/src/debug/qemu/11.0.2/hw/i386/xen -> /usr/src/debug/qemu/11.0.3/hw/i386/xen, directory renamed /usr/src/debug/qemu/11.0.2/linux-user/sh4 -> /usr/src/debug/qemu/11.0.3/linux-user/sh4, directory renamed /usr/src/debug/qemu/11.0.2/hw/i386 -> /usr/src/debug/qemu/11.0.3/hw/i386, directory renamed /usr/src/debug/qemu/11.0.2/linux-headers/asm-x86 -> /usr/src/debug/qemu/11.0.3/linux-headers/asm-x86, directory renamed /usr/src/debug/qemu/11.0.2/hw/block -> /usr/src/debug/qemu/11.0.3/hw/block, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-aarch64-softmmu.a.p -> /usr/src/debug/qemu/11.0.3/libqemu-aarch64-softmmu.a.p, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-riscv64-softmmu.a.p -> /usr/src/debug/qemu/11.0.3/libqemu-riscv32-softmmu.a.p, directory renamed /usr/src/debug/qemu/11.0.2/chardev -> /usr/src/debug/qemu/11.0.3/chardev, directory ren
 amed /usr/src/debug/qemu/11.0.2/hw/ipmi -> /usr/src/debug/qemu/11.0.3/hw/ipmi, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/scsi -> /usr/src/debug/qemu/11.0.3/include/hw/scsi, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/timer -> /usr/src/debug/qemu/11.0.3/include/hw/timer, directory renamed /usr/src/debug/qemu/11.0.2/hw/nvme -> /usr/src/debug/qemu/11.0.3/hw/nvme, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/virtio -> /usr/src/debug/qemu/11.0.3/include/hw/virtio, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/misc -> /usr/src/debug/qemu/11.0.3/include/hw/misc, directory renamed /usr/src/debug/qemu/11.0.2/subprojects/berkeley-softfloat-3/source -> /usr/src/debug/qemu/11.0.3/subprojects/berkeley-softfloat-3/source, directory renamed /usr/src/debug/qemu/11.0.2/tests/qtest/migration -> /usr/src/debug/qemu/11.0.3/tests/qtest/migration, directory renamed /usr/src/debug/qemu/11.0.2/include/block -> /usr/src/debug/qemu/11.0.3/include/block, director
 y renamed /usr/src/debug/qemu/11.0.2/stubs -> /usr/src/debug/qemu/11.0.3/stubs, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/xen/interface -> /usr/src/debug/qemu/11.0.3/include/hw/xen/interface, directory renamed /usr/src/debug/qemu/11.0.2/linux-user/i386 -> /usr/src/debug/qemu/11.0.3/linux-user/i386, directory renamed /usr/src/debug/qemu/11.0.2/hw/sd -> /usr/src/debug/qemu/11.0.3/hw/sd, directory renamed /usr/src/debug/qemu/11.0.2/hw/intc -> /usr/src/debug/qemu/11.0.3/hw/intc, directory renamed /usr/src/debug/qemu/11.0.2/hw/pci-host -> /usr/src/debug/qemu/11.0.3/hw/pci-host, directory renamed /usr/src/debug/qemu/11.0.2/hw/net/can -> /usr/src/debug/qemu/11.0.3/hw/net/can, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-ppc64-softmmu.a.p -> /usr/src/debug/qemu/11.0.3/libqemu-ppc-softmmu.a.p, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/hyperv -> /usr/src/debug/qemu/11.0.3/include/hw/hyperv, directory renamed /usr/src/debug/qemu/11.0.2/include/qobject -> /us
 r/src/debug/qemu/11.0.3/include/qobject, directory renamed /usr/src/debug/qemu/11.0.2/qga -> /usr/src/debug/qemu/11.0.3/qga, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/fsi -> /usr/src/debug/qemu/11.0.3/include/hw/fsi, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/pci -> /usr/src/debug/qemu/11.0.3/include/hw/pci, directory renamed /usr/src/debug/qemu/11.0.2/host/include/generic/host -> /usr/src/debug/qemu/11.0.3/host/include/generic/host, directory renamed /usr/src/debug/qemu/11.0.2/include/crypto -> /usr/src/debug/qemu/11.0.3/include/crypto, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/arm -> /usr/src/debug/qemu/11.0.3/include/hw/arm, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/cxl -> /usr/src/debug/qemu/11.0.3/include/hw/cxl, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/adc -> /usr/src/debug/qemu/11.0.3/include/hw/adc, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/i2c -> /usr/src/debug/qemu/11.0.3/include/hw/i2c, di
 rectory renamed /usr/src/debug/qemu/11.0.2/include/hw/dma -> /usr/src/debug/qemu/11.0.3/include/hw/dma, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/i3c -> /usr/src/debug/qemu/11.0.3/include/hw/i3c, directory renamed /usr/src/debug/qemu/11.0.2/include/exec -> /usr/src/debug/qemu/11.0.3/include/exec, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/isa -> /usr/src/debug/qemu/11.0.3/include/hw/isa, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/ide -> /usr/src/debug/qemu/11.0.3/include/hw/ide, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/mem -> /usr/src/debug/qemu/11.0.3/include/hw/mem, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/ppc -> /usr/src/debug/qemu/11.0.3/include/hw/ppc, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/rtc -> /usr/src/debug/qemu/11.0.3/include/hw/rtc, directory renamed /usr/src/debug/qemu/11.0.2/target/mips/system -> /usr/src/debug/qemu/11.0.3/target/mips/system, directory renamed /usr/src/debug/qemu/11.
 0.2/hw/display -> /usr/src/debug/qemu/11.0.3/hw/display, directory renamed /usr/src/debug/qemu/11.0.2/qom -> /usr/src/debug/qemu/11.0.3/qom, directory renamed /usr/src/debug/qemu/11.0.2/hw/block/dataplane -> /usr/src/debug/qemu/11.0.3/hw/block/dataplane, directory renamed /usr/src/debug/qemu/11.0.2/ui/shader -> /usr/src/debug/qemu/11.0.3/ui/shader, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/ipack -> /usr/src/debug/qemu/11.0.3/include/hw/ipack, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/xen/interface/hvm -> /usr/src/debug/qemu/11.0.3/include/hw/xen/interface/hvm, directory renamed /usr/src/debug/qemu/11.0.2/include/qom -> /usr/src/debug/qemu/11.0.3/include/qom, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/net -> /usr/src/debug/qemu/11.0.3/include/hw/net, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/cpu -> /usr/src/debug/qemu/11.0.3/include/hw/cpu, directory renamed /usr/src/debug/qemu/11.0.2/include/plugins -> /usr/src/debug/qemu/11.0.3
 /include/plugins, directory renamed /usr/src/debug/qemu/11.0.2/target/arm/whpx -> /usr/src/debug/qemu/11.0.3/target/arm/whpx, directory renamed /usr/src/debug/qemu/11.0.2/storage-daemon/qapi -> /usr/src/debug/qemu/11.0.3/storage-daemon/qapi, directory renamed /usr/src/debug/qemu/11.0.2/linux-user/aarch64 -> /usr/src/debug/qemu/11.0.3/linux-user/aarch64, directory renamed /usr/src/debug/qemu/11.0.2/target/ppc/translate -> /usr/src/debug/qemu/11.0.3/target/ppc/translate, directory renamed /usr/src/debug/qemu/11.0.2/target/riscv/tcg -> /usr/src/debug/qemu/11.0.3/target/riscv/tcg, directory renamed /usr/src/debug/qemu/11.0.2/common-user -> /usr/src/debug/qemu/11.0.3/common-user, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/uefi -> /usr/src/debug/qemu/11.0.3/include/hw/uefi, directory renamed /usr/src/debug/qemu/11.0.2/tests/unit -> /usr/src/debug/qemu/11.0.3/tests/unit, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-mips64el-softmmu.a.p -> /usr/src/debug/qemu/11.0.3/lib
 qemu-mips64el-linux-user.a.p, directory renamed /usr/src/debug/qemu/11.0.2/migration -> /usr/src/debug/qemu/11.0.3/migration, directory renamed /usr/src/debug/qemu/11.0.2/monitor -> /usr/src/debug/qemu/11.0.3/monitor, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/riscv -> /usr/src/debug/qemu/11.0.3/include/hw/riscv, directory renamed /usr/src/debug/qemu/11.0.2/target/i386/tcg -> /usr/src/debug/qemu/11.0.3/target/i386/tcg, directory renamed /usr/src/debug/qemu/11.0.2/target/mips/tcg -> /usr/src/debug/qemu/11.0.3/target/mips/tcg, directory renamed /usr/src/debug/qemu/11.0.2/include/hw -> /usr/src/debug/qemu/11.0.3/include/hw, directory renamed /usr/src/debug/qemu/11.0.2/target/riscv/insn_trans -> /usr/src/debug/qemu/11.0.3/target/riscv/insn_trans, directory renamed /usr/src/debug/qemu/11.0.2/hw/nvram -> /usr/src/debug/qemu/11.0.3/hw/nvram, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/block -> /usr/src/debug/qemu/11.0.3/include/hw/block, directory renamed /usr/src/
 debug/qemu/11.0.2/target/i386/emulate -> /usr/src/debug/qemu/11.0.3/target/i386/emulate, directory renamed /usr/src/debug/qemu/11.0.2/tests/fp -> /usr/src/debug/qemu/11.0.3/tests/fp, directory renamed /usr/src/debug/qemu/11.0.2/hw/remote -> /usr/src/debug/qemu/11.0.3/hw/remote, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/gpio -> /usr/src/debug/qemu/11.0.3/include/hw/gpio, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/vfio -> /usr/src/debug/qemu/11.0.3/include/hw/vfio, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/xen/interface/io -> /usr/src/debug/qemu/11.0.3/include/hw/xen/interface/io, directory renamed /usr/src/debug/qemu/11.0.2/linux-user/mips64 -> /usr/src/debug/qemu/11.0.3/linux-user/mips64, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/pci-bridge -> /usr/src/debug/qemu/11.0.3/include/hw/pci-bridge, directory renamed /usr/src/debug/qemu/11.0.2/hw/ipack -> /usr/src/debug/qemu/11.0.3/hw/ipack, directory renamed /usr/src/debug/qemu/11.0.2
 /linux-user/riscv -> /usr/src/debug/qemu/11.0.3/linux-user/riscv, directory renamed /usr/src/debug/qemu/11.0.2/include/qapi -> /usr/src/debug/qemu/11.0.3/include/qapi, directory renamed /usr/src/debug/qemu/11.0.2/tests/qtest/migration/aarch64 -> /usr/src/debug/qemu/11.0.3/tests/qtest/migration/ppc64, directory renamed /usr/src/debug/qemu/11.0.2/hw/loongarch -> /usr/src/debug/qemu/11.0.3/hw/loongarch, directory renamed /usr/src/debug/qemu/11.0.2/linux-user/loongarch64 -> /usr/src/debug/qemu/11.0.3/linux-user/loongarch64, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/sh4 -> /usr/src/debug/qemu/11.0.3/include/hw/sh4, directory renamed /usr/src/debug/qemu/11.0.2/block/export -> /usr/src/debug/qemu/11.0.3/block/export, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/sd -> /usr/src/debug/qemu/11.0.3/include/hw/sd, directory renamed /usr/src/debug/qemu/11.0.2/target/loongarch -> /usr/src/debug/qemu/11.0.3/target/loongarch, directory renamed /usr/src/debug/qemu/11.0.2/hw/n
 et/fsl_etsec -> /usr/src/debug/qemu/11.0.3/hw/net/fsl_etsec, directory renamed /usr/src/debug/qemu/11.0.2/include/libdecnumber -> /usr/src/debug/qemu/11.0.3/include/libdecnumber, directory renamed /usr/src/debug/qemu/11.0.2/include/standard-headers/linux -> /usr/src/debug/qemu/11.0.3/include/standard-headers/linux, directory renamed /usr/src/debug/qemu/11.0.2/tests/qtest/migration/i386 -> /usr/src/debug/qemu/11.0.3/tests/qtest/migration/i386, directory renamed /usr/src/debug/qemu/11.0.2/include/net -> /usr/src/debug/qemu/11.0.3/include/net, directory renamed /usr/src/debug/qemu/11.0.2/plugins -> /usr/src/debug/qemu/11.0.3/plugins, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/char -> /usr/src/debug/qemu/11.0.3/include/hw/char, directory renamed /usr/src/debug/qemu/11.0.2/tcg -> /usr/src/debug/qemu/11.0.3/tcg, directory renamed /usr/src/debug/qemu/11.0.2/block -> /usr/src/debug/qemu/11.0.3/block, directory renamed /usr/src/debug/qemu/11.0.2/hw/net/rocker -> /usr/src/debug/q
 emu/11.0.3/hw/net/rocker, directory renamed /usr/src/debug/qemu/11.0.2/hw/virtio -> /usr/src/debug/qemu/11.0.3/hw/virtio, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/intc -> /usr/src/debug/qemu/11.0.3/include/hw/intc, directory renamed /usr/src/debug/qemu/11.0.2/subprojects/libvhost-user -> /usr/src/debug/qemu/11.0.3/subprojects/libvhost-user, directory renamed /usr/src/debug/qemu/11.0.2/subprojects/berkeley-softfloat-3/source/8086-SSE -> /usr/src/debug/qemu/11.0.3/subprojects/berkeley-softfloat-3/source/8086-SSE, directory renamed /usr/src/debug/qemu/11.0.2/target/i386/kvm -> /usr/src/debug/qemu/11.0.3/target/i386/kvm, directory renamed /usr/src/debug/qemu/11.0.2/hw/pci-bridge -> /usr/src/debug/qemu/11.0.3/hw/pci-bridge, directory renamed /usr/src/debug/qemu/11.0.2/target/loongarch/tcg -> /usr/src/debug/qemu/11.0.3/target/loongarch/tcg, directory renamed /usr/src/debug/qemu/11.0.2/hw/nitro -> /usr/src/debug/qemu/11.0.3/hw/nitro, directory renamed /usr/src/debug/qemu/11.
 0.2/hw/isa -> /usr/src/debug/qemu/11.0.3/hw/isa, directory renamed /usr/src/debug/qemu/11.0.2/include/accel/tcg -> /usr/src/debug/qemu/11.0.3/include/accel/tcg, directory renamed /usr/src/debug/qemu/11.0.2/disas -> /usr/src/debug/qemu/11.0.3/disas, directory renamed /usr/src/debug/qemu/11.0.2/include/tcg -> /usr/src/debug/qemu/11.0.3/include/tcg, directory renamed /usr/src/debug/qemu/11.0.2/linux-user/generic -> /usr/src/debug/qemu/11.0.3/linux-user/generic, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-ppc64le-linux-user.a.p -> /usr/src/debug/qemu/11.0.3/libqemu-ppc64le-linux-user.a.p, directory renamed /usr/src/debug/qemu/11.0.2/hw/gpio -> /usr/src/debug/qemu/11.0.3/hw/gpio, directory renamed /usr/src/debug/qemu/11.0.2/hw/vfio -> /usr/src/debug/qemu/11.0.3/hw/vfio, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-mipsel-softmmu.a.p -> /usr/src/debug/qemu/11.0.3/libqemu-mipsel-softmmu.a.p, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-i386-linux-user.a.p -> /usr/s
 rc/debug/qemu/11.0.3/libqemu-i386-linux-user.a.p, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-mips-linux-user.a.p -> /usr/src/debug/qemu/11.0.3/libqemu-mips-linux-user.a.p, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/sensor -> /usr/src/debug/qemu/11.0.3/include/hw/sensor, directory renamed /usr/src/debug/qemu/11.0.2/libcommon.a.p -> /usr/src/debug/qemu/11.0.3/libcommon.a.p, directory renamed /usr/src/debug/qemu/11.0.2/hw/input -> /usr/src/debug/qemu/11.0.3/hw/input, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-mips-softmmu.a.p -> /usr/src/debug/qemu/11.0.3/libqemu-mips-softmmu.a.p, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-mips64el-linux-user.a.p -> /usr/src/debug/qemu/11.0.3/libqemu-mips64-linux-user.a.p, directory renamed /usr/src/debug/qemu/11.0.2/nbd -> /usr/src/debug/qemu/11.0.3/nbd, directory renamed /usr/src/debug/qemu/11.0.2/hw/timer -> /usr/src/debug/qemu/11.0.3/hw/timer, directory renamed /usr/src/debug/qemu/11.0.2/linux-user/x86_64 
 -> /usr/src/debug/qemu/11.0.3/linux-user/x86_64, directory renamed /usr/src/debug/qemu/11.0.2/target/riscv -> /usr/src/debug/qemu/11.0.3/target/riscv, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-arm-linux-user.a.p -> /usr/src/debug/qemu/11.0.3/libqemu-arm-linux-user.a.p, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-ppc-linux-user.a.p -> /usr/src/debug/qemu/11.0.3/libqemu-ppc-linux-user.a.p, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/display -> /usr/src/debug/qemu/11.0.3/include/hw/display, directory renamed /usr/src/debug/qemu/11.0.2/hw/char -> /usr/src/debug/qemu/11.0.3/hw/char, directory renamed /usr/src/debug/qemu/11.0.2/tcg/x86_64 -> /usr/src/debug/qemu/11.0.3/tcg/x86_64, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/misc/macio -> /usr/src/debug/qemu/11.0.3/include/hw/misc/macio, directory renamed /usr/src/debug/qemu/11.0.2/hw/watchdog -> /usr/src/debug/qemu/11.0.3/hw/watchdog, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/xen/in
 terface/arch-x86 -> /usr/src/debug/qemu/11.0.3/include/hw/xen/interface/arch-x86, directory renamed /usr/src/debug/qemu/11.0.2/scsi -> /usr/src/debug/qemu/11.0.3/scsi, directory renamed /usr/src/debug/qemu/11.0.2/tests -> /usr/src/debug/qemu/11.0.3/tests, directory renamed /usr/src/debug/qemu/11.0.2/configs/targets -> /usr/src/debug/qemu/11.0.3/configs/targets, directory renamed /usr/src/debug/qemu/11.0.2/libdecnumber/dpd -> /usr/src/debug/qemu/11.0.3/libdecnumber/dpd, directory renamed /usr/src/debug/qemu/11.0.2/hw/vfio-user -> /usr/src/debug/qemu/11.0.3/hw/vfio-user, directory renamed /usr/src/debug/qemu/11.0.2/include/monitor -> /usr/src/debug/qemu/11.0.3/include/monitor, directory renamed /usr/src/debug/qemu/11.0.2/include/scsi -> /usr/src/debug/qemu/11.0.3/include/scsi, directory renamed /usr/src/debug/qemu/11.0.2/subprojects/berkeley-testfloat-3/source -> /usr/src/debug/qemu/11.0.3/subprojects/berkeley-testfloat-3/source, directory renamed /usr/src/debug/qemu/11.0.2/ui -> /usr
 /src/debug/qemu/11.0.3/ui, directory renamed /usr/src/debug/qemu/11.0.2/include/migration -> /usr/src/debug/qemu/11.0.3/include/migration, directory renamed /usr/src/debug/qemu/11.0.2/tests/qtest/libqos -> /usr/src/debug/qemu/11.0.3/tests/qtest/libqos, directory renamed /usr/src/debug/qemu/11.0.2/tests/audio -> /usr/src/debug/qemu/11.0.3/tests/audio, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/audio -> /usr/src/debug/qemu/11.0.3/include/hw/audio, directory renamed /usr/src/debug/qemu/11.0.2/net/can -> /usr/src/debug/qemu/11.0.3/net/can, directory renamed /usr/src/debug/qemu/11.0.2/dump -> /usr/src/debug/qemu/11.0.3/dump, directory renamed /usr/src/debug/qemu/11.0.2/include/io -> /usr/src/debug/qemu/11.0.3/include/io, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-loongarch64-softmmu.a.p -> /usr/src/debug/qemu/11.0.3/libqemu-loongarch64-softmmu.a.p, directory renamed /usr/src/debug/qemu/11.0.2/linux-user/include/host/x86_64 -> /usr/src/debug/qemu/11.0.3/linux-user/i
 nclude/host/x86_64, directory renamed /usr/src/debug/qemu/11.0.2/include/disas -> /usr/src/debug/qemu/11.0.3/include/disas, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-mips64-linux-user.a.p -> /usr/src/debug/qemu/11.0.3/libqemu-mips64-softmmu.a.p, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/i386 -> /usr/src/debug/qemu/11.0.3/include/hw/i386, directory renamed /usr/src/debug/qemu/11.0.2/hw/mips -> /usr/src/debug/qemu/11.0.3/hw/mips, directory renamed /usr/src/debug/qemu/11.0.2/fpu -> /usr/src/debug/qemu/11.0.3/fpu, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-x86_64-linux-user.a.p -> /usr/src/debug/qemu/11.0.3/libqemu-x86_64-linux-user.a.p, directory renamed /usr/src/debug/qemu/11.0.2/linux-headers/linux -> /usr/src/debug/qemu/11.0.3/linux-headers/linux, directory renamed /usr/src/debug/qemu/11.0.2/qapi -> /usr/src/debug/qemu/11.0.3/qapi, directory renamed /usr/src/debug/qemu/11.0.2/stats -> /usr/src/debug/qemu/11.0.3/stats, directory renamed /usr/src/deb
 ug/qemu/11.0.2/hw/acpi -> /usr/src/debug/qemu/11.0.3/hw/acpi, directory renamed /usr/src/debug/qemu/11.0.2/subprojects/berkeley-softfloat-3/source/include -> /usr/src/debug/qemu/11.0.3/subprojects/berkeley-softfloat-3/source/include, directory renamed /usr/src/debug/qemu/11.0.2/include/fpu -> /usr/src/debug/qemu/11.0.3/include/fpu, directory renamed /usr/src/debug/qemu/11.0.2/include/libdecnumber/dpd -> /usr/src/debug/qemu/11.0.3/include/libdecnumber/dpd, directory renamed /usr/src/debug/qemu/11.0.2/host/include/x86_64/host/crypto -> /usr/src/debug/qemu/11.0.3/host/include/x86_64/host/crypto, directory renamed /usr/src/debug/qemu/11.0.2/accel -> /usr/src/debug/qemu/11.0.3/accel, directory renamed /usr/src/debug/qemu/11.0.2/fsdev -> /usr/src/debug/qemu/11.0.3/fsdev, directory renamed /usr/src/debug/qemu/11.0.2/libdecnumber -> /usr/src/debug/qemu/11.0.3/libdecnumber, directory renamed /usr/src/debug/qemu/11.0.2/authz -> /usr/src/debug/qemu/11.0.3/authz, directory renamed /usr/src/debu
 g/qemu/11.0.2/include/hw/watchdog -> /usr/src/debug/qemu/11.0.3/include/hw/watchdog, directory renamed /usr/src/debug/qemu/11.0.2/linux-user -> /usr/src/debug/qemu/11.0.3/linux-user, directory renamed /usr/src/debug/qemu/11.0.2/target/arm/tcg -> /usr/src/debug/qemu/11.0.3/target/arm/tcg, directory renamed /usr/src/debug/qemu/11.0.2/target/arm -> /usr/src/debug/qemu/11.0.3/target/arm, directory renamed /usr/src/debug/qemu/11.0.2/include -> /usr/src/debug/qemu/11.0.3/include, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-mipsel-linux-user.a.p -> /usr/src/debug/qemu/11.0.3/libqemu-mipsel-linux-user.a.p, directory renamed /usr/src/debug/qemu/11.0.2/hw/misc -> /usr/src/debug/qemu/11.0.3/hw/misc, directory renamed /usr/src/debug/qemu/11.0.2/accel/nitro -> /usr/src/debug/qemu/11.0.3/accel/nitro, directory renamed /usr/src/debug/qemu/11.0.2 -> /usr/src/debug/qemu/11.0.3, directory renamed /usr/src/debug/qemu/11.0.2/hw/scsi -> /usr/src/debug/qemu/11.0.3/hw/scsi, directory renamed /usr
 /src/debug/qemu/11.0.2/tests/qtest/migration/s390x -> /usr/src/debug/qemu/11.0.3/tests/qtest/migration/s390x, directory renamed /usr/src/debug/qemu/11.0.2/hw/smbios -> /usr/src/debug/qemu/11.0.3/hw/smbios, directory renamed /usr/src/debug/qemu/11.0.2/tests/tcg/plugins -> /usr/src/debug/qemu/11.0.3/tests/tcg/plugins, directory renamed /usr/src/debug/qemu/11.0.2/include/system -> /usr/src/debug/qemu/11.0.3/include/system, directory renamed /usr/src/debug/qemu/11.0.2/target/i386/mshv -> /usr/src/debug/qemu/11.0.3/target/i386/mshv, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/s390x -> /usr/src/debug/qemu/11.0.3/include/hw/s390x, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/core -> /usr/src/debug/qemu/11.0.3/include/hw/core, directory renamed /usr/src/debug/qemu/11.0.2/backends -> /usr/src/debug/qemu/11.0.3/backends, directory renamed /usr/src/debug/qemu/11.0.2/block/monitor -> /usr/src/debug/qemu/11.0.3/block/monitor, directory renamed /usr/src/debug/qemu/11.0.2/in
 clude/user -> /usr/src/debug/qemu/11.0.3/include/user, directory renamed /usr/src/debug/qemu/11.0.2/util -> /usr/src/debug/qemu/11.0.3/util, directory renamed /usr/src/debug/qemu/11.0.2/contrib/ivshmem-server -> /usr/src/debug/qemu/11.0.3/contrib/ivshmem-server, directory renamed /usr/src/debug/qemu/11.0.2/ebpf -> /usr/src/debug/qemu/11.0.3/ebpf, directory renamed /usr/src/debug/qemu/11.0.2/target/i386/tcg/system -> /usr/src/debug/qemu/11.0.3/target/i386/tcg/system, directory renamed /usr/src/debug/qemu/11.0.2/target/mips/tcg/system -> /usr/src/debug/qemu/11.0.3/target/mips/tcg/system, directory renamed /usr/src/debug/qemu/11.0.2/target/sh4 -> /usr/src/debug/qemu/11.0.3/target/sh4, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/usb -> /usr/src/debug/qemu/11.0.3/include/hw/usb, directory renamed /usr/src/debug/qemu/11.0.2/host/include/x86_64/host -> /usr/src/debug/qemu/11.0.3/host/include/x86_64/host, directory renamed /usr/src/debug/qemu/11.0.2/include/gdbstub -> /usr/src/d
 ebug/qemu/11.0.3/include/gdbstub, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-riscv32-linux-user.a.p -> /usr/src/debug/qemu/11.0.3/libqemu-riscv32-linux-user.a.p, directory renamed /usr/src/debug/qemu/11.0.2/hw/sh4 -> /usr/src/debug/qemu/11.0.3/hw/sh4, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/southbridge -> /usr/src/debug/qemu/11.0.3/include/hw/southbridge, directory renamed /usr/src/debug/qemu/11.0.2/io -> /usr/src/debug/qemu/11.0.3/io, directory renamed /usr/src/debug/qemu/11.0.2/accel/qtest -> /usr/src/debug/qemu/11.0.3/accel/qtest, directory renamed /usr/src/debug/qemu/11.0.2/hw/riscv -> /usr/src/debug/qemu/11.0.3/hw/riscv, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/loongarch -> /usr/src/debug/qemu/11.0.3/include/hw/loongarch, directory renamed /usr/src/debug/qemu/11.0.2/include/standard-headers/uefi -> /usr/src/debug/qemu/11.0.3/include/standard-headers/uefi, directory renamed /usr/src/debug/qemu/11.0.2/target/i386 -> /usr/src/debug/qemu/11.
 0.3/target/i386, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-aarch64-linux-user.a.p -> /usr/src/debug/qemu/11.0.3/libqemu-aarch64-linux-user.a.p, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-riscv64-linux-user.a.p -> /usr/src/debug/qemu/11.0.3/libqemu-riscv64-linux-user.a.p, directory renamed /usr/src/debug/qemu/11.0.2/qobject -> /usr/src/debug/qemu/11.0.3/qobject, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/nitro -> /usr/src/debug/qemu/11.0.3/include/hw/nitro, directory renamed /usr/src/debug/qemu/11.0.2/hw/core -> /usr/src/debug/qemu/11.0.3/hw/core, directory renamed /usr/src/debug/qemu/11.0.2/accel/stubs -> /usr/src/debug/qemu/11.0.3/accel/stubs, directory renamed /usr/src/debug/qemu/11.0.2/target/ppc -> /usr/src/debug/qemu/11.0.3/target/ppc, directory renamed /usr/src/debug/qemu/11.0.2/include/semihosting -> /usr/src/debug/qemu/11.0.3/include/semihosting, directory renamed /usr/src/debug/qemu/11.0.2/trace -> /usr/src/debug/qemu/11.0.3/trace, director
 y renamed /usr/src/debug/qemu/11.0.2/hw/i3c -> /usr/src/debug/qemu/11.0.3/hw/i3c, directory renamed /usr/src/debug/qemu/11.0.2/hw/ppc -> /usr/src/debug/qemu/11.0.3/hw/ppc, directory renamed /usr/src/debug/qemu/11.0.2/hw/rtc -> /usr/src/debug/qemu/11.0.3/hw/rtc, directory renamed /usr/src/debug/qemu/11.0.2/hw/adc -> /usr/src/debug/qemu/11.0.3/hw/adc, directory renamed /usr/src/debug/qemu/11.0.2/hw/cxl -> /usr/src/debug/qemu/11.0.3/hw/cxl, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/remote -> /usr/src/debug/qemu/11.0.3/include/hw/remote, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/ipmi -> /usr/src/debug/qemu/11.0.3/include/hw/ipmi, directory renamed /usr/src/debug/qemu/11.0.2/hw/audio -> /usr/src/debug/qemu/11.0.3/hw/audio, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/firmware -> /usr/src/debug/qemu/11.0.3/include/hw/firmware, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-loongarch64-linux-user.a.p -> /usr/src/debug/qemu/11.0.3/libqemu-loongar
 ch64-linux-user.a.p, directory renamed /usr/src/debug/qemu/11.0.2/linux-user/mips -> /usr/src/debug/qemu/11.0.3/linux-user/mips, directory renamed /usr/src/debug/qemu/11.0.2/storage-daemon -> /usr/src/debug/qemu/11.0.3/storage-daemon, directory renamed /usr/src/debug/qemu/11.0.2/tests/qtest/migration/ppc64 -> /usr/src/debug/qemu/11.0.3/tests/qtest/migration/aarch64, directory renamed /usr/src/debug/qemu/11.0.2/hw/mem -> /usr/src/debug/qemu/11.0.3/hw/mem, directory renamed /usr/src/debug/qemu/11.0.2/hw/arm -> /usr/src/debug/qemu/11.0.3/hw/arm, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/input -> /usr/src/debug/qemu/11.0.3/include/hw/input, directory renamed /usr/src/debug/qemu/11.0.2/semihosting -> /usr/src/debug/qemu/11.0.3/semihosting, directory renamed /usr/src/debug/qemu/11.0.2/tools/i386 -> /usr/src/debug/qemu/11.0.3/tools/i386, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-riscv32-softmmu.a.p -> /usr/src/debug/qemu/11.0.3/libqemu-riscv64-softmmu.a.p, director
 y renamed /usr/src/debug/qemu/11.0.2/tests/qtest -> /usr/src/debug/qemu/11.0.3/tests/qtest, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/nvram -> /usr/src/debug/qemu/11.0.3/include/hw/nvram, directory renamed /usr/src/debug/qemu/11.0.2/tests/bench -> /usr/src/debug/qemu/11.0.3/tests/bench, directory renamed /usr/src/debug/qemu/11.0.2/hw/ide -> /usr/src/debug/qemu/11.0.3/hw/ide, directory renamed /usr/src/debug/qemu/11.0.2/hw/ssi -> /usr/src/debug/qemu/11.0.3/hw/ssi, directory renamed /usr/src/debug/qemu/11.0.2/backends/tpm -> /usr/src/debug/qemu/11.0.3/backends/tpm, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/ssi -> /usr/src/debug/qemu/11.0.3/include/hw/ssi, directory renamed /usr/src/debug/qemu/11.0.2/hw/dma -> /usr/src/debug/qemu/11.0.3/hw/dma, directory renamed /usr/src/debug/qemu/11.0.2/hw/usb -> /usr/src/debug/qemu/11.0.3/hw/usb, directory renamed /usr/src/debug/qemu/11.0.2/include/accel -> /usr/src/debug/qemu/11.0.3/include/accel, directory renamed /usr/
 src/debug/qemu/11.0.2/target/i386/tcg/user -> /usr/src/debug/qemu/11.0.3/target/i386/tcg/user, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-arm-softmmu.a.p -> /usr/src/debug/qemu/11.0.3/libqemu-arm-softmmu.a.p, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-ppc-softmmu.a.p -> /usr/src/debug/qemu/11.0.3/libqemu-ppc64-softmmu.a.p, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/xen -> /usr/src/debug/qemu/11.0.3/include/hw/xen, directory renamed /usr/src/debug/qemu/11.0.2/hw/i2c -> /usr/src/debug/qemu/11.0.3/hw/i2c, directory renamed /usr/src/debug/qemu/11.0.2/net -> /usr/src/debug/qemu/11.0.3/net, directory renamed /usr/src/debug/qemu/11.0.2/include/qemu -> /usr/src/debug/qemu/11.0.3/include/qemu, directory renamed /usr/src/debug/qemu/11.0.2/hw/tpm -> /usr/src/debug/qemu/11.0.3/hw/tpm, directory renamed /usr/src/debug/qemu/11.0.2/hw/xen -> /usr/src/debug/qemu/11.0.3/hw/xen, directory renamed /usr/src/debug/qemu/11.0.2/system -> /usr/src/debug/qemu/11.0.3/system, 
 directory renamed /usr/src/debug/qemu/11.0.2/include/chardev -> /usr/src/debug/qemu/11.0.3/include/chardev, directory renamed /usr/src/debug/qemu/11.0.2/hw/pci -> /usr/src/debug/qemu/11.0.3/hw/pci, directory renamed /usr/src/debug/qemu/11.0.2/crypto -> /usr/src/debug/qemu/11.0.3/crypto, directory renamed /usr/src/debug/qemu/11.0.2/hw/fsi -> /usr/src/debug/qemu/11.0.3/hw/fsi, directory renamed /usr/src/debug/qemu/11.0.2/hw/cpu -> /usr/src/debug/qemu/11.0.3/hw/cpu, directory renamed /usr/src/debug/qemu/11.0.2/hw/ufs -> /usr/src/debug/qemu/11.0.3/hw/ufs, directory renamed /usr/src/debug/qemu/11.0.2/hw/net -> /usr/src/debug/qemu/11.0.3/hw/net, directory renamed /usr/src/debug/qemu/11.0.2/hw/hyperv -> /usr/src/debug/qemu/11.0.3/hw/hyperv, directory renamed /usr/src/debug/qemu/11.0.2/hw/i386/kvm -> /usr/src/debug/qemu/11.0.3/hw/i386/kvm, directory renamed /usr/src/debug/qemu/11.0.2/libqemu-mips64-softmmu.a.p -> /usr/src/debug/qemu/11.0.3/libqemu-mips64el-softmmu.a.p, directory renamed /us
 r/src/debug/qemu/11.0.2/audio -> /usr/src/debug/qemu/11.0.3/audio, directory renamed /usr/src/debug/qemu/11.0.2/replay -> /usr/src/debug/qemu/11.0.3/replay, directory renamed /usr/src/debug/qemu/11.0.2/include/hw/pci-host -> /usr/src/debug/qemu/11.0.3/include/hw/pci-host
packages/x86-64-v3-poky-linux/qemu/qemu-staticdev: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-staticdev: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-aarch64: PKGSIZE changed from 34314808 to 34314872 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-aarch64: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-system-aarch64: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-arm: PKGSIZE changed from 31265168 to 31265232 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-arm: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-system-arm: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-i386: PKGSIZE changed from 28918296 to 28918360 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-i386: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-system-i386: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-loongarch64: PKGSIZE changed from 14822552 to 14822616 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-loongarch64: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-system-loongarch64: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips: PKGSIZE changed from 13651064 to 13651128 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64: PKGSIZE changed from 13783608 to 13787768 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64el: PKGSIZE changed from 15693304 to 15693368 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64el: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64el: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-mipsel: PKGSIZE changed from 13651064 to 13651128 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-mipsel: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-system-mipsel: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc: PKGSIZE changed from 15772784 to 15781040 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc64: PKGSIZE changed from 16938520 to 16942680 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc64: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc64: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv32: PKGSIZE changed from 16122840 to 16127000 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv32: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv32: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv64: PKGSIZE changed from 16227736 to 16227800 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv64: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv64: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-sh4: PKGSIZE changed from 12175280 to 12175344 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-sh4: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-system-sh4: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-x86-64: PKGSIZE changed from 29195384 to 29195448 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-x86-64: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-system-x86-64: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-aarch64: PKGSIZE changed from 5934736 to 5926544 (-0%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-aarch64: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-user-aarch64: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-arm: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-user-arm: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-i386: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-user-i386: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-loongarch64: PKGSIZE changed from 2832952 to 2837048 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-loongarch64: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-user-loongarch64: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mipsel: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mipsel: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc: PKGSIZE changed from 3168944 to 3173040 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64le: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64le: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv32: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv32: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv64: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv64: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-sh4: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-user-sh4: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-vmsr-helper: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-user-vmsr-helper: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-x86-64: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu-user-x86-64: PKGV changed from 11.0.2 [default] to 11.0.3 [default]
packages/x86-64-v3-poky-linux/qemu/qemu: PV changed from "11.0.2" to "11.0.3"
packages/x86-64-v3-poky-linux/qemu/qemu: PKGV changed from 11.0.2 [default] to 11.0.3 [default]

--===============4475290280797304493==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-qemu-native-qemu-qemu-system-native-upgrade-11.0.2-1.patch"

RnJvbSBhZWI3NTU3NzUyZWFhZTdiNmE5YTY5MjEzNDg4ZmUyNjAzNmQ1NjIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjUgSnVsIDIwMjYgMDU6MzI6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBx
ZW11LW5hdGl2ZSxxZW11LHFlbXUtc3lzdGVtLW5hdGl2ZTogdXBncmFkZSAxMS4wLjIgLT4KIDEx
LjAuMywxMS4wLjIgLT4gMTEuMC4zLDExLjAuMiAtPiAxMS4wLjMKCi0tLQogLi4uL3FlbXUve3Fl
bXUtbmF0aXZlXzExLjAuMi5iYiA9PiBxZW11LW5hdGl2ZV8xMS4wLjMuYmJ9ICAgICB8IDEgKwog
Li4udS1zeXN0ZW0tbmF0aXZlXzExLjAuMi5iYiA9PiBxZW11LXN5c3RlbS1uYXRpdmVfMTEuMC4z
LmJifSB8IDEgKwogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLnFlbXUtQWRkLWFkZGl0aW9uLWVudmlyb25tZW50
LXNwYWNlLXRvLWJvb3QtbG9hZGVyLXEucGF0Y2ggfCAyICstCiAuLi51aS1zZGwyLmMtZm9yY2Ut
ZGlzYWJsZS1TRExfSElOVF9WSURFT19YMTFfRk9SQ0VfRUdMLnBhdGNoIHwgMiArLQogLi4uL3Fl
bXUvcWVtdS8wMDAyLWFwaWMtZml4dXAtZmFsbHRocm91Z2gtdG8tUElDLnBhdGNoICAgICAgICB8
IDIgKy0KIC4uLi9xZW11LzAwMDQtcWVtdS1Eby1ub3QtaW5jbHVkZS1maWxlLWlmLW5vdC1leGlz
dHMucGF0Y2ggICAgfCA0ICsrLS0KIC4uLnFlbXUtQWRkLXNvbWUtdXNlci1zcGFjZS1tbWFwLXR3
ZWFrcy10by1hZGRyZXNzLW11c2wucGF0Y2ggfCAyICstCiAuLi4vcWVtdS9xZW11LzAwMDYtcWVt
dS1EZXRlcm1pbmlzbS1maXhlcy5wYXRjaCAgICAgICAgICAgICAgIHwgMiArLQogLi4udGVzdHMt
bWVzb24uYnVpbGQtdXNlLXJlbGF0aXZlLXBhdGgtdG8tcmVmZXItdG8tZmlsZS5wYXRjaCB8IDIg
Ky0KIC4uLkRlZmluZS1NQVBfU1lOQy1hbmQtTUFQX1NIQVJFRF9WQUxJREFURS1vbi1uZWVkZWQt
bGkucGF0Y2ggfCAyICstCiAuLi4vcWVtdS8wMDEwLWNvbmZpZ3VyZS1sb29rdXAtbWVzb24tZXh1
dGFibGUtZnJvbS1QQVRILnBhdGNoIHwgMiArLQogLi4ucWVtdS1FbnN1cmUtcGlwLWFuZC10aGUt
cHl0aG9uLXZlbnYtYXJlbi10LXVzZWQtZm9yLS5wYXRjaCB8IDIgKy0KIC4uLi8wMDEyLW1lc29u
LWZpeC1jbG9zZV9yYW5nZS1kZXRlY3Rpb24tb24tb2xkZXItZ2xpYmMucGF0Y2ggfCA0ICsrLS0K
IC4uLnNpLWluY2x1ZGUtc3RhbmRhcmQtaGVhZGVycy1mb3Itdmhvc3Qtd29ya2VyLXN0cnVjdHMu
cGF0Y2ggfCAyICstCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS97cWVtdV8xMS4wLjIuYmIg
PT4gcWVtdV8xMS4wLjMuYmJ9IHwgMAogMTYgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygr
KSwgMTUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUve3Fl
bXUtbmF0aXZlXzExLjAuMi5iYiA9PiBxZW11LW5hdGl2ZV8xMS4wLjMuYmJ9ICg5OSUpCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUve3FlbXUtc3lzdGVtLW5hdGl2ZV8xMS4wLjIu
YmIgPT4gcWVtdS1zeXN0ZW0tbmF0aXZlXzExLjAuMy5iYn0gKDk5JSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcWVtdS97cWVtdV8xMS4wLjIuYmIgPT4gcWVtdV8xMS4wLjMuYmJ9ICgx
MDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUtbmF0aXZl
XzExLjAuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUtbmF0aXZlXzExLjAu
My5iYgpzaW1pbGFyaXR5IGluZGV4IDk5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcWVtdS9xZW11LW5hdGl2ZV8xMS4wLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9xZW11L3FlbXUtbmF0aXZlXzExLjAuMy5iYgppbmRleCBhNzc5NTM1MjliLi4yNmZhODRj
MTgwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LW5hdGl2ZV8x
MS4wLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1uYXRpdmVfMTEu
MC4zLmJiCkBAIC03LDMgKzcsNCBAQCByZXF1aXJlIHFlbXUtbmF0aXZlLmluYwogRVhUUkFfT0VD
T05GOmFwcGVuZCA9ICIgLS10YXJnZXQtbGlzdD0ke0BnZXRfcWVtdV91c2VybW9kZV90YXJnZXRf
bGlzdChkKX0gLS1kaXNhYmxlLXRvb2xzIC0tZGlzYWJsZS1pbnN0YWxsLWJsb2JzIC0tZGlzYWJs
ZS1ndWVzdC1hZ2VudCIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gInBpZSIKKwpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1zeXN0ZW0tbmF0aXZlXzExLjAuMi5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUtc3lzdGVtLW5hdGl2ZV8xMS4wLjMuYmIK
c2ltaWxhcml0eSBpbmRleCA5OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdS1zeXN0ZW0tbmF0aXZlXzExLjAuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3FlbXUvcWVtdS1zeXN0ZW0tbmF0aXZlXzExLjAuMy5iYgppbmRleCA3OTQ3NDk5YzVm
Li42MmU4YTBhODNiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11
LXN5c3RlbS1uYXRpdmVfMTEuMC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXUtc3lzdGVtLW5hdGl2ZV8xMS4wLjMuYmIKQEAgLTI2LDMgKzI2LDQgQEAgZG9faW5zdGFs
bDphcHBlbmQoKSB7CiAgICAgcm0gLXJmICR7RH0ke2RhdGFkaXJ9L2ljb25zLwogICAgIHJtIC1y
ZiAke0R9JHtpbmNsdWRlZGlyfS9xZW11LXBsdWdpbi5oCiB9CisKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdS5pbmMKaW5kZXggNmZjYTZiYzQ5OS4uZTQ0MGQ3NDhiMiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3FlbXUvcWVtdS5pbmMKQEAgLTQyLDcgKzQyLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2Rv
d25sb2FkLnFlbXUub3JnLyR7QlBOfS0ke1BWfS50YXIueHogXAogVVBTVFJFQU1fQ0hFQ0tfVVJJ
ID0gImh0dHBzOi8vd3d3LnFlbXUub3JnIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicWVtdS0o
P1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM3NDVm
NmVhODhlMmU4N2ZlMGRjODM4YjJiMWQ0ZTBhNzcwYmY0OGUwMWExZDVhMTg2ODQyYTFmZmY3NmNj
ZjUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGE1ZmNmZmMzMjc2MjgyMDU2OGI4MjhlZDQzMGE3
Mjg4NjRkMzRkNTBiNmQyZjMwMzU4NTk3NzYwY2JiMDUyMyIKIAogQ1ZFX1NUQVRVU1tDVkUtMjAw
Ny0wOTk4XSA9ICJub3QtYXBwbGljYWJsZS1jb25maWc6IFRoZSBWTkMgc2VydmVyIGNhbiBleHBv
c2UgaG9zdCBmaWxlcyB1ZGVyIHNvbWUgY2lyY3Vtc3RhbmNlcy4gV2UgZG9uJ3QgZW5hYmxlIGl0
IGJ5IGRlZmF1bHQuIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LzAwMDEtcWVtdS1BZGQtYWRkaXRpb24tZW52aXJvbm1lbnQtc3BhY2UtdG8tYm9vdC1sb2Fk
ZXItcS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMS1xZW11LUFk
ZC1hZGRpdGlvbi1lbnZpcm9ubWVudC1zcGFjZS10by1ib290LWxvYWRlci1xLnBhdGNoCmluZGV4
IDk0ZjIzNTU4YmMuLjM3NTBlYWVmMGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUvMDAwMS1xZW11LUFkZC1hZGRpdGlvbi1lbnZpcm9ubWVudC1zcGFjZS10by1i
b290LWxvYWRlci1xLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUv
MDAwMS1xZW11LUFkZC1hZGRpdGlvbi1lbnZpcm9ubWVudC1zcGFjZS10by1ib290LWxvYWRlci1x
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0YzAzMGZlZjZiNzViZmM5YWVkMjEwOTliMTI2
NDhmMTNmNzYyNmE2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5MTJiNDViMmQ3NGNm
YWVlZTEyMDExMGM2MmU1NWNlM2FiNWJkYjM0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogSmFzb24gV2Vzc2VsIDxqYXNvbi53ZXNzZWxAd2luZHJpdmVyLmNvbT4KIERhdGU6IEZyaSwg
MjggTWFyIDIwMTQgMTc6NDI6NDMgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gcWVtdTogQWRkIGFk
ZGl0aW9uIGVudmlyb25tZW50IHNwYWNlIHRvIGJvb3QgbG9hZGVyCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDEtdWktc2RsMi5jLWZvcmNlLWRpc2FibGUt
U0RMX0hJTlRfVklERU9fWDExX0ZPUkNFX0VHTC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUvMDAwMS11aS1zZGwyLmMtZm9yY2UtZGlzYWJsZS1TRExfSElOVF9WSURFT19Y
MTFfRk9SQ0VfRUdMLnBhdGNoCmluZGV4IGE0OTcxMGM4NmQuLmQzNGRhYjk2MjAgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMS11aS1zZGwyLmMtZm9yY2Ut
ZGlzYWJsZS1TRExfSElOVF9WSURFT19YMTFfRk9SQ0VfRUdMLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMS11aS1zZGwyLmMtZm9yY2UtZGlzYWJsZS1TRExf
SElOVF9WSURFT19YMTFfRk9SQ0VfRUdMLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwYTAy
OWRlOGM0YzMxNTA3Y2FlNTQyYjU0MTM0OTEyODM1Njk0NjdjIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA3NmZkNzk1NDkyZGQ5YzEyYzdhOGFmNTJhMzFhMzZlMjYxZmI0ZjQ0IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRy
b25peC5kZT4KIERhdGU6IFdlZCwgMTAgSnVuIDIwMjYgMTU6MDA6MjYgKzAyMDAKIFN1YmplY3Q6
IFtQQVRDSF0gdWkvc2RsMi5jOiBmb3JjZS1kaXNhYmxlIFNETF9ISU5UX1ZJREVPX1gxMV9GT1JD
RV9FR0wsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDIt
YXBpYy1maXh1cC1mYWxsdGhyb3VnaC10by1QSUMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcWVtdS9xZW11LzAwMDItYXBpYy1maXh1cC1mYWxsdGhyb3VnaC10by1QSUMucGF0Y2gKaW5k
ZXggZmU5Y2EwNTYxNC4uM2RjZWI3NDI4YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3FlbXUvcWVtdS8wMDAyLWFwaWMtZml4dXAtZmFsbHRocm91Z2gtdG8tUElDLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMi1hcGljLWZpeHVwLWZhbGx0
aHJvdWdoLXRvLVBJQy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZWI3ZjcyN2M2NGIwOTMz
N2IzOWIyMzFiZTY1MzYwMTM0ZTIwNjVlOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
NDJlMmU0ZDRjZjY1ZWMyM2UyZGU2YWE2NmM1ZmUwYjdiMGNjNTlmMiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IE1hcmsgQXNzZWxzdGluZSA8bWFyay5hc3NlbHN0aW5lQHdpbmRyaXZl
ci5jb20+CiBEYXRlOiBUdWUsIDI2IEZlYiAyMDEzIDExOjQzOjI4IC0wNTAwCiBTdWJqZWN0OiBb
UEFUQ0hdIGFwaWM6IGZpeHVwIGZhbGx0aHJvdWdoIHRvIFBJQwpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA0LXFlbXUtRG8tbm90LWluY2x1ZGUtZmlsZS1p
Zi1ub3QtZXhpc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA0
LXFlbXUtRG8tbm90LWluY2x1ZGUtZmlsZS1pZi1ub3QtZXhpc3RzLnBhdGNoCmluZGV4IGE0MTUw
NjIwZDYuLjNiMmMwMjhkNjMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXUvMDAwNC1xZW11LURvLW5vdC1pbmNsdWRlLWZpbGUtaWYtbm90LWV4aXN0cy5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDQtcWVtdS1Eby1ub3QtaW5j
bHVkZS1maWxlLWlmLW5vdC1leGlzdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDMzOTQw
MzI3YTEwY2Q1ZGRhOWQ0MTdjY2VlZjQ3ZmMzNGU5ZTI2OWQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDNiZWE2NzY1MjBmMmRhZjc5Y2Q5NDgyMGU5OTQ4Y2UwYmQ2YWEyY2EgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBPbGVrc2l5IE9iaXRvdHNreXkgPG9vYml0b3RzQGNp
c2NvLmNvbT4KIERhdGU6IFdlZCwgMjUgTWFyIDIwMjAgMjE6MjE6MzUgKzAyMDAKIFN1YmplY3Q6
IFtQQVRDSF0gcWVtdTogRG8gbm90IGluY2x1ZGUgZmlsZSBpZiBub3QgZXhpc3RzCkBAIC0xNiw3
ICsxNiw3IEBAIFNpZ25lZC1vZmYtYnk6IFNha2liIFNhamFsIDxzYWtpYi5zYWphbEB3aW5kcml2
ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBh
L2xpbnV4LXVzZXIvc3lzY2FsbC5jIGIvbGludXgtdXNlci9zeXNjYWxsLmMKLWluZGV4IDExZDNi
NDFkZi4uMmMzNmRmNTdmIDEwMDY0NAoraW5kZXggZWMyNDk4MDZiLi5iODVmNzM2MGMgMTAwNjQ0
CiAtLS0gYS9saW51eC11c2VyL3N5c2NhbGwuYwogKysrIGIvbGludXgtdXNlci9zeXNjYWxsLmMK
IEBAIC0xMTcsNyArMTE3LDkgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9x
ZW11L3FlbXUvMDAwNS1xZW11LUFkZC1zb21lLXVzZXItc3BhY2UtbW1hcC10d2Vha3MtdG8tYWRk
cmVzcy1tdXNsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA1LXFl
bXUtQWRkLXNvbWUtdXNlci1zcGFjZS1tbWFwLXR3ZWFrcy10by1hZGRyZXNzLW11c2wucGF0Y2gK
aW5kZXggMjg5ODgxNDZhOC4uZGQxMTFjMThiMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3FlbXUvcWVtdS8wMDA1LXFlbXUtQWRkLXNvbWUtdXNlci1zcGFjZS1tbWFwLXR3ZWFr
cy10by1hZGRyZXNzLW11c2wucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS8wMDA1LXFlbXUtQWRkLXNvbWUtdXNlci1zcGFjZS1tbWFwLXR3ZWFrcy10by1hZGRyZXNz
LW11c2wucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDA3MmUyYTJhOTdlMDM3NmU1NmQ5NzVj
OTg0ZGIzZjg1ODQwMjI4NDkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGU1ZDM4NWQ2
NTE5OTk2NTBkNzExNTI4NTg1YmZlMjk1OGI3MmVmMTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9y
Zz4KIERhdGU6IEZyaSwgOCBKYW4gMjAyMSAxNzoyNzowNiArMDAwMAogU3ViamVjdDogW1BBVENI
XSBxZW11OiBBZGQgc29tZSB1c2VyIHNwYWNlIG1tYXAgdHdlYWtzIHRvIGFkZHJlc3MgbXVzbCAz
MiBiaXQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNi1x
ZW11LURldGVybWluaXNtLWZpeGVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS8wMDA2LXFlbXUtRGV0ZXJtaW5pc20tZml4ZXMucGF0Y2gKaW5kZXggN2E4MTI3ODUzNy4u
YmEzMzA2ZDRlNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8w
MDA2LXFlbXUtRGV0ZXJtaW5pc20tZml4ZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3FlbXUvcWVtdS8wMDA2LXFlbXUtRGV0ZXJtaW5pc20tZml4ZXMucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDIyNjdmY2FkMTQxNmYxY2VlZjg4YWIwNTJmOWQ2OWVmZTI2ZjdkNTggTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDU5ZDU4N2JkNGM1MTI3NDgzZTk3M2JjYWI3M2Y3
ZTc2MDA0ZmZjMTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRp
ZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IE1vbiwgMSBNYXIg
MjAyMSAxMzowMDo0NyArMDAwMAogU3ViamVjdDogW1BBVENIXSBxZW11OiBEZXRlcm1pbmlzbSBm
aXhlcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA3LXRl
c3RzLW1lc29uLmJ1aWxkLXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJlZmVyLXRvLWZpbGUucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDctdGVzdHMtbWVzb24uYnVpbGQt
dXNlLXJlbGF0aXZlLXBhdGgtdG8tcmVmZXItdG8tZmlsZS5wYXRjaAppbmRleCA2MWQ3OTI0OTY5
Li5iYWJmMWJmOGZkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11
LzAwMDctdGVzdHMtbWVzb24uYnVpbGQtdXNlLXJlbGF0aXZlLXBhdGgtdG8tcmVmZXItdG8tZmls
ZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDctdGVzdHMt
bWVzb24uYnVpbGQtdXNlLXJlbGF0aXZlLXBhdGgtdG8tcmVmZXItdG8tZmlsZS5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gM2Q3YmY4NmY2OWI1ZmY4MGRiZTU0ZGMyYjNiZDNkYmEwOTcxZTBh
YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzA4ODhlNzdhZWQ3ZWI5ZDllZGIyMmRh
MTRlMjFlOTQzNTg5NDg1OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoYW5ncWlu
ZyBMaSA8Y2hhbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUaHUsIDE0IEphbiAyMDIx
IDA2OjMzOjA0ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL21lc29uLmJ1aWxkOiB1c2Ug
cmVsYXRpdmUgcGF0aCB0byByZWZlciB0byBmaWxlcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS8wMDA4LURlZmluZS1NQVBfU1lOQy1hbmQtTUFQX1NIQVJFRF9W
QUxJREFURS1vbi1uZWVkZWQtbGkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LzAwMDgtRGVmaW5lLU1BUF9TWU5DLWFuZC1NQVBfU0hBUkVEX1ZBTElEQVRFLW9uLW5lZWRl
ZC1saS5wYXRjaAppbmRleCA0ODBlMWM2YTA3Li4yYmNiNmU5NzFlIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDgtRGVmaW5lLU1BUF9TWU5DLWFuZC1NQVBf
U0hBUkVEX1ZBTElEQVRFLW9uLW5lZWRlZC1saS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcWVtdS9xZW11LzAwMDgtRGVmaW5lLU1BUF9TWU5DLWFuZC1NQVBfU0hBUkVEX1ZBTElE
QVRFLW9uLW5lZWRlZC1saS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDJhZDNkMzZjZmQz
OTVkMDU2MDk1NDBlMjMwNDhlMTcxZGE3NzliYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gMmJmNWVhNzFhNGVhNGQzYzAzOTY2ZWFkMTExMzUxNmQxOGM2ZDNkMyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBN
b24sIDIxIE1hciAyMDIyIDEwOjA5OjM4IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIERlZmluZSBN
QVBfU1lOQyBhbmQgTUFQX1NIQVJFRF9WQUxJREFURSBvbiBuZWVkZWQgbGludXgKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMC1jb25maWd1cmUtbG9va3Vw
LW1lc29uLWV4dXRhYmxlLWZyb20tUEFUSC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9x
ZW11L3FlbXUvMDAxMC1jb25maWd1cmUtbG9va3VwLW1lc29uLWV4dXRhYmxlLWZyb20tUEFUSC5w
YXRjaAppbmRleCA3MDQzYzk0MmIyLi4wNjE1OTVhYjUwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTAtY29uZmlndXJlLWxvb2t1cC1tZXNvbi1leHV0YWJs
ZS1mcm9tLVBBVEgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8w
MDEwLWNvbmZpZ3VyZS1sb29rdXAtbWVzb24tZXh1dGFibGUtZnJvbS1QQVRILnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSBlZjllYThlODM0NjhjZTk3NDA3OTk2NGE1MTA0ZGYxNzBiZWJhODVi
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2NTAyNjFkODJkMTk2MGRiNWVjZWU3YzM4
YzA3ZmNhZWJlMjEyMTk0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogPT9VVEYtOD9x
P01hcnRpbj0yMEh1bmRlYj1DMz1COGxsPz0gPG1hcnRpbkBnZWFuaXguY29tPgogRGF0ZTogV2Vk
LCAyMiBNYXkgMjAyNCAxNDowMjo1NSArMDIwMAogU3ViamVjdDogW1BBVENIXSBjb25maWd1cmU6
IGxvb2t1cCBtZXNvbiBleHV0YWJsZSBmcm9tIFBBVEgKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMS1xZW11LUVuc3VyZS1waXAtYW5kLXRoZS1weXRob24t
dmVudi1hcmVuLXQtdXNlZC1mb3ItLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS8wMDExLXFlbXUtRW5zdXJlLXBpcC1hbmQtdGhlLXB5dGhvbi12ZW52LWFyZW4tdC11c2Vk
LWZvci0ucGF0Y2gKaW5kZXggYmI0Mzk4ZjQ3NC4uOGE2N2UzZjViMyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDExLXFlbXUtRW5zdXJlLXBpcC1hbmQtdGhl
LXB5dGhvbi12ZW52LWFyZW4tdC11c2VkLWZvci0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3FlbXUvcWVtdS8wMDExLXFlbXUtRW5zdXJlLXBpcC1hbmQtdGhlLXB5dGhvbi12ZW52
LWFyZW4tdC11c2VkLWZvci0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQ2MmY3OGZlYTQ3
ZjRiMzJmZDBmNDhjNDYyNTNmMTYxY2YzMDU1NDcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDhmZTkzODRjNzg1NjRkNGY3Zjc5MjcyMDY0ZGRlYTIwZDRkMDVmOTYgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhm
b3VuZGF0aW9uLm9yZz4KIERhdGU6IFdlZCwgMjIgTWF5IDIwMjQgMTM6NTg6MjMgKzAyMDAKIFN1
YmplY3Q6IFtQQVRDSF0gcWVtdTogRW5zdXJlIHBpcCBhbmQgdGhlIHB5dGhvbiB2ZW52IGFyZW4n
dCB1c2VkIGZvciBtZXNvbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS8wMDEyLW1lc29uLWZpeC1jbG9zZV9yYW5nZS1kZXRlY3Rpb24tb24tb2xkZXItZ2xpYmMu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTItbWVzb24tZml4LWNs
b3NlX3JhbmdlLWRldGVjdGlvbi1vbi1vbGRlci1nbGliYy5wYXRjaAppbmRleCBjY2VmODUzYzNi
Li5kYjk2YjE4ZTQ0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11
LzAwMTItbWVzb24tZml4LWNsb3NlX3JhbmdlLWRldGVjdGlvbi1vbi1vbGRlci1nbGliYy5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTItbWVzb24tZml4LWNs
b3NlX3JhbmdlLWRldGVjdGlvbi1vbi1vbGRlci1nbGliYy5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gYjJiOWE5ZTM4ZjIwZmI4YWE2ZWQyNmEzYzM4OTYyNjUxZTNhOWVhZSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTMxMjlkNzEyMzRmNTdjYTEzMWQwYzkyOTUyZDY3NGQwYmYy
NjNiNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFF1YW4gU3VuIDxRdWFuLlN1bkB3
aW5kcml2ZXIuY29tPgogRGF0ZTogRnJpLCA1IEp1biAyMDI2IDExOjU0OjU3ICswMDAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIG1lc29uOiBmaXggY2xvc2VfcmFuZ2UgZGV0ZWN0aW9uIG9uIG9sZGVyIGds
aWJjCkBAIC0yNCw3ICsyNCw3IEBAIFNpZ25lZC1vZmYtYnk6IFF1YW4gU3VuIDxRdWFuLlN1bkB3
aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IDUx
ZjVmMjg1MS4uNDM1MzIwMGRiIDEwMDY0NAoraW5kZXggYzU1ZjYwMWQ2Li42ZTE3MGFkYjYgMTAw
NjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKIEBAIC0yNjM3LDcgKzI2
MzcsOCBAQCBpZiBob3N0X29zID09ICd3aW5kb3dzJwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS8wMDEzLWh3LXNjc2ktdmhvc3Qtc2NzaS1pbmNsdWRlLXN0YW5k
YXJkLWhlYWRlcnMtZm9yLXZob3N0LXdvcmtlci1zdHJ1Y3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS8wMDEzLWh3LXNjc2ktdmhvc3Qtc2NzaS1pbmNsdWRlLXN0YW5k
YXJkLWhlYWRlcnMtZm9yLXZob3N0LXdvcmtlci1zdHJ1Y3RzLnBhdGNoCmluZGV4IGQxNTdjZTA2
NTIuLjdjNDQxZTk4NDMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUvMDAxMy1ody1zY3NpLXZob3N0LXNjc2ktaW5jbHVkZS1zdGFuZGFyZC1oZWFkZXJzLWZvci12
aG9zdC13b3JrZXItc3RydWN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11LzAwMTMtaHctc2NzaS12aG9zdC1zY3NpLWluY2x1ZGUtc3RhbmRhcmQtaGVhZGVycy1m
b3Itdmhvc3Qtd29ya2VyLXN0cnVjdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGI4NzM2
Nzk4YTEwOWUyYjNhNGQ1YzAyZjVmZDgzM2JmODcwYmE3NzEgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDA2MWIwZDk5YjJkYjQwODY0MWRkNmUwOTcwYjk4NmRlMzNjZmIwMTggTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBRdWFuIFN1biA8UXVhbi5TdW5Ad2luZHJpdmVyLmNv
bT4KIERhdGU6IEZyaSwgNSBKdW4gMjAyNiAxMTo1NDo1OCArMDAwMAogU3ViamVjdDogW1BBVENI
XSBody9zY3NpL3Zob3N0LXNjc2k6IGZpeCBidWlsZCB3aXRoIG9sZGVyIGtlcm5lbCBoZWFkZXJz
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzExLjAuMi5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXVfMTEuMC4zLmJiCnNpbWlsYXJpdHkgaW5k
ZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzExLjAu
Mi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV8xMS4wLjMuYmIK
LS0gCjIuNDcuMQoK

--===============4475290280797304493==--

