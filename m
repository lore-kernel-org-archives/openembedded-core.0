Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B242C7EE32
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:02 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.32139.1680384536169092497
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dvZyYJNM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101873eb92b70-67c9a4ca-e1fe-4341-a04a-be21ea7adf6a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=F1fMKb99xra+BCUIzaFjlkieFvEeLM9DU8I0dWUm+Lo=;
	b=dvZyYJNMuS2MmDvmqLVA+7wZXQefbZtLV5E2LrGcVILL0FFXk/Mmqkp1zu6QfaAd
	dPnF4bAX1lhD2od3C0ubHV1z8YNUHLWOch8I0QgdlvqGCnjzj8ZxIspVvaGDRIW79rL
	R1ea9eQEIAJWJBn0JGGaueb3Knb2LFXPugpffB00=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=F1fMKb99xra+BCUIzaFjlkieFvEeLM9DU8I0dWUm+Lo=;
	b=iv1S5BGJK1jCF7uOpqmkcIOY5+Szo3K0IQkYfuVCIR6Qn1sNjL5o+f08ffvuXc6/
	0B9D8nm+AZkLMl+xDZ4ufE9fQYcNNIzPOIttaNUH//HT5yojiBPBYoCcU1X80FVaylb
	Bvh3CBkbhWFAdFWZXO2DE1aYDphqvKhQLvyG8Eck=
Content-Type: multipart/mixed; boundary="===============0421917691869820846=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva: upgrading to 2.18.0 SUCCEEDED
Message-ID: <010101873eb92b70-67c9a4ca-e1fe-4341-a04a-be21ea7adf6a-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179538

--===============0421917691869820846==
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
--===============0421917691869820846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libva: PV changed from "2.16.0" to "2.18.0"
packages/core2-32-poky-linux/libva: SRC_URI changed from "https://github.com/intel/libva/releases/download/2.16.0/libva-2.16.0.tar.bz2" to "https://github.com/intel/libva/releases/download/2.18.0/libva-2.18.0.tar.bz2"
packages/core2-32-poky-linux/libva: PKGV changed from 2.16.0 [default] to 2.18.0 [default]
packages/core2-32-poky-linux/libva/libva-dbg: RRECOMMENDS: added "libx11-xcb-dbg libxcb-dri3-dbg libxcb-dbg"
packages/core2-32-poky-linux/libva/libva-dbg: PV changed from "2.16.0" to "2.18.0"
packages/core2-32-poky-linux/libva/libva-dbg: PKGSIZE changed from 730640 to 705620 (-3%)
packages/core2-32-poky-linux/libva/libva-dbg: PKGV changed from 2.16.0 [default] to 2.18.0 [default]
packages/core2-32-poky-linux/libva/libva-dbg: FILELIST: removed "/usr/lib/.debug/libva-wayland.so.2.1600.0 /usr/lib/.debug/libva-drm.so.2.1600.0 /usr/lib/.debug/libva-x11.so.2.1600.0 /usr/lib/.debug/libva-glx.so.2.1600.0 /usr/lib/.debug/libva.so.2.1600.0", added "/usr/lib/.debug/libva-wayland.so.2.1800.0 /usr/lib/.debug/libva-x11.so.2.1800.0 /usr/lib/.debug/libva-drm.so.2.1800.0 /usr/lib/.debug/libva-glx.so.2.1800.0 /usr/lib/.debug/libva.so.2.1800.0"
packages/core2-32-poky-linux/libva/libva-dev: RRECOMMENDS: added "libx11-xcb-dev libxcb-dev libxcb-dri3-dev"
packages/core2-32-poky-linux/libva/libva-dev: PV changed from "2.16.0" to "2.18.0"
packages/core2-32-poky-linux/libva/libva-dev: PKGSIZE changed from 649531 to 649621 (+0%)
packages/core2-32-poky-linux/libva/libva-dev: PKGV changed from 2.16.0 [default] to 2.18.0 [default]
packages/core2-32-poky-linux/libva/libva-doc: PV changed from "2.16.0" to "2.18.0"
packages/core2-32-poky-linux/libva/libva-doc: PKGV changed from 2.16.0 [default] to 2.18.0 [default]
packages/core2-32-poky-linux/libva/libva-glx: PV changed from "2.16.0" to "2.18.0"
packages/core2-32-poky-linux/libva/libva-glx: PKGV changed from 2.16.0 [default] to 2.18.0 [default]
packages/core2-32-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva-glx.so.2.1600.0", added "/usr/lib/libva-glx.so.2.1800.0"
packages/core2-32-poky-linux/libva/libva-locale: PV changed from "2.16.0" to "2.18.0"
packages/core2-32-poky-linux/libva/libva-locale: PKGV changed from 2.16.0 [default] to 2.18.0 [default]
packages/core2-32-poky-linux/libva/libva-src: PV changed from "2.16.0" to "2.18.0"
packages/core2-32-poky-linux/libva/libva-src: PKGSIZE changed from 1124659 to 1102368 (-2%)
packages/core2-32-poky-linux/libva/libva-src: PKGV changed from 2.16.0 [default] to 2.18.0 [default]
packages/core2-32-poky-linux/libva/libva-src: FILELIST: directory renamed /usr/src/debug/libva/2.16.0-r0/va/drm -> /usr/src/debug/libva/2.18.0-r0/va/drm, directory renamed /usr/src/debug/libva/2.16.0-r0/va/glx -> /usr/src/debug/libva/2.18.0-r0/va/glx, directory renamed /usr/src/debug/libva/2.16.0-r0/va -> /usr/src/debug/libva/2.18.0-r0/va, removed "/usr/src/debug/libva/2.16.0-r0/va/x11/va_dricommon.c /usr/src/debug/libva/2.16.0-r0/va/wayland/va_wayland_drm.h /usr/src/debug/libva/2.16.0-r0/va/x11/va_dri2.c /usr/src/debug/libva/2.16.0-r0/va/wayland/va_backend_wayland.h /usr/src/debug/libva/2.16.0-r0/va/x11/va_dri2.h /usr/src/debug/libva/2.16.0-r0/va/x11/va_dricommon.h /usr/src/debug/libva/2.16.0-r0/va/x11/va_x11.c /usr/src/debug/libva/2.16.0-r0/va/wayland/va_wayland_drm.c /usr/src/debug/libva/2.16.0-r0/va/wayland/va_wayland_private.h /usr/src/debug/libva/2.16.0-r0/va/x11/dri2_util.c /usr/src/debug/libva/2.16.0-r0/va/x11/va_dri2str.h /usr/src/debug/libva/2.16.0-r0/va/wayland/va_wayland_
 emgd.h /usr/src/debug/libva/2.16.0-r0/va/x11/va_fglrx.h /usr/src/debug/libva/2.16.0-r0/va/x11/va_nvctrl.c /usr/src/debug/libva/2.16.0-r0/va/x11/va_nvctrl.h /usr/src/debug/libva/2.16.0-r0/va/wayland/va_wayland.c /usr/src/debug/libva/2.16.0-r0/va/x11/va_fglrx.c /usr/src/debug/libva/2.16.0-r0/va/wayland/va_wayland_emgd.c", added "/usr/src/debug/libva/2.18.0-r0/va/wayland/va_backend_wayland.h /usr/src/debug/libva/2.18.0-r0/va/x11/va_dricommon.h /usr/src/debug/libva/2.18.0-r0/va/wayland/va_wayland_private.h /usr/src/debug/libva/2.18.0-r0/va/x11/va_x11.c /usr/src/debug/libva/2.18.0-r0/va/x11/va_dricommon.c /usr/src/debug/libva/2.18.0-r0/va/wayland/va_wayland_drm.c /usr/src/debug/libva/2.18.0-r0/va/x11/va_dri3.h /usr/src/debug/libva/2.18.0-r0/va/x11/dri2_util.c /usr/src/debug/libva/2.18.0-r0/va/x11/va_dri2str.h /usr/src/debug/libva/2.18.0-r0/va/x11/va_dri2.h /usr/src/debug/libva/2.18.0-r0/va/wayland/va_wayland.c /usr/src/debug/libva/2.18.0-r0/va/x11/va_dri3.c /usr/src/debug/libva/2.18.0-r0
 /va/wayland/va_wayland_drm.h /usr/src/debug/libva/2.18.0-r0/va/x11/va_dri2.c"
packages/core2-32-poky-linux/libva/libva-staticdev: PV changed from "2.16.0" to "2.18.0"
packages/core2-32-poky-linux/libva/libva-staticdev: PKGV changed from 2.16.0 [default] to 2.18.0 [default]
packages/core2-32-poky-linux/libva/libva-wayland: PV changed from "2.16.0" to "2.18.0"
packages/core2-32-poky-linux/libva/libva-wayland: PKGSIZE changed from 22017 to 17921 (-19%)
packages/core2-32-poky-linux/libva/libva-wayland: PKGV changed from 2.16.0 [default] to 2.18.0 [default]
packages/core2-32-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva-wayland.so.2.1600.0", added "/usr/lib/libva-wayland.so.2.1800.0"
packages/core2-32-poky-linux/libva/libva-x11: PV changed from "2.16.0" to "2.18.0"
packages/core2-32-poky-linux/libva/libva-x11: PKGSIZE changed from 26101 to 30133 (+15%)
packages/core2-32-poky-linux/libva/libva-x11: PKGV changed from 2.16.0 [default] to 2.18.0 [default]
packages/core2-32-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva-x11.so.2.1600.0", added "/usr/lib/libva-x11.so.2.1800.0"
packages/core2-32-poky-linux/libva/libva-x11: RDEPENDS: added "libxcb (['>= 1.15']) libxcb-dri3 (['>= 1.15']) libx11-xcb (['>= 1.8.4'])"
packages/core2-32-poky-linux/libva/libva: PV changed from "2.16.0" to "2.18.0"
packages/core2-32-poky-linux/libva/libva: PKGV changed from 2.16.0 [default] to 2.18.0 [default]
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

--===============0421917691869820846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libva/libva-dbg: RRECOMMENDS: added "libxcb-dri3-dbg libxcb-dbg libx11-xcb-dbg"
packages/core2-32-poky-linux/libva/libva-dev: RRECOMMENDS: added "libxcb-dri3-dev libxcb-dev libx11-xcb-dev"
packages/core2-32-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva-glx.so.2.1600.0", added "/usr/lib/libva-glx.so.2.1800.0"
packages/core2-32-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva-wayland.so.2.1600.0", added "/usr/lib/libva-wayland.so.2.1800.0"
packages/core2-32-poky-linux/libva/libva-wayland: PKGSIZE changed from 22017 to 17921 (-19%)
packages/core2-32-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva-x11.so.2.1600.0", added "/usr/lib/libva-x11.so.2.1800.0"
packages/core2-32-poky-linux/libva/libva-x11: RDEPENDS: added "libxcb (['>= 1.15']) libx11-xcb (['>= 1.8.4']) libxcb-dri3 (['>= 1.15'])"
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

--===============0421917691869820846==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libva-upgrade-2.16.0-2.18.0.patch"

RnJvbSAyNzMwN2IxMGYzMDE1MmUxZGY5ZWFmNzRiNTJjNTA1MzJmYWMyMWEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAxNTo0ODozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnZhOiB1cGdyYWRlIDIuMTYuMCAtPiAyLjE4LjAKCi0tLQogbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L2xpYnZhL2xpYnZhLmluYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogLi4uL3Jl
Y2lwZXMtZ3JhcGhpY3MvbGlidmEve2xpYnZhXzIuMTYuMC5iYiA9PiBsaWJ2YV8yLjE4LjAuYmJ9
IHwgMAogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS97bGlidmFfMi4xNi4wLmJiID0+IGxpYnZh
XzIuMTguMC5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xp
YnZhL2xpYnZhLmluYyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS9saWJ2YS5pbmMKaW5k
ZXggMGYxNmRhY2M5OC4uN2VkMGM5ZWQ4OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2xpYnZhL2xpYnZhLmluYworKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGli
dmEuaW5jCkBAIC0xOCw3ICsxOCw3IEBAIExJQ0VOU0UgPSAiTUlUIgogCiBTUkNfVVJJID0gIiR7
R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS9saWJ2YS0ke1BWfS50YXIuYnoyIgogTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MmU0ODk0MGY5NGFjYjBhZjU4MmU1
ZWYwMzUzNzgwMGYiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTE1ZmFjYTBkYjJjNDE3YTM3ZGE0
OTgzMDg3MGUyNjA0NTBmYTEzMDY2ZjVlMjRlMjUyYTIwYzM2ZDkyMGExYyIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICJhMzU3N2VlYmEwYzIzOTI0Njg2YzdlMmYyMDMwMDczNzM2YzgyODJhODBmMjdi
NTQ3M2UzM2VhOTRjY2Q0OTgyIgogCiBTID0gIiR7V09SS0RJUn0vbGlidmEtJHtQVn0iCiAKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS9saWJ2YV8yLjE2LjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmFfMi4xOC4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmFfMi4x
Ni4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmFfMi4xOC4w
LmJiCi0tIAoyLjM5LjIKCg==

--===============0421917691869820846==--

