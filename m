Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987D6D5E133
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:39 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17396.1765872135892522841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=wpLp9wQD;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=KWwD6NHS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019b262ec1b6-1b923887-4796-4baa-8699-8d80bce0617d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872157;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=evF9mlWWji9SS8ui7gvW2wKuiNabQS+8jL+XML0930I=;
	b=wpLp9wQDSdd0j+40wuaPG8SL7fYe3XL6LWVm1/6zAJ63/S2hN1VX6DLWN2BZ3OHO
	l5k3pFhumaNNTSxHSjhpQiF/r57u0jTfxpHViIHPbbFk3iduxrCOvGmj54YoFhmThJd
	LId4o7LR4xOcmOeCvgUdtfVTwXI9dYxFb/fP/X3g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872157;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=evF9mlWWji9SS8ui7gvW2wKuiNabQS+8jL+XML0930I=;
	b=KWwD6NHSfi2xlk4Fjm1goDgLmS4VHgreAmSz1m1bMyJ3NbDZkF2iWClz71IVDTnL
	K6iYIugqj3zNQFA2CzDAOLqt1oLzuWPe5nBJEKi4ASG9vurrSNDpvzklaRL9AsN/fVg
	EQkESIO7dGuYpr3STrf7edvSPuN4w0zbzqaz3MJ4=
Content-Type: multipart/mixed; boundary="===============8026342987702600757=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libdrm: upgrading to 2.4.131 SUCCEEDED
Message-ID: <0101019b262ec1b6-1b923887-4796-4baa-8699-8d80bce0617d-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227859

--===============8026342987702600757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libdrm* to *2.4.131* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdrm-upgrade-2.4.128-2.4.131.patch
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
From fcc9e6d2548ae3821e5f0233742f91a737bab09c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 04:05:43 +0000
Subject: [PATCH] libdrm: upgrade 2.4.128 -> 2.4.131

---
 .../drm/{libdrm_2.4.128.bb => libdrm_2.4.131.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.128.bb => libdrm_2.4.131.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.128.bb b/meta/recipes-graphics/drm/libdrm_2.4.131.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.128.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.131.bb
index 8796a7a3d0..1c55dd5550 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.128.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.131.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "3bb35db8700c2a0b569f2c6729a53f5495786856b310854c8de57782a22bddac"
+SRC_URI[sha256sum] = "45ba9983b51c896406a3d654de81d313b953b76e6391e2797073d543c5f617d5"
 
 inherit meson pkgconfig manpages
 
-- 
2.47.1


--===============8026342987702600757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libdrm/libdrm-amdgpu: FILELIST: removed "/usr/lib/libdrm_amdgpu.so.1.128.0", added "/usr/lib/libdrm_amdgpu.so.1.131.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-etnaviv: FILELIST: removed "/usr/lib/libdrm_etnaviv.so.1.128.0", added "/usr/lib/libdrm_etnaviv.so.1.131.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-freedreno: FILELIST: removed "/usr/lib/libdrm_freedreno.so.1.128.0", added "/usr/lib/libdrm_freedreno.so.1.131.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-intel: FILELIST: removed "/usr/lib/libdrm_intel.so.1.128.0", added "/usr/lib/libdrm_intel.so.1.131.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-nouveau: FILELIST: removed "/usr/lib/libdrm_nouveau.so.2.128.0", added "/usr/lib/libdrm_nouveau.so.2.131.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-omap: FILELIST: removed "/usr/lib/libdrm_omap.so.1.128.0", added "/usr/lib/libdrm_omap.so.1.131.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-radeon: FILELIST: removed "/usr/lib/libdrm_radeon.so.1.128.0", added "/usr/lib/libdrm_radeon.so.1.131.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm: FILELIST: removed "/usr/lib/libdrm.so.2.128.0", added "/usr/lib/libdrm.so.2.131.0"
Changes to packages/x86-64-v3-poky-linux/libdrm (sysroot):
  /usr/lib/libdrm_amdgpu.so.1 changed symlink target from libdrm_amdgpu.so.1.128.0 to libdrm_amdgpu.so.1.131.0
  /usr/lib/libdrm_etnaviv.so.1 changed symlink target from libdrm_etnaviv.so.1.128.0 to libdrm_etnaviv.so.1.131.0
  /usr/lib/libdrm_freedreno.so.1 changed symlink target from libdrm_freedreno.so.1.128.0 to libdrm_freedreno.so.1.131.0
  /usr/lib/libdrm_intel.so.1 changed symlink target from libdrm_intel.so.1.128.0 to libdrm_intel.so.1.131.0
  /usr/lib/libdrm_nouveau.so.2 changed symlink target from libdrm_nouveau.so.2.128.0 to libdrm_nouveau.so.2.131.0
  /usr/lib/libdrm_omap.so.1 changed symlink target from libdrm_omap.so.1.128.0 to libdrm_omap.so.1.131.0
  /usr/lib/libdrm_radeon.so.1 changed symlink target from libdrm_radeon.so.1.128.0 to libdrm_radeon.so.1.131.0
  /usr/lib/libdrm.so.2 changed symlink target from libdrm.so.2.128.0 to libdrm.so.2.131.0
  /usr/lib/libdrm_amdgpu.so.1.128.0 moved to /usr/lib/libdrm_amdgpu.so.1.131.0
  /usr/lib/libdrm_etnaviv.so.1.128.0 moved to /usr/lib/libdrm_etnaviv.so.1.131.0
  /usr/lib/libdrm_freedreno.so.1.128.0 moved to /usr/lib/libdrm_freedreno.so.1.131.0
  /usr/lib/libdrm_intel.so.1.128.0 moved to /usr/lib/libdrm_intel.so.1.131.0
  /usr/lib/libdrm_nouveau.so.2.128.0 moved to /usr/lib/libdrm_nouveau.so.2.131.0
  /usr/lib/libdrm_omap.so.1.128.0 moved to /usr/lib/libdrm_omap.so.1.131.0
  /usr/lib/libdrm_radeon.so.1.128.0 moved to /usr/lib/libdrm_radeon.so.1.131.0
  /usr/lib/libdrm.so.2.128.0 moved to /usr/lib/libdrm.so.2.131.0

--===============8026342987702600757==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdrm-upgrade-2.4.128-2.4.131.patch"

RnJvbSBmY2M5ZTZkMjU0OGFlMzgyMWU1ZjAyMzM3NDJmOTFhNzM3YmFiMDljIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDQ6MDU6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJkcm06IHVwZ3JhZGUgMi40LjEyOCAtPiAyLjQuMTMxCgotLS0KIC4uLi9kcm0ve2xpYmRybV8y
LjQuMTI4LmJiID0+IGxpYmRybV8yLjQuMTMxLmJifSAgICAgICAgICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy9kcm0ve2xpYmRybV8yLjQuMTI4LmJiID0+IGxpYmRybV8yLjQuMTMx
LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJt
XzIuNC4xMjguYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuMTMxLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9k
cm0vbGliZHJtXzIuNC4xMjguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0v
bGliZHJtXzIuNC4xMzEuYmIKaW5kZXggODc5NmE3YTNkMC4uMWM1NWRkNTU1MCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2RybS9saWJkcm1fMi40LjEyOC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuMTMxLmJiCkBAIC0xMyw3ICsxMyw3IEBA
IERFUEVORFMgPSAibGlicHRocmVhZC1zdHVicyIKIFNSQ19VUkkgPSAiaHR0cDovL2RyaS5mcmVl
ZGVza3RvcC5vcmcvbGliZHJtLyR7QlB9LnRhci54eiBcCiAgICAgICAgICAgIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiM2JiMzVkYjg3MDBjMmEwYjU2OWYyYzY3MjlhNTNmNTQ5NTc4Njg1NmIz
MTA4NTRjOGRlNTc3ODJhMjJiZGRhYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0NWJhOTk4M2I1
MWM4OTY0MDZhM2Q2NTRkZTgxZDMxM2I5NTNiNzZlNjM5MWUyNzk3MDczZDU0M2M1ZjYxN2Q1Igog
CiBpbmhlcml0IG1lc29uIHBrZ2NvbmZpZyBtYW5wYWdlcwogCi0tIAoyLjQ3LjEKCg==

--===============8026342987702600757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libdrm: PKGV changed from 2.4.128 [default] to 2.4.131 [default]
packages/x86-64-v3-poky-linux/libdrm: SRC_URI changed from "http://dri.freedesktop.org/libdrm/libdrm-2.4.128.tar.xz" to "http://dri.freedesktop.org/libdrm/libdrm-2.4.131.tar.xz"
packages/x86-64-v3-poky-linux/libdrm: PV changed from "2.4.128" to "2.4.131"
packages/x86-64-v3-poky-linux/libdrm/libdrm-amdgpu: PKGV changed from 2.4.128 [default] to 2.4.131 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-amdgpu: FILELIST: removed "/usr/lib/libdrm_amdgpu.so.1.128.0", added "/usr/lib/libdrm_amdgpu.so.1.131.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-amdgpu: PV changed from "2.4.128" to "2.4.131"
packages/x86-64-v3-poky-linux/libdrm/libdrm-amdgpu: PKGSIZE changed from 70349 to 70664 (+0%)
packages/x86-64-v3-poky-linux/libdrm/libdrm-dbg: PKGV changed from 2.4.128 [default] to 2.4.131 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-dbg: FILELIST: removed "/usr/lib/.debug/libdrm_nouveau.so.2.128.0 /usr/lib/.debug/libdrm_freedreno.so.1.128.0 /usr/lib/.debug/libdrm_amdgpu.so.1.128.0 /usr/lib/.debug/libdrm_intel.so.1.128.0 /usr/lib/.debug/libdrm_radeon.so.1.128.0 /usr/lib/.debug/libdrm_omap.so.1.128.0 /usr/lib/.debug/libdrm.so.2.128.0 /usr/lib/.debug/libdrm_etnaviv.so.1.128.0", added "/usr/lib/.debug/libdrm_amdgpu.so.1.131.0 /usr/lib/.debug/libdrm_nouveau.so.2.131.0 /usr/lib/.debug/libdrm.so.2.131.0 /usr/lib/.debug/libdrm_freedreno.so.1.131.0 /usr/lib/.debug/libdrm_intel.so.1.131.0 /usr/lib/.debug/libdrm_radeon.so.1.131.0 /usr/lib/.debug/libdrm_omap.so.1.131.0 /usr/lib/.debug/libdrm_etnaviv.so.1.131.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-dbg: PV changed from "2.4.128" to "2.4.131"
packages/x86-64-v3-poky-linux/libdrm/libdrm-dbg: PKGSIZE changed from 1647472 to 1651104 (+0%)
packages/x86-64-v3-poky-linux/libdrm/libdrm-dev: PKGV changed from 2.4.128 [default] to 2.4.131 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-dev: PV changed from "2.4.128" to "2.4.131"
packages/x86-64-v3-poky-linux/libdrm/libdrm-dev: PKGSIZE changed from 782902 to 795745 (+2%)
packages/x86-64-v3-poky-linux/libdrm/libdrm-doc: PKGV changed from 2.4.128 [default] to 2.4.131 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-doc: PV changed from "2.4.128" to "2.4.131"
packages/x86-64-v3-poky-linux/libdrm/libdrm-drivers: PKGV changed from 2.4.128 [default] to 2.4.131 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-drivers: PV changed from "2.4.128" to "2.4.131"
packages/x86-64-v3-poky-linux/libdrm/libdrm-etnaviv: PKGV changed from 2.4.128 [default] to 2.4.131 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-etnaviv: FILELIST: removed "/usr/lib/libdrm_etnaviv.so.1.128.0", added "/usr/lib/libdrm_etnaviv.so.1.131.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-etnaviv: PV changed from "2.4.128" to "2.4.131"
packages/x86-64-v3-poky-linux/libdrm/libdrm-exynos: PKGV changed from 2.4.128 [default] to 2.4.131 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-exynos: PV changed from "2.4.128" to "2.4.131"
packages/x86-64-v3-poky-linux/libdrm/libdrm-freedreno: PKGV changed from 2.4.128 [default] to 2.4.131 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-freedreno: FILELIST: removed "/usr/lib/libdrm_freedreno.so.1.128.0", added "/usr/lib/libdrm_freedreno.so.1.131.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-freedreno: PV changed from "2.4.128" to "2.4.131"
packages/x86-64-v3-poky-linux/libdrm/libdrm-intel: PKGV changed from 2.4.128 [default] to 2.4.131 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-intel: FILELIST: removed "/usr/lib/libdrm_intel.so.1.128.0", added "/usr/lib/libdrm_intel.so.1.131.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-intel: PV changed from "2.4.128" to "2.4.131"
packages/x86-64-v3-poky-linux/libdrm/libdrm-locale: PKGV changed from 2.4.128 [default] to 2.4.131 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-locale: PV changed from "2.4.128" to "2.4.131"
packages/x86-64-v3-poky-linux/libdrm/libdrm-nouveau: PKGV changed from 2.4.128 [default] to 2.4.131 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-nouveau: FILELIST: removed "/usr/lib/libdrm_nouveau.so.2.128.0", added "/usr/lib/libdrm_nouveau.so.2.131.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-nouveau: PV changed from "2.4.128" to "2.4.131"
packages/x86-64-v3-poky-linux/libdrm/libdrm-omap: PKGV changed from 2.4.128 [default] to 2.4.131 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-omap: FILELIST: removed "/usr/lib/libdrm_omap.so.1.128.0", added "/usr/lib/libdrm_omap.so.1.131.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-omap: PV changed from "2.4.128" to "2.4.131"
packages/x86-64-v3-poky-linux/libdrm/libdrm-radeon: PKGV changed from 2.4.128 [default] to 2.4.131 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-radeon: FILELIST: removed "/usr/lib/libdrm_radeon.so.1.128.0", added "/usr/lib/libdrm_radeon.so.1.131.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-radeon: PV changed from "2.4.128" to "2.4.131"
packages/x86-64-v3-poky-linux/libdrm/libdrm-src: PKGV changed from 2.4.128 [default] to 2.4.131 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-src: FILELIST: directory renamed /usr/src/debug/libdrm/2.4.128/include/drm -> /usr/src/debug/libdrm/2.4.131/include/drm, directory renamed /usr/src/debug/libdrm/2.4.128/tests/modetest -> /usr/src/debug/libdrm/2.4.131/tests/modetest, directory renamed /usr/src/debug/libdrm/2.4.128/tests/proptest -> /usr/src/debug/libdrm/2.4.131/tests/proptest, directory renamed /usr/src/debug/libdrm/2.4.128/nouveau -> /usr/src/debug/libdrm/2.4.131/nouveau, directory renamed /usr/src/debug/libdrm/2.4.128/freedreno -> /usr/src/debug/libdrm/2.4.131/freedreno, directory renamed /usr/src/debug/libdrm/2.4.128/nouveau/nvif -> /usr/src/debug/libdrm/2.4.131/nouveau/nvif, directory renamed /usr/src/debug/libdrm/2.4.128/tests/vbltest -> /usr/src/debug/libdrm/2.4.131/tests/vbltest, directory renamed /usr/src/debug/libdrm/2.4.128/intel -> /usr/src/debug/libdrm/2.4.131/intel, directory renamed /usr/src/debug/libdrm/2.4.128 -> /usr/src/debug/libdrm/2.4.131, directory renam
 ed /usr/src/debug/libdrm/2.4.128/tests -> /usr/src/debug/libdrm/2.4.131/tests, directory renamed /usr/src/debug/libdrm/2.4.128/radeon -> /usr/src/debug/libdrm/2.4.131/radeon, directory renamed /usr/src/debug/libdrm/2.4.128/freedreno/msm -> /usr/src/debug/libdrm/2.4.131/freedreno/msm, directory renamed /usr/src/debug/libdrm/2.4.128/tests/util -> /usr/src/debug/libdrm/2.4.131/tests/util, directory renamed /usr/src/debug/libdrm/2.4.128/tests/amdgpu -> /usr/src/debug/libdrm/2.4.131/tests/amdgpu, directory renamed /usr/src/debug/libdrm/2.4.128/amdgpu -> /usr/src/debug/libdrm/2.4.131/amdgpu, directory renamed /usr/src/debug/libdrm/2.4.128/omap -> /usr/src/debug/libdrm/2.4.131/omap, directory renamed /usr/src/debug/libdrm/2.4.128/etnaviv -> /usr/src/debug/libdrm/2.4.131/etnaviv, directory renamed /usr/src/debug/libdrm/2.4.128/tests/modeprint -> /usr/src/debug/libdrm/2.4.131/tests/modeprint, directory renamed /usr/src/debug/libdrm/2.4.128/tests/etnaviv -> /usr/src/debug/libdrm/2.4.131/tests
 /etnaviv
packages/x86-64-v3-poky-linux/libdrm/libdrm-src: PV changed from "2.4.128" to "2.4.131"
packages/x86-64-v3-poky-linux/libdrm/libdrm-src: PKGSIZE changed from 1728894 to 1739951 (+1%)
packages/x86-64-v3-poky-linux/libdrm/libdrm-staticdev: PKGV changed from 2.4.128 [default] to 2.4.131 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-staticdev: PV changed from "2.4.128" to "2.4.131"
packages/x86-64-v3-poky-linux/libdrm/libdrm-tests: PKGV changed from 2.4.128 [default] to 2.4.131 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-tests: PV changed from "2.4.128" to "2.4.131"
packages/x86-64-v3-poky-linux/libdrm/libdrm: PKGV changed from 2.4.128 [default] to 2.4.131 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm: FILELIST: removed "/usr/lib/libdrm.so.2.128.0", added "/usr/lib/libdrm.so.2.131.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm: PV changed from "2.4.128" to "2.4.131"
Changes to packages/x86-64-v3-poky-linux/libdrm (sysroot):
  /usr/lib/libdrm_amdgpu.so.1 changed symlink target from libdrm_amdgpu.so.1.128.0 to libdrm_amdgpu.so.1.131.0
  /usr/lib/libdrm_etnaviv.so.1 changed symlink target from libdrm_etnaviv.so.1.128.0 to libdrm_etnaviv.so.1.131.0
  /usr/lib/libdrm_freedreno.so.1 changed symlink target from libdrm_freedreno.so.1.128.0 to libdrm_freedreno.so.1.131.0
  /usr/lib/libdrm_intel.so.1 changed symlink target from libdrm_intel.so.1.128.0 to libdrm_intel.so.1.131.0
  /usr/lib/libdrm_nouveau.so.2 changed symlink target from libdrm_nouveau.so.2.128.0 to libdrm_nouveau.so.2.131.0
  /usr/lib/libdrm_omap.so.1 changed symlink target from libdrm_omap.so.1.128.0 to libdrm_omap.so.1.131.0
  /usr/lib/libdrm_radeon.so.1 changed symlink target from libdrm_radeon.so.1.128.0 to libdrm_radeon.so.1.131.0
  /usr/lib/libdrm.so.2 changed symlink target from libdrm.so.2.128.0 to libdrm.so.2.131.0
  /usr/lib/libdrm_amdgpu.so.1.128.0 moved to /usr/lib/libdrm_amdgpu.so.1.131.0
  /usr/lib/libdrm_etnaviv.so.1.128.0 moved to /usr/lib/libdrm_etnaviv.so.1.131.0
  /usr/lib/libdrm_freedreno.so.1.128.0 moved to /usr/lib/libdrm_freedreno.so.1.131.0
  /usr/lib/libdrm_intel.so.1.128.0 moved to /usr/lib/libdrm_intel.so.1.131.0
  /usr/lib/libdrm_nouveau.so.2.128.0 moved to /usr/lib/libdrm_nouveau.so.2.131.0
  /usr/lib/libdrm_omap.so.1.128.0 moved to /usr/lib/libdrm_omap.so.1.131.0
  /usr/lib/libdrm_radeon.so.1.128.0 moved to /usr/lib/libdrm_radeon.so.1.131.0
  /usr/lib/libdrm.so.2.128.0 moved to /usr/lib/libdrm.so.2.131.0

--===============8026342987702600757==--

