Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3235C88CB0
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:16 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.3771.1684186748712335923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EBbKVeBm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188215a5b51-9b049d14-ebef-439f-971a-83fe1b1bb57a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FJkTbFHxF0Pj7v/JPPDpsX7TmKcO4IDNFpUv8Tvj9dA=;
	b=EBbKVeBmvKwVtUjK2mbKusH6aGNC1ZFtvHAr2LhiwsB30/UuyAKwHKOtcgASrlH/
	ev9k2xBlhlksVrAu45uYsSlWGPZOR3dqWNrTScmbPalO38qXsgDye+1P2rXlX6YPrOJ
	4NG9nsY8Degtehw4906NvsIcxwVRBWANF9pfTXks=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FJkTbFHxF0Pj7v/JPPDpsX7TmKcO4IDNFpUv8Tvj9dA=;
	b=P4eUKB+UMQtNBsBJG4SGm7k0uRXqR/Srbz04f4GE1ZSwQ7sKea7ZQ64mbVPiVoiS
	/rBoG8hqsKrqajceb1JltpgF3esmBE6ld+hLWAL2azP69LacFg/YCx8OMUVuxKNEV9d
	6mQhRBE+RkDpphQ7mQZ+F40zot7kjyX816clxH7o=
Content-Type: multipart/mixed; boundary="===============6827128576359864698=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva: upgrading to 2.18.0 SUCCEEDED
Message-ID: <01010188215a5b51-9b049d14-ebef-439f-971a-83fe1b1bb57a-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181350

--===============6827128576359864698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva* to *2.18.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libva-upgrade-2.16.0-2.18.0.patch
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
--===============6827128576359864698==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libva-upgrade-2.16.0-2.18.0.patch"

RnJvbSA1N2RhZTQ2NWM5ZmJlZWQ3NDE1MWQ1NDY1MWJiODIxMGM1YTA4ZTg4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTc6NTI6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ2YTogdXBncmFkZSAyLjE2LjAgLT4gMi4xOC4wCgotLS0KIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy9saWJ2YS9saWJ2YS5pbmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9y
ZWNpcGVzLWdyYXBoaWNzL2xpYnZhL3tsaWJ2YV8yLjE2LjAuYmIgPT4gbGlidmFfMi4xOC4wLmJi
fSB8IDAKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEve2xpYnZhXzIuMTYuMC5iYiA9PiBsaWJ2
YV8yLjE4LjAuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9s
aWJ2YS9saWJ2YS5pbmMgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEuaW5jCmlu
ZGV4IDBmMTZkYWNjOTguLjdlZDBjOWVkODkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9saWJ2YS9saWJ2YS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xp
YnZhLmluYwpAQCAtMTgsNyArMTgsNyBAQCBMSUNFTlNFID0gIk1JVCIKIAogU1JDX1VSSSA9ICIk
e0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vbGlidmEtJHtQVn0udGFyLmJ6MiIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTJlNDg5NDBmOTRhY2IwYWY1ODJl
NWVmMDM1Mzc4MDBmIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjExNWZhY2EwZGIyYzQxN2EzN2Rh
NDk4MzA4NzBlMjYwNDUwZmExMzA2NmY1ZTI0ZTI1MmEyMGMzNmQ5MjBhMWMiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiYTM1NzdlZWJhMGMyMzkyNDY4NmM3ZTJmMjAzMDA3MzczNmM4MjgyYTgwZjI3
YjU0NzNlMzNlYTk0Y2NkNDk4MiIKIAogUyA9ICIke1dPUktESVJ9L2xpYnZhLSR7UFZ9IgogCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmFfMi4xNi4wLmJiIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIuMTguMC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIu
MTYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIuMTgu
MC5iYgotLSAKMi4zOS4yCgo=

--===============6827128576359864698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libva: PKGV changed from 2.16.0 [default] to 2.18.0 [default]
packages/core2-32-poky-linux/libva: PV changed from "2.16.0" to "2.18.0"
packages/core2-32-poky-linux/libva: SRC_URI changed from "https://github.com/intel/libva/releases/download/2.16.0/libva-2.16.0.tar.bz2" to "https://github.com/intel/libva/releases/download/2.18.0/libva-2.18.0.tar.bz2"
packages/core2-32-poky-linux/libva/libva-dbg: RRECOMMENDS: added "libxcb-dri3-dbg libxcb-dbg libx11-xcb-dbg"
packages/core2-32-poky-linux/libva/libva-dbg: PKGV changed from 2.16.0 [default] to 2.18.0 [default]
packages/core2-32-poky-linux/libva/libva-dbg: PV changed from "2.16.0" to "2.18.0"
packages/core2-32-poky-linux/libva/libva-dbg: PKGSIZE changed from 730640 to 705620 (-3%)
packages/core2-32-poky-linux/libva/libva-dbg: FILELIST: removed "/usr/lib/.debug/libva-drm.so.2.1600.0 /usr/lib/.debug/libva-x11.so.2.1600.0 /usr/lib/.debug/libva-wayland.so.2.1600.0 /usr/lib/.debug/libva.so.2.1600.0 /usr/lib/.debug/libva-glx.so.2.1600.0", added "/usr/lib/.debug/libva-x11.so.2.1800.0 /usr/lib/.debug/libva-drm.so.2.1800.0 /usr/lib/.debug/libva-glx.so.2.1800.0 /usr/lib/.debug/libva-wayland.so.2.1800.0 /usr/lib/.debug/libva.so.2.1800.0"
packages/core2-32-poky-linux/libva/libva-dev: RRECOMMENDS: added "libxcb-dri3-dev libxcb-dev libx11-xcb-dev"
packages/core2-32-poky-linux/libva/libva-dev: PKGV changed from 2.16.0 [default] to 2.18.0 [default]
packages/core2-32-poky-linux/libva/libva-dev: PV changed from "2.16.0" to "2.18.0"
packages/core2-32-poky-linux/libva/libva-dev: PKGSIZE changed from 649531 to 649621 (+0%)
packages/core2-32-poky-linux/libva/libva-doc: PKGV changed from 2.16.0 [default] to 2.18.0 [default]
packages/core2-32-poky-linux/libva/libva-doc: PV changed from "2.16.0" to "2.18.0"
packages/core2-32-poky-linux/libva/libva-glx: PKGV changed from 2.16.0 [default] to 2.18.0 [default]
packages/core2-32-poky-linux/libva/libva-glx: PV changed from "2.16.0" to "2.18.0"
packages/core2-32-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva-glx.so.2.1600.0", added "/usr/lib/libva-glx.so.2.1800.0"
packages/core2-32-poky-linux/libva/libva-locale: PKGV changed from 2.16.0 [default] to 2.18.0 [default]
packages/core2-32-poky-linux/libva/libva-locale: PV changed from "2.16.0" to "2.18.0"
packages/core2-32-poky-linux/libva/libva-src: PKGV changed from 2.16.0 [default] to 2.18.0 [default]
packages/core2-32-poky-linux/libva/libva-src: PV changed from "2.16.0" to "2.18.0"
packages/core2-32-poky-linux/libva/libva-src: PKGSIZE changed from 1124659 to 1102368 (-2%)
packages/core2-32-poky-linux/libva/libva-src: FILELIST: directory renamed /usr/src/debug/libva/2.16.0-r0/va -> /usr/src/debug/libva/2.18.0-r0/va, directory renamed /usr/src/debug/libva/2.16.0-r0/va/glx -> /usr/src/debug/libva/2.18.0-r0/va/glx, directory renamed /usr/src/debug/libva/2.16.0-r0/va/drm -> /usr/src/debug/libva/2.18.0-r0/va/drm, removed "/usr/src/debug/libva/2.16.0-r0/va/x11/va_nvctrl.h /usr/src/debug/libva/2.16.0-r0/va/wayland/va_wayland_emgd.h /usr/src/debug/libva/2.16.0-r0/va/x11/va_dricommon.h /usr/src/debug/libva/2.16.0-r0/va/wayland/va_wayland.c /usr/src/debug/libva/2.16.0-r0/va/wayland/va_wayland_drm.h /usr/src/debug/libva/2.16.0-r0/va/wayland/va_backend_wayland.h /usr/src/debug/libva/2.16.0-r0/va/x11/va_dri2.c /usr/src/debug/libva/2.16.0-r0/va/x11/va_dricommon.c /usr/src/debug/libva/2.16.0-r0/va/wayland/va_wayland_emgd.c /usr/src/debug/libva/2.16.0-r0/va/wayland/va_wayland_private.h /usr/src/debug/libva/2.16.0-r0/va/x11/va_nvctrl.c /usr/src/debug/libva/2.16.0-r0/va
 /x11/va_dri2.h /usr/src/debug/libva/2.16.0-r0/va/wayland/va_wayland_drm.c /usr/src/debug/libva/2.16.0-r0/va/x11/va_fglrx.c /usr/src/debug/libva/2.16.0-r0/va/x11/va_x11.c /usr/src/debug/libva/2.16.0-r0/va/x11/dri2_util.c /usr/src/debug/libva/2.16.0-r0/va/x11/va_fglrx.h /usr/src/debug/libva/2.16.0-r0/va/x11/va_dri2str.h", added "/usr/src/debug/libva/2.18.0-r0/va/wayland/va_wayland_drm.c /usr/src/debug/libva/2.18.0-r0/va/wayland/va_backend_wayland.h /usr/src/debug/libva/2.18.0-r0/va/wayland/va_wayland.c /usr/src/debug/libva/2.18.0-r0/va/x11/va_dricommon.c /usr/src/debug/libva/2.18.0-r0/va/wayland/va_wayland_drm.h /usr/src/debug/libva/2.18.0-r0/va/wayland/va_wayland_private.h /usr/src/debug/libva/2.18.0-r0/va/x11/va_dricommon.h /usr/src/debug/libva/2.18.0-r0/va/x11/va_dri2.h /usr/src/debug/libva/2.18.0-r0/va/x11/va_dri3.h /usr/src/debug/libva/2.18.0-r0/va/x11/dri2_util.c /usr/src/debug/libva/2.18.0-r0/va/x11/va_dri2.c /usr/src/debug/libva/2.18.0-r0/va/x11/va_x11.c /usr/src/debug/libva/2
 .18.0-r0/va/x11/va_dri3.c /usr/src/debug/libva/2.18.0-r0/va/x11/va_dri2str.h"
packages/core2-32-poky-linux/libva/libva-staticdev: PKGV changed from 2.16.0 [default] to 2.18.0 [default]
packages/core2-32-poky-linux/libva/libva-staticdev: PV changed from "2.16.0" to "2.18.0"
packages/core2-32-poky-linux/libva/libva-wayland: PKGV changed from 2.16.0 [default] to 2.18.0 [default]
packages/core2-32-poky-linux/libva/libva-wayland: PV changed from "2.16.0" to "2.18.0"
packages/core2-32-poky-linux/libva/libva-wayland: PKGSIZE changed from 22017 to 17921 (-19%)
packages/core2-32-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva-wayland.so.2.1600.0", added "/usr/lib/libva-wayland.so.2.1800.0"
packages/core2-32-poky-linux/libva/libva-x11: PKGV changed from 2.16.0 [default] to 2.18.0 [default]
packages/core2-32-poky-linux/libva/libva-x11: PV changed from "2.16.0" to "2.18.0"
packages/core2-32-poky-linux/libva/libva-x11: PKGSIZE changed from 26101 to 30133 (+15%)
packages/core2-32-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva-x11.so.2.1600.0", added "/usr/lib/libva-x11.so.2.1800.0"
packages/core2-32-poky-linux/libva/libva-x11: RDEPENDS: added "libxcb (['>= 1.15']) libx11-xcb (['>= 1.8.4']) libxcb-dri3 (['>= 1.15'])"
packages/core2-32-poky-linux/libva/libva: PKGV changed from 2.16.0 [default] to 2.18.0 [default]
packages/core2-32-poky-linux/libva/libva: PV changed from "2.16.0" to "2.18.0"
packages/core2-32-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva.so.2.1600.0 /usr/lib/libva-drm.so.2.1600.0", added "/usr/lib/libva.so.2.1800.0 /usr/lib/libva-drm.so.2.1800.0"
Changes to packages/core2-32-poky-linux/libva (sysroot):
  /usr/lib/libva-drm.so.2 changed symlink target from libva-drm.so.2.1600.0 to libva-drm.so.2.1800.0
  /usr/lib/libva-glx.so.2 changed symlink target from libva-glx.so.2.1600.0 to libva-glx.so.2.1800.0
  /usr/lib/libva.so.2 changed symlink target from libva.so.2.1600.0 to libva.so.2.1800.0
  /usr/lib/libva-wayland.so.2 changed symlink target from libva-wayland.so.2.1600.0 to libva-wayland.so.2.1800.0
  /usr/lib/libva-x11.so.2 changed symlink target from libva-x11.so.2.1600.0 to libva-x11.so.2.1800.0
  /usr/lib/libva-drm.so.2.1600.0 moved to /usr/lib/libva-drm.so.2.1800.0
  /usr/lib/libva-glx.so.2.1600.0 moved to /usr/lib/libva-glx.so.2.1800.0
  /usr/lib/libva.so.2.1600.0 moved to /usr/lib/libva.so.2.1800.0
  /usr/lib/libva-wayland.so.2.1600.0 moved to /usr/lib/libva-wayland.so.2.1800.0
  /usr/lib/libva-x11.so.2.1600.0 moved to /usr/lib/libva-x11.so.2.1800.0

--===============6827128576359864698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libva/libva-dbg: RRECOMMENDS: added "libxcb-dri3-dbg libxcb-dbg libx11-xcb-dbg"
packages/core2-32-poky-linux/libva/libva-dev: RRECOMMENDS: added "libxcb-dev libx11-xcb-dev libxcb-dri3-dev"
packages/core2-32-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva-glx.so.2.1600.0", added "/usr/lib/libva-glx.so.2.1800.0"
packages/core2-32-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva-wayland.so.2.1600.0", added "/usr/lib/libva-wayland.so.2.1800.0"
packages/core2-32-poky-linux/libva/libva-wayland: PKGSIZE changed from 22017 to 17921 (-19%)
packages/core2-32-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva-x11.so.2.1600.0", added "/usr/lib/libva-x11.so.2.1800.0"
packages/core2-32-poky-linux/libva/libva-x11: RDEPENDS: added "libx11-xcb (['>= 1.8.4']) libxcb (['>= 1.15']) libxcb-dri3 (['>= 1.15'])"
packages/core2-32-poky-linux/libva/libva-x11: PKGSIZE changed from 26101 to 30133 (+15%)
packages/core2-32-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva-drm.so.2.1600.0 /usr/lib/libva.so.2.1600.0", added "/usr/lib/libva.so.2.1800.0 /usr/lib/libva-drm.so.2.1800.0"
Changes to packages/core2-32-poky-linux/libva (sysroot):
  /usr/lib/libva-drm.so.2 changed symlink target from libva-drm.so.2.1600.0 to libva-drm.so.2.1800.0
  /usr/lib/libva-glx.so.2 changed symlink target from libva-glx.so.2.1600.0 to libva-glx.so.2.1800.0
  /usr/lib/libva.so.2 changed symlink target from libva.so.2.1600.0 to libva.so.2.1800.0
  /usr/lib/libva-wayland.so.2 changed symlink target from libva-wayland.so.2.1600.0 to libva-wayland.so.2.1800.0
  /usr/lib/libva-x11.so.2 changed symlink target from libva-x11.so.2.1600.0 to libva-x11.so.2.1800.0
  /usr/lib/libva-drm.so.2.1600.0 moved to /usr/lib/libva-drm.so.2.1800.0
  /usr/lib/libva-glx.so.2.1600.0 moved to /usr/lib/libva-glx.so.2.1800.0
  /usr/lib/libva.so.2.1600.0 moved to /usr/lib/libva.so.2.1800.0
  /usr/lib/libva-wayland.so.2.1600.0 moved to /usr/lib/libva-wayland.so.2.1800.0
  /usr/lib/libva-x11.so.2.1600.0 moved to /usr/lib/libva-x11.so.2.1800.0

--===============6827128576359864698==--

