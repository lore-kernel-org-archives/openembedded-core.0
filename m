Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCDAC05054
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.8658.1698848704600524775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FNSLNpSH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OXJZpIWQ;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.33, mailfrom: 0101018b8b460de2-0183e2f8-7fcb-4b57-be45-a5a9543d46e7-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848706;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=IEuV3A0It12Vrw5QkIy6dehtrVYa+qmSYoYCtZiaqFw=;
	b=FNSLNpSH5uO9twi8+SJ4aSfXj5PGYB5SIKebEWUiIrXcsxJclKNvnmsasel8ocMi
	TT5Ln9GxTZOEHQk06CEjuXGu+wJR34X2vQ4kLCanCTxWacIJOAj+SwIGH2FMdJfjV9I
	dWiER1+snmNv12zwew0aowPfV7RGm6Rce6/YKZ3Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848706;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=IEuV3A0It12Vrw5QkIy6dehtrVYa+qmSYoYCtZiaqFw=;
	b=OXJZpIWQtaKBmeUNHnFUGXJ32nRHoOQuobtHvsCsSFLbFzerzE4lA449P7WIfrh/
	gbixHP2JhFTJgjTAxSshlK7tNLy/PIvG/XZn7Syrho7wETEoaaqiMerUDoGAR2l5FDQ
	VnEa/wgEnqngUW/DVTz9+bvQIUaZzF+cwsj6FlgU=
Content-Type: multipart/mixed; boundary="===============4009352820331478939=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xserver-xorg: upgrading to 21.1.9 SUCCEEDED
Message-ID: <0101018b8b460de2-0183e2f8-7fcb-4b57-be45-a5a9543d46e7-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190021

--===============4009352820331478939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xserver-xorg* to *21.1.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xserver-xorg-upgrade-21.1.8-21.1.9.patch
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
From 148bc3310567dd6f677aa3bf85650e4aad895b63 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 13:29:10 +0000
Subject: [PATCH] xserver-xorg: upgrade 21.1.8 -> 21.1.9

---
 .../{xserver-xorg_21.1.8.bb => xserver-xorg_21.1.9.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.8.bb => xserver-xorg_21.1.9.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb
index 19db7ea434..43c06181e3 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
+SRC_URI[sha256sum] = "ff697be2011b4c4966b7806929e51b7a08e9d33800d505305d26d9ccde4b533a"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.39.2


--===============4009352820331478939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xserver-xorg: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg: SRC_URI changed from "https://www.x.org/releases//individual/xserver/xorg-server-21.1.8.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch" to "https://www.x.org/releases//individual/xserver/xorg-server-21.1.9.tar.xz file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch"
packages/core2-64-poky-linux/xserver-xorg: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xf86-video-modesetting: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xf86-video-modesetting: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dbg: PKGSIZE changed from 26806624 to 26807272 (+0%)
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dbg: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dev: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dev: PKGSIZE changed from 1154536 to 1154394 (-0%)
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-dev: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-doc: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-doc: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dbe: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-dri2: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-extmod: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-glx: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-record: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-extension-record: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-fbdev: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-fbdev: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-locale: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-locale: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-exa: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-exa: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libafb: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libcfb: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libint10: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libmfb: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libwfb: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf1bpp: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-libxf4bpp: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-module-xaa: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-multimedia-modules: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-sdl: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-sdl: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-src: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-src: PKGSIZE changed from 11884759 to 11885751 (+0%)
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-src: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-staticdev: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-staticdev: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-utils: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-utils: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xephyr: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xephyr: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xvfb: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xvfb: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xwayland: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg-xwayland: PV changed from "21.1.8" to "21.1.9"
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg: PKGV changed from 21.1.8 [default] to 21.1.9 [default]
packages/core2-64-poky-linux/xserver-xorg/xserver-xorg: PV changed from "21.1.8" to "21.1.9"

--===============4009352820331478939==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xserver-xorg-upgrade-21.1.8-21.1.9.patch"

RnJvbSAxNDhiYzMzMTA1NjdkZDZmNjc3YWEzYmY4NTY1MGU0YWFkODk1YjYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMzoyOToxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhz
ZXJ2ZXIteG9yZzogdXBncmFkZSAyMS4xLjggLT4gMjEuMS45CgotLS0KIC4uLi97eHNlcnZlci14
b3JnXzIxLjEuOC5iYiA9PiB4c2VydmVyLXhvcmdfMjEuMS45LmJifSAgICAgICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhzZXJ2ZXIve3hzZXJ2ZXIteG9yZ18yMS4xLjguYmIg
PT4geHNlcnZlci14b3JnXzIxLjEuOS5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjguYmIgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjkuYmIKc2ltaWxh
cml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNl
cnZlci94c2VydmVyLXhvcmdfMjEuMS44LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjkuYmIKaW5kZXggMTlkYjdlYTQzNC4u
NDNjMDYxODFlMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmcteHNlcnZl
ci94c2VydmVyLXhvcmdfMjEuMS44LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LXhzZXJ2ZXIveHNlcnZlci14b3JnXzIxLjEuOS5iYgpAQCAtMyw3ICszLDcgQEAgcmVxdWlyZSB4
c2VydmVyLXhvcmcuaW5jCiBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS14Zjg2cGNpQnVzLmMtdXNl
LUludGVsLWRkeC1vbmx5LWZvci1wcmUtZ2VuNC1oYXJkd2FyLnBhdGNoIFwKICAgICAgICAgICAg
ZmlsZTovLzAwMDEtQXZvaWQtZHVwbGljYXRlLWRlZmluaXRpb25zLW9mLUlPUG9ydEJhc2UucGF0
Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzhhYWRiNzM1NjUwYzgw
MjRlZTI1MjExYzE5MGJmOGFhZDg0NGM1ZjU5NjMyNzYxYWIxZWY0YzRkNWFlYjE1MiIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICJmZjY5N2JlMjAxMWI0YzQ5NjZiNzgwNjkyOWU1MWI3YTA4ZTlkMzM4
MDBkNTA1MzA1ZDI2ZDljY2RlNGI1MzNhIgogCiAjIFRoZXNlIGV4dGVuc2lvbnMgYXJlIG5vdyBp
bnRlZ3JhdGVkIGludG8gdGhlIHNlcnZlciwgc28gZGVjbGFyZSB0aGUgbWlncmF0aW9uCiAjIHBh
dGggZm9yIGluLXBsYWNlIHVwZ3JhZGVzLgotLSAKMi4zOS4yCgo=

--===============4009352820331478939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1843 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-5ce5edc9f9326a9590dbd03fadcdf3ba71a5e925"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5ce5edc9f9326a9590dbd03fadcdf3ba71a5e925"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 157 Local 61 Mirrors 0 Missed 96 Current 677 (38% match, 88% complete)
Removing 6 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 691 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 714 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 716 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libxrandr/1.5.3/temp/log.do_packagedata_setscene.2467691
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/vulkan-headers/1.3.261.1/temp/log.do_packagedata_setscene.2467689
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 829 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_package_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 830 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_package_setscene)
NOTE: Running task 1477 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_recipe_qa)
NOTE: Running task 1519 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_recipe_qa)
NOTE: Running task 1577 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_recipe_qa)
NOTE: Running task 1578 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_recipe_qa)
NOTE: Running task 1588 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.24.0.bb:do_recipe_qa)
NOTE: Running task 1630 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_recipe_qa)
NOTE: Running task 1711 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_recipe_qa)
NOTE: recipe encodings-1_1.0.7-r0: task do_recipe_qa: Started
NOTE: Running task 1730 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_recipe_qa)
NOTE: Running task 1731 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa)
NOTE: Running task 1732 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_recipe_qa)
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa: Started
NOTE: Running task 1805 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.24.0.bb:do_write_config)
NOTE: Running task 1817 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb:do_recipe_qa)
NOTE: recipe mtdev-1.1.6-r0: task do_recipe_qa: Started
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa: Started
NOTE: Running task 1841 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 1842 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_write_config)
NOTE: Running task 1878 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb:do_write_config)
NOTE: Running task 1888 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_recipe_qa)
NOTE: Running task 1889 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_recipe_qa)
NOTE: Running task 1890 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_recipe_qa)
NOTE: Running task 1892 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_recipe_qa)
NOTE: recipe libinput-1.24.0-r0: task do_recipe_qa: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_recipe_qa unihash changed to e3ff60d4da8884cea6cde43e09a1e0cc1b39e50e9697305019d0ab4104ec3610
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_package_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package_setscene: Started
NOTE: recipe font-util-1.4.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1925 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_fetch)
NOTE: recipe libinput-1.24.0-r0: task do_write_config: Started
NOTE: Running task 1926 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_fetch)
NOTE: recipe mtdev-1.1.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_recipe_qa: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_recipe_qa: Started
NOTE: Running task 1960 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_fetch)
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_recipe_qa: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_recipe_qa: Started
NOTE: recipe libinput-1.24.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2006 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_package_write_rpm)
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_write_config: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libinput-1.24.0-r0: task do_write_config: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_write_config: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2007 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_fetch)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_write_config: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_fetch: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_fetch: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Started
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_recipe_qa: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2008 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_unpack)
NOTE: Running task 2009 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.24.0.bb:do_fetch)
NOTE: Running task 2010 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_unpack)
NOTE: Running task 2011 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_unpack)
NOTE: Running task 2012 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_fetch)
NOTE: Running task 2013 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 2014 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_fetch)
NOTE: Running task 2015 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_fetch)
NOTE: Running task 2016 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 2017 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_fetch)
NOTE: Running task 2018 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running setscene task 832 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running task 2019 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb:do_fetch)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 2020 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_fetch)
NOTE: Running task 2021 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_fetch)
NOTE: Running task 2022 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_fetch)
NOTE: Running task 2023 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_fetch)
NOTE: Running setscene task 834 of 834 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_recipe_qa_setscene)
NOTE: recipe libevdev-1.13.1-r0: task do_fetch: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_unpack: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe font-util-1.4.1-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Started
NOTE: recipe libinput-1.24.0-r0: task do_fetch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 2024 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_unpack)
NOTE: Running task 2025 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.40-r0: task do_package_write_rpm: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_fetch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_fetch: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_fetch: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_fetch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 2026 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_unpack)
NOTE: Running task 2027 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_fetch: Succeeded
NOTE: Running task 2028 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_unpack)
NOTE: Running task 2029 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_fetch: Started
NOTE: Running task 2030 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_unpack)
NOTE: Running task 2031 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe encodings-1_1.0.7-r0: task do_unpack: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_fetch: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_fetch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2032 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_unpack)
NOTE: Running task 2033 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_patch)
NOTE: Running task 2034 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_unpack)
NOTE: Running task 2035 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_unpack)
NOTE: recipe mtdev-1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_fetch: Succeeded
NOTE: Running task 2036 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_collect_spdx_deps)
NOTE: Running task 2037 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_patch)
NOTE: Running task 2038 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb:do_unpack)
NOTE: Running task 2039 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.24.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 2040 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_collect_spdx_deps)
NOTE: Running task 2041 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.24.0.bb:do_unpack)
NOTE: Running task 2042 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_unpack)
NOTE: Running task 2043 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 2044 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_patch)
NOTE: Running task 2045 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_unpack: Started
NOTE: Setscene tasks completed
NOTE: recipe libevdev-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2076 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Started
NOTE: Running task 2078 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_unpack: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_patch: Started
NOTE: Running task 2086 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe encodings-1_1.0.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_unpack: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_unpack: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_unpack: Started
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_patch: Succeeded
NOTE: Running task 2089 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_patch)
NOTE: recipe rgb-1_1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2090 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_collect_spdx_deps)
NOTE: recipe encodings-1_1.0.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_unpack: Started
NOTE: Running task 2091 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_deploy_source_date_epoch)
NOTE: recipe mtdev-1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Started
NOTE: recipe libinput-1.24.0-r0: task do_unpack: Started
NOTE: recipe font-util-1.4.1-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.1-r0: task do_unpack: Succeeded
NOTE: Running task 2092 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_patch)
NOTE: Running task 2093 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_collect_spdx_deps)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Started
NOTE: recipe mtdev-1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 2094 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2095 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_patch)
NOTE: Running task 2096 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_patch)
NOTE: Running task 2097 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_collect_spdx_deps)
NOTE: recipe libxfont2-2.0.6-r0: task do_unpack: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_patch: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2098 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_patch)
NOTE: Running task 2099 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_patch)
NOTE: Running task 2100 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_patch)
NOTE: Running task 2101 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_patch)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2102 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_collect_spdx_deps)
NOTE: recipe encodings-1_1.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2103 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_patch: Succeeded
NOTE: Running task 2104 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe font-util-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_patch: Started
NOTE: recipe libevdev-1.13.1-r0: task do_patch: Succeeded
NOTE: Running task 2105 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_patch: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2106 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe rgb-1_1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2107 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_deploy_source_date_epoch unihash changed to b7a047e814cbcc5577c6ba4420afcdb1caa0f68e08f95c1481ac9218e2af81ef
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_patch: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_patch: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_patch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2108 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_configure)
NOTE: Running task 2111 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2115 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2116 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2117 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libevdev-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_packagedata: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2127 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_package_write_rpm)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe font-util-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 2128 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: Running task 2129 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe libxcvt-0.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_configure: Started
NOTE: recipe libinput-1.24.0-r0: task do_unpack: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2130 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.24.0.bb:do_patch)
NOTE: recipe libxcvt-0.1.2-r0: task do_unpack: Succeeded
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_unpack: Succeeded
NOTE: recipe mtdev-1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2131 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_patch)
NOTE: Running task 2132 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_collect_spdx_deps)
NOTE: Setscene tasks completed
NOTE: Running task 2133 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_configure)
NOTE: Running task 2134 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb:do_patch)
NOTE: Running task 2135 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2136 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_configure)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Started
NOTE: Running task 2137 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_configure)
NOTE: recipe libinput-1.24.0-r0: task do_patch: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_configure: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_patch: Succeeded
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2138 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_patch: Started
NOTE: Running task 2139 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_configure)
NOTE: recipe xkbcomp-1.4.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.24.0-r0: task do_patch: Succeeded
NOTE: Running task 2140 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.24.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfont2-2.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_configure: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_configure: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Started
NOTE: Running task 2141 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 2142 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_patch: Succeeded
NOTE: recipe libinput-1.24.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2143 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2144 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb:do_populate_lic)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_compile: Succeeded
NOTE: Running task 2145 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_populate_lic: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2146 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_configure)
NOTE: recipe libinput-1.24.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Started
NOTE: Running task 2147 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_populate_lic: Succeeded
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_install: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: Running task 2148 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2149 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package: Succeeded
NOTE: Running task 2150 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_packagedata)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_packagedata: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_configure: Succeeded
NOTE: Running task 2151 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 2152 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe encodings-1_1.0.7-r0: task do_compile: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2153 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_create_spdx)
NOTE: Running task 2154 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_compile: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_compile: Succeeded
NOTE: recipe xserver-xf86-config-0.1-r0: task do_create_spdx: Started
NOTE: Running task 2155 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_install)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_rpm: Started
NOTE: Running task 2156 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_install)
NOTE: recipe encodings-1_1.0.7-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Started
NOTE: recipe xserver-xf86-config-0.1-r0: task do_create_spdx: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_install: Succeeded
NOTE: Running task 2157 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_populate_sysroot)
NOTE: Running task 2158 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_package)
NOTE: recipe xserver-xf86-config-0.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_install: Succeeded
NOTE: Running task 2159 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_populate_sysroot)
NOTE: Running task 2160 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_package)
NOTE: recipe encodings-1_1.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_populate_sysroot unihash changed to 8d96b091ff707670c3da6e916d18bb0e3d7459c086f55c051db78b0d6c294393
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Started
NOTE: Setscene tasks completed
NOTE: Running task 2161 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2162 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_configure)
NOTE: recipe font-util-1.4.1-r0: task do_configure: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_package: Succeeded
NOTE: Running task 2163 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_packagedata)
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_package: Succeeded
NOTE: Running task 2164 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_packagedata)
NOTE: recipe encodings-1_1.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2165 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/encodings_1.0.7.bb:do_create_spdx)
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Started
NOTE: recipe encodings-1_1.0.7-r0: task do_create_spdx: Started
NOTE: recipe libxcvt-0.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe encodings-1_1.0.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 2166 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcvt_0.1.2.bb:do_create_spdx)
NOTE: Running task 2167 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_collect_spdx_deps)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Started
NOTE: recipe font-util-1.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe font-util-1.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2168 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_compile)
NOTE: recipe libxcvt-0.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 2169 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_compile)
NOTE: recipe rgb-1_1.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2170 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_install: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_install: Succeeded
NOTE: Running task 2171 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package)
NOTE: recipe rgb-1_1.1.0-r0: task do_package: Started
NOTE: recipe mtdev-1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2172 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_install: Started
NOTE: recipe mtdev-1.1.6-r0: task do_install: Succeeded
NOTE: Running task 2173 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_populate_sysroot)
NOTE: Running task 2174 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_package)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe mtdev-1.1.6-r0: task do_package: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2175 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Started
NOTE: recipe libevdev-1.13.1-r0: task do_configure: Succeeded
NOTE: Running task 2176 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_compile)
NOTE: recipe rgb-1_1.1.0-r0: task do_package: Succeeded
NOTE: Running task 2177 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_packagedata)
NOTE: recipe libevdev-1.13.1-r0: task do_compile: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_packagedata: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2178 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_create_spdx)
NOTE: Running task 2179 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/rgb_1.1.0.bb:do_package_write_rpm)
NOTE: recipe rgb-1_1.1.0-r0: task do_create_spdx: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe rgb-1_1.1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2180 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Started
NOTE: recipe font-util-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 2181 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_compile)
NOTE: recipe mtdev-1.1.6-r0: task do_package: Succeeded
NOTE: recipe rgb-1_1.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2182 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_packagedata)
NOTE: recipe font-util-1.4.1-r0: task do_compile: Started
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 2183 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_package)
NOTE: Running task 2184 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_populate_sysroot)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Started
NOTE: recipe libevdev-1.13.1-r0: task do_compile: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: Running task 2185 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_install)
NOTE: recipe mtdev-1.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2186 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/mtdev_1.1.6.bb:do_create_spdx)
NOTE: recipe libevdev-1.13.1-r0: task do_install: Started
NOTE: recipe mtdev-1.1.6-r0: task do_create_spdx: Started
NOTE: recipe font-util-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 2187 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_install)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2188 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.1-r0: task do_install: Started
NOTE: recipe mtdev-1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libevdev-1.13.1-r0: task do_install: Succeeded
NOTE: Running task 2189 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_populate_sysroot)
NOTE: Running task 2190 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_package)
NOTE: recipe font-util-1.4.1-r0: task do_install: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2191 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_configure)
NOTE: Running task 2192 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_populate_sysroot)
NOTE: Running task 2193 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_package)
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Started
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe libevdev-1.13.1-r0: task do_package: Started
NOTE: recipe font-util-1.4.1-r0: task do_package: Started
NOTE: recipe libevdev-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2194 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.24.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe font-util-1.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2195 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libinput-1.24.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2196 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_configure)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Started
NOTE: recipe libinput-1.24.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2197 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.24.0.bb:do_configure)
NOTE: recipe libinput-1.24.0-r0: task do_configure: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 2198 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_packagedata)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2199 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.2.bb:do_create_spdx)
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_create_spdx: Started
NOTE: recipe libevdev-1.13.1-r0: task do_package: Succeeded
NOTE: recipe libxkbfile-1_1.1.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2200 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_collect_spdx_deps)
NOTE: recipe font-util-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 2201 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_packagedata)
NOTE: Running task 2202 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_packagedata)
NOTE: recipe xkbcomp-1.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata: Started
NOTE: recipe font-util-1.4.1-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libevdev-1.13.1-r0: task do_packagedata: Succeeded
NOTE: recipe font-util-1.4.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2203 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libevdev/libevdev_1.13.1.bb:do_create_spdx)
NOTE: Running task 2204 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-font/font-util_1.4.1.bb:do_create_spdx)
NOTE: recipe libevdev-1.13.1-r0: task do_create_spdx: Started
NOTE: recipe font-util-1.4.1-r0: task do_create_spdx: Started
NOTE: recipe libevdev-1.13.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2205 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.24.0.bb:do_collect_spdx_deps)
NOTE: recipe font-util-1.4.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2206 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_collect_spdx_deps)
NOTE: recipe libinput-1.24.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libinput-1.24.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libinput-1.24.0-r0: task do_configure: Succeeded
NOTE: Running task 2207 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.24.0.bb:do_configure_ptest_base)
NOTE: recipe libinput-1.24.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libinput-1.24.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2208 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.24.0.bb:do_compile)
NOTE: recipe libinput-1.24.0-r0: task do_compile: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_configure: Succeeded
NOTE: Running task 2209 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_compile)
NOTE: recipe xkbcomp-1.4.6-r0: task do_compile: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2210 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_install)
NOTE: recipe xkbcomp-1.4.6-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_install: Succeeded
NOTE: Running task 2211 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_package)
NOTE: recipe libinput-1.24.0-r0: task do_compile: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_package: Started
NOTE: Running task 2212 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.24.0.bb:do_compile_ptest_base)
NOTE: recipe libinput-1.24.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libinput-1.24.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2213 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.24.0.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 2214 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libinput-1.24.0-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: recipe libinput-1.24.0-r0: task do_install: Succeeded
NOTE: Running task 2215 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 2216 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: Running task 2217 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.24.0.bb:do_install_ptest_base)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libinput-1.24.0-r0: task do_install_ptest_base: Started
NOTE: recipe libinput-1.24.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2218 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.24.0.bb:do_package)
NOTE: Running task 2219 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.24.0.bb:do_populate_sysroot)
NOTE: recipe libinput-1.24.0-r0: task do_populate_sysroot: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 2220 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_compile)
NOTE: recipe libinput-1.24.0-r0: task do_package: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_package: Succeeded
NOTE: Running task 2221 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_packagedata)
NOTE: recipe libinput-1.24.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkbcomp-1.4.6-r0: task do_packagedata: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2222 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_create_spdx)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 2223 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_install)
NOTE: Running task 2224 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xkbcomp_1.4.6.bb:do_package_write_rpm)
NOTE: recipe xkbcomp-1.4.6-r0: task do_create_spdx: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe xkbcomp-1.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libfontenc-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 2225 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 2226 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_package)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 2227 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2228 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkbcomp-1.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2229 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2230 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_configure)
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe libinput-1.24.0-r0: task do_package: Succeeded
NOTE: Running task 2231 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.24.0.bb:do_packagedata)
NOTE: recipe libinput-1.24.0-r0: task do_packagedata: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_package: Succeeded
NOTE: Running task 2232 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_packagedata)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libinput-1.24.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2233 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.24.0.bb:do_create_spdx)
NOTE: recipe libinput-1.24.0-r0: task do_create_spdx: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2234 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libfontenc_1.1.7.bb:do_create_spdx)
NOTE: recipe libfontenc-1_1.1.7-r0: task do_create_spdx: Started
NOTE: recipe libfontenc-1_1.1.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 2235 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_collect_spdx_deps)
NOTE: recipe libinput-1.24.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxfont2-2.0.6-r0: task do_configure: Succeeded
NOTE: Running task 2236 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_compile)
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_compile: Succeeded
NOTE: Running task 2237 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_install)
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_install: Succeeded
NOTE: Running task 2238 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_populate_sysroot)
NOTE: Running task 2239 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_package)
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2240 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2241 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb:do_configure)
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_configure: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_package: Succeeded
NOTE: Running task 2242 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_packagedata)
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 2243 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb:do_create_spdx)
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx: Started
NOTE: recipe libxfont2-2.0.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 2244 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb:do_collect_spdx_deps)
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_configure: Succeeded
NOTE: Running task 2245 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb:do_compile)
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_compile: Started
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_compile: Succeeded
NOTE: Running task 2246 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb:do_install)
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_install: Started
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_install: Succeeded
NOTE: Running task 2247 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb:do_package)
NOTE: Running task 2248 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb:do_populate_sysroot)
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_populate_sysroot: Started
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_package: Started
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2249 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2250 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_configure)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_configure: Started
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_package: Succeeded
NOTE: Running task 2251 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb:do_packagedata)
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_packagedata: Started
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_packagedata: Succeeded
NOTE: Running task 2252 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb:do_create_spdx)
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_create_spdx: Started
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 2253 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_collect_spdx_deps)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2254 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_compile)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_compile: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2255 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_install)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_install: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_install: Succeeded
NOTE: Running task 2256 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_package)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_package: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_package: Succeeded
NOTE: Running task 2257 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_packagedata)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_packagedata: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2258 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_create_spdx)
NOTE: Running task 2259 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-driver/xf86-input-libinput_1.4.0.bb:do_package_write_rpm)
NOTE: Running task 2260 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb:do_package_write_rpm)
NOTE: Running task 2261 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb:do_package_qa)
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_create_spdx: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_package_write_rpm: Started
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_package_qa: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2262 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb:do_create_runtime_spdx)
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_create_runtime_spdx: Started
NOTE: recipe xf86-input-libinput-2_1.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_package_qa: Succeeded
NOTE: recipe xserver-xorg-2_21.1.9-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2263 of 2263 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.9.bb:do_build)
NOTE: Tasks Summary: Attempted 2263 tasks of which 2037 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: libxrandr-1_1.5.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxrandr-src went backwards which would break package feeds (from 1:1.5.4-r0 to 1:1.5.3-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.261.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.268.0-r0 to 0:1.3.261.1-r0) [version-going-backwards]
ERROR: libxrandr-1_1.5.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxrandr-dbg went backwards which would break package feeds (from 1:1.5.4-r0 to 1:1.5.3-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.261.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.268.0-r0 to 0:1.3.261.1-r0) [version-going-backwards]
ERROR: libxrandr-1_1.5.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxrandr-staticdev went backwards which would break package feeds (from 1:1.5.4-r0 to 1:1.5.3-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.261.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.268.0-r0 to 0:1.3.261.1-r0) [version-going-backwards]
ERROR: libxrandr-1_1.5.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxrandr-dev went backwards which would break package feeds (from 1:1.5.4-r0 to 1:1.5.3-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.261.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.268.0-r0 to 0:1.3.261.1-r0) [version-going-backwards]
ERROR: libxrandr-1_1.5.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxrandr-doc went backwards which would break package feeds (from 1:1.5.4-r0 to 1:1.5.3-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.261.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.268.0-r0 to 0:1.3.261.1-r0) [version-going-backwards]
ERROR: libxrandr-1_1.5.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxrandr-locale went backwards which would break package feeds (from 1:1.5.4-r0 to 1:1.5.3-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.261.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.268.0-r0 to 0:1.3.261.1-r0) [version-going-backwards]
ERROR: libxrandr-1_1.5.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxrandr went backwards which would break package feeds (from 1:1.5.4-r0 to 1:1.5.3-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.261.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.268.0-r0 to 0:1.3.261.1-r0) [version-going-backwards]
ERROR: libxrandr-1_1.5.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: vulkan-headers-1.3.261.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4009352820331478939==--

