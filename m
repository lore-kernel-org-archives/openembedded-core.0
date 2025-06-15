Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79727C83F0F
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:15:05 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.8871.1749993292128519691
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nW5eKtKx;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=de7T+uvh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019773ba9698-c0e5f2a5-43f6-4c46-9806-9963058f27c1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993297;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ghZzcwXltpJZK0u4V0f2b19pRfBod3HINoXLDtVz7Cc=;
	b=nW5eKtKxy+c836eTOHyYOMhger2yiQcxtGZAGO/CqGcz+NbniuOUy7OKgWnub7Bv
	y+6QrRxPi7HcurGwy8tZ4Y92K7U22oI/hGp6RL/DCF6ARBQnR9pWc5BcVmF926bWIT9
	yrDZd/T8LzvyYpMqLMm+pPN/uMoIiOjIhhB5MDSc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993297;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ghZzcwXltpJZK0u4V0f2b19pRfBod3HINoXLDtVz7Cc=;
	b=de7T+uvhctTjujBujr605Gdel5rrGx0fDqmYbKQMq7JZzGYWDlwwEIZ19gaWfldV
	7AOXYj6vQfblpRXBYhZWoWgxIiozEdgmEtB/qcVK2uFZ/1QfxsI9zcD7OP/W3nGmJ5w
	00iAsA2fD3iczX0aq1uvds8IrvcbRWWphTz1jANc=
Content-Type: multipart/mixed; boundary="===============0044158201702595698=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdrm: upgrading to 2.4.125 SUCCEEDED
Message-ID: <0101019773ba9698-c0e5f2a5-43f6-4c46-9806-9963058f27c1-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218717

--===============0044158201702595698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libdrm* to *2.4.125* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdrm-upgrade-2.4.124-2.4.125.patch
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
From 5aae3d8c492f70fbf733487fa4b402ee09eb7a68 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 11:10:34 +0000
Subject: [PATCH] libdrm: upgrade 2.4.124 -> 2.4.125

---
 .../drm/{libdrm_2.4.124.bb => libdrm_2.4.125.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.124.bb => libdrm_2.4.125.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.124.bb b/meta/recipes-graphics/drm/libdrm_2.4.125.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.124.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.125.bb
index 78f31ccb95..a256f73145 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.124.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.125.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "ac36293f61ca4aafaf4b16a2a7afff312aa4f5c37c9fbd797de9e3c0863ca379"
+SRC_URI[sha256sum] = "d4bae92797a50f81a93524762e0410a49cd84cfa0f997795bc0172ac8fb1d96a"
 
 inherit meson pkgconfig manpages
 
-- 
2.47.1


--===============0044158201702595698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libdrm: PV changed from "2.4.124" to "2.4.125"
packages/core2-64-poky-linux/libdrm: PKGV changed from 2.4.124 [default] to 2.4.125 [default]
packages/core2-64-poky-linux/libdrm: SRC_URI changed from "http://dri.freedesktop.org/libdrm/libdrm-2.4.124.tar.xz" to "http://dri.freedesktop.org/libdrm/libdrm-2.4.125.tar.xz"
packages/core2-64-poky-linux/libdrm/libdrm-amdgpu: PV changed from "2.4.124" to "2.4.125"
packages/core2-64-poky-linux/libdrm/libdrm-amdgpu: PKGV changed from 2.4.124 [default] to 2.4.125 [default]
packages/core2-64-poky-linux/libdrm/libdrm-amdgpu: FILELIST: removed "/usr/lib/libdrm_amdgpu.so.1.124.0", added "/usr/lib/libdrm_amdgpu.so.1.125.0"
packages/core2-64-poky-linux/libdrm/libdrm-amdgpu: PKGSIZE changed from 62297 to 70282 (+13%)
packages/core2-64-poky-linux/libdrm/libdrm-dbg: PV changed from "2.4.124" to "2.4.125"
packages/core2-64-poky-linux/libdrm/libdrm-dbg: PKGV changed from 2.4.124 [default] to 2.4.125 [default]
packages/core2-64-poky-linux/libdrm/libdrm-dbg: FILELIST: removed "/usr/lib/.debug/libdrm_omap.so.1.124.0 /usr/lib/.debug/libdrm_freedreno.so.1.124.0 /usr/lib/.debug/libdrm_amdgpu.so.1.124.0 /usr/lib/.debug/libdrm_etnaviv.so.1.124.0 /usr/lib/.debug/libdrm_nouveau.so.2.124.0 /usr/lib/.debug/libdrm_intel.so.1.124.0 /usr/lib/.debug/libdrm.so.2.124.0 /usr/lib/.debug/libdrm_radeon.so.1.124.0", added "/usr/lib/.debug/libdrm_intel.so.1.125.0 /usr/lib/.debug/libdrm_omap.so.1.125.0 /usr/lib/.debug/libdrm_etnaviv.so.1.125.0 /usr/lib/.debug/libdrm_nouveau.so.2.125.0 /usr/lib/.debug/libdrm_freedreno.so.1.125.0 /usr/lib/.debug/libdrm_amdgpu.so.1.125.0 /usr/lib/.debug/libdrm_radeon.so.1.125.0 /usr/lib/.debug/libdrm.so.2.125.0"
packages/core2-64-poky-linux/libdrm/libdrm-dbg: PKGSIZE changed from 1613280 to 1622136 (+1%)
packages/core2-64-poky-linux/libdrm/libdrm-dev: PV changed from "2.4.124" to "2.4.125"
packages/core2-64-poky-linux/libdrm/libdrm-dev: PKGV changed from 2.4.124 [default] to 2.4.125 [default]
packages/core2-64-poky-linux/libdrm/libdrm-dev: PKGSIZE changed from 761905 to 782697 (+3%)
packages/core2-64-poky-linux/libdrm/libdrm-doc: PV changed from "2.4.124" to "2.4.125"
packages/core2-64-poky-linux/libdrm/libdrm-doc: PKGV changed from 2.4.124 [default] to 2.4.125 [default]
packages/core2-64-poky-linux/libdrm/libdrm-drivers: PV changed from "2.4.124" to "2.4.125"
packages/core2-64-poky-linux/libdrm/libdrm-drivers: PKGV changed from 2.4.124 [default] to 2.4.125 [default]
packages/core2-64-poky-linux/libdrm/libdrm-etnaviv: PV changed from "2.4.124" to "2.4.125"
packages/core2-64-poky-linux/libdrm/libdrm-etnaviv: PKGV changed from 2.4.124 [default] to 2.4.125 [default]
packages/core2-64-poky-linux/libdrm/libdrm-etnaviv: FILELIST: removed "/usr/lib/libdrm_etnaviv.so.1.124.0", added "/usr/lib/libdrm_etnaviv.so.1.125.0"
packages/core2-64-poky-linux/libdrm/libdrm-exynos: PV changed from "2.4.124" to "2.4.125"
packages/core2-64-poky-linux/libdrm/libdrm-exynos: PKGV changed from 2.4.124 [default] to 2.4.125 [default]
packages/core2-64-poky-linux/libdrm/libdrm-freedreno: PV changed from "2.4.124" to "2.4.125"
packages/core2-64-poky-linux/libdrm/libdrm-freedreno: PKGV changed from 2.4.124 [default] to 2.4.125 [default]
packages/core2-64-poky-linux/libdrm/libdrm-freedreno: FILELIST: removed "/usr/lib/libdrm_freedreno.so.1.124.0", added "/usr/lib/libdrm_freedreno.so.1.125.0"
packages/core2-64-poky-linux/libdrm/libdrm-intel: PV changed from "2.4.124" to "2.4.125"
packages/core2-64-poky-linux/libdrm/libdrm-intel: PKGV changed from 2.4.124 [default] to 2.4.125 [default]
packages/core2-64-poky-linux/libdrm/libdrm-intel: FILELIST: removed "/usr/lib/libdrm_intel.so.1.124.0", added "/usr/lib/libdrm_intel.so.1.125.0"
packages/core2-64-poky-linux/libdrm/libdrm-locale: PV changed from "2.4.124" to "2.4.125"
packages/core2-64-poky-linux/libdrm/libdrm-locale: PKGV changed from 2.4.124 [default] to 2.4.125 [default]
packages/core2-64-poky-linux/libdrm/libdrm-nouveau: PV changed from "2.4.124" to "2.4.125"
packages/core2-64-poky-linux/libdrm/libdrm-nouveau: PKGV changed from 2.4.124 [default] to 2.4.125 [default]
packages/core2-64-poky-linux/libdrm/libdrm-nouveau: FILELIST: removed "/usr/lib/libdrm_nouveau.so.2.124.0", added "/usr/lib/libdrm_nouveau.so.2.125.0"
packages/core2-64-poky-linux/libdrm/libdrm-omap: PV changed from "2.4.124" to "2.4.125"
packages/core2-64-poky-linux/libdrm/libdrm-omap: PKGV changed from 2.4.124 [default] to 2.4.125 [default]
packages/core2-64-poky-linux/libdrm/libdrm-omap: FILELIST: removed "/usr/lib/libdrm_omap.so.1.124.0", added "/usr/lib/libdrm_omap.so.1.125.0"
packages/core2-64-poky-linux/libdrm/libdrm-radeon: PV changed from "2.4.124" to "2.4.125"
packages/core2-64-poky-linux/libdrm/libdrm-radeon: PKGV changed from 2.4.124 [default] to 2.4.125 [default]
packages/core2-64-poky-linux/libdrm/libdrm-radeon: FILELIST: removed "/usr/lib/libdrm_radeon.so.1.124.0", added "/usr/lib/libdrm_radeon.so.1.125.0"
packages/core2-64-poky-linux/libdrm/libdrm-src: PV changed from "2.4.124" to "2.4.125"
packages/core2-64-poky-linux/libdrm/libdrm-src: PKGV changed from 2.4.124 [default] to 2.4.125 [default]
packages/core2-64-poky-linux/libdrm/libdrm-src: PKGSIZE changed from 3259 to 3471 (+7%)
packages/core2-64-poky-linux/libdrm/libdrm-staticdev: PV changed from "2.4.124" to "2.4.125"
packages/core2-64-poky-linux/libdrm/libdrm-staticdev: PKGV changed from 2.4.124 [default] to 2.4.125 [default]
packages/core2-64-poky-linux/libdrm/libdrm-tests: PV changed from "2.4.124" to "2.4.125"
packages/core2-64-poky-linux/libdrm/libdrm-tests: PKGV changed from 2.4.124 [default] to 2.4.125 [default]
packages/core2-64-poky-linux/libdrm/libdrm: PV changed from "2.4.124" to "2.4.125"
packages/core2-64-poky-linux/libdrm/libdrm: PKGV changed from 2.4.124 [default] to 2.4.125 [default]
packages/core2-64-poky-linux/libdrm/libdrm: FILELIST: removed "/usr/lib/libdrm.so.2.124.0", added "/usr/lib/libdrm.so.2.125.0"
Changes to packages/core2-64-poky-linux/libdrm (sysroot):
  /usr/lib/libdrm_amdgpu.so.1 changed symlink target from libdrm_amdgpu.so.1.124.0 to libdrm_amdgpu.so.1.125.0
  /usr/lib/libdrm_etnaviv.so.1 changed symlink target from libdrm_etnaviv.so.1.124.0 to libdrm_etnaviv.so.1.125.0
  /usr/lib/libdrm_freedreno.so.1 changed symlink target from libdrm_freedreno.so.1.124.0 to libdrm_freedreno.so.1.125.0
  /usr/lib/libdrm_intel.so.1 changed symlink target from libdrm_intel.so.1.124.0 to libdrm_intel.so.1.125.0
  /usr/lib/libdrm_nouveau.so.2 changed symlink target from libdrm_nouveau.so.2.124.0 to libdrm_nouveau.so.2.125.0
  /usr/lib/libdrm_omap.so.1 changed symlink target from libdrm_omap.so.1.124.0 to libdrm_omap.so.1.125.0
  /usr/lib/libdrm_radeon.so.1 changed symlink target from libdrm_radeon.so.1.124.0 to libdrm_radeon.so.1.125.0
  /usr/lib/libdrm.so.2 changed symlink target from libdrm.so.2.124.0 to libdrm.so.2.125.0
  /usr/lib/libdrm_amdgpu.so.1.124.0 moved to /usr/lib/libdrm_amdgpu.so.1.125.0
  /usr/lib/libdrm_etnaviv.so.1.124.0 moved to /usr/lib/libdrm_etnaviv.so.1.125.0
  /usr/lib/libdrm_freedreno.so.1.124.0 moved to /usr/lib/libdrm_freedreno.so.1.125.0
  /usr/lib/libdrm_intel.so.1.124.0 moved to /usr/lib/libdrm_intel.so.1.125.0
  /usr/lib/libdrm_nouveau.so.2.124.0 moved to /usr/lib/libdrm_nouveau.so.2.125.0
  /usr/lib/libdrm_omap.so.1.124.0 moved to /usr/lib/libdrm_omap.so.1.125.0
  /usr/lib/libdrm_radeon.so.1.124.0 moved to /usr/lib/libdrm_radeon.so.1.125.0
  /usr/lib/libdrm.so.2.124.0 moved to /usr/lib/libdrm.so.2.125.0

--===============0044158201702595698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libdrm/libdrm-amdgpu: FILELIST: removed "/usr/lib/libdrm_amdgpu.so.1.124.0", added "/usr/lib/libdrm_amdgpu.so.1.125.0"
packages/core2-64-poky-linux/libdrm/libdrm-amdgpu: PKGSIZE changed from 62297 to 70282 (+13%)
packages/core2-64-poky-linux/libdrm/libdrm-etnaviv: FILELIST: removed "/usr/lib/libdrm_etnaviv.so.1.124.0", added "/usr/lib/libdrm_etnaviv.so.1.125.0"
packages/core2-64-poky-linux/libdrm/libdrm-freedreno: FILELIST: removed "/usr/lib/libdrm_freedreno.so.1.124.0", added "/usr/lib/libdrm_freedreno.so.1.125.0"
packages/core2-64-poky-linux/libdrm/libdrm-intel: FILELIST: removed "/usr/lib/libdrm_intel.so.1.124.0", added "/usr/lib/libdrm_intel.so.1.125.0"
packages/core2-64-poky-linux/libdrm/libdrm-nouveau: FILELIST: removed "/usr/lib/libdrm_nouveau.so.2.124.0", added "/usr/lib/libdrm_nouveau.so.2.125.0"
packages/core2-64-poky-linux/libdrm/libdrm-omap: FILELIST: removed "/usr/lib/libdrm_omap.so.1.124.0", added "/usr/lib/libdrm_omap.so.1.125.0"
packages/core2-64-poky-linux/libdrm/libdrm-radeon: FILELIST: removed "/usr/lib/libdrm_radeon.so.1.124.0", added "/usr/lib/libdrm_radeon.so.1.125.0"
packages/core2-64-poky-linux/libdrm/libdrm: FILELIST: removed "/usr/lib/libdrm.so.2.124.0", added "/usr/lib/libdrm.so.2.125.0"
Changes to packages/core2-64-poky-linux/libdrm (sysroot):
  /usr/lib/libdrm_amdgpu.so.1 changed symlink target from libdrm_amdgpu.so.1.124.0 to libdrm_amdgpu.so.1.125.0
  /usr/lib/libdrm_etnaviv.so.1 changed symlink target from libdrm_etnaviv.so.1.124.0 to libdrm_etnaviv.so.1.125.0
  /usr/lib/libdrm_freedreno.so.1 changed symlink target from libdrm_freedreno.so.1.124.0 to libdrm_freedreno.so.1.125.0
  /usr/lib/libdrm_intel.so.1 changed symlink target from libdrm_intel.so.1.124.0 to libdrm_intel.so.1.125.0
  /usr/lib/libdrm_nouveau.so.2 changed symlink target from libdrm_nouveau.so.2.124.0 to libdrm_nouveau.so.2.125.0
  /usr/lib/libdrm_omap.so.1 changed symlink target from libdrm_omap.so.1.124.0 to libdrm_omap.so.1.125.0
  /usr/lib/libdrm_radeon.so.1 changed symlink target from libdrm_radeon.so.1.124.0 to libdrm_radeon.so.1.125.0
  /usr/lib/libdrm.so.2 changed symlink target from libdrm.so.2.124.0 to libdrm.so.2.125.0
  /usr/lib/libdrm_amdgpu.so.1.124.0 moved to /usr/lib/libdrm_amdgpu.so.1.125.0
  /usr/lib/libdrm_etnaviv.so.1.124.0 moved to /usr/lib/libdrm_etnaviv.so.1.125.0
  /usr/lib/libdrm_freedreno.so.1.124.0 moved to /usr/lib/libdrm_freedreno.so.1.125.0
  /usr/lib/libdrm_intel.so.1.124.0 moved to /usr/lib/libdrm_intel.so.1.125.0
  /usr/lib/libdrm_nouveau.so.2.124.0 moved to /usr/lib/libdrm_nouveau.so.2.125.0
  /usr/lib/libdrm_omap.so.1.124.0 moved to /usr/lib/libdrm_omap.so.1.125.0
  /usr/lib/libdrm_radeon.so.1.124.0 moved to /usr/lib/libdrm_radeon.so.1.125.0
  /usr/lib/libdrm.so.2.124.0 moved to /usr/lib/libdrm.so.2.125.0

--===============0044158201702595698==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdrm-upgrade-2.4.124-2.4.125.patch"

RnJvbSA1YWFlM2Q4YzQ5MmY3MGZiZjczMzQ4N2ZhNGI0MDJlZTA5ZWI3YTY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMTE6MTA6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJkcm06IHVwZ3JhZGUgMi40LjEyNCAtPiAyLjQuMTI1CgotLS0KIC4uLi9kcm0ve2xpYmRybV8y
LjQuMTI0LmJiID0+IGxpYmRybV8yLjQuMTI1LmJifSAgICAgICAgICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy9kcm0ve2xpYmRybV8yLjQuMTI0LmJiID0+IGxpYmRybV8yLjQuMTI1
LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0vbGliZHJt
XzIuNC4xMjQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuMTI1LmJi
CnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9k
cm0vbGliZHJtXzIuNC4xMjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9kcm0v
bGliZHJtXzIuNC4xMjUuYmIKaW5kZXggNzhmMzFjY2I5NS4uYTI1NmY3MzE0NSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2RybS9saWJkcm1fMi40LjEyNC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvZHJtL2xpYmRybV8yLjQuMTI1LmJiCkBAIC0xMyw3ICsxMyw3IEBA
IERFUEVORFMgPSAibGlicHRocmVhZC1zdHVicyIKIFNSQ19VUkkgPSAiaHR0cDovL2RyaS5mcmVl
ZGVza3RvcC5vcmcvbGliZHJtLyR7QlB9LnRhci54eiBcCiAgICAgICAgICAgIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiYWMzNjI5M2Y2MWNhNGFhZmFmNGIxNmEyYTdhZmZmMzEyYWE0ZjVjMzdj
OWZiZDc5N2RlOWUzYzA4NjNjYTM3OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkNGJhZTkyNzk3
YTUwZjgxYTkzNTI0NzYyZTA0MTBhNDljZDg0Y2ZhMGY5OTc3OTViYzAxNzJhYzhmYjFkOTZhIgog
CiBpbmhlcml0IG1lc29uIHBrZ2NvbmZpZyBtYW5wYWdlcwogCi0tIAoyLjQ3LjEKCg==

--===============0044158201702595698==--

