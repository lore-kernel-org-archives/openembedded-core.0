Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE5BC36001
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:39 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.7179.1740828338049428871
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=eC+a+3za;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Z63iyAT6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019551746593-ebe660e2-27fe-448d-ab99-a9e5981412d2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z7Mrd9qoWNyb0ZmdWZOlRkB0V2IQ/OGJuhXpISuwW/o=;
	b=eC+a+3zaXI6YC8xD0LqF9K/D5F/1AQ33O5ODeL0/BOWw0XFkg+gea0WX3zrd5N1L
	zxwBRqDPPjtU4dh9tjrLqIhSjKIuuV9FYlngiwpF+KY0IKaI/3NpbR4RXK+sBGgu+n5
	7Way0hLgSozky07IV5xVlHQitXPtoR/E53m6SI7s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z7Mrd9qoWNyb0ZmdWZOlRkB0V2IQ/OGJuhXpISuwW/o=;
	b=Z63iyAT6//NeSYUiIJxqCveziD+itTp2gjsk80iaRnc9nQUj8haF5Qacz/t1KKmw
	KnUtiqGyCK6OwavqhRSpEG9PEpTCcrTSqDFb7NsIUhNfbOMfjh7a7c6ZZquakNkyd/C
	s80IjhGUETFCH/LyxDtQSmp/1WQ8kLcZtDAUp8Yo=
Content-Type: multipart/mixed; boundary="===============2801910872000356110=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xserver-xorg: upgrading to 21.1.16 SUCCEEDED
Message-ID: <0101019551746593-ebe660e2-27fe-448d-ab99-a9e5981412d2-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212163

--===============2801910872000356110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xserver-xorg* to *21.1.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xserver-xorg-upgrade-21.1.15-21.1.16.patch
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
From e28ec9cc7101e16459d2334bfcb6b5f0bcaf8e83 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 10:36:34 +0000
Subject: [PATCH] xserver-xorg: upgrade 21.1.15 -> 21.1.16

---
 .../0001-Avoid-duplicate-definitions-of-IOPortBase.patch        | 2 +-
 ...1-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch | 2 +-
 .../{xserver-xorg_21.1.15.bb => xserver-xorg_21.1.16.bb}        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.15.bb => xserver-xorg_21.1.16.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
index e9cbc9b4da..323688024c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
@@ -1,4 +1,4 @@
-From cedc797e1a0850039a25b7e387b342e54fffcc97 Mon Sep 17 00:00:00 2001
+From 952e00af8ec4e84e7b09819dbc377e0a6976ae12 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 17 Aug 2020 10:50:51 -0700
 Subject: [PATCH] Avoid duplicate definitions of IOPortBase
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
index d1516c2f52..df7673a061 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch
@@ -1,4 +1,4 @@
-From ad8967de36e6e2a185b71ce1d701448cda4ef3e2 Mon Sep 17 00:00:00 2001
+From eaabf1f18d80814f76d8251046e846715168072d Mon Sep 17 00:00:00 2001
 From: California Sullivan <california.l.sullivan@intel.com>
 Date: Fri, 16 Mar 2018 17:23:11 -0700
 Subject: [PATCH] xf86pciBus.c: use Intel ddx only for pre-gen4 hardware
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
index 080e6d220e..38c81f2372 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "841c82901282902725762df03adbbcd68153d4cdfb0d61df0cfd73ad677ae089"
+SRC_URI[sha256sum] = "b14a116d2d805debc5b5b2aac505a279e69b217dae2fae2dfcb62400471a9970"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.44.1


--===============2801910872000356110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xserver-xorg: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg: SRC_URI changed from "https://www.x.org/releases//individual/xserver/xorg-server-21.1.15.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch" to "https://www.x.org/releases//individual/xserver/xorg-server-21.1.16.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch"
packages/core2-64-poky-linux/xserver-xorg: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xf86-video-modesetting: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xf86-video-modesetting: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dbg: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGSIZE changed from 18229048 to 18239928 (+0%)
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dev: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dev: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-doc: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-doc: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-record: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-record: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-fbdev: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-fbdev: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-locale: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-locale: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-exa: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-exa: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-sdl: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-sdl: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-src: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-src: PKGSIZE changed from 11851221 to 11853123 (+0%)
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-src: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-staticdev: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-staticdev: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-utils: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-utils: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xephyr: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xephyr: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xvfb: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xvfb: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xwayland: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xwayland: PKGV changed from 21.1.15 [default] to 21.1.16 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg: PV changed from "21.1.15" to "21.1.16"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg: PKGSIZE changed from 2794562 to 2798658 (+0%)
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg: PKGV changed from 21.1.15 [default] to 21.1.16 [default]

--===============2801910872000356110==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xserver-xorg-upgrade-21.1.15-21.1.16.patch"

RnJvbSBlMjhlYzljYzcxMDFlMTY0NTlkMjMzNGJmY2I2YjVmMGJjYWY4ZTgzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAxMDozNjozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhz
ZXJ2ZXIteG9yZzogdXBncmFkZSAyMS4xLjE1IC0+IDIxLjEuMTYKCi0tLQogLi4uLzAwMDEtQXZv
aWQtZHVwbGljYXRlLWRlZmluaXRpb25zLW9mLUlPUG9ydEJhc2UucGF0Y2ggICAgICAgIHwgMiAr
LQogLi4uMS14Zjg2cGNpQnVzLmMtdXNlLUludGVsLWRkeC1vbmx5LWZvci1wcmUtZ2VuNC1oYXJk
d2FyLnBhdGNoIHwgMiArLQogLi4uL3t4c2VydmVyLXhvcmdfMjEuMS4xNS5iYiA9PiB4c2VydmVy
LXhvcmdfMjEuMS4xNi5iYn0gICAgICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hv
cmcteHNlcnZlci97eHNlcnZlci14b3JnXzIxLjEuMTUuYmIgPT4geHNlcnZlci14b3JnXzIxLjEu
MTYuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNl
cnZlci94c2VydmVyLXhvcmcvMDAwMS1Bdm9pZC1kdXBsaWNhdGUtZGVmaW5pdGlvbnMtb2YtSU9Q
b3J0QmFzZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZl
ci14b3JnLzAwMDEtQXZvaWQtZHVwbGljYXRlLWRlZmluaXRpb25zLW9mLUlPUG9ydEJhc2UucGF0
Y2gKaW5kZXggZTljYmM5YjRkYS4uMzIzNjg4MDI0YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmcvMDAwMS1Bdm9pZC1kdXBsaWNhdGUt
ZGVmaW5pdGlvbnMtb2YtSU9Qb3J0QmFzZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZy8wMDAxLUF2b2lkLWR1cGxpY2F0ZS1kZWZpbml0
aW9ucy1vZi1JT1BvcnRCYXNlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjZWRjNzk3ZTFh
MDg1MDAzOWEyNWI3ZTM4N2IzNDJlNTRmZmZjYzk3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSA5NTJlMDBhZjhlYzRlODRlN2IwOTgxOWRiYzM3N2UwYTY5NzZhZTEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6
IE1vbiwgMTcgQXVnIDIwMjAgMTA6NTA6NTEgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gQXZvaWQg
ZHVwbGljYXRlIGRlZmluaXRpb25zIG9mIElPUG9ydEJhc2UKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnLzAwMDEteGY4NnBjaUJ1cy5j
LXVzZS1JbnRlbC1kZHgtb25seS1mb3ItcHJlLWdlbjQtaGFyZHdhci5wYXRjaCBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnLzAwMDEteGY4NnBjaUJ1cy5j
LXVzZS1JbnRlbC1kZHgtb25seS1mb3ItcHJlLWdlbjQtaGFyZHdhci5wYXRjaAppbmRleCBkMTUx
NmMyZjUyLi5kZjc2NzNhMDYxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy14c2VydmVyL3hzZXJ2ZXIteG9yZy8wMDAxLXhmODZwY2lCdXMuYy11c2UtSW50ZWwtZGR4LW9u
bHktZm9yLXByZS1nZW40LWhhcmR3YXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3hvcmcteHNlcnZlci94c2VydmVyLXhvcmcvMDAwMS14Zjg2cGNpQnVzLmMtdXNlLUludGVsLWRk
eC1vbmx5LWZvci1wcmUtZ2VuNC1oYXJkd2FyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBh
ZDg5NjdkZTM2ZTZlMmExODViNzFjZTFkNzAxNDQ4Y2RhNGVmM2UyIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBlYWFiZjFmMThkODA4MTRmNzZkODI1MTA0NmU4NDY3MTUxNjgwNzJkIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2FsaWZvcm5pYSBTdWxsaXZhbiA8Y2FsaWZv
cm5pYS5sLnN1bGxpdmFuQGludGVsLmNvbT4KIERhdGU6IEZyaSwgMTYgTWFyIDIwMTggMTc6MjM6
MTEgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0geGY4NnBjaUJ1cy5jOiB1c2UgSW50ZWwgZGR4IG9u
bHkgZm9yIHByZS1nZW40IGhhcmR3YXJlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjE1LmJiIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmdfMjEuMS4xNi5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hz
ZXJ2ZXIteG9yZ18yMS4xLjE1LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjE2LmJiCmluZGV4IDA4MGU2ZDIyMGUuLjM4Yzgx
ZjIzNzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIveHNl
cnZlci14b3JnXzIxLjEuMTUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNl
cnZlci94c2VydmVyLXhvcmdfMjEuMS4xNi5iYgpAQCAtMyw3ICszLDcgQEAgcmVxdWlyZSB4c2Vy
dmVyLXhvcmcuaW5jCiBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS14Zjg2cGNpQnVzLmMtdXNlLUlu
dGVsLWRkeC1vbmx5LWZvci1wcmUtZ2VuNC1oYXJkd2FyLnBhdGNoIFwKICAgICAgICAgICAgZmls
ZTovLzAwMDEtQXZvaWQtZHVwbGljYXRlLWRlZmluaXRpb25zLW9mLUlPUG9ydEJhc2UucGF0Y2gg
XAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODQxYzgyOTAxMjgyOTAyNzI1
NzYyZGYwM2FkYmJjZDY4MTUzZDRjZGZiMGQ2MWRmMGNmZDczYWQ2NzdhZTA4OSIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICJiMTRhMTE2ZDJkODA1ZGViYzViNWIyYWFjNTA1YTI3OWU2OWIyMTdkYWUy
ZmFlMmRmY2I2MjQwMDQ3MWE5OTcwIgogCiAjIFRoZXNlIGV4dGVuc2lvbnMgYXJlIG5vdyBpbnRl
Z3JhdGVkIGludG8gdGhlIHNlcnZlciwgc28gZGVjbGFyZSB0aGUgbWlncmF0aW9uCiAjIHBhdGgg
Zm9yIGluLXBsYWNlIHVwZ3JhZGVzLgotLSAKMi40NC4xCgo=

--===============2801910872000356110==--

