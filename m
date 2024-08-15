Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C73EC54F30
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:06 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.131419.1723748333894603541
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=eWpHtuqm;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=M6IO/285;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019157683d78-1e2c95e2-ccda-49ba-99a0-331e3d8668f2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eXaNdBmLqbutHy2shztvl/T42akC0yi1zbwhkjZbNZY=;
	b=eWpHtuqm5xHy9hQ5DlRhqseiqNQ4oc5oPejKHlDsjJoC2ptEw15z9BkHoMIWBa9j
	S80ge05sJtwa5NG+ZONUq+V2rx+ZetqAnyYHj6W0s91HATpPeqn7uoO7+95Sbd1dAwa
	I3VvFDkFBzLG6rPt4Dn9BPUHiSSyBiE+kEyH2bkw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eXaNdBmLqbutHy2shztvl/T42akC0yi1zbwhkjZbNZY=;
	b=M6IO/285zYpWq5R4GqhYIGWwgXPPJvxz8xaC3Wxx59thZDlEc1fdhUZ5lHHwB6qm
	Um2TAvmD/6EaDMuUSnkZgiETR2K4H7IZe8fTg8lJOM3FMsjUIR83qGnaQcRqfoq3byj
	bT1/w9d4GuALG0mrnJh/VtF9/AzuSto9Ci95qguM=
Content-Type: multipart/mixed; boundary="===============5055926112442910550=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsdl2: upgrading to 2.30.6 SUCCEEDED
Message-ID: <0101019157683d78-1e2c95e2-ccda-49ba-99a0-331e3d8668f2-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203412

--===============5055926112442910550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsdl2* to *2.30.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsdl2-upgrade-2.30.5-2.30.6.patch
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
From da075d015e04ebb552e42f6802d83331037ec5d8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 15:13:54 +0000
Subject: [PATCH] libsdl2: upgrade 2.30.5 -> 2.30.6

---
 .../libsdl2/{libsdl2_2.30.5.bb => libsdl2_2.30.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.30.5.bb => libsdl2_2.30.6.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.30.6.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.30.6.bb
index 302c52ee9c..9d1f79f662 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.30.6.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "f374f3fa29c37dfcc20822d4a7d7dc57e58924d1a5f2ad511bfab4c8193de63b"
+SRC_URI[sha256sum] = "c6ef64ca18a19d13df6eb22df9aff19fb0db65610a74cc81dae33a82235cacd4"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.44.0


--===============5055926112442910550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libsdl2/libsdl2: FILELIST: removed "/usr/lib/libSDL2-2.0.so.0.3000.5", added "/usr/lib/libSDL2-2.0.so.0.3000.6"
Changes to packages/core2-64-poky-linux/libsdl2 (sysroot):
  /usr/lib/libSDL2-2.0.so.0 changed symlink target from libSDL2-2.0.so.0.3000.5 to libSDL2-2.0.so.0.3000.6
  /usr/lib/libSDL2-2.0.so.0.3000.5 moved to /usr/lib/libSDL2-2.0.so.0.3000.6

--===============5055926112442910550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libsdl2: PKGV changed from 2.30.5 [default] to 2.30.6 [default]
packages/core2-64-poky-linux/libsdl2: PV changed from "2.30.5" to "2.30.6"
packages/core2-64-poky-linux/libsdl2: SRC_URI changed from "http://www.libsdl.org/release/SDL2-2.30.5.tar.gz" to "http://www.libsdl.org/release/SDL2-2.30.6.tar.gz"
packages/core2-64-poky-linux/libsdl2/libsdl2-bin: PKGV changed from 2.30.5 [default] to 2.30.6 [default]
packages/core2-64-poky-linux/libsdl2/libsdl2-bin: PV changed from "2.30.5" to "2.30.6"
packages/core2-64-poky-linux/libsdl2/libsdl2-dbg: PKGSIZE changed from 7275864 to 7277136 (+0%)
packages/core2-64-poky-linux/libsdl2/libsdl2-dbg: PKGV changed from 2.30.5 [default] to 2.30.6 [default]
packages/core2-64-poky-linux/libsdl2/libsdl2-dbg: FILELIST: removed "/usr/lib/.debug/libSDL2-2.0.so.0.3000.5", added "/usr/lib/.debug/libSDL2-2.0.so.0.3000.6"
packages/core2-64-poky-linux/libsdl2/libsdl2-dbg: PV changed from "2.30.5" to "2.30.6"
packages/core2-64-poky-linux/libsdl2/libsdl2-dev: PKGSIZE changed from 2452310 to 2452548 (+0%)
packages/core2-64-poky-linux/libsdl2/libsdl2-dev: PKGV changed from 2.30.5 [default] to 2.30.6 [default]
packages/core2-64-poky-linux/libsdl2/libsdl2-dev: PV changed from "2.30.5" to "2.30.6"
packages/core2-64-poky-linux/libsdl2/libsdl2-doc: PKGV changed from 2.30.5 [default] to 2.30.6 [default]
packages/core2-64-poky-linux/libsdl2/libsdl2-doc: PV changed from "2.30.5" to "2.30.6"
packages/core2-64-poky-linux/libsdl2/libsdl2-locale: PKGV changed from 2.30.5 [default] to 2.30.6 [default]
packages/core2-64-poky-linux/libsdl2/libsdl2-locale: PV changed from "2.30.5" to "2.30.6"
packages/core2-64-poky-linux/libsdl2/libsdl2-src: PKGSIZE changed from 10531063 to 10540502 (+0%)
packages/core2-64-poky-linux/libsdl2/libsdl2-src: PKGV changed from 2.30.5 [default] to 2.30.6 [default]
packages/core2-64-poky-linux/libsdl2/libsdl2-src: FILELIST: directory renamed /usr/src/debug/libsdl2/2.30.5/src/video -> /usr/src/debug/libsdl2/2.30.6/src/video, directory renamed /usr/src/debug/libsdl2/2.30.5/src/loadso/dlopen -> /usr/src/debug/libsdl2/2.30.6/src/loadso/dlopen, directory renamed /usr/src/debug/libsdl2/2.30.5/src/video/khronos/vulkan -> /usr/src/debug/libsdl2/2.30.6/src/video/khronos/vulkan, directory renamed /usr/src/debug/libsdl2/2.30.5/src/audio/alsa -> /usr/src/debug/libsdl2/2.30.6/src/audio/alsa, directory renamed /usr/src/debug/libsdl2/2.30.5/src/atomic -> /usr/src/debug/libsdl2/2.30.6/src/atomic, directory renamed /usr/src/debug/libsdl2/2.30.5/src/dynapi -> /usr/src/debug/libsdl2/2.30.6/src/dynapi, directory renamed /usr/src/debug/libsdl2/2.30.5/src/audio/pulseaudio -> /usr/src/debug/libsdl2/2.30.6/src/audio/pulseaudio, directory renamed /usr/src/debug/libsdl2/2.30.5/src/power/linux -> /usr/src/debug/libsdl2/2.30.6/src/power/linux, directory renamed /usr/src/d
 ebug/libsdl2/2.30.5/src/thread/pthread -> /usr/src/debug/libsdl2/2.30.6/src/thread/pthread, directory renamed /usr/src/debug/libsdl2/2.30.5/src/sensor -> /usr/src/debug/libsdl2/2.30.6/src/sensor, directory renamed /usr/src/debug/libsdl2/2.30.5/src/render -> /usr/src/debug/libsdl2/2.30.6/src/render, directory renamed /usr/src/debug/libsdl2/2.30.5/src/video/x11 -> /usr/src/debug/libsdl2/2.30.6/src/video/x11, directory renamed /usr/src/debug/libsdl2/2.30.5/src/video/offscreen -> /usr/src/debug/libsdl2/2.30.6/src/video/offscreen, directory renamed /usr/src/debug/libsdl2/2.30.5/src/core/linux -> /usr/src/debug/libsdl2/2.30.6/src/core/linux, directory renamed /usr/src/debug/libsdl2/2.30.5/src/core/unix -> /usr/src/debug/libsdl2/2.30.6/src/core/unix, directory renamed /usr/src/debug/libsdl2/2.30.5/src/misc/unix -> /usr/src/debug/libsdl2/2.30.6/src/misc/unix, directory renamed /usr/src/debug/libsdl2/2.30.5/src/filesystem/unix -> /usr/src/debug/libsdl2/2.30.6/src/filesystem/unix, directory r
 enamed /usr/src/debug/libsdl2/2.30.5/src/render/opengles2 -> /usr/src/debug/libsdl2/2.30.6/src/render/opengles2, directory renamed /usr/src/debug/libsdl2/2.30.5/src/video/wayland -> /usr/src/debug/libsdl2/2.30.6/src/video/wayland, directory renamed /usr/src/debug/libsdl2/2.30.5/wayland-generated-protocols -> /usr/src/debug/libsdl2/2.30.6/wayland-generated-protocols, directory renamed /usr/src/debug/libsdl2/2.30.5/src/locale -> /usr/src/debug/libsdl2/2.30.6/src/locale, directory renamed /usr/src/debug/libsdl2/2.30.5/src/haptic/linux -> /usr/src/debug/libsdl2/2.30.6/src/haptic/linux, directory renamed /usr/src/debug/libsdl2/2.30.5/src/hidapi/linux -> /usr/src/debug/libsdl2/2.30.6/src/hidapi/linux, directory renamed /usr/src/debug/libsdl2/2.30.5/include/SDL2 -> /usr/src/debug/libsdl2/2.30.6/include/SDL2, directory renamed /usr/src/debug/libsdl2/2.30.5/src/joystick/hidapi/steam -> /usr/src/debug/libsdl2/2.30.6/src/joystick/hidapi/steam, directory renamed /usr/src/debug/libsdl2/2.30.5/sr
 c/hidapi -> /usr/src/debug/libsdl2/2.30.6/src/hidapi, directory renamed /usr/src/debug/libsdl2/2.30.5/src/hidapi/hidapi -> /usr/src/debug/libsdl2/2.30.6/src/hidapi/hidapi, directory renamed /usr/src/debug/libsdl2/2.30.5/src/stdlib -> /usr/src/debug/libsdl2/2.30.6/src/stdlib, directory renamed /usr/src/debug/libsdl2/2.30.5/src/haptic -> /usr/src/debug/libsdl2/2.30.6/src/haptic, directory renamed /usr/src/debug/libsdl2/2.30.5/src/file -> /usr/src/debug/libsdl2/2.30.6/src/file, directory renamed /usr/src/debug/libsdl2/2.30.5/src/render/opengles -> /usr/src/debug/libsdl2/2.30.6/src/render/opengles, directory renamed /usr/src/debug/libsdl2/2.30.5/src/sensor/dummy -> /usr/src/debug/libsdl2/2.30.6/src/sensor/dummy, directory renamed /usr/src/debug/libsdl2/2.30.5/src/cpuinfo -> /usr/src/debug/libsdl2/2.30.6/src/cpuinfo, directory renamed /usr/src/debug/libsdl2/2.30.5/src/misc -> /usr/src/debug/libsdl2/2.30.6/src/misc, directory renamed /usr/src/debug/libsdl2/2.30.5/src/render/opengl -> /usr
 /src/debug/libsdl2/2.30.6/src/render/opengl, directory renamed /usr/src/debug/libsdl2/2.30.5/src/locale/unix -> /usr/src/debug/libsdl2/2.30.6/src/locale/unix, directory renamed /usr/src/debug/libsdl2/2.30.5/src/audio -> /usr/src/debug/libsdl2/2.30.6/src/audio, directory renamed /usr/src/debug/libsdl2/2.30.5/src/render/software -> /usr/src/debug/libsdl2/2.30.6/src/render/software, directory renamed /usr/src/debug/libsdl2/2.30.5/src/test -> /usr/src/debug/libsdl2/2.30.6/src/test, directory renamed /usr/src/debug/libsdl2/2.30.5/src/main/dummy -> /usr/src/debug/libsdl2/2.30.6/src/main/dummy, directory renamed /usr/src/debug/libsdl2/2.30.5/src/power -> /usr/src/debug/libsdl2/2.30.6/src/power, directory renamed /usr/src/debug/libsdl2/2.30.5/src/joystick/hidapi -> /usr/src/debug/libsdl2/2.30.6/src/joystick/hidapi, directory renamed /usr/src/debug/libsdl2/2.30.5/src/joystick/virtual -> /usr/src/debug/libsdl2/2.30.6/src/joystick/virtual, directory renamed /usr/src/debug/libsdl2/2.30.5/src/jo
 ystick -> /usr/src/debug/libsdl2/2.30.6/src/joystick, directory renamed /usr/src/debug/libsdl2/2.30.5/src/joystick/steam -> /usr/src/debug/libsdl2/2.30.6/src/joystick/steam, directory renamed /usr/src/debug/libsdl2/2.30.5/src/events -> /usr/src/debug/libsdl2/2.30.6/src/events, directory renamed /usr/src/debug/libsdl2/2.30.5/include -> /usr/src/debug/libsdl2/2.30.6/include, directory renamed /usr/src/debug/libsdl2/2.30.5/src/audio/dummy -> /usr/src/debug/libsdl2/2.30.6/src/audio/dummy, directory renamed /usr/src/debug/libsdl2/2.30.5/src/thread -> /usr/src/debug/libsdl2/2.30.6/src/thread, directory renamed /usr/src/debug/libsdl2/2.30.5/src/timer/unix -> /usr/src/debug/libsdl2/2.30.6/src/timer/unix, directory renamed /usr/src/debug/libsdl2/2.30.5/src/joystick/linux -> /usr/src/debug/libsdl2/2.30.6/src/joystick/linux, directory renamed /usr/src/debug/libsdl2/2.30.5/src/timer -> /usr/src/debug/libsdl2/2.30.6/src/timer, directory renamed /usr/src/debug/libsdl2/2.30.5/src/video/yuv2rgb -> 
 /usr/src/debug/libsdl2/2.30.6/src/video/yuv2rgb, directory renamed /usr/src/debug/libsdl2/2.30.5/src/libm -> /usr/src/debug/libsdl2/2.30.6/src/libm, removed "/usr/src/debug/libsdl2/2.30.5/src/SDL_list.h /usr/src/debug/libsdl2/2.30.5/src/SDL_utils_c.h /usr/src/debug/libsdl2/2.30.5/src/SDL_error_c.h /usr/src/debug/libsdl2/2.30.5/src/SDL_log_c.h /usr/src/debug/libsdl2/2.30.5/src/SDL_assert.c /usr/src/debug/libsdl2/2.30.5/src/SDL_list.c /usr/src/debug/libsdl2/2.30.5/src/SDL_log.c /usr/src/debug/libsdl2/2.30.5/src/SDL_assert_c.h /usr/src/debug/libsdl2/2.30.5/src/SDL_guid.c /usr/src/debug/libsdl2/2.30.5/src/SDL.c /usr/src/debug/libsdl2/2.30.5/src/SDL_hints_c.h /usr/src/debug/libsdl2/2.30.5/src/SDL_utils.c /usr/src/debug/libsdl2/2.30.5/src/SDL_dataqueue.c /usr/src/debug/libsdl2/2.30.5/src/SDL_error.c /usr/src/debug/libsdl2/2.30.5/src/SDL_hints.c /usr/src/debug/libsdl2/2.30.5/src/SDL_dataqueue.h", added "/usr/src/debug/libsdl2/2.30.6/src/SDL_list.h /usr/src/debug/libsdl2/2.30.6/src/SDL_util
 s_c.h /usr/src/debug/libsdl2/2.30.6/src/SDL_error_c.h /usr/src/debug/libsdl2/2.30.6/src/SDL_log_c.h /usr/src/debug/libsdl2/2.30.6/src/SDL_assert.c /usr/src/debug/libsdl2/2.30.6/src/SDL_list.c /usr/src/debug/libsdl2/2.30.6/src/SDL_log.c /usr/src/debug/libsdl2/2.30.6/src/SDL_assert_c.h /usr/src/debug/libsdl2/2.30.6/src/SDL_guid.c /usr/src/debug/libsdl2/2.30.6/src/SDL.c /usr/src/debug/libsdl2/2.30.6/src/SDL_hints_c.h /usr/src/debug/libsdl2/2.30.6/src/SDL_utils.c /usr/src/debug/libsdl2/2.30.6/src/SDL_dataqueue.c /usr/src/debug/libsdl2/2.30.6/src/SDL_error.c /usr/src/debug/libsdl2/2.30.6/src/SDL_internal.h /usr/src/debug/libsdl2/2.30.6/src/SDL_hints.c /usr/src/debug/libsdl2/2.30.6/src/SDL_dataqueue.h"
packages/core2-64-poky-linux/libsdl2/libsdl2-src: PV changed from "2.30.5" to "2.30.6"
packages/core2-64-poky-linux/libsdl2/libsdl2-staticdev: PKGSIZE changed from 14475972 to 14478804 (+0%)
packages/core2-64-poky-linux/libsdl2/libsdl2-staticdev: PKGV changed from 2.30.5 [default] to 2.30.6 [default]
packages/core2-64-poky-linux/libsdl2/libsdl2-staticdev: PV changed from "2.30.5" to "2.30.6"
packages/core2-64-poky-linux/libsdl2/libsdl2: PKGV changed from 2.30.5 [default] to 2.30.6 [default]
packages/core2-64-poky-linux/libsdl2/libsdl2: FILELIST: removed "/usr/lib/libSDL2-2.0.so.0.3000.5", added "/usr/lib/libSDL2-2.0.so.0.3000.6"
packages/core2-64-poky-linux/libsdl2/libsdl2: PV changed from "2.30.5" to "2.30.6"
Changes to packages/core2-64-poky-linux/libsdl2 (sysroot):
  /usr/lib/libSDL2-2.0.so.0 changed symlink target from libSDL2-2.0.so.0.3000.5 to libSDL2-2.0.so.0.3000.6
  /usr/lib/libSDL2-2.0.so.0.3000.5 moved to /usr/lib/libSDL2-2.0.so.0.3000.6

--===============5055926112442910550==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsdl2-upgrade-2.30.5-2.30.6.patch"

RnJvbSBkYTA3NWQwMTVlMDRlYmI1NTJlNDJmNjgwMmQ4MzMzMTAzN2VjNWQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTU6MTM6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzZGwyOiB1cGdyYWRlIDIuMzAuNSAtPiAyLjMwLjYKCi0tLQogLi4uL2xpYnNkbDIve2xpYnNk
bDJfMi4zMC41LmJiID0+IGxpYnNkbDJfMi4zMC42LmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL2xpYnNkbDIve2xpYnNkbDJfMi4zMC41LmJiID0+IGxpYnNkbDJfMi4z
MC42LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJzZGwy
L2xpYnNkbDJfMi4zMC41LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnNkbDIvbGlic2Rs
Ml8yLjMwLjYuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2xpYnNkbDIvbGlic2RsMl8yLjMwLjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy9saWJzZGwyL2xpYnNkbDJfMi4zMC42LmJiCmluZGV4IDMwMmM1MmVlOWMuLjlk
MWY3OWY2NjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJzZGwyL2xpYnNk
bDJfMi4zMC41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJzZGwyL2xpYnNkbDJf
Mi4zMC42LmJiCkBAIC0yNSw3ICsyNSw3IEBAIFNSQ19VUkkgPSAiaHR0cDovL3d3dy5saWJzZGwu
b3JnL3JlbGVhc2UvU0RMMi0ke1BWfS50YXIuZ3oiCiAKIFMgPSAiJHtXT1JLRElSfS9TREwyLSR7
UFZ9IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjM3NGYzZmEyOWMzN2RmY2MyMDgyMmQ0YTdk
N2RjNTdlNTg5MjRkMWE1ZjJhZDUxMWJmYWI0YzgxOTNkZTYzYiIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICJjNmVmNjRjYTE4YTE5ZDEzZGY2ZWIyMmRmOWFmZjE5ZmIwZGI2NTYxMGE3NGNjODFkYWUz
M2E4MjIzNWNhY2Q0IgogCiBpbmhlcml0IGNtYWtlIGxpYl9wYWNrYWdlIGJpbmNvbmZpZy1kaXNh
YmxlZCBwa2djb25maWcgdXBzdHJlYW0tdmVyc2lvbi1pcy1ldmVuCiAKLS0gCjIuNDQuMAoK

--===============5055926112442910550==--

