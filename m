Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D4EC531FA
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 05:19:26 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5940.1785043162185400446
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2026 22:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XggdU0KY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=d8OVD3Um;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019f9cdd113b-976fa2c4-14ec-47d6-81a0-876ff1cf219f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785043161;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2SFrAvAnpqf0v0gQxkaUDGOYm5oTPU1o++/xRlZHQO4=;
	b=XggdU0KYjc0bbVilMxe/iVaRvoZ9u36m1BlpbUrtgpPflJ3+MvpIMw3cuHQKWk6h
	d78E1XE4rZ6iCSl8sappFmzyuOcTRlPmkkUh5/Vt0kNGUs3A4jbDbymYwuhzNU7XtVy
	ETt18I5UnPWLGHc19wuogdvFpAHov2M0cVMm0SG4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785043161;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2SFrAvAnpqf0v0gQxkaUDGOYm5oTPU1o++/xRlZHQO4=;
	b=d8OVD3UmnjBd8P5IPxjETLPBOAWj45lvg2YWmV19aLpAQahmOLoGDrCsLy5r3eBM
	JOQ3gK4U3aJfJTJTo88EXy9bMfODy3BEDNZhkyDUEa+M+Yi0AFTb3cptjlJXtV135vV
	25+38Q3YowNys/GRZpYLrsDn09QRwQGPLchIwiHQ=
Content-Type: multipart/mixed; boundary="===============2032655091477373641=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libical: upgrading to 4.0.4 SUCCEEDED
Message-ID: <0101019f9cdd113b-976fa2c4-14ec-47d6-81a0-876ff1cf219f-000000@us-west-2.amazonses.com>
Date: Sun, 26 Jul 2026 05:19:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.26-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 05:19:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241979

--===============2032655091477373641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libical* to *4.0.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libical-upgrade-4.0.3-4.0.4.patch
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
From f5a41a7e23945e5848b302089284332b6317b7c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 26 Jul 2026 05:19:15 +0000
Subject: [PATCH] libical: upgrade 4.0.3 -> 4.0.4

Source: docs/4.0.4/release.md

# Libical v4.0.4

## Overview

This is a patch release and is fully source and binary compatible with version 4.0.0.

## ReleaseNotes

- Fix an uninitialized memory issue reading zoneinfo geo coordinates.

Please see the [CHANGELOG](https://github.com/libical/libical/blob/4.0/CHANGELOG.md) for more.
---
 meta/recipes-support/libical/libical/flags.patch                | 2 +-
 .../libical/{libical_4.0.3.bb => libical_4.0.4.bb}              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libical/{libical_4.0.3.bb => libical_4.0.4.bb} (96%)

diff --git a/meta/recipes-support/libical/libical/flags.patch b/meta/recipes-support/libical/libical/flags.patch
index 868314591c..9276ea3808 100644
--- a/meta/recipes-support/libical/libical/flags.patch
+++ b/meta/recipes-support/libical/libical/flags.patch
@@ -1,4 +1,4 @@
-From cba8f762f6a3270530550915d957c01f3da9a601 Mon Sep 17 00:00:00 2001
+From 08603ea4ba6d26a22e9a19b8b83d125eba38f4d4 Mon Sep 17 00:00:00 2001
 From: Milan Crha <mcrha@redhat.com>
 Date: Wed, 10 Sep 2025 09:52:37 +0200
 Subject: [PATCH] libical-glib: Hide some target options in the installed CMake
diff --git a/meta/recipes-support/libical/libical_4.0.3.bb b/meta/recipes-support/libical/libical_4.0.4.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_4.0.3.bb
rename to meta/recipes-support/libical/libical_4.0.4.bb
index dff79bcc4f..516c7a95b0 100644
--- a/meta/recipes-support/libical/libical_4.0.3.bb
+++ b/meta/recipes-support/libical/libical_4.0.4.bb
@@ -13,7 +13,7 @@ SECTION = "libs"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://flags.patch \
            "
-SRC_URI[sha256sum] = "86f29029d0ec9fa30c9001de16c0859a3816ae154ff5b097392b014e21a3d254"
+SRC_URI[sha256sum] = "c851cdb46da5e6397881dafaa592c5516fb49da05dd1bb095f711a6d20eac422"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 
-- 
2.47.1


--===============2032655091477373641==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libical-upgrade-4.0.3-4.0.4.patch"

RnJvbSBmNWE0MWE3ZTIzOTQ1ZTU4NDhiMzAyMDg5Mjg0MzMyYjYzMTdiN2MyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMjYgSnVsIDIwMjYgMDU6MTk6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJpY2FsOiB1cGdyYWRlIDQuMC4zIC0+IDQuMC40CgpTb3VyY2U6IGRvY3MvNC4wLjQvcmVsZWFz
ZS5tZAoKIyBMaWJpY2FsIHY0LjAuNAoKIyMgT3ZlcnZpZXcKClRoaXMgaXMgYSBwYXRjaCByZWxl
YXNlIGFuZCBpcyBmdWxseSBzb3VyY2UgYW5kIGJpbmFyeSBjb21wYXRpYmxlIHdpdGggdmVyc2lv
biA0LjAuMC4KCiMjIFJlbGVhc2VOb3RlcwoKLSBGaXggYW4gdW5pbml0aWFsaXplZCBtZW1vcnkg
aXNzdWUgcmVhZGluZyB6b25laW5mbyBnZW8gY29vcmRpbmF0ZXMuCgpQbGVhc2Ugc2VlIHRoZSBb
Q0hBTkdFTE9HXShodHRwczovL2dpdGh1Yi5jb20vbGliaWNhbC9saWJpY2FsL2Jsb2IvNC4wL0NI
QU5HRUxPRy5tZCkgZm9yIG1vcmUuCi0tLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaWNhbC9s
aWJpY2FsL2ZsYWdzLnBhdGNoICAgICAgICAgICAgICAgIHwgMiArLQogLi4uL2xpYmljYWwve2xp
YmljYWxfNC4wLjMuYmIgPT4gbGliaWNhbF80LjAuNC5iYn0gICAgICAgICAgICAgIHwgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaWNhbC97bGliaWNhbF80LjAuMy5iYiA9PiBsaWJpY2Fs
XzQuMC40LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmlj
YWwvbGliaWNhbC9mbGFncy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmljYWwvbGli
aWNhbC9mbGFncy5wYXRjaAppbmRleCA4NjgzMTQ1OTFjLi45Mjc2ZWEzODA4IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJpY2FsL2xpYmljYWwvZmxhZ3MucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaWNhbC9saWJpY2FsL2ZsYWdzLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBjYmE4Zjc2MmY2YTMyNzA1MzA1NTA5MTVkOTU3YzAxZjNkYTlhNjAxIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwODYwM2VhNGJhNmQyNmEyMmU5YTE5YjhiODNk
MTI1ZWJhMzhmNGQ0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWlsYW4gQ3JoYSA8
bWNyaGFAcmVkaGF0LmNvbT4KIERhdGU6IFdlZCwgMTAgU2VwIDIwMjUgMDk6NTI6MzcgKzAyMDAK
IFN1YmplY3Q6IFtQQVRDSF0gbGliaWNhbC1nbGliOiBIaWRlIHNvbWUgdGFyZ2V0IG9wdGlvbnMg
aW4gdGhlIGluc3RhbGxlZCBDTWFrZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGliaWNhbC9saWJpY2FsXzQuMC4zLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaWNhbC9s
aWJpY2FsXzQuMC40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYmljYWwvbGliaWNhbF80LjAuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGliaWNhbC9saWJpY2FsXzQuMC40LmJiCmluZGV4IGRmZjc5YmNjNGYuLjUx
NmM3YTk1YjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmljYWwvbGliaWNh
bF80LjAuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJpY2FsL2xpYmljYWxfNC4w
LjQuYmIKQEAgLTEzLDcgKzEzLDcgQEAgU0VDVElPTiA9ICJsaWJzIgogU1JDX1VSSSA9ICIke0dJ
VEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9LyR7QlB9LnRhci5neiBcCiAgICAgICAgICAg
IGZpbGU6Ly9mbGFncy5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICI4NmYyOTAyOWQwZWM5ZmEzMGM5MDAxZGUxNmMwODU5YTM4MTZhZTE1NGZmNWIwOTczOTJiMDE0
ZTIxYTNkMjU0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImM4NTFjZGI0NmRhNWU2Mzk3ODgxZGFm
YWE1OTJjNTUxNmZiNDlkYTA1ZGQxYmIwOTVmNzExYTZkMjBlYWM0MjIiCiAKIGluaGVyaXQgY21h
a2UgcGtnY29uZmlnIGdvYmplY3QtaW50cm9zcGVjdGlvbiB2YWxhIGdpdGh1Yi1yZWxlYXNlcwog
Ci0tIAoyLjQ3LjEKCg==

--===============2032655091477373641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libical: PV changed from "4.0.3" to "4.0.4"
packages/x86-64-v3-poky-linux/libical: SRC_URI changed from "https://github.com/libical/libical/releases//download/v4.0.3/libical-4.0.3.tar.gz file://flags.patch" to "https://github.com/libical/libical/releases//download/v4.0.4/libical-4.0.4.tar.gz file://flags.patch"
packages/x86-64-v3-poky-linux/libical: PKGV changed from 4.0.3 [default] to 4.0.4 [default]
packages/x86-64-v3-poky-linux/libical/libical-dbg: PV changed from "4.0.3" to "4.0.4"
packages/x86-64-v3-poky-linux/libical/libical-dbg: FILELIST: removed "/usr/lib/.debug/libicalss_cxx.so.4.0.3 /usr/lib/.debug/libical-glib.so.4.0.3 /usr/lib/.debug/libical_cxx.so.4.0.3 /usr/lib/.debug/libicalvcal.so.4.0.3 /usr/lib/.debug/libicalvcard.so.4.0.3 /usr/lib/.debug/libicalss.so.4.0.3 /usr/lib/.debug/libical.so.4.0.3", added "/usr/lib/.debug/libical-glib.so.4.0.4 /usr/lib/.debug/libicalss_cxx.so.4.0.4 /usr/lib/.debug/libicalss.so.4.0.4 /usr/lib/.debug/libicalvcard.so.4.0.4 /usr/lib/.debug/libical_cxx.so.4.0.4 /usr/lib/.debug/libical.so.4.0.4 /usr/lib/.debug/libicalvcal.so.4.0.4"
packages/x86-64-v3-poky-linux/libical/libical-dbg: PKGV changed from 4.0.3 [default] to 4.0.4 [default]
packages/x86-64-v3-poky-linux/libical/libical-dbg: PKGSIZE changed from 5045456 to 5045416 (-0%)
packages/x86-64-v3-poky-linux/libical/libical-dev: PV changed from "4.0.3" to "4.0.4"
packages/x86-64-v3-poky-linux/libical/libical-dev: PKGV changed from 4.0.3 [default] to 4.0.4 [default]
packages/x86-64-v3-poky-linux/libical/libical-doc: PV changed from "4.0.3" to "4.0.4"
packages/x86-64-v3-poky-linux/libical/libical-doc: PKGV changed from 4.0.3 [default] to 4.0.4 [default]
packages/x86-64-v3-poky-linux/libical/libical-locale: PV changed from "4.0.3" to "4.0.4"
packages/x86-64-v3-poky-linux/libical/libical-locale: PKGV changed from 4.0.3 [default] to 4.0.4 [default]
packages/x86-64-v3-poky-linux/libical/libical-src: PV changed from "4.0.3" to "4.0.4"
packages/x86-64-v3-poky-linux/libical/libical-src: FILELIST: directory renamed /usr/src/debug/libical/4.0.3/src/libicalvcard -> /usr/src/debug/libical/4.0.4/src/libicalvcard, directory renamed /usr/src/debug/libical/4.0.3/src/libicalss -> /usr/src/debug/libical/4.0.4/src/libicalss, directory renamed /usr/src/debug/libical/4.0.3/src/libical -> /usr/src/debug/libical/4.0.4/src/libical, directory renamed /usr/src/debug/libical/4.0.3/src/libical-glib -> /usr/src/debug/libical/4.0.4/src/libical-glib, directory renamed /usr/src/debug/libical/4.0.3 -> /usr/src/debug/libical/4.0.4, directory renamed /usr/src/debug/libical/4.0.3/src/libicalvcal -> /usr/src/debug/libical/4.0.4/src/libicalvcal
packages/x86-64-v3-poky-linux/libical/libical-src: PKGV changed from 4.0.3 [default] to 4.0.4 [default]
packages/x86-64-v3-poky-linux/libical/libical-src: PKGSIZE changed from 4374741 to 4375009 (+0%)
packages/x86-64-v3-poky-linux/libical/libical-staticdev: PV changed from "4.0.3" to "4.0.4"
packages/x86-64-v3-poky-linux/libical/libical-staticdev: PKGV changed from 4.0.3 [default] to 4.0.4 [default]
packages/x86-64-v3-poky-linux/libical/libical: PV changed from "4.0.3" to "4.0.4"
packages/x86-64-v3-poky-linux/libical/libical: FILELIST: removed "/usr/lib/libicalvcard.so.4.0.3 /usr/lib/libicalss.so.4.0.3 /usr/lib/libical.so.4.0.3 /usr/lib/libical-glib.so.4.0.3 /usr/lib/libical_cxx.so.4.0.3 /usr/lib/libicalss_cxx.so.4.0.3 /usr/lib/libicalvcal.so.4.0.3", added "/usr/lib/libicalvcard.so.4.0.4 /usr/lib/libicalss.so.4.0.4 /usr/lib/libical_cxx.so.4.0.4 /usr/lib/libical-glib.so.4.0.4 /usr/lib/libical.so.4.0.4 /usr/lib/libicalvcal.so.4.0.4 /usr/lib/libicalss_cxx.so.4.0.4"
packages/x86-64-v3-poky-linux/libical/libical: PKGV changed from 4.0.3 [default] to 4.0.4 [default]
Changes to packages/x86-64-v3-poky-linux/libical (sysroot):
  /usr/lib/libical_cxx.so.4.0 changed symlink target from libical_cxx.so.4.0.3 to libical_cxx.so.4.0.4
  /usr/lib/libical-glib.so.4.0 changed symlink target from libical-glib.so.4.0.3 to libical-glib.so.4.0.4
  /usr/lib/libical.so.4.0 changed symlink target from libical.so.4.0.3 to libical.so.4.0.4
  /usr/lib/libicalss_cxx.so.4.0 changed symlink target from libicalss_cxx.so.4.0.3 to libicalss_cxx.so.4.0.4
  /usr/lib/libicalss.so.4.0 changed symlink target from libicalss.so.4.0.3 to libicalss.so.4.0.4
  /usr/lib/libicalvcal.so.4.0 changed symlink target from libicalvcal.so.4.0.3 to libicalvcal.so.4.0.4
  /usr/lib/libicalvcard.so.4.0 changed symlink target from libicalvcard.so.4.0.3 to libicalvcard.so.4.0.4
  /usr/lib/libical_cxx.so.4.0.3 moved to /usr/lib/libical_cxx.so.4.0.4
  /usr/lib/libical-glib.so.4.0.3 moved to /usr/lib/libical-glib.so.4.0.4
  /usr/lib/libical.so.4.0.3 moved to /usr/lib/libical.so.4.0.4
  /usr/lib/libicalss_cxx.so.4.0.3 moved to /usr/lib/libicalss_cxx.so.4.0.4
  /usr/lib/libicalss.so.4.0.3 moved to /usr/lib/libicalss.so.4.0.4
  /usr/lib/libicalvcal.so.4.0.3 moved to /usr/lib/libicalvcal.so.4.0.4
  /usr/lib/libicalvcard.so.4.0.3 moved to /usr/lib/libicalvcard.so.4.0.4

--===============2032655091477373641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libical-changelog.txt"

Changelog for libical: 4.0.3 -> 4.0.4
Source: docs/4.0.4/release.md

# Libical v4.0.4

## Overview

This is a patch release and is fully source and binary compatible with version 4.0.0.

## ReleaseNotes

- Fix an uninitialized memory issue reading zoneinfo geo coordinates.

Please see the [CHANGELOG](https://github.com/libical/libical/blob/4.0/CHANGELOG.md) for more.

--===============2032655091477373641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libical/libical: FILELIST: removed "/usr/lib/libicalvcal.so.4.0.3 /usr/lib/libicalvcard.so.4.0.3 /usr/lib/libical.so.4.0.3 /usr/lib/libical-glib.so.4.0.3 /usr/lib/libicalss.so.4.0.3 /usr/lib/libicalss_cxx.so.4.0.3 /usr/lib/libical_cxx.so.4.0.3", added "/usr/lib/libicalvcard.so.4.0.4 /usr/lib/libicalvcal.so.4.0.4 /usr/lib/libical.so.4.0.4 /usr/lib/libicalss.so.4.0.4 /usr/lib/libical_cxx.so.4.0.4 /usr/lib/libical-glib.so.4.0.4 /usr/lib/libicalss_cxx.so.4.0.4"
Changes to packages/x86-64-v3-poky-linux/libical (sysroot):
  /usr/lib/libical_cxx.so.4.0 changed symlink target from libical_cxx.so.4.0.3 to libical_cxx.so.4.0.4
  /usr/lib/libical-glib.so.4.0 changed symlink target from libical-glib.so.4.0.3 to libical-glib.so.4.0.4
  /usr/lib/libical.so.4.0 changed symlink target from libical.so.4.0.3 to libical.so.4.0.4
  /usr/lib/libicalss_cxx.so.4.0 changed symlink target from libicalss_cxx.so.4.0.3 to libicalss_cxx.so.4.0.4
  /usr/lib/libicalss.so.4.0 changed symlink target from libicalss.so.4.0.3 to libicalss.so.4.0.4
  /usr/lib/libicalvcal.so.4.0 changed symlink target from libicalvcal.so.4.0.3 to libicalvcal.so.4.0.4
  /usr/lib/libicalvcard.so.4.0 changed symlink target from libicalvcard.so.4.0.3 to libicalvcard.so.4.0.4
  /usr/lib/libical_cxx.so.4.0.3 moved to /usr/lib/libical_cxx.so.4.0.4
  /usr/lib/libical-glib.so.4.0.3 moved to /usr/lib/libical-glib.so.4.0.4
  /usr/lib/libical.so.4.0.3 moved to /usr/lib/libical.so.4.0.4
  /usr/lib/libicalss_cxx.so.4.0.3 moved to /usr/lib/libicalss_cxx.so.4.0.4
  /usr/lib/libicalss.so.4.0.3 moved to /usr/lib/libicalss.so.4.0.4
  /usr/lib/libicalvcal.so.4.0.3 moved to /usr/lib/libicalvcal.so.4.0.4
  /usr/lib/libicalvcard.so.4.0.3 moved to /usr/lib/libicalvcard.so.4.0.4

--===============2032655091477373641==--

