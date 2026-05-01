Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F139CD342F
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:53 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15608.1777645529547183619
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=uQ1T9iI2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=B4nZqozd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019de3ee79a5-4488ad08-932f-4228-b932-728e8137b35f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645550;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=um3bMxFA8J0Z0QPmvmh1K8AqSGAmWflS7SyqmA2uIfg=;
	b=uQ1T9iI2f7fcAxXRp7RmcEx+TkIMYUhd6ylwzePnF8Wg+uXOAp5znnVwAK3JYydE
	THF6WYFLlV4fNLbakwFkGufwNINtKY8b03axjJYl/NbWUAuxfl6DcXCPUy57u7ZoAsc
	NZwY7mB5Ipto2ROXePWrysLKIB1uEu/90UybqzEg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645550;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=um3bMxFA8J0Z0QPmvmh1K8AqSGAmWflS7SyqmA2uIfg=;
	b=B4nZqozdX0uipJd+ctN5Wk7CMsMbllQYX0epoaByTY01TjmSTxJKHWeWPLHS51wC
	9IVZv3OB2fMbtviCjNyWR4+8G8bjyaEh05+8vdf6V4HKA2mR6kX/3gDJNomXlK+KBNU
	AOGNrMu0f/ZIOR4NYsdIR6pfHnCSs0W7In/cUmWg=
Content-Type: multipart/mixed; boundary="===============8348296997830768675=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libdrm: upgrading to 2.4.133 SUCCEEDED
Message-ID: <0101019de3ee79a5-4488ad08-932f-4228-b932-728e8137b35f-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236271

--===============8348296997830768675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libdrm* to *2.4.133* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdrm-upgrade-2.4.131-2.4.133.patch
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
From c955c88d4a7a1cf25ec7b35e5676d4db81fb8634 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 11:51:34 +0000
Subject: [PATCH] libdrm: upgrade 2.4.131 -> 2.4.133

---
 .../drm/{libdrm_2.4.131.bb => libdrm_2.4.133.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.131.bb => libdrm_2.4.133.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.131.bb b/meta/recipes-graphics/drm/libdrm_2.4.133.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.131.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.133.bb
index 1c55dd5550..afddb21e0a 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.131.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.133.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "45ba9983b51c896406a3d654de81d313b953b76e6391e2797073d543c5f617d5"
+SRC_URI[sha256sum] = "fc68f9d0ba2ea63c9432a299e14fea09fad7a8a66e8039fcd7802ca59f77b4f5"
 
 inherit meson pkgconfig manpages
 
-- 
2.47.1


--===============8348296997830768675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libdrm/libdrm-amdgpu: FILELIST: removed "/usr/lib/libdrm_amdgpu.so.1.131.0", added "/usr/lib/libdrm_amdgpu.so.1.133.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-etnaviv: FILELIST: removed "/usr/lib/libdrm_etnaviv.so.1.131.0", added "/usr/lib/libdrm_etnaviv.so.1.133.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-freedreno: FILELIST: removed "/usr/lib/libdrm_freedreno.so.1.131.0", added "/usr/lib/libdrm_freedreno.so.1.133.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-intel: FILELIST: removed "/usr/lib/libdrm_intel.so.1.131.0", added "/usr/lib/libdrm_intel.so.1.133.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-nouveau: FILELIST: removed "/usr/lib/libdrm_nouveau.so.2.131.0", added "/usr/lib/libdrm_nouveau.so.2.133.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-omap: FILELIST: removed "/usr/lib/libdrm_omap.so.1.131.0", added "/usr/lib/libdrm_omap.so.1.133.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-radeon: FILELIST: removed "/usr/lib/libdrm_radeon.so.1.131.0", added "/usr/lib/libdrm_radeon.so.1.133.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm: FILELIST: removed "/usr/lib/libdrm.so.2.131.0", added "/usr/lib/libdrm.so.2.133.0"
Changes to packages/x86-64-v3-poky-linux/libdrm (sysroot):
  /usr/lib/libdrm_amdgpu.so.1 changed symlink target from libdrm_amdgpu.so.1.131.0 to libdrm_amdgpu.so.1.133.0
  /usr/lib/libdrm_etnaviv.so.1 changed symlink target from libdrm_etnaviv.so.1.131.0 to libdrm_etnaviv.so.1.133.0
  /usr/lib/libdrm_freedreno.so.1 changed symlink target from libdrm_freedreno.so.1.131.0 to libdrm_freedreno.so.1.133.0
  /usr/lib/libdrm_intel.so.1 changed symlink target from libdrm_intel.so.1.131.0 to libdrm_intel.so.1.133.0
  /usr/lib/libdrm_nouveau.so.2 changed symlink target from libdrm_nouveau.so.2.131.0 to libdrm_nouveau.so.2.133.0
  /usr/lib/libdrm_omap.so.1 changed symlink target from libdrm_omap.so.1.131.0 to libdrm_omap.so.1.133.0
  /usr/lib/libdrm_radeon.so.1 changed symlink target from libdrm_radeon.so.1.131.0 to libdrm_radeon.so.1.133.0
  /usr/lib/libdrm.so.2 changed symlink target from libdrm.so.2.131.0 to libdrm.so.2.133.0
  /usr/lib/libdrm_amdgpu.so.1.131.0 moved to /usr/lib/libdrm_amdgpu.so.1.133.0
  /usr/lib/libdrm_etnaviv.so.1.131.0 moved to /usr/lib/libdrm_etnaviv.so.1.133.0
  /usr/lib/libdrm_freedreno.so.1.131.0 moved to /usr/lib/libdrm_freedreno.so.1.133.0
  /usr/lib/libdrm_intel.so.1.131.0 moved to /usr/lib/libdrm_intel.so.1.133.0
  /usr/lib/libdrm_nouveau.so.2.131.0 moved to /usr/lib/libdrm_nouveau.so.2.133.0
  /usr/lib/libdrm_omap.so.1.131.0 moved to /usr/lib/libdrm_omap.so.1.133.0
  /usr/lib/libdrm_radeon.so.1.131.0 moved to /usr/lib/libdrm_radeon.so.1.133.0
  /usr/lib/libdrm.so.2.131.0 moved to /usr/lib/libdrm.so.2.133.0

--===============8348296997830768675==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdrm-upgrade-2.4.131-2.4.133.patch"

RnJvbSBjOTU1Yzg4ZDRhN2ExY2YyNWVjN2IzNWU1Njc2ZDRkYjgxZmI4NjM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMTo1MTozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmRybTogdXBncmFkZSAyLjQuMTMxIC0+IDIuNC4xMzMKCi0tLQogLi4uL2RybS97bGliZHJtXzIu
NC4xMzEuYmIgPT4gbGliZHJtXzIuNC4xMzMuYmJ9ICAgICAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL2RybS97bGliZHJtXzIuNC4xMzEuYmIgPT4gbGliZHJtXzIuNC4xMzMu
YmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2RybS9saWJkcm1f
Mi40LjEzMS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJtXzIuNC4xMzMuYmIK
c2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2Ry
bS9saWJkcm1fMi40LjEzMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2RybS9s
aWJkcm1fMi40LjEzMy5iYgppbmRleCAxYzU1ZGQ1NTUwLi5hZmRkYjIxZTBhIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuMTMxLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJtXzIuNC4xMzMuYmIKQEAgLTEzLDcgKzEzLDcgQEAg
REVQRU5EUyA9ICJsaWJwdGhyZWFkLXN0dWJzIgogU1JDX1VSSSA9ICJodHRwOi8vZHJpLmZyZWVk
ZXNrdG9wLm9yZy9saWJkcm0vJHtCUH0udGFyLnh6IFwKICAgICAgICAgICAiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI0NWJhOTk4M2I1MWM4OTY0MDZhM2Q2NTRkZTgxZDMxM2I5NTNiNzZlNjM5
MWUyNzk3MDczZDU0M2M1ZjYxN2Q1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImZjNjhmOWQwYmEy
ZWE2M2M5NDMyYTI5OWUxNGZlYTA5ZmFkN2E4YTY2ZTgwMzlmY2Q3ODAyY2E1OWY3N2I0ZjUiCiAK
IGluaGVyaXQgbWVzb24gcGtnY29uZmlnIG1hbnBhZ2VzCiAKLS0gCjIuNDcuMQoK

--===============8348296997830768675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libdrm: PKGV changed from 2.4.131 [default] to 2.4.133 [default]
packages/x86-64-v3-poky-linux/libdrm: SRC_URI changed from "http://dri.freedesktop.org/libdrm/libdrm-2.4.131.tar.xz" to "http://dri.freedesktop.org/libdrm/libdrm-2.4.133.tar.xz"
packages/x86-64-v3-poky-linux/libdrm: PV changed from "2.4.131" to "2.4.133"
packages/x86-64-v3-poky-linux/libdrm/libdrm-amdgpu: PKGV changed from 2.4.131 [default] to 2.4.133 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-amdgpu: PV changed from "2.4.131" to "2.4.133"
packages/x86-64-v3-poky-linux/libdrm/libdrm-amdgpu: PKGSIZE changed from 70664 to 72409 (+2%)
packages/x86-64-v3-poky-linux/libdrm/libdrm-amdgpu: FILELIST: removed "/usr/lib/libdrm_amdgpu.so.1.131.0", added "/usr/lib/libdrm_amdgpu.so.1.133.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-dbg: PKGV changed from 2.4.131 [default] to 2.4.133 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-dbg: PV changed from "2.4.131" to "2.4.133"
packages/x86-64-v3-poky-linux/libdrm/libdrm-dbg: PKGSIZE changed from 1770424 to 1772808 (+0%)
packages/x86-64-v3-poky-linux/libdrm/libdrm-dbg: FILELIST: removed "/usr/lib/.debug/libdrm_omap.so.1.131.0 /usr/lib/.debug/libdrm_radeon.so.1.131.0 /usr/lib/.debug/libdrm_etnaviv.so.1.131.0 /usr/lib/.debug/libdrm_freedreno.so.1.131.0 /usr/lib/.debug/libdrm_amdgpu.so.1.131.0 /usr/lib/.debug/libdrm_intel.so.1.131.0 /usr/lib/.debug/libdrm.so.2.131.0 /usr/lib/.debug/libdrm_nouveau.so.2.131.0", added "/usr/lib/.debug/libdrm_intel.so.1.133.0 /usr/lib/.debug/libdrm_amdgpu.so.1.133.0 /usr/lib/.debug/libdrm_freedreno.so.1.133.0 /usr/lib/.debug/libdrm_etnaviv.so.1.133.0 /usr/lib/.debug/libdrm_omap.so.1.133.0 /usr/lib/.debug/libdrm_radeon.so.1.133.0 /usr/lib/.debug/libdrm.so.2.133.0 /usr/lib/.debug/libdrm_nouveau.so.2.133.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-dev: PKGV changed from 2.4.131 [default] to 2.4.133 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-dev: PV changed from "2.4.131" to "2.4.133"
packages/x86-64-v3-poky-linux/libdrm/libdrm-dev: PKGSIZE changed from 795745 to 796984 (+0%)
packages/x86-64-v3-poky-linux/libdrm/libdrm-doc: PKGV changed from 2.4.131 [default] to 2.4.133 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-doc: PV changed from "2.4.131" to "2.4.133"
packages/x86-64-v3-poky-linux/libdrm/libdrm-drivers: PKGV changed from 2.4.131 [default] to 2.4.133 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-drivers: PV changed from "2.4.131" to "2.4.133"
packages/x86-64-v3-poky-linux/libdrm/libdrm-etnaviv: PKGV changed from 2.4.131 [default] to 2.4.133 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-etnaviv: PV changed from "2.4.131" to "2.4.133"
packages/x86-64-v3-poky-linux/libdrm/libdrm-etnaviv: FILELIST: removed "/usr/lib/libdrm_etnaviv.so.1.131.0", added "/usr/lib/libdrm_etnaviv.so.1.133.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-exynos: PKGV changed from 2.4.131 [default] to 2.4.133 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-exynos: PV changed from "2.4.131" to "2.4.133"
packages/x86-64-v3-poky-linux/libdrm/libdrm-freedreno: PKGV changed from 2.4.131 [default] to 2.4.133 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-freedreno: PV changed from "2.4.131" to "2.4.133"
packages/x86-64-v3-poky-linux/libdrm/libdrm-freedreno: FILELIST: removed "/usr/lib/libdrm_freedreno.so.1.131.0", added "/usr/lib/libdrm_freedreno.so.1.133.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-intel: PKGV changed from 2.4.131 [default] to 2.4.133 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-intel: PV changed from "2.4.131" to "2.4.133"
packages/x86-64-v3-poky-linux/libdrm/libdrm-intel: FILELIST: removed "/usr/lib/libdrm_intel.so.1.131.0", added "/usr/lib/libdrm_intel.so.1.133.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-locale: PKGV changed from 2.4.131 [default] to 2.4.133 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-locale: PV changed from "2.4.131" to "2.4.133"
packages/x86-64-v3-poky-linux/libdrm/libdrm-nouveau: PKGV changed from 2.4.131 [default] to 2.4.133 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-nouveau: PV changed from "2.4.131" to "2.4.133"
packages/x86-64-v3-poky-linux/libdrm/libdrm-nouveau: FILELIST: removed "/usr/lib/libdrm_nouveau.so.2.131.0", added "/usr/lib/libdrm_nouveau.so.2.133.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-omap: PKGV changed from 2.4.131 [default] to 2.4.133 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-omap: PV changed from "2.4.131" to "2.4.133"
packages/x86-64-v3-poky-linux/libdrm/libdrm-omap: FILELIST: removed "/usr/lib/libdrm_omap.so.1.131.0", added "/usr/lib/libdrm_omap.so.1.133.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-radeon: PKGV changed from 2.4.131 [default] to 2.4.133 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-radeon: PV changed from "2.4.131" to "2.4.133"
packages/x86-64-v3-poky-linux/libdrm/libdrm-radeon: FILELIST: removed "/usr/lib/libdrm_radeon.so.1.131.0", added "/usr/lib/libdrm_radeon.so.1.133.0"
packages/x86-64-v3-poky-linux/libdrm/libdrm-src: PKGV changed from 2.4.131 [default] to 2.4.133 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-src: PV changed from "2.4.131" to "2.4.133"
packages/x86-64-v3-poky-linux/libdrm/libdrm-src: PKGSIZE changed from 1739951 to 1746521 (+0%)
packages/x86-64-v3-poky-linux/libdrm/libdrm-src: FILELIST: directory renamed /usr/src/debug/libdrm/2.4.131/tests/modeprint -> /usr/src/debug/libdrm/2.4.133/tests/modeprint, directory renamed /usr/src/debug/libdrm/2.4.131/amdgpu -> /usr/src/debug/libdrm/2.4.133/amdgpu, directory renamed /usr/src/debug/libdrm/2.4.131/tests/util -> /usr/src/debug/libdrm/2.4.133/tests/util, directory renamed /usr/src/debug/libdrm/2.4.131/tests/proptest -> /usr/src/debug/libdrm/2.4.133/tests/proptest, directory renamed /usr/src/debug/libdrm/2.4.131/tests/modetest -> /usr/src/debug/libdrm/2.4.133/tests/modetest, directory renamed /usr/src/debug/libdrm/2.4.131/radeon -> /usr/src/debug/libdrm/2.4.133/radeon, directory renamed /usr/src/debug/libdrm/2.4.131/tests/etnaviv -> /usr/src/debug/libdrm/2.4.133/tests/etnaviv, directory renamed /usr/src/debug/libdrm/2.4.131/tests/amdgpu -> /usr/src/debug/libdrm/2.4.133/tests/amdgpu, directory renamed /usr/src/debug/libdrm/2.4.131/etnaviv -> /usr/src/debug/libdrm/2.4.13
 3/etnaviv, directory renamed /usr/src/debug/libdrm/2.4.131/freedreno/msm -> /usr/src/debug/libdrm/2.4.133/freedreno/msm, directory renamed /usr/src/debug/libdrm/2.4.131/omap -> /usr/src/debug/libdrm/2.4.133/omap, directory renamed /usr/src/debug/libdrm/2.4.131/tests -> /usr/src/debug/libdrm/2.4.133/tests, directory renamed /usr/src/debug/libdrm/2.4.131/nouveau/nvif -> /usr/src/debug/libdrm/2.4.133/nouveau/nvif, directory renamed /usr/src/debug/libdrm/2.4.131/include/drm -> /usr/src/debug/libdrm/2.4.133/include/drm, directory renamed /usr/src/debug/libdrm/2.4.131/tests/vbltest -> /usr/src/debug/libdrm/2.4.133/tests/vbltest, directory renamed /usr/src/debug/libdrm/2.4.131/intel -> /usr/src/debug/libdrm/2.4.133/intel, directory renamed /usr/src/debug/libdrm/2.4.131/nouveau -> /usr/src/debug/libdrm/2.4.133/nouveau, directory renamed /usr/src/debug/libdrm/2.4.131/freedreno -> /usr/src/debug/libdrm/2.4.133/freedreno, removed "/usr/src/debug/libdrm/2.4.131/libdrm_lists.h /usr/src/debug/lib
 drm/2.4.131/xf86drmHash.c /usr/src/debug/libdrm/2.4.131/generated_static_table_fourcc.h /usr/src/debug/libdrm/2.4.131/xf86drmRandom.c /usr/src/debug/libdrm/2.4.131/libdrm_macros.h /usr/src/debug/libdrm/2.4.131/xf86drmRandom.h /usr/src/debug/libdrm/2.4.131/xf86drmSL.c /usr/src/debug/libdrm/2.4.131/xf86drmHash.h /usr/src/debug/libdrm/2.4.131/xf86atomic.h /usr/src/debug/libdrm/2.4.131/xf86drm.c /usr/src/debug/libdrm/2.4.131/util_double_list.h /usr/src/debug/libdrm/2.4.131/xf86drmMode.h /usr/src/debug/libdrm/2.4.131/xf86drm.h /usr/src/debug/libdrm/2.4.131/xf86drmMode.c", added "/usr/src/debug/libdrm/2.4.133/libdrm_lists.h /usr/src/debug/libdrm/2.4.133/xf86drmHash.c /usr/src/debug/libdrm/2.4.133/generated_static_table_fourcc.h /usr/src/debug/libdrm/2.4.133/xf86drmRandom.c /usr/src/debug/libdrm/2.4.133/libdrm_macros.h /usr/src/debug/libdrm/2.4.133/xf86drmRandom.h /usr/src/debug/libdrm/2.4.133/xf86drmSL.c /usr/src/debug/libdrm/2.4.133/xf86drmHash.h /usr/src/debug/libdrm/2.4.133/xf86atomic.
 h /usr/src/debug/libdrm/2.4.133/xf86drm.c /usr/src/debug/libdrm/2.4.133/util_double_list.h /usr/src/debug/libdrm/2.4.133/util_math.h /usr/src/debug/libdrm/2.4.133/xf86drmMode.h /usr/src/debug/libdrm/2.4.133/xf86drm.h /usr/src/debug/libdrm/2.4.133/xf86drmMode.c"
packages/x86-64-v3-poky-linux/libdrm/libdrm-staticdev: PKGV changed from 2.4.131 [default] to 2.4.133 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-staticdev: PV changed from "2.4.131" to "2.4.133"
packages/x86-64-v3-poky-linux/libdrm/libdrm-tests: PKGV changed from 2.4.131 [default] to 2.4.133 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm-tests: PV changed from "2.4.131" to "2.4.133"
packages/x86-64-v3-poky-linux/libdrm/libdrm: PKGV changed from 2.4.131 [default] to 2.4.133 [default]
packages/x86-64-v3-poky-linux/libdrm/libdrm: PV changed from "2.4.131" to "2.4.133"
packages/x86-64-v3-poky-linux/libdrm/libdrm: FILELIST: removed "/usr/lib/libdrm.so.2.131.0", added "/usr/lib/libdrm.so.2.133.0"
Changes to packages/x86-64-v3-poky-linux/libdrm (sysroot):
  /usr/lib/libdrm_amdgpu.so.1 changed symlink target from libdrm_amdgpu.so.1.131.0 to libdrm_amdgpu.so.1.133.0
  /usr/lib/libdrm_etnaviv.so.1 changed symlink target from libdrm_etnaviv.so.1.131.0 to libdrm_etnaviv.so.1.133.0
  /usr/lib/libdrm_freedreno.so.1 changed symlink target from libdrm_freedreno.so.1.131.0 to libdrm_freedreno.so.1.133.0
  /usr/lib/libdrm_intel.so.1 changed symlink target from libdrm_intel.so.1.131.0 to libdrm_intel.so.1.133.0
  /usr/lib/libdrm_nouveau.so.2 changed symlink target from libdrm_nouveau.so.2.131.0 to libdrm_nouveau.so.2.133.0
  /usr/lib/libdrm_omap.so.1 changed symlink target from libdrm_omap.so.1.131.0 to libdrm_omap.so.1.133.0
  /usr/lib/libdrm_radeon.so.1 changed symlink target from libdrm_radeon.so.1.131.0 to libdrm_radeon.so.1.133.0
  /usr/lib/libdrm.so.2 changed symlink target from libdrm.so.2.131.0 to libdrm.so.2.133.0
  /usr/lib/libdrm_amdgpu.so.1.131.0 moved to /usr/lib/libdrm_amdgpu.so.1.133.0
  /usr/lib/libdrm_etnaviv.so.1.131.0 moved to /usr/lib/libdrm_etnaviv.so.1.133.0
  /usr/lib/libdrm_freedreno.so.1.131.0 moved to /usr/lib/libdrm_freedreno.so.1.133.0
  /usr/lib/libdrm_intel.so.1.131.0 moved to /usr/lib/libdrm_intel.so.1.133.0
  /usr/lib/libdrm_nouveau.so.2.131.0 moved to /usr/lib/libdrm_nouveau.so.2.133.0
  /usr/lib/libdrm_omap.so.1.131.0 moved to /usr/lib/libdrm_omap.so.1.133.0
  /usr/lib/libdrm_radeon.so.1.131.0 moved to /usr/lib/libdrm_radeon.so.1.133.0
  /usr/lib/libdrm.so.2.131.0 moved to /usr/lib/libdrm.so.2.133.0

--===============8348296997830768675==--

