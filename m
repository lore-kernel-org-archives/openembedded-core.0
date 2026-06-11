Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF2DCDB479
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:56 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50429.1781195510621012332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JoWs0t5+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Wj6JXESO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019eb786a053-139fe3ce-2e89-4915-91fa-43e9a44f8e53-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195514;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wdAFUY15dbNyK+tZhfupTjHcNHsqM8Pxr/3vNeKgI9g=;
	b=JoWs0t5+ul6WcIgiLUXQt6r74BGeCrpf5rpDX+7HEmsJoZ5LZ7tS09LjCgdZWIGK
	wRtHFcD5DXFCMW3dyw79oVR/G2sQuYjfzLBqWKiup2rVDj2ShfQr3MrVV3lHJNp4ReZ
	NjoBMvZ562o3+h3w4C87KO9qIkvFwKANbDwBVxUc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195514;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wdAFUY15dbNyK+tZhfupTjHcNHsqM8Pxr/3vNeKgI9g=;
	b=Wj6JXESOwZncopzPcfU6KZqV4AnF6shOY8UYSJiRkJcNZFabnkMk8L6fsrNr/rHt
	ZA87Kio4saf2IbLrRdmarXiruu4f9BYWY/WTZWX+J2eBYlzNdxm0gg02EvT0KgzEQSM
	dV4VYlmNNAkw3iXHK0k3lCHukb1ljH421ybIcxtA=
Content-Type: multipart/mixed; boundary="===============0700254294422072993=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libdrm: upgrading to 2.4.134 SUCCEEDED
Message-ID: <0101019eb786a053-139fe3ce-2e89-4915-91fa-43e9a44f8e53-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238527

--===============0700254294422072993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libdrm* to *2.4.134* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdrm-upgrade-2.4.133-2.4.134.patch
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
From 94560dbc0d46bd32c86cfe7a25fddcda222e96a4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 11:57:35 +0000
Subject: [PATCH] libdrm: upgrade 2.4.133 -> 2.4.134

---
 .../drm/{libdrm_2.4.133.bb => libdrm_2.4.134.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.133.bb => libdrm_2.4.134.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.133.bb b/meta/recipes-graphics/drm/libdrm_2.4.134.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.133.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.134.bb
index afddb21e0a..d344dc830f 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.133.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.134.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "fc68f9d0ba2ea63c9432a299e14fea09fad7a8a66e8039fcd7802ca59f77b4f5"
+SRC_URI[sha256sum] = "ac5e74d157830eb8bee44c6a6bf3ad49774ef0dd2a72bdad74a8f20308b52a95"
 
 inherit meson pkgconfig manpages
 
-- 
2.47.1


--===============0700254294422072993==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdrm-upgrade-2.4.133-2.4.134.patch"

RnJvbSA5NDU2MGRiYzBkNDZiZDMyYzg2Y2ZlN2EyNWZkZGNkYTIyMmU5NmE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTE6NTc6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJkcm06IHVwZ3JhZGUgMi40LjEzMyAtPiAyLjQuMTM0CgotLS0KIC4uLi9kcm0ve2xpYmRybV8y
LjQuMTMzLmJiID0+IGxpYmRybV8yLjQuMTM0LmJifSAgICAgICAgICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy9kcm0ve2xpYmRybV8yLjQuMTMzLmJiID0+IGxpYmRybV8yLjQuMTM0
LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJt
XzIuNC4xMzMuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuMTM0LmJi
CnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9k
cm0vbGliZHJtXzIuNC4xMzMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0v
bGliZHJtXzIuNC4xMzQuYmIKaW5kZXggYWZkZGIyMWUwYS4uZDM0NGRjODMwZiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2RybS9saWJkcm1fMi40LjEzMy5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuMTM0LmJiCkBAIC0xMyw3ICsxMyw3IEBA
IERFUEVORFMgPSAibGlicHRocmVhZC1zdHVicyIKIFNSQ19VUkkgPSAiaHR0cDovL2RyaS5mcmVl
ZGVza3RvcC5vcmcvbGliZHJtLyR7QlB9LnRhci54eiBcCiAgICAgICAgICAgIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiZmM2OGY5ZDBiYTJlYTYzYzk0MzJhMjk5ZTE0ZmVhMDlmYWQ3YThhNjZl
ODAzOWZjZDc4MDJjYTU5Zjc3YjRmNSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhYzVlNzRkMTU3
ODMwZWI4YmVlNDRjNmE2YmYzYWQ0OTc3NGVmMGRkMmE3MmJkYWQ3NGE4ZjIwMzA4YjUyYTk1Igog
CiBpbmhlcml0IG1lc29uIHBrZ2NvbmZpZyBtYW5wYWdlcwogCi0tIAoyLjQ3LjEKCg==

--===============0700254294422072993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libdrm: SRC_URI changed from "http://dri.freedesktop.org/libdrm/libdrm-2.4.133.tar.xz" to "http://dri.freedesktop.org/libdrm/libdrm-2.4.134.tar.xz"
packages/x86-64-v3-poky-linux/libdrm: PKGV changed from 2.4.133 [default] to 2.4.134 [default]
packages/x86-64-v3-poky-linux/libdrm: PV changed from "2.4.133" to "2.4.134"
packages/x86-64-v3-poky-linux/libdrm/libdrm-amdgpu: FILELIST: removed "/usr/lib/libdrm_amdgpu.so.1.133.0", added "/usr/lib/libdrm_amdgpu.so.1.134.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-amdgpu: PKGV changed from 2.4.133 [default] to 2.4.134 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-amdgpu: PV changed from "2.4.133" to "2.4.134"
packages/x86-64-v3-poky-linux/libdrm/libdrm-dbg: PKGSIZE changed from 1779224 to 1779240 (+0%)
packages/x86-64-v3-poky-linux/libdrm/libdrm-dbg: FILELIST: removed "/usr/lib/.debug/libdrm_omap.so.1.133.0 /usr/lib/.debug/libdrm_radeon.so.1.133.0 /usr/lib/.debug/libdrm_nouveau.so.2.133.0 /usr/lib/.debug/libdrm_freedreno.so.1.133.0 /usr/lib/.debug/libdrm_amdgpu.so.1.133.0 /usr/lib/.debug/libdrm_etnaviv.so.1.133.0 /usr/lib/.debug/libdrm.so.2.133.0 /usr/lib/.debug/libdrm_intel.so.1.133.0", added "/usr/lib/.debug/libdrm_freedreno.so.1.134.0 /usr/lib/.debug/libdrm_nouveau.so.2.134.0 /usr/lib/.debug/libdrm_amdgpu.so.1.134.0 /usr/lib/.debug/libdrm_etnaviv.so.1.134.0 /usr/lib/.debug/libdrm.so.2.134.0 /usr/lib/.debug/libdrm_intel.so.1.134.0 /usr/lib/.debug/libdrm_omap.so.1.134.0 /usr/lib/.debug/libdrm_radeon.so.1.134.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-dbg: PKGV changed from 2.4.133 [default] to 2.4.134 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-dbg: PV changed from "2.4.133" to "2.4.134"
packages/x86-64-v3-poky-linux/libdrm/libdrm-dev: PKGSIZE changed from 796984 to 797932 (+0%)
packages/x86-64-v3-poky-linux/libdrm/libdrm-dev: PKGV changed from 2.4.133 [default] to 2.4.134 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-dev: PV changed from "2.4.133" to "2.4.134"
packages/x86-64-v3-poky-linux/libdrm/libdrm-doc: PKGV changed from 2.4.133 [default] to 2.4.134 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-doc: PV changed from "2.4.133" to "2.4.134"
packages/x86-64-v3-poky-linux/libdrm/libdrm-drivers: PKGV changed from 2.4.133 [default] to 2.4.134 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-drivers: PV changed from "2.4.133" to "2.4.134"
packages/x86-64-v3-poky-linux/libdrm/libdrm-etnaviv: FILELIST: removed "/usr/lib/libdrm_etnaviv.so.1.133.0", added "/usr/lib/libdrm_etnaviv.so.1.134.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-etnaviv: PKGV changed from 2.4.133 [default] to 2.4.134 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-etnaviv: PV changed from "2.4.133" to "2.4.134"
packages/x86-64-v3-poky-linux/libdrm/libdrm-exynos: PKGV changed from 2.4.133 [default] to 2.4.134 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-exynos: PV changed from "2.4.133" to "2.4.134"
packages/x86-64-v3-poky-linux/libdrm/libdrm-freedreno: FILELIST: removed "/usr/lib/libdrm_freedreno.so.1.133.0", added "/usr/lib/libdrm_freedreno.so.1.134.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-freedreno: PKGV changed from 2.4.133 [default] to 2.4.134 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-freedreno: PV changed from "2.4.133" to "2.4.134"
packages/x86-64-v3-poky-linux/libdrm/libdrm-intel: FILELIST: removed "/usr/lib/libdrm_intel.so.1.133.0", added "/usr/lib/libdrm_intel.so.1.134.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-intel: PKGV changed from 2.4.133 [default] to 2.4.134 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-intel: PV changed from "2.4.133" to "2.4.134"
packages/x86-64-v3-poky-linux/libdrm/libdrm-locale: PKGV changed from 2.4.133 [default] to 2.4.134 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-locale: PV changed from "2.4.133" to "2.4.134"
packages/x86-64-v3-poky-linux/libdrm/libdrm-nouveau: FILELIST: removed "/usr/lib/libdrm_nouveau.so.2.133.0", added "/usr/lib/libdrm_nouveau.so.2.134.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-nouveau: PKGV changed from 2.4.133 [default] to 2.4.134 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-nouveau: PV changed from "2.4.133" to "2.4.134"
packages/x86-64-v3-poky-linux/libdrm/libdrm-omap: FILELIST: removed "/usr/lib/libdrm_omap.so.1.133.0", added "/usr/lib/libdrm_omap.so.1.134.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-omap: PKGV changed from 2.4.133 [default] to 2.4.134 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-omap: PV changed from "2.4.133" to "2.4.134"
packages/x86-64-v3-poky-linux/libdrm/libdrm-radeon: FILELIST: removed "/usr/lib/libdrm_radeon.so.1.133.0", added "/usr/lib/libdrm_radeon.so.1.134.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-radeon: PKGV changed from 2.4.133 [default] to 2.4.134 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-radeon: PV changed from "2.4.133" to "2.4.134"
packages/x86-64-v3-poky-linux/libdrm/libdrm-src: PKGSIZE changed from 1746521 to 1746557 (+0%)
packages/x86-64-v3-poky-linux/libdrm/libdrm-src: FILELIST: directory renamed /usr/src/debug/libdrm/2.4.133/tests -> /usr/src/debug/libdrm/2.4.134/tests, directory renamed /usr/src/debug/libdrm/2.4.133 -> /usr/src/debug/libdrm/2.4.134, directory renamed /usr/src/debug/libdrm/2.4.133/include/drm -> /usr/src/debug/libdrm/2.4.134/include/drm, directory renamed /usr/src/debug/libdrm/2.4.133/tests/etnaviv -> /usr/src/debug/libdrm/2.4.134/tests/etnaviv, directory renamed /usr/src/debug/libdrm/2.4.133/freedreno/msm -> /usr/src/debug/libdrm/2.4.134/freedreno/msm, directory renamed /usr/src/debug/libdrm/2.4.133/etnaviv -> /usr/src/debug/libdrm/2.4.134/etnaviv, directory renamed /usr/src/debug/libdrm/2.4.133/tests/modetest -> /usr/src/debug/libdrm/2.4.134/tests/modetest, directory renamed /usr/src/debug/libdrm/2.4.133/tests/proptest -> /usr/src/debug/libdrm/2.4.134/tests/proptest, directory renamed /usr/src/debug/libdrm/2.4.133/tests/util -> /usr/src/debug/libdrm/2.4.134/tests/util, directory r
 enamed /usr/src/debug/libdrm/2.4.133/amdgpu -> /usr/src/debug/libdrm/2.4.134/amdgpu, directory renamed /usr/src/debug/libdrm/2.4.133/intel -> /usr/src/debug/libdrm/2.4.134/intel, directory renamed /usr/src/debug/libdrm/2.4.133/freedreno -> /usr/src/debug/libdrm/2.4.134/freedreno, directory renamed /usr/src/debug/libdrm/2.4.133/tests/modeprint -> /usr/src/debug/libdrm/2.4.134/tests/modeprint, directory renamed /usr/src/debug/libdrm/2.4.133/radeon -> /usr/src/debug/libdrm/2.4.134/radeon, directory renamed /usr/src/debug/libdrm/2.4.133/tests/vbltest -> /usr/src/debug/libdrm/2.4.134/tests/vbltest, directory renamed /usr/src/debug/libdrm/2.4.133/omap -> /usr/src/debug/libdrm/2.4.134/omap, directory renamed /usr/src/debug/libdrm/2.4.133/nouveau/nvif -> /usr/src/debug/libdrm/2.4.134/nouveau/nvif, directory renamed /usr/src/debug/libdrm/2.4.133/nouveau -> /usr/src/debug/libdrm/2.4.134/nouveau, directory renamed /usr/src/debug/libdrm/2.4.133/tests/amdgpu -> /usr/src/debug/libdrm/2.4.134/test
 s/amdgpu
packages/x86-64-v3-poky-linux/libdrm/libdrm-src: PKGV changed from 2.4.133 [default] to 2.4.134 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-src: PV changed from "2.4.133" to "2.4.134"
packages/x86-64-v3-poky-linux/libdrm/libdrm-staticdev: PKGV changed from 2.4.133 [default] to 2.4.134 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-staticdev: PV changed from "2.4.133" to "2.4.134"
packages/x86-64-v3-poky-linux/libdrm/libdrm-tests: PKGV changed from 2.4.133 [default] to 2.4.134 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-tests: PV changed from "2.4.133" to "2.4.134"
packages/x86-64-v3-poky-linux/libdrm/libdrm: FILELIST: removed "/usr/lib/libdrm.so.2.133.0", added "/usr/lib/libdrm.so.2.134.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm: PKGV changed from 2.4.133 [default] to 2.4.134 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm: PV changed from "2.4.133" to "2.4.134"
Changes to packages/x86-64-v3-poky-linux/libdrm (sysroot):
  /usr/lib/libdrm_amdgpu.so.1 changed symlink target from libdrm_amdgpu.so.1.133.0 to libdrm_amdgpu.so.1.134.0
  /usr/lib/libdrm_etnaviv.so.1 changed symlink target from libdrm_etnaviv.so.1.133.0 to libdrm_etnaviv.so.1.134.0
  /usr/lib/libdrm_freedreno.so.1 changed symlink target from libdrm_freedreno.so.1.133.0 to libdrm_freedreno.so.1.134.0
  /usr/lib/libdrm_intel.so.1 changed symlink target from libdrm_intel.so.1.133.0 to libdrm_intel.so.1.134.0
  /usr/lib/libdrm_nouveau.so.2 changed symlink target from libdrm_nouveau.so.2.133.0 to libdrm_nouveau.so.2.134.0
  /usr/lib/libdrm_omap.so.1 changed symlink target from libdrm_omap.so.1.133.0 to libdrm_omap.so.1.134.0
  /usr/lib/libdrm_radeon.so.1 changed symlink target from libdrm_radeon.so.1.133.0 to libdrm_radeon.so.1.134.0
  /usr/lib/libdrm.so.2 changed symlink target from libdrm.so.2.133.0 to libdrm.so.2.134.0
  /usr/lib/libdrm_amdgpu.so.1.133.0 moved to /usr/lib/libdrm_amdgpu.so.1.134.0
  /usr/lib/libdrm_etnaviv.so.1.133.0 moved to /usr/lib/libdrm_etnaviv.so.1.134.0
  /usr/lib/libdrm_freedreno.so.1.133.0 moved to /usr/lib/libdrm_freedreno.so.1.134.0
  /usr/lib/libdrm_intel.so.1.133.0 moved to /usr/lib/libdrm_intel.so.1.134.0
  /usr/lib/libdrm_nouveau.so.2.133.0 moved to /usr/lib/libdrm_nouveau.so.2.134.0
  /usr/lib/libdrm_omap.so.1.133.0 moved to /usr/lib/libdrm_omap.so.1.134.0
  /usr/lib/libdrm_radeon.so.1.133.0 moved to /usr/lib/libdrm_radeon.so.1.134.0
  /usr/lib/libdrm.so.2.133.0 moved to /usr/lib/libdrm.so.2.134.0

--===============0700254294422072993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libdrm/libdrm-amdgpu: FILELIST: removed "/usr/lib/libdrm_amdgpu.so.1.133.0", added "/usr/lib/libdrm_amdgpu.so.1.134.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-etnaviv: FILELIST: removed "/usr/lib/libdrm_etnaviv.so.1.133.0", added "/usr/lib/libdrm_etnaviv.so.1.134.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-freedreno: FILELIST: removed "/usr/lib/libdrm_freedreno.so.1.133.0", added "/usr/lib/libdrm_freedreno.so.1.134.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-intel: FILELIST: removed "/usr/lib/libdrm_intel.so.1.133.0", added "/usr/lib/libdrm_intel.so.1.134.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-nouveau: FILELIST: removed "/usr/lib/libdrm_nouveau.so.2.133.0", added "/usr/lib/libdrm_nouveau.so.2.134.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-omap: FILELIST: removed "/usr/lib/libdrm_omap.so.1.133.0", added "/usr/lib/libdrm_omap.so.1.134.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-radeon: FILELIST: removed "/usr/lib/libdrm_radeon.so.1.133.0", added "/usr/lib/libdrm_radeon.so.1.134.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm: FILELIST: removed "/usr/lib/libdrm.so.2.133.0", added "/usr/lib/libdrm.so.2.134.0"
Changes to packages/x86-64-v3-poky-linux/libdrm (sysroot):
  /usr/lib/libdrm_amdgpu.so.1 changed symlink target from libdrm_amdgpu.so.1.133.0 to libdrm_amdgpu.so.1.134.0
  /usr/lib/libdrm_etnaviv.so.1 changed symlink target from libdrm_etnaviv.so.1.133.0 to libdrm_etnaviv.so.1.134.0
  /usr/lib/libdrm_freedreno.so.1 changed symlink target from libdrm_freedreno.so.1.133.0 to libdrm_freedreno.so.1.134.0
  /usr/lib/libdrm_intel.so.1 changed symlink target from libdrm_intel.so.1.133.0 to libdrm_intel.so.1.134.0
  /usr/lib/libdrm_nouveau.so.2 changed symlink target from libdrm_nouveau.so.2.133.0 to libdrm_nouveau.so.2.134.0
  /usr/lib/libdrm_omap.so.1 changed symlink target from libdrm_omap.so.1.133.0 to libdrm_omap.so.1.134.0
  /usr/lib/libdrm_radeon.so.1 changed symlink target from libdrm_radeon.so.1.133.0 to libdrm_radeon.so.1.134.0
  /usr/lib/libdrm.so.2 changed symlink target from libdrm.so.2.133.0 to libdrm.so.2.134.0
  /usr/lib/libdrm_amdgpu.so.1.133.0 moved to /usr/lib/libdrm_amdgpu.so.1.134.0
  /usr/lib/libdrm_etnaviv.so.1.133.0 moved to /usr/lib/libdrm_etnaviv.so.1.134.0
  /usr/lib/libdrm_freedreno.so.1.133.0 moved to /usr/lib/libdrm_freedreno.so.1.134.0
  /usr/lib/libdrm_intel.so.1.133.0 moved to /usr/lib/libdrm_intel.so.1.134.0
  /usr/lib/libdrm_nouveau.so.2.133.0 moved to /usr/lib/libdrm_nouveau.so.2.134.0
  /usr/lib/libdrm_omap.so.1.133.0 moved to /usr/lib/libdrm_omap.so.1.134.0
  /usr/lib/libdrm_radeon.so.1.133.0 moved to /usr/lib/libdrm_radeon.so.1.134.0
  /usr/lib/libdrm.so.2.133.0 moved to /usr/lib/libdrm.so.2.134.0

--===============0700254294422072993==--

