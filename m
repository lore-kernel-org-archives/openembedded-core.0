Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735FCD0D79B
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:42 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.53275.1728588954413364594
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=II7xmM1/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Cg89SAcg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019277eee2b4-7549c43c-e005-4abf-bf02-a50886bc8b01-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588997;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ssVHAvyZxm5IJvRENWavbITBaqX/5kbH0rq0nKCIy88=;
	b=II7xmM1/jl4h55u8vGcUVnfe6UlGpgzQT1KrTw05E0pya8u8tHwPLNBJiSAiQ3Vd
	Q6uxK5L55GRYpQHEnkxbzxi+xKIVe3LqsM0wbgvwHhtSP6OC6XTAri1peo6k1ibUygo
	HDPLAlbyE2/lIhm4MbTyoyRigtuyGpW2Pm4kvPr4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588997;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ssVHAvyZxm5IJvRENWavbITBaqX/5kbH0rq0nKCIy88=;
	b=Cg89SAcgUMGtdLny401MvhkrIGgfS2gJdjm0QtTsgcX2a729FbJb6Exc9gHJXBsN
	2pLMphKErq0rEdDLk/RpxbQgM+La/CHfxIeVeqF66YCZJBVDqWc+ZsZd97BM7c7ntvj
	WODJLCfIy4hnzxVKsQ1uJlZ7f7fbCVsblBpft7Cw=
Content-Type: multipart/mixed; boundary="===============0299640501314864261=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 10.0.1 SUCCEEDED
Message-ID: <0101019277eee2b4-7549c43c-e005-4abf-bf02-a50886bc8b01-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205613

--===============0299640501314864261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *harfbuzz* to *10.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-9.0.0-10.0.1.patch
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
From 704634fc1fa161241597e01611abb42306ab6a80 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 15:01:47 +0000
Subject: [PATCH] harfbuzz: upgrade 9.0.0 -> 10.0.1

---
 .../harfbuzz/{harfbuzz_9.0.0.bb => harfbuzz_10.0.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_9.0.0.bb => harfbuzz_10.0.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_10.0.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_10.0.1.bb
index 01ea6ca86d..3b211251af 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_10.0.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a41b272ceeb920c57263ec851604542d9ec85ee3030506d94662067c7b6ab89e"
+SRC_URI[sha256sum] = "b2cb13bd351904cb9038f907dc0dee0ae07127061242fe3556b2795c4e9748fc"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.44.1


--===============0299640501314864261==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-9.0.0-10.0.1.patch"

RnJvbSA3MDQ2MzRmYzFmYTE2MTI0MTU5N2UwMTYxMWFiYjQyMzA2YWI2YTgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTU6MDE6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
YXJmYnV6ejogdXBncmFkZSA5LjAuMCAtPiAxMC4wLjEKCi0tLQogLi4uL2hhcmZidXp6L3toYXJm
YnV6el85LjAuMC5iYiA9PiBoYXJmYnV6el8xMC4wLjEuYmJ9ICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L3toYXJmYnV6el85LjAuMC5iYiA9PiBoYXJmYnV6el8x
MC4wLjEuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZi
dXp6L2hhcmZidXp6XzkuMC4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hh
cmZidXp6XzEwLjAuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfOS4wLjAuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xMC4wLjEuYmIKaW5kZXggMDFlYTZj
YTg2ZC4uM2IyMTEyNTFhZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZi
dXp6L2hhcmZidXp6XzkuMC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6
ei9oYXJmYnV6el8xMC4wLjEuYmIKQEAgLTksNyArOSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PWI5ODQyOWI4ZThlM2MyYTY3Y2ZlZjAxZTk5ZTQ4OTNkIFwKICAg
ICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3du
bG9hZC8ke1BWfS8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImE0
MWIyNzJjZWViOTIwYzU3MjYzZWM4NTE2MDQ1NDJkOWVjODVlZTMwMzA1MDZkOTQ2NjIwNjdjN2I2
YWI4OWUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjJjYjEzYmQzNTE5MDRjYjkwMzhmOTA3ZGMw
ZGVlMGFlMDcxMjcwNjEyNDJmZTM1NTZiMjc5NWM0ZTk3NDhmYyIKIAogREVQRU5EUyArPSAiZ2xp
Yi0yLjAtbmF0aXZlIgogCi0tIAoyLjQ0LjEKCg==

--===============0299640501314864261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.60900.0", added "/usr/lib/libharfbuzz-icu.so.0.61001.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.60900.0", added "/usr/lib/libharfbuzz-subset.so.0.61001.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.60900.0 /usr/lib/libharfbuzz.so.0.60900.0 /usr/lib/libharfbuzz-gobject.so.0.60900.0", added "/usr/lib/libharfbuzz.so.0.61001.0 /usr/lib/libharfbuzz-cairo.so.0.61001.0 /usr/lib/libharfbuzz-gobject.so.0.61001.0"
Changes to packages/core2-64-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.60900.0 to libharfbuzz-cairo.so.0.61001.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.60900.0 to libharfbuzz-gobject.so.0.61001.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.60900.0 to libharfbuzz-icu.so.0.61001.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.60900.0 to libharfbuzz.so.0.61001.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.60900.0 to libharfbuzz-subset.so.0.61001.0
  /usr/lib/libharfbuzz-cairo.so.0.60900.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61001.0
  /usr/lib/libharfbuzz-gobject.so.0.60900.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61001.0
  /usr/lib/libharfbuzz-icu.so.0.60900.0 moved to /usr/lib/libharfbuzz-icu.so.0.61001.0
  /usr/lib/libharfbuzz.so.0.60900.0 moved to /usr/lib/libharfbuzz.so.0.61001.0
  /usr/lib/libharfbuzz-subset.so.0.60900.0 moved to /usr/lib/libharfbuzz-subset.so.0.61001.0

--===============0299640501314864261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 9.0.0 [default] to 10.0.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "9.0.0" to "10.0.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 9.0.0 [default] to 10.0.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 77625336 to 77823224 (+0%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "9.0.0" to "10.0.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz.so.0.60900.0 /usr/lib/.debug/libharfbuzz-subset.so.0.60900.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.60900.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.60900.0 /usr/lib/.debug/libharfbuzz-icu.so.0.60900.0", added "/usr/lib/.debug/libharfbuzz-subset.so.0.61001.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61001.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61001.0 /usr/lib/.debug/libharfbuzz.so.0.61001.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61001.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 9.0.0 [default] to 10.0.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1719345 to 1731053 (+1%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "9.0.0" to "10.0.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 9.0.0 [default] to 10.0.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "9.0.0" to "10.0.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu-dev: PKGV changed from 9.0.0 [default] to 10.0.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu-dev: PKGSIZE changed from 304 to 306 (+1%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu-dev: PV changed from "9.0.0" to "10.0.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 9.0.0 [default] to 10.0.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "9.0.0" to "10.0.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.60900.0", added "/usr/lib/libharfbuzz-icu.so.0.61001.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 9.0.0 [default] to 10.0.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "9.0.0" to "10.0.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 9.0.0 [default] to 10.0.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 4895646 to 4935038 (+1%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz-src: PV changed from "9.0.0" to "10.0.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 9.0.0 [default] to 10.0.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "9.0.0" to "10.0.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 9.0.0 [default] to 10.0.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "9.0.0" to "10.0.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.60900.0", added "/usr/lib/libharfbuzz-subset.so.0.61001.0"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PKGV changed from 9.0.0 [default] to 10.0.1 [default]
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1646462 to 1651658 (+0%)
packages/core2-64-poky-linux/harfbuzz/harfbuzz: PV changed from "9.0.0" to "10.0.1"
packages/core2-64-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.60900.0 /usr/lib/libharfbuzz.so.0.60900.0 /usr/lib/libharfbuzz-cairo.so.0.60900.0", added "/usr/lib/libharfbuzz-gobject.so.0.61001.0 /usr/lib/libharfbuzz-cairo.so.0.61001.0 /usr/lib/libharfbuzz.so.0.61001.0"
packages/core2-64-poky-linux/harfbuzz: PKGV changed from 9.0.0 [default] to 10.0.1 [default]
packages/core2-64-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/9.0.0/harfbuzz-9.0.0.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases//download/10.0.1/harfbuzz-10.0.1.tar.xz"
packages/core2-64-poky-linux/harfbuzz: PV changed from "9.0.0" to "10.0.1"
Changes to packages/core2-64-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.60900.0 to libharfbuzz-cairo.so.0.61001.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.60900.0 to libharfbuzz-gobject.so.0.61001.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.60900.0 to libharfbuzz-icu.so.0.61001.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.60900.0 to libharfbuzz.so.0.61001.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.60900.0 to libharfbuzz-subset.so.0.61001.0
  /usr/lib/libharfbuzz-cairo.so.0.60900.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61001.0
  /usr/lib/libharfbuzz-gobject.so.0.60900.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61001.0
  /usr/lib/libharfbuzz-icu.so.0.60900.0 moved to /usr/lib/libharfbuzz-icu.so.0.61001.0
  /usr/lib/libharfbuzz.so.0.60900.0 moved to /usr/lib/libharfbuzz.so.0.61001.0
  /usr/lib/libharfbuzz-subset.so.0.60900.0 moved to /usr/lib/libharfbuzz-subset.so.0.61001.0

--===============0299640501314864261==--

