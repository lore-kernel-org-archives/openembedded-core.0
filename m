Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25C8C88E45
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 06:00:32 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7481.1789020028707574540
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 23:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VIelsyOb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=wTyf2DnV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a089e73be7-49c46523-1ef5-4937-b706-2a621f0e86a7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789020028;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Jcy0SbQSw+Ubpa4i2WsPlx8Xx+/khPcwLGK9ybh5rNc=;
	b=VIelsyOb/AG06u+ne39UYdtZb0iQ1AZdhH5UK6s8fEizoJWat578shRlWC0m1eFf
	1bBOrrrUaXXw0E5TSnl98f8M2mTZcEewtcR6hPaZLz46fNWZ7WwYgHhMkLgPoTkOxBP
	g++MrsCrnoIeyNUWTvHhBAPT6S0Meo7D4Tpy4tsY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789020028;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Jcy0SbQSw+Ubpa4i2WsPlx8Xx+/khPcwLGK9ybh5rNc=;
	b=wTyf2DnVcQqgKRP0gHDlqQlZQUWYFA2DX2kKFkY3mUEOpMed8r0c6IJeC83ZwB79
	UK10DOIE5CxlMfV5iFtyEemwugS0dB+jRahmzUA56X2U2DrAlvsHacpwgtO/U2FJfrI
	qbFBS/HMcGn+c1PVsbL4Z+oo3J9aIfB3M2gC4LWU=
Content-Type: multipart/mixed; boundary="===============1487197996129348314=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] orc: upgrading to 0.4.44 SUCCEEDED
Message-ID: <010101a089e73be7-49c46523-1ef5-4937-b706-2a621f0e86a7-000000@us-west-2.amazonses.com>
Date: Thu, 10 Sep 2026 06:00:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.10-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 06:00:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245534

--===============1487197996129348314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *orc* to *0.4.44* has Succeeded.

Next steps:
    - apply the patch: git am 0001-orc-upgrade-0.4.43-0.4.44.patch
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
From 8a1f3dbffbce865b28fa1cd257fc0d320bb822d5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Sep 2026 05:35:19 +0000
Subject: [PATCH] orc: upgrade 0.4.43 -> 0.4.44

---
 meta/recipes-devtools/orc/{orc_0.4.43.bb => orc_0.4.44.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/orc/{orc_0.4.43.bb => orc_0.4.44.bb} (95%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.43.bb b/meta/recipes-devtools/orc/orc_0.4.44.bb
similarity index 95%
rename from meta/recipes-devtools/orc/orc_0.4.43.bb
rename to meta/recipes-devtools/orc/orc_0.4.44.bb
index db7f5023b3..98e2291532 100644
--- a/meta/recipes-devtools/orc/orc_0.4.43.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.44.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause AND BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[sha256sum] = "82394e20e5c4dffe8b45ea8525c62dd4e3e8be7f253ac11c19297ba7ea5473e0"
+SRC_URI[sha256sum] = "4aeb97aea2b58224029dc2b23d7d064cfa990cb4fb8c4da440bcbe9c95bc5d2d"
 
 inherit meson pkgconfig
 
-- 
2.47.1


--===============1487197996129348314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/orc/liborc-0.4: FILELIST: removed "/usr/lib/liborc-0.4.so.0.43.0", added "/usr/lib/liborc-0.4.so.0.44.0"
packages/x86-64-v3-poky-linux/orc/liborc-test-0.4: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.43.0", added "/usr/lib/liborc-test-0.4.so.0.44.0"
Changes to packages/x86-64-v3-poky-linux/orc (sysroot):
  /usr/lib/liborc-0.4.so.0 changed symlink target from liborc-0.4.so.0.43.0 to liborc-0.4.so.0.44.0
  /usr/lib/liborc-test-0.4.so.0 changed symlink target from liborc-test-0.4.so.0.43.0 to liborc-test-0.4.so.0.44.0
  /usr/lib/liborc-0.4.so.0.43.0 moved to /usr/lib/liborc-0.4.so.0.44.0
  /usr/lib/liborc-test-0.4.so.0.43.0 moved to /usr/lib/liborc-test-0.4.so.0.44.0

--===============1487197996129348314==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-orc-upgrade-0.4.43-0.4.44.patch"

RnJvbSA4YTFmM2RiZmZiY2U4NjViMjhmYTFjZDI1N2ZjMGQzMjBiYjgyMmQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgU2VwIDIwMjYgMDU6MzU6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
cmM6IHVwZ3JhZGUgMC40LjQzIC0+IDAuNC40NAoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
b3JjL3tvcmNfMC40LjQzLmJiID0+IG9yY18wLjQuNDQuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL29yYy97b3JjXzAuNC40My5iYiA9PiBvcmNfMC40LjQ0LmJifSAoOTUlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9vcmMvb3JjXzAuNC40My5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9vcmMvb3JjXzAuNC40NC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3JjL29yY18wLjQuNDMuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9vcmMvb3JjXzAuNC40NC5iYgppbmRleCBkYjdmNTAyM2Iz
Li45OGUyMjkxNTMyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3JjL29yY18w
LjQuNDMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL29yYy9vcmNfMC40LjQ0LmJiCkBA
IC01LDcgKzUsNyBAQCBMSUNFTlNFID0gIkJTRC0yLUNsYXVzZSBBTkQgQlNELTMtQ2xhdXNlIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MTQwMGJkOWQwOWU4YWY1NmI5
ZWM5ODJiM2Q4NTc5N2UiCiAKIFNSQ19VUkkgPSAiaHR0cDovL2dzdHJlYW1lci5mcmVlZGVza3Rv
cC5vcmcvc3JjL29yYy9vcmMtJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjgy
Mzk0ZTIwZTVjNGRmZmU4YjQ1ZWE4NTI1YzYyZGQ0ZTNlOGJlN2YyNTNhYzExYzE5Mjk3YmE3ZWE1
NDczZTAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNGFlYjk3YWVhMmI1ODIyNDAyOWRjMmIyM2Q3
ZDA2NGNmYTk5MGNiNGZiOGM0ZGE0NDBiY2JlOWM5NWJjNWQyZCIKIAogaW5oZXJpdCBtZXNvbiBw
a2djb25maWcKIAotLSAKMi40Ny4xCgo=

--===============1487197996129348314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/orc: PV changed from "0.4.43" to "0.4.44"
packages/x86-64-v3-poky-linux/orc: SRC_URI changed from "http://gstreamer.freedesktop.org/src/orc/orc-0.4.43.tar.xz" to "http://gstreamer.freedesktop.org/src/orc/orc-0.4.44.tar.xz"
packages/x86-64-v3-poky-linux/orc: PKGV changed from 0.4.43 [default] to 0.4.44 [default]
packages/x86-64-v3-poky-linux/orc/liborc-0.4: FILELIST: removed "/usr/lib/liborc-0.4.so.0.43.0", added "/usr/lib/liborc-0.4.so.0.44.0"
packages/x86-64-v3-poky-linux/orc/liborc-0.4: PV changed from "0.4.43" to "0.4.44"
packages/x86-64-v3-poky-linux/orc/liborc-0.4: FILES: removed "/usr/lib/liborc-0.4.so.0.43.0", added "/usr/lib/liborc-0.4.so.0.44.0"
packages/x86-64-v3-poky-linux/orc/liborc-0.4: PKGV changed from 0.4.43 [default] to 0.4.44 [default]
packages/x86-64-v3-poky-linux/orc/liborc-test-0.4: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.43.0", added "/usr/lib/liborc-test-0.4.so.0.44.0"
packages/x86-64-v3-poky-linux/orc/liborc-test-0.4: PV changed from "0.4.43" to "0.4.44"
packages/x86-64-v3-poky-linux/orc/liborc-test-0.4: FILES: removed "/usr/lib/liborc-test-0.4.so.0.43.0", added "/usr/lib/liborc-test-0.4.so.0.44.0"
packages/x86-64-v3-poky-linux/orc/liborc-test-0.4: PKGV changed from 0.4.43 [default] to 0.4.44 [default]
packages/x86-64-v3-poky-linux/orc/orc-dbg: FILELIST: removed "/usr/lib/.debug/liborc-test-0.4.so.0.43.0 /usr/lib/.debug/liborc-0.4.so.0.43.0", added "/usr/lib/.debug/liborc-test-0.4.so.0.44.0 /usr/lib/.debug/liborc-0.4.so.0.44.0"
packages/x86-64-v3-poky-linux/orc/orc-dbg: PV changed from "0.4.43" to "0.4.44"
packages/x86-64-v3-poky-linux/orc/orc-dbg: PKGSIZE changed from 3914632 to 3914384 (-0%)
packages/x86-64-v3-poky-linux/orc/orc-dbg: PKGV changed from 0.4.43 [default] to 0.4.44 [default]
packages/x86-64-v3-poky-linux/orc/orc-dev: PV changed from "0.4.43" to "0.4.44"
packages/x86-64-v3-poky-linux/orc/orc-dev: PKGV changed from 0.4.43 [default] to 0.4.44 [default]
packages/x86-64-v3-poky-linux/orc/orc-doc: PV changed from "0.4.43" to "0.4.44"
packages/x86-64-v3-poky-linux/orc/orc-doc: PKGV changed from 0.4.43 [default] to 0.4.44 [default]
packages/x86-64-v3-poky-linux/orc/orc-examples: PV changed from "0.4.43" to "0.4.44"
packages/x86-64-v3-poky-linux/orc/orc-examples: PKGV changed from 0.4.43 [default] to 0.4.44 [default]
packages/x86-64-v3-poky-linux/orc/orc-locale: PV changed from "0.4.43" to "0.4.44"
packages/x86-64-v3-poky-linux/orc/orc-locale: PKGV changed from 0.4.43 [default] to 0.4.44 [default]
packages/x86-64-v3-poky-linux/orc/orc-src: FILELIST: directory renamed /usr/src/debug/orc/0.4.43/orc/riscv -> /usr/src/debug/orc/0.4.44/orc/riscv, directory renamed /usr/src/debug/orc/0.4.43/orc/avx512 -> /usr/src/debug/orc/0.4.44/orc/avx512, directory renamed /usr/src/debug/orc/0.4.43/orc -> /usr/src/debug/orc/0.4.44/orc, directory renamed /usr/src/debug/orc/0.4.43/orc-test -> /usr/src/debug/orc/0.4.44/orc-test, directory renamed /usr/src/debug/orc/0.4.43/orc/loongarch -> /usr/src/debug/orc/0.4.44/orc/loongarch, directory renamed /usr/src/debug/orc/0.4.43/tools -> /usr/src/debug/orc/0.4.44/tools
packages/x86-64-v3-poky-linux/orc/orc-src: PV changed from "0.4.43" to "0.4.44"
packages/x86-64-v3-poky-linux/orc/orc-src: PKGSIZE changed from 2991526 to 2991436 (-0%)
packages/x86-64-v3-poky-linux/orc/orc-src: PKGV changed from 0.4.43 [default] to 0.4.44 [default]
packages/x86-64-v3-poky-linux/orc/orc-staticdev: PV changed from "0.4.43" to "0.4.44"
packages/x86-64-v3-poky-linux/orc/orc-staticdev: PKGV changed from 0.4.43 [default] to 0.4.44 [default]
packages/x86-64-v3-poky-linux/orc/orc: PV changed from "0.4.43" to "0.4.44"
packages/x86-64-v3-poky-linux/orc/orc: PKGV changed from 0.4.43 [default] to 0.4.44 [default]
Changes to packages/x86-64-v3-poky-linux/orc (sysroot):
  /usr/lib/liborc-0.4.so.0 changed symlink target from liborc-0.4.so.0.43.0 to liborc-0.4.so.0.44.0
  /usr/lib/liborc-test-0.4.so.0 changed symlink target from liborc-test-0.4.so.0.43.0 to liborc-test-0.4.so.0.44.0
  /usr/lib/liborc-0.4.so.0.43.0 moved to /usr/lib/liborc-0.4.so.0.44.0
  /usr/lib/liborc-test-0.4.so.0.43.0 moved to /usr/lib/liborc-test-0.4.so.0.44.0

--===============1487197996129348314==--

