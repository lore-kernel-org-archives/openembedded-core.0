Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF31C5DF64
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 05:55:59 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12997.1786600554327421333
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 22:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TiVMGf3g;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=e7asHMvl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019ff9b0fc09-cf4df431-eb47-4fff-9e0a-c3321eddd462-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786600553;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=IP/iVWR1aPd4zOeBo8CvSUYD+ADt8MSRLshPkBScyVs=;
	b=TiVMGf3gbUFdYOaUtS/3IuNseMwEQvRbhLXohUhEu3ggblwBGCPzCebddOLLPv23
	8QRzTqAkTKMof74DCPA2tKLED72WhxmCltD1rKx3HNv35aFtFb9alpHPkbE95iReLkc
	oiCkeBaDqkrI2r3MMi8XohynwioPouLFBcp7URqk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786600553;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=IP/iVWR1aPd4zOeBo8CvSUYD+ADt8MSRLshPkBScyVs=;
	b=e7asHMvlVQBTvv5zdvI7lgl8Qi7QY7rhSP/M/CuhLJHubJhEm7RcMTXv1yk3AL/3
	DHcebBA0KbQu4FAGCAfIeSORcVYNS2MDh8nKlXoAPUJ+M/c3HlfHLvYSn+MGsJTL9pr
	AXYaiR76bouLx1ngZVSczxhfQ6w2tBKU5BiGYGK4=
Content-Type: multipart/mixed; boundary="===============6682479375877673392=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 14.3.1 SUCCEEDED
Message-ID: <0101019ff9b0fc09-cf4df431-eb47-4fff-9e0a-c3321eddd462-000000@us-west-2.amazonses.com>
Date: Thu, 13 Aug 2026 05:55:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.13-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 05:55:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243328

--===============6682479375877673392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *harfbuzz* to *14.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-14.3.0-14.3.1.patch
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
From d52208fbcfc55cfadc9db69bcb5eefcbd053b9c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 13 Aug 2026 05:38:46 +0000
Subject: [PATCH] harfbuzz: upgrade 14.3.0 -> 14.3.1

Source: NEWS

Overview of changes leading to 14.3.1
Thursday, August 13, 2026
=====================================
- Various fuzzing and build fixes.
- Various subsetting fixes.
- Fix AAT insertion at the end of the text.
- Fix various rendering bugs in the experimental GPU library.
- WASM shaper code can now read the user features.
---
 .../harfbuzz/{harfbuzz_14.3.0.bb => harfbuzz_14.3.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_14.3.0.bb => harfbuzz_14.3.1.bb} (96%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_14.3.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_14.3.1.bb
similarity index 96%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_14.3.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_14.3.1.bb
index 6e4e9b7b85..4f0d5d3ec2 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_14.3.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_14.3.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "16070d77cfc4ba1f1e7327e83bf9b3f55898081cabdb94e56a33e04fc8874eae"
+SRC_URI[sha256sum] = "9dae9538aae2ffdf70cec31f2c27bf68e2aaeeae3112688467697d5faf6194f7"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
 
-- 
2.47.1


--===============6682479375877673392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "14.3.0" to "14.3.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 14.3.0 [default] to 14.3.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILES: removed "/usr/lib/libharfbuzz-cairo.so.0.61430.0", added "/usr/lib/libharfbuzz-cairo.so.0.61431.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61430.0", added "/usr/lib/libharfbuzz-cairo.so.0.61431.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: PV changed from "14.3.0" to "14.3.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: PKGV changed from 14.3.0 [default] to 14.3.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz-cairo.so.0.61430.0 /usr/lib/.debug/libharfbuzz.so.0.61430.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61430.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61430.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61430.0", added "/usr/lib/.debug/libharfbuzz.so.0.61431.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61431.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61431.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61431.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61431.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "14.3.0" to "14.3.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 91844560 to 91939040 (+0%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 14.3.0 [default] to 14.3.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "14.3.0" to "14.3.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 14.3.0 [default] to 14.3.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "14.3.0" to "14.3.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 14.3.0 [default] to 14.3.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILES: removed "/usr/lib/libharfbuzz-gobject.so.0.61430.0", added "/usr/lib/libharfbuzz-gobject.so.0.61431.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61430.0", added "/usr/lib/libharfbuzz-gobject.so.0.61431.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: PV changed from "14.3.0" to "14.3.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: PKGV changed from 14.3.0 [default] to 14.3.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILES: removed "/usr/lib/libharfbuzz-icu.so.0.61430.0", added "/usr/lib/libharfbuzz-icu.so.0.61431.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61430.0", added "/usr/lib/libharfbuzz-icu.so.0.61431.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "14.3.0" to "14.3.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 14.3.0 [default] to 14.3.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "14.3.0" to "14.3.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 14.3.0 [default] to 14.3.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: FILELIST: directory renamed /usr/src/debug/harfbuzz/14.3.0/src/OT/Color/CPAL -> /usr/src/debug/harfbuzz/14.3.1/src/OT/Color/CPAL, directory renamed /usr/src/debug/harfbuzz/14.3.0/src/OT/Layout/GPOS -> /usr/src/debug/harfbuzz/14.3.1/src/OT/Layout/GPOS, directory renamed /usr/src/debug/harfbuzz/14.3.0/src/OT/Layout/Common -> /usr/src/debug/harfbuzz/14.3.1/src/OT/Layout/Common, directory renamed /usr/src/debug/harfbuzz/14.3.0/src/OT/Color/COLR -> /usr/src/debug/harfbuzz/14.3.1/src/OT/Color/COLR, directory renamed /usr/src/debug/harfbuzz/14.3.0/src/OT/glyf -> /usr/src/debug/harfbuzz/14.3.1/src/OT/glyf, directory renamed /usr/src/debug/harfbuzz/14.3.0/src/OT/name -> /usr/src/debug/harfbuzz/14.3.1/src/OT/name, directory renamed /usr/src/debug/harfbuzz/14.3.0/src/OT/Color/CBDT -> /usr/src/debug/harfbuzz/14.3.1/src/OT/Color/CBDT, directory renamed /usr/src/debug/harfbuzz/14.3.0/src -> /usr/src/debug/harfbuzz/14.3.1/src, directory renamed /
 usr/src/debug/harfbuzz/14.3.0/src/OT/Layout/GDEF -> /usr/src/debug/harfbuzz/14.3.1/src/OT/Layout/GDEF, directory renamed /usr/src/debug/harfbuzz/14.3.0/src/OT/Var/VARC -> /usr/src/debug/harfbuzz/14.3.1/src/OT/Var/VARC, directory renamed /usr/src/debug/harfbuzz/14.3.0/util -> /usr/src/debug/harfbuzz/14.3.1/util, directory renamed /usr/src/debug/harfbuzz/14.3.0/src/OT/Layout -> /usr/src/debug/harfbuzz/14.3.1/src/OT/Layout, directory renamed /usr/src/debug/harfbuzz/14.3.0/src/OT/Layout/GSUB -> /usr/src/debug/harfbuzz/14.3.1/src/OT/Layout/GSUB, directory renamed /usr/src/debug/harfbuzz/14.3.0/src/graph -> /usr/src/debug/harfbuzz/14.3.1/src/graph, directory renamed /usr/src/debug/harfbuzz/14.3.0/src/OT/Color/sbix -> /usr/src/debug/harfbuzz/14.3.1/src/OT/Color/sbix, directory renamed /usr/src/debug/harfbuzz/14.3.0/src/OT/Color/svg -> /usr/src/debug/harfbuzz/14.3.1/src/OT/Color/svg
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PV changed from "14.3.0" to "14.3.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 5501685 to 5512119 (+0%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 14.3.0 [default] to 14.3.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "14.3.0" to "14.3.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 14.3.0 [default] to 14.3.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILES: removed "/usr/lib/libharfbuzz-subset.so.0.61430.0", added "/usr/lib/libharfbuzz-subset.so.0.61431.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61430.0", added "/usr/lib/libharfbuzz-subset.so.0.61431.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "14.3.0" to "14.3.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 14.3.0 [default] to 14.3.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61430.0", added "/usr/lib/libharfbuzz.so.0.61431.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PV changed from "14.3.0" to "14.3.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGV changed from 14.3.0 [default] to 14.3.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz: PV changed from "14.3.0" to "14.3.1"
packages/x86-64-v3-poky-linux/harfbuzz: PKGV changed from 14.3.0 [default] to 14.3.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/14.3.0/harfbuzz-14.3.0.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases//download/14.3.1/harfbuzz-14.3.1.tar.xz"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61430.0 to libharfbuzz-cairo.so.0.61431.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61430.0 to libharfbuzz-gobject.so.0.61431.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61430.0 to libharfbuzz-icu.so.0.61431.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61430.0 to libharfbuzz.so.0.61431.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61430.0 to libharfbuzz-subset.so.0.61431.0
  /usr/lib/libharfbuzz-cairo.so.0.61430.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61431.0
  /usr/lib/libharfbuzz-gobject.so.0.61430.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61431.0
  /usr/lib/libharfbuzz-icu.so.0.61430.0 moved to /usr/lib/libharfbuzz-icu.so.0.61431.0
  /usr/lib/libharfbuzz.so.0.61430.0 moved to /usr/lib/libharfbuzz.so.0.61431.0
  /usr/lib/libharfbuzz-subset.so.0.61430.0 moved to /usr/lib/libharfbuzz-subset.so.0.61431.0

--===============6682479375877673392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="harfbuzz-changelog.txt"

Changelog for harfbuzz: 14.3.0 -> 14.3.1
Source: NEWS

Overview of changes leading to 14.3.1
Thursday, August 13, 2026
=====================================
- Various fuzzing and build fixes.
- Various subsetting fixes.
- Fix AAT insertion at the end of the text.
- Fix various rendering bugs in the experimental GPU library.
- WASM shaper code can now read the user features.

--===============6682479375877673392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61430.0", added "/usr/lib/libharfbuzz-cairo.so.0.61431.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61430.0", added "/usr/lib/libharfbuzz-gobject.so.0.61431.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61430.0", added "/usr/lib/libharfbuzz-icu.so.0.61431.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61430.0", added "/usr/lib/libharfbuzz-subset.so.0.61431.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61430.0", added "/usr/lib/libharfbuzz.so.0.61431.0"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61430.0 to libharfbuzz-cairo.so.0.61431.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61430.0 to libharfbuzz-gobject.so.0.61431.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61430.0 to libharfbuzz-icu.so.0.61431.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61430.0 to libharfbuzz.so.0.61431.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61430.0 to libharfbuzz-subset.so.0.61431.0
  /usr/lib/libharfbuzz-cairo.so.0.61430.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61431.0
  /usr/lib/libharfbuzz-gobject.so.0.61430.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61431.0
  /usr/lib/libharfbuzz-icu.so.0.61430.0 moved to /usr/lib/libharfbuzz-icu.so.0.61431.0
  /usr/lib/libharfbuzz.so.0.61430.0 moved to /usr/lib/libharfbuzz.so.0.61431.0
  /usr/lib/libharfbuzz-subset.so.0.61430.0 moved to /usr/lib/libharfbuzz-subset.so.0.61431.0

--===============6682479375877673392==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-14.3.0-14.3.1.patch"

RnJvbSBkNTIyMDhmYmNmYzU1Y2ZhZGM5ZGI2OWJjYjVlZWZjYmQwNTNiOWMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTMgQXVnIDIwMjYgMDU6Mzg6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
YXJmYnV6ejogdXBncmFkZSAxNC4zLjAgLT4gMTQuMy4xCgpTb3VyY2U6IE5FV1MKCk92ZXJ2aWV3
IG9mIGNoYW5nZXMgbGVhZGluZyB0byAxNC4zLjEKVGh1cnNkYXksIEF1Z3VzdCAxMywgMjAyNgo9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0gVmFyaW91cyBmdXp6aW5nIGFu
ZCBidWlsZCBmaXhlcy4KLSBWYXJpb3VzIHN1YnNldHRpbmcgZml4ZXMuCi0gRml4IEFBVCBpbnNl
cnRpb24gYXQgdGhlIGVuZCBvZiB0aGUgdGV4dC4KLSBGaXggdmFyaW91cyByZW5kZXJpbmcgYnVn
cyBpbiB0aGUgZXhwZXJpbWVudGFsIEdQVSBsaWJyYXJ5LgotIFdBU00gc2hhcGVyIGNvZGUgY2Fu
IG5vdyByZWFkIHRoZSB1c2VyIGZlYXR1cmVzLgotLS0KIC4uLi9oYXJmYnV6ei97aGFyZmJ1enpf
MTQuMy4wLmJiID0+IGhhcmZidXp6XzE0LjMuMS5iYn0gICAgICAgICB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy9oYXJmYnV6ei97aGFyZmJ1enpfMTQuMy4wLmJiID0+IGhhcmZidXp6XzE0LjMu
MS5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enov
aGFyZmJ1enpfMTQuMy4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZi
dXp6XzE0LjMuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMTQuMy4wLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMTQuMy4xLmJiCmluZGV4IDZlNGU5Yjdi
ODUuLjRmMGQ1ZDNlYzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6
ei9oYXJmYnV6el8xNC4zLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6
L2hhcmZidXp6XzE0LjMuMS5iYgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9Yjk4NDI5YjhlOGUzYzJhNjdjZmVmMDFlOTllNDg5M2QgXAogICAg
ICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25s
b2FkLyR7UFZ9LyR7QlBOfS0ke1BWfS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTYw
NzBkNzdjZmM0YmExZjFlNzMyN2U4M2JmOWIzZjU1ODk4MDgxY2FiZGI5NGU1NmEzM2UwNGZjODg3
NGVhZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5ZGFlOTUzOGFhZTJmZmRmNzBjZWMzMWYyYzI3
YmY2OGUyYWFlZWFlMzExMjY4ODQ2NzY5N2Q1ZmFmNjE5NGY3IgogCiBpbmhlcml0IG1lc29uIHBr
Z2NvbmZpZyBsaWJfcGFja2FnZSBndGstZG9jIGdvYmplY3QtaW50cm9zcGVjdGlvbiBnaXRodWIt
cmVsZWFzZXMKIAotLSAKMi40Ny4xCgo=

--===============6682479375877673392==--

