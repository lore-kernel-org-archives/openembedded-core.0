Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C31C2BB9D
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:37 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web09.3953.1659679409431629209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TwcnvxVI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 010101826c9a0225-cfe4fb97-ae1e-4ab8-8f6e-b97f377e4b55-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Elvtw/yr70KFJR2U3u8wrLb1sXwC/rX+4NgwQlI8XAU=;
	b=TwcnvxVIH1Unjh5ONTtk0d0lgLNG+LW91/Q0BJ/IsCVfsdWj99FEcsEBhfrkA94L
	6RW8Brz0O7Dus18+dlpRC9BObFCUHoEsgWvtRv4CF5kXaXXdP8dMxToYfyq8yiThR0Z
	BRwKV3C2SxBTQ09VaqPGPEBUUQuQspSurX8jtKwc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Elvtw/yr70KFJR2U3u8wrLb1sXwC/rX+4NgwQlI8XAU=;
	b=eh/4yd3TpUKndi2JxW7jKaTq33r9bq+1R8PIxN5FXLh5PCtsEdNIW48giSY4aEcW
	o5uqDDKW7VC9KbZCg2ztVeMRoBdFwGG5awGx3pWajRTaW/fsZpuTxKrG2n1ffEeLx4b
	B4c3BbGLBj4vIlpRKB4MF3ZafAU/7gJ4R1ijgWiQ=
Content-Type: multipart/mixed; boundary="===============0836141686152917255=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libwpe: upgrading to 1.12.2 FAILED
Message-ID: 
 <010101826c9a0225-cfe4fb97-ae1e-4ab8-8f6e-b97f377e4b55-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:28 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168917

--===============0836141686152917255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libwpe* to *1.12.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libwpe-upgrade-1.12.0-1.12.2.patch
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
--===============0836141686152917255==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libwpe-upgrade-1.12.0-1.12.2.patch"

RnJvbSAzOTkyYWMxZjA0ODkxYWU0ZGFkOTU5Mjk4ZmYzYmYxY2FlMzk1Y2Y3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNSBBdWcgMjAyMiAwMzowNTo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YndwZTogdXBncmFkZSAxLjEyLjAgLT4gMS4xMi4yCgotLS0KIG1ldGEvcmVjaXBlcy1zYXRvL3dl
YmtpdC97bGlid3BlXzEuMTIuMC5iYiA9PiBsaWJ3cGVfMS4xMi4yLmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zYXRvL3dlYmtpdC97bGlid3BlXzEuMTIuMC5iYiA9PiBsaWJ3cGVfMS4xMi4yLmJifSAo
ODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC9saWJ3cGVfMS4xMi4w
LmJiIGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L2xpYndwZV8xLjEyLjIuYmIKc2ltaWxhcml0
eSBpbmRleCA4OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L2xpYndwZV8x
LjEyLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC9saWJ3cGVfMS4xMi4y
LmJiCmluZGV4IGFjNGVlM2ViMjMuLjIzNDBmNTM2NWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1zYXRvL3dlYmtpdC9saWJ3cGVfMS4xMi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3dl
YmtpdC9saWJ3cGVfMS4xMi4yLmJiCkBAIC0xMSw3ICsxMSw3IEBAIGluaGVyaXQgY21ha2UgZmVh
dHVyZXNfY2hlY2sgcGtnY29uZmlnCiBSRVFVSVJFRF9ESVNUUk9fRkVBVFVSRVMgPSAib3Blbmds
IgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3Bld2Via2l0Lm9yZy9yZWxlYXNlcy8ke0JQTn0tJHtQ
Vn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImU4ZWVjYTIyOGE2YjRjMzYyOTRjZmI2
M2Y3ZDNiYTlhZGE0N2E0MzA5MDRhNWE5NzNiM2M5OWM5NmE0NGMxOGMiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiNGFjNGZkMGE4YjU2MmI3MjFiZmZkMGY0NmFlOWYwNmMyYjVhMzExNDQwNzU4MTk3
OGJlODc1YTlkNjUxNjQyYSIKIAogIyBUaGlzIGlzIGEgdHdlYWsgb2YgdXBzdHJlYW0tdmVyc2lv
bi1pcy1ldmVuIG5lZWRlZCBiZWNhdXNlCiAjIGlwc3RyZWFtIGRpcmVjdG9yeSBjb250YWlucyB0
YXJiYWxscyBmb3Igb3RoZXIgY29tcG9uZW50cyBhcyB3ZWxsLgotLSAKMi4zMS4xCgo=

--===============0836141686152917255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libwpe/libwpe: PKGSIZE changed from 38191 to 42287 (+11%)
packages/core2-32-poky-linux/libwpe/libwpe: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.6.0", added "/usr/lib/libwpe-1.0.so.1.6.2"
Changes to packages/core2-32-poky-linux/libwpe (sysroot):
  /usr/lib/libwpe-1.0.so.1 changed symlink target from libwpe-1.0.so.1.6.0 to libwpe-1.0.so.1.6.2
  /usr/lib/libwpe-1.0.so.1.6.0 moved to /usr/lib/libwpe-1.0.so.1.6.2

--===============0836141686152917255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libwpe: PV changed from "1.12.0" to "1.12.2"
packages/core2-32-poky-linux/libwpe: SRC_URI changed from "https://wpewebkit.org/releases/libwpe-1.12.0.tar.xz" to "https://wpewebkit.org/releases/libwpe-1.12.2.tar.xz"
packages/core2-32-poky-linux/libwpe: PKGV changed from 1.12.0 [default] to 1.12.2 [default]
packages/core2-32-poky-linux/libwpe/libwpe-dbg: PV changed from "1.12.0" to "1.12.2"
packages/core2-32-poky-linux/libwpe/libwpe-dbg: FILELIST: removed "/usr/lib/.debug/libwpe-1.0.so.1.6.0", added "/usr/lib/.debug/libwpe-1.0.so.1.6.2"
packages/core2-32-poky-linux/libwpe/libwpe-dbg: PKGSIZE changed from 218120 to 225552 (+3%)
packages/core2-32-poky-linux/libwpe/libwpe-dbg: PKGV changed from 1.12.0 [default] to 1.12.2 [default]
packages/core2-32-poky-linux/libwpe/libwpe-dev: PV changed from "1.12.0" to "1.12.2"
packages/core2-32-poky-linux/libwpe/libwpe-dev: PKGSIZE changed from 241523 to 242756 (+1%)
packages/core2-32-poky-linux/libwpe/libwpe-dev: PKGV changed from 1.12.0 [default] to 1.12.2 [default]
packages/core2-32-poky-linux/libwpe/libwpe-doc: PV changed from "1.12.0" to "1.12.2"
packages/core2-32-poky-linux/libwpe/libwpe-doc: PKGV changed from 1.12.0 [default] to 1.12.2 [default]
packages/core2-32-poky-linux/libwpe/libwpe-locale: PV changed from "1.12.0" to "1.12.2"
packages/core2-32-poky-linux/libwpe/libwpe-locale: PKGV changed from 1.12.0 [default] to 1.12.2 [default]
packages/core2-32-poky-linux/libwpe/libwpe-src: PV changed from "1.12.0" to "1.12.2"
packages/core2-32-poky-linux/libwpe/libwpe-src: FILELIST: directory renamed /usr/src/debug/libwpe/1.12.0-r0/libwpe-1.12.0/include/wpe -> /usr/src/debug/libwpe/1.12.2-r0/libwpe-1.12.2/include/wpe, removed "/usr/src/debug/libwpe/1.12.0-r0/libwpe-1.12.0/src/pasteboard.c /usr/src/debug/libwpe/1.12.0-r0/libwpe-1.12.0/src/input.c /usr/src/debug/libwpe/1.12.0-r0/libwpe-1.12.0/src/loader-private.h /usr/src/debug/libwpe/1.12.0-r0/libwpe-1.12.0/src/view-backend.c /usr/src/debug/libwpe/1.12.0-r0/libwpe-1.12.0/src/loader.c /usr/src/debug/libwpe/1.12.0-r0/libwpe-1.12.0/src/renderer-host-private.h /usr/src/debug/libwpe/1.12.0-r0/libwpe-1.12.0/src/renderer-host.c /usr/src/debug/libwpe/1.12.0-r0/libwpe-1.12.0/src/renderer-backend-egl.c /usr/src/debug/libwpe/1.12.0-r0/libwpe-1.12.0/src/renderer-backend-egl-private.h /usr/src/debug/libwpe/1.12.0-r0/libwpe-1.12.0/src/key-unicode.c /usr/src/debug/libwpe/1.12.0-r0/libwpe-1.12.0/src/pasteboard-private.h /usr/src/debug/libwpe/1.12.0-r0/libwpe-1.12.0/src/vi
 ew-backend-private.h /usr/src/debug/libwpe/1.12.0-r0/libwpe-1.12.0/src/version.c /usr/src/debug/libwpe/1.12.0-r0/libwpe-1.12.0/src/pasteboard-generic.cpp /usr/src/debug/libwpe/1.12.0-r0/libwpe-1.12.0/src/pasteboard-noop.cpp", added "/usr/src/debug/libwpe/1.12.2-r0/libwpe-1.12.2/src/key-unicode.c /usr/src/debug/libwpe/1.12.2-r0/libwpe-1.12.2/src/pasteboard-generic.cpp /usr/src/debug/libwpe/1.12.2-r0/libwpe-1.12.2/src/view-backend.c /usr/src/debug/libwpe/1.12.2-r0/libwpe-1.12.2/src/version.c /usr/src/debug/libwpe/1.12.2-r0/libwpe-1.12.2/src/pasteboard-noop.cpp /usr/src/debug/libwpe/1.12.2-r0/libwpe-1.12.2/src/input.c /usr/src/debug/libwpe/1.12.2-r0/libwpe-1.12.2/src/loader.c /usr/src/debug/libwpe/1.12.2-r0/libwpe-1.12.2/src/pasteboard.c /usr/src/debug/libwpe/1.12.2-r0/libwpe-1.12.2/src/renderer-backend-egl.c /usr/src/debug/libwpe/1.12.2-r0/libwpe-1.12.2/src/renderer-host.c /usr/src/debug/libwpe/1.12.2-r0/libwpe-1.12.2/src/loader-private.h /usr/src/debug/libwpe/1.12.2-r0/libwpe-1.12.2/
 src/alloc.c /usr/src/debug/libwpe/1.12.2-r0/libwpe-1.12.2/src/alloc-private.h /usr/src/debug/libwpe/1.12.2-r0/libwpe-1.12.2/src/view-backend-private.h /usr/src/debug/libwpe/1.12.2-r0/libwpe-1.12.2/src/renderer-backend-egl-private.h /usr/src/debug/libwpe/1.12.2-r0/libwpe-1.12.2/src/renderer-host-private.h /usr/src/debug/libwpe/1.12.2-r0/libwpe-1.12.2/src/pasteboard-private.h"
packages/core2-32-poky-linux/libwpe/libwpe-src: PKGSIZE changed from 216811 to 222069 (+2%)
packages/core2-32-poky-linux/libwpe/libwpe-src: PKGV changed from 1.12.0 [default] to 1.12.2 [default]
packages/core2-32-poky-linux/libwpe/libwpe-staticdev: PV changed from "1.12.0" to "1.12.2"
packages/core2-32-poky-linux/libwpe/libwpe-staticdev: PKGV changed from 1.12.0 [default] to 1.12.2 [default]
packages/core2-32-poky-linux/libwpe/libwpe: PV changed from "1.12.0" to "1.12.2"
packages/core2-32-poky-linux/libwpe/libwpe: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.6.0", added "/usr/lib/libwpe-1.0.so.1.6.2"
packages/core2-32-poky-linux/libwpe/libwpe: PKGSIZE changed from 38191 to 42287 (+11%)
packages/core2-32-poky-linux/libwpe/libwpe: PKGV changed from 1.12.0 [default] to 1.12.2 [default]
Changes to packages/core2-32-poky-linux/libwpe (sysroot):
  /usr/lib/libwpe-1.0.so.1 changed symlink target from libwpe-1.0.so.1.6.0 to libwpe-1.0.so.1.6.2
  /usr/lib/libwpe-1.0.so.1.6.0 moved to /usr/lib/libwpe-1.0.so.1.6.2

--===============0836141686152917255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1660 targets, 49 skipped, 0 masked, 0 errors.
Removing 45 recipes from the core2-32 sysroot...done.
Removing 45 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-9e18c4b4201b6bb0c6e7f0784448d663a7e2d7d6"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9e18c4b4201b6bb0c6e7f0784448d663a7e2d7d6"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 203 Local 196 Mirrors 0 Missed 7 Current 171 (96% match, 98% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 177 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 178 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 181 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 182 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 744 of 1371 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.2.bb:do_fetch)
NOTE: recipe libwpe-1.12.2-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwpe-1.12.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 794 of 1371 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.2.bb:do_unpack)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 191 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwpe-1.12.2-r0: task do_unpack: Started
NOTE: Running setscene task 193 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 195 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.112.bb:do_packagedata_setscene)
NOTE: Running setscene task 196 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.112.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 198 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 199 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 200 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 201 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 202 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 203 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 204 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 205 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 206 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 207 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libwpe-1.12.2-r0: task do_unpack: Succeeded
NOTE: Running task 805 of 1371 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.2.bb:do_patch)
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.112-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.112-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libwpe-1.12.2-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwpe-1.12.2-r0: task do_patch: Succeeded
NOTE: Running task 806 of 1371 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 807 of 1371 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.2.bb:do_generate_toolchain_file)
NOTE: Running task 808 of 1371 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.2.bb:do_populate_lic)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 209 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 212 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 213 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.112-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 215 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.112-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 219 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 221 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 222 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 226 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 227 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libwpe-1.12.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.12.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe libwpe-1.12.2-r0: task do_populate_lic: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwpe-1.12.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 233 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 234 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libwpe-1.12.2-r0: task do_populate_lic: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.2.bb:do_populate_lic unihash changed to 4df59338e60a670136e304a7674858dc28c7330b2dd3c6518a684592cbef307f
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwpe-1.12.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 237 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 239 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 241 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 247 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 250 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 252 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 255 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 256 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 258 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 269 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 270 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 271 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 272 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 273 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 275 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 276 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 277 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 278 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 280 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 281 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 284 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 291 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 301 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 302 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 304 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 305 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 306 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 310 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 322 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 326 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 330 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 331 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 335 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 339 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 344 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 347 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 349 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 351 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 353 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 356 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 361 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 362 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 368 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 371 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 372 of 374 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1352 of 1371 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwpe-1.12.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.12.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1363 of 1371 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.2.bb:do_configure)
NOTE: recipe libwpe-1.12.2-r0: task do_configure: Started
NOTE: recipe libwpe-1.12.2-r0: task do_configure: Succeeded
NOTE: Running task 1364 of 1371 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.2.bb:do_compile)
NOTE: recipe libwpe-1.12.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/build --target all --
| [1/13] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc -DWPE_COMPILATION -Dwpe_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot/usr/include/libdrm -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native=  -Wall -fPIC -fvisibility=hidden -std=gnu99 -MD -MT CMakeFiles/wpe.dir/src/alloc.c.o -MF CMakeFiles/wpe.dir/src/alloc.c.o.d -o CMakeFiles/wpe.dir/src/alloc.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src/alloc.c
| [2/13] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc -DWPE_COMPILATION -Dwpe_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot/usr/include/libdrm -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native=  -Wall -fPIC -fvisibility=hidden -std=gnu99 -MD -MT CMakeFiles/wpe.dir/src/version.c.o -MF CMakeFiles/wpe.dir/src/version.c.o.d -o CMakeFiles/wpe.dir/src/version.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src/version.c
| [3/13] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc -DWPE_COMPILATION -Dwpe_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot/usr/include/libdrm -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native=  -Wall -fPIC -fvisibility=hidden -std=gnu99 -MD -MT CMakeFiles/wpe.dir/src/renderer-host.c.o -MF CMakeFiles/wpe.dir/src/renderer-host.c.o.d -o CMakeFiles/wpe.dir/src/renderer-host.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src/renderer-host.c
| [4/13] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-g++ -DWPE_COMPILATION -Dwpe_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot/usr/include/libdrm -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -fno-exceptions -fno-rtti -Wall -fPIC -fvisibility=hidden -std=gnu++11 -MD -MT CMakeFiles/wpe.dir/src/pasteboard-noop.cpp.o -MF CMakeFiles/wpe.dir/src/pasteboard-noop.cpp.o.d -o CMakeFiles/wpe.dir/src/pasteboard-noop.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src/pasteboard-noop.cpp
| [5/13] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc -DWPE_COMPILATION -Dwpe_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot/usr/include/libdrm -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native=  -Wall -fPIC -fvisibility=hidden -std=gnu99 -MD -MT CMakeFiles/wpe.dir/src/pasteboard.c.o -MF CMakeFiles/wpe.dir/src/pasteboard.c.o.d -o CMakeFiles/wpe.dir/src/pasteboard.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src/pasteboard.c
| [6/13] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc -DWPE_COMPILATION -Dwpe_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot/usr/include/libdrm -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native=  -Wall -fPIC -fvisibility=hidden -std=gnu99 -MD -MT CMakeFiles/wpe.dir/src/loader.c.o -MF CMakeFiles/wpe.dir/src/loader.c.o.d -o CMakeFiles/wpe.dir/src/loader.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src/loader.c
| [7/13] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc -DWPE_COMPILATION -Dwpe_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot/usr/include/libdrm -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native=  -Wall -fPIC -fvisibility=hidden -std=gnu99 -MD -MT CMakeFiles/wpe.dir/src/key-unicode.c.o -MF CMakeFiles/wpe.dir/src/key-unicode.c.o.d -o CMakeFiles/wpe.dir/src/key-unicode.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src/key-unicode.c
| [8/13] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc -DWPE_COMPILATION -Dwpe_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot/usr/include/libdrm -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native=  -Wall -fPIC -fvisibility=hidden -std=gnu99 -MD -MT CMakeFiles/wpe.dir/src/renderer-backend-egl.c.o -MF CMakeFiles/wpe.dir/src/renderer-backend-egl.c.o.d -o CMakeFiles/wpe.dir/src/renderer-backend-egl.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src/renderer-backend-egl.c
| [9/13] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc -DWPE_COMPILATION -Dwpe_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot/usr/include/libdrm -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native=  -Wall -fPIC -fvisibility=hidden -std=gnu99 -MD -MT CMakeFiles/wpe.dir/src/view-backend.c.o -MF CMakeFiles/wpe.dir/src/view-backend.c.o.d -o CMakeFiles/wpe.dir/src/view-backend.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src/view-backend.c
| [10/13] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc -DWPE_COMPILATION -Dwpe_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot/usr/include/libdrm -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/bui
 ld/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native=  -Wall -fPIC -fvisibility=hidden -std=gnu99 -MD -MT CMakeFiles/wpe.dir/src/input.c.o -MF CMakeFiles/wpe.dir/src/input.c.o.d -o CMakeFiles/wpe.dir/src/input.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src/input.c
| [11/13] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-g++ -DWPE_COMPILATION -Dwpe_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot/usr/include/libdrm -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/bui
 ld/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -fno-exceptions -fno-rtti -Wall -fPIC -fvisibility=hidden -std=gnu++11 -MD -MT CMakeFiles/wpe.dir/src/pasteboard-generic.cpp.o -MF CMakeFiles/wpe.dir/src/pasteboard-generic.cpp.o.d -o CMakeFiles/wpe.dir/src/pasteboard-generic.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src/pasteboard-generic.cpp
| FAILED: CMakeFiles/wpe.dir/src/pasteboard-generic.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-g++ -DWPE_COMPILATION -Dwpe_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/include -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot/usr/include/libdrm -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0=/usr/src/debug/libwpe/1.12.2-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -fno-exceptions -fno-rtti -Wall -fPIC -fvisibility=hidden -std=gnu++11 -MD -MT CMakeFiles/wpe.dir/src/pasteboard-generic.cpp.o -MF CMakeFiles/wpe.dir/src/pasteboard-generic.cpp.o.d -o CMakeFiles/wpe.dir/src/pasteboard-generic.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src/pasteboard-generic.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot/usr/include/pthread.h:30,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot/usr/include/c++/12.1.0/i686-poky-linux-musl/bits/gthr-default.h:35,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot/usr/include/c++/12.1.0/i686-poky-linux-musl/bits/gthr.h:148,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot/usr/include/c++/12.1.0/ext/atomicity.h:35,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot/usr/include/c++/12.1.0/bits/basic_string.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot/usr/include/c++/12.1.0/string:53,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/libwpe-1.12.2/src/pasteboard-generic.cpp:33:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot/usr/include/sched.h:84:7: error: attempt to use poisoned "calloc"
|    84 | void *calloc(size_t, size_t);
|       |       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot/usr/include/sched.h:85:6: error: attempt to use poisoned "free"
|    85 | void free(void *);
|       |      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot/usr/include/sched.h:124:36: error: attempt to use poisoned "calloc"
|   124 | #define CPU_ALLOC(n) ((cpu_set_t *)calloc(1,CPU_ALLOC_SIZE(n)))
|       |                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/recipe-sysroot/usr/include/sched.h:125:23: error: attempt to use poisoned "free"
|   125 | #define CPU_FREE(set) free(set)
|       |                       ^
| ninja: build stopped: subcommand failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/temp/run.do_compile.484267:154 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/temp/run.do_compile.484267, line 154
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/temp/run.do_compile.484267, line 148
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/temp/run.do_compile.484267, line 143
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/temp/run.do_compile.484267, line 167
NOTE: recipe libwpe-1.12.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1364 tasks of which 1355 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.2.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libwpe-1.12.2-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/temp/run.do_compile.484267', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libwpe/1.12.2-r0/temp/log.do_compile.484267
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/libwpe_1.12.2.bb:do_compile) failed with exit code '1'

--===============0836141686152917255==--

