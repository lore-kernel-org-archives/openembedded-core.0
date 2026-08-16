Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE47C5DF70
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 05:11:09 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5174.1786857062792951955
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2026 22:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OYu6JWBk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=O8RdpDrf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a008fafe04-724ecd93-5ef4-4b5e-84b9-1a2701d200bf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786857062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s0+ElzZnmUOVJKvW8JO8KdiVQdG25e4EMm2unvaOKf4=;
	b=OYu6JWBkrBzNBwRDa1AMX/RBndPggUFO+zSi1YiOpivc7AWQm/tdg+mFXLqbw2w/
	K3gn40FqN6cfZHJOYOb/rsJaJwIpELPVXXFjtTpSWs9cblXkTjQ9bS5gKYmB+m0NLY5
	nBi2wQxai8kXskDyNw6LJVUSuCdKkVv0ASjuss2A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786857062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s0+ElzZnmUOVJKvW8JO8KdiVQdG25e4EMm2unvaOKf4=;
	b=O8RdpDrftOoUUBSA9sSWeSXlXyJ4uxVwqisPSdmjOqS/oXY0WNmjBcxnAIsnM2Hq
	Q2ucdFPILLXbQUsWHOi/miMx5siKpzRnUub15Eh8KaVwYnUPk304IBbR5dUCn1gpFOn
	CRDW67aPTibf5kiAD8PfX/+IIk+b4VrJ2Uv7k5jc=
Content-Type: multipart/mixed; boundary="===============7294857016426475729=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libical: upgrading to 4.0.5 SUCCEEDED
Message-ID: <010101a008fafe04-724ecd93-5ef4-4b5e-84b9-1a2701d200bf-000000@us-west-2.amazonses.com>
Date: Sun, 16 Aug 2026 05:11:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 05:11:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243505

--===============7294857016426475729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libical* to *4.0.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libical-upgrade-4.0.4-4.0.5.patch
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
From 0cdadc75633f0b91ac24c4db3216802a7ec45dec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 16 Aug 2026 05:10:58 +0000
Subject: [PATCH] libical: upgrade 4.0.4 -> 4.0.5

Source: docs/4.0.5/release.md

# Libical v4.0.5

## Overview

This is a patch release and is fully source and binary compatible with version 4.0.0.

[Note: the libicalvcard is a released as a *Technical Preview*. As such,
its API is not finalized and no source or binary compatibility is guaranteed
with that library in the 4.0.x series.]

## ReleaseNotes

- Fix 32-bit time_t upper bound off by two days.
- Buildsystem: fix libical_deprecated_option() writing the wrong cache value
- Bogus TZIDs no longer cause an error.
- DTEND, DURATION, DUE property types and values are now validated per RFC 5545 Sections 3.8.2.2 - 3.8.2.5.
- Built-in timezones updated to tzdata2026c.

Please see the [CHANGELOG](https://github.com/libical/libical/blob/4.0/CHANGELOG.md) for more.
---
 meta/recipes-support/libical/libical/flags.patch                | 2 +-
 .../libical/{libical_4.0.4.bb => libical_4.0.5.bb}              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libical/{libical_4.0.4.bb => libical_4.0.5.bb} (96%)

diff --git a/meta/recipes-support/libical/libical/flags.patch b/meta/recipes-support/libical/libical/flags.patch
index 868314591c..93d3b41d03 100644
--- a/meta/recipes-support/libical/libical/flags.patch
+++ b/meta/recipes-support/libical/libical/flags.patch
@@ -1,4 +1,4 @@
-From cba8f762f6a3270530550915d957c01f3da9a601 Mon Sep 17 00:00:00 2001
+From a58b079714cc5037a33e24502b5c1aaa3b99914c Mon Sep 17 00:00:00 2001
 From: Milan Crha <mcrha@redhat.com>
 Date: Wed, 10 Sep 2025 09:52:37 +0200
 Subject: [PATCH] libical-glib: Hide some target options in the installed CMake
diff --git a/meta/recipes-support/libical/libical_4.0.4.bb b/meta/recipes-support/libical/libical_4.0.5.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_4.0.4.bb
rename to meta/recipes-support/libical/libical_4.0.5.bb
index 516c7a95b0..8ec656edd2 100644
--- a/meta/recipes-support/libical/libical_4.0.4.bb
+++ b/meta/recipes-support/libical/libical_4.0.5.bb
@@ -13,7 +13,7 @@ SECTION = "libs"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://flags.patch \
            "
-SRC_URI[sha256sum] = "c851cdb46da5e6397881dafaa592c5516fb49da05dd1bb095f711a6d20eac422"
+SRC_URI[sha256sum] = "cc09a3ac41d60e6144e644bd3fcf97d47106d659c4a0b8965102581401e67c9c"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 
-- 
2.47.1


--===============7294857016426475729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libical/libical: FILELIST: removed "/usr/lib/libical_cxx.so.4.0.4 /usr/lib/libical.so.4.0.4 /usr/lib/libical-glib.so.4.0.4 /usr/lib/libicalvcard.so.4.0.4 /usr/lib/libicalvcal.so.4.0.4 /usr/lib/libicalss.so.4.0.4 /usr/lib/libicalss_cxx.so.4.0.4", added "/usr/lib/libical_cxx.so.4.0.5 /usr/lib/libical.so.4.0.5 /usr/lib/libical-glib.so.4.0.5 /usr/lib/libicalvcard.so.4.0.5 /usr/lib/libicalvcal.so.4.0.5 /usr/lib/libicalss.so.4.0.5 /usr/lib/libicalss_cxx.so.4.0.5"
Changes to packages/x86-64-v3-poky-linux/libical (sysroot):
  /usr/lib/libical_cxx.so.4.0 changed symlink target from libical_cxx.so.4.0.4 to libical_cxx.so.4.0.5
  /usr/lib/libical-glib.so.4.0 changed symlink target from libical-glib.so.4.0.4 to libical-glib.so.4.0.5
  /usr/lib/libical.so.4.0 changed symlink target from libical.so.4.0.4 to libical.so.4.0.5
  /usr/lib/libicalss_cxx.so.4.0 changed symlink target from libicalss_cxx.so.4.0.4 to libicalss_cxx.so.4.0.5
  /usr/lib/libicalss.so.4.0 changed symlink target from libicalss.so.4.0.4 to libicalss.so.4.0.5
  /usr/lib/libicalvcal.so.4.0 changed symlink target from libicalvcal.so.4.0.4 to libicalvcal.so.4.0.5
  /usr/lib/libicalvcard.so.4.0 changed symlink target from libicalvcard.so.4.0.4 to libicalvcard.so.4.0.5
  /usr/lib/libical_cxx.so.4.0.4 moved to /usr/lib/libical_cxx.so.4.0.5
  /usr/lib/libical-glib.so.4.0.4 moved to /usr/lib/libical-glib.so.4.0.5
  /usr/lib/libical.so.4.0.4 moved to /usr/lib/libical.so.4.0.5
  /usr/lib/libicalss_cxx.so.4.0.4 moved to /usr/lib/libicalss_cxx.so.4.0.5
  /usr/lib/libicalss.so.4.0.4 moved to /usr/lib/libicalss.so.4.0.5
  /usr/lib/libicalvcal.so.4.0.4 moved to /usr/lib/libicalvcal.so.4.0.5
  /usr/lib/libicalvcard.so.4.0.4 moved to /usr/lib/libicalvcard.so.4.0.5

--===============7294857016426475729==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libical-upgrade-4.0.4-4.0.5.patch"

RnJvbSAwY2RhZGM3NTYzM2YwYjkxYWMyNGM0ZGIzMjE2ODAyYTdlYzQ1ZGVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTYgQXVnIDIwMjYgMDU6MTA6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJpY2FsOiB1cGdyYWRlIDQuMC40IC0+IDQuMC41CgpTb3VyY2U6IGRvY3MvNC4wLjUvcmVsZWFz
ZS5tZAoKIyBMaWJpY2FsIHY0LjAuNQoKIyMgT3ZlcnZpZXcKClRoaXMgaXMgYSBwYXRjaCByZWxl
YXNlIGFuZCBpcyBmdWxseSBzb3VyY2UgYW5kIGJpbmFyeSBjb21wYXRpYmxlIHdpdGggdmVyc2lv
biA0LjAuMC4KCltOb3RlOiB0aGUgbGliaWNhbHZjYXJkIGlzIGEgcmVsZWFzZWQgYXMgYSAqVGVj
aG5pY2FsIFByZXZpZXcqLiBBcyBzdWNoLAppdHMgQVBJIGlzIG5vdCBmaW5hbGl6ZWQgYW5kIG5v
IHNvdXJjZSBvciBiaW5hcnkgY29tcGF0aWJpbGl0eSBpcyBndWFyYW50ZWVkCndpdGggdGhhdCBs
aWJyYXJ5IGluIHRoZSA0LjAueCBzZXJpZXMuXQoKIyMgUmVsZWFzZU5vdGVzCgotIEZpeCAzMi1i
aXQgdGltZV90IHVwcGVyIGJvdW5kIG9mZiBieSB0d28gZGF5cy4KLSBCdWlsZHN5c3RlbTogZml4
IGxpYmljYWxfZGVwcmVjYXRlZF9vcHRpb24oKSB3cml0aW5nIHRoZSB3cm9uZyBjYWNoZSB2YWx1
ZQotIEJvZ3VzIFRaSURzIG5vIGxvbmdlciBjYXVzZSBhbiBlcnJvci4KLSBEVEVORCwgRFVSQVRJ
T04sIERVRSBwcm9wZXJ0eSB0eXBlcyBhbmQgdmFsdWVzIGFyZSBub3cgdmFsaWRhdGVkIHBlciBS
RkMgNTU0NSBTZWN0aW9ucyAzLjguMi4yIC0gMy44LjIuNS4KLSBCdWlsdC1pbiB0aW1lem9uZXMg
dXBkYXRlZCB0byB0emRhdGEyMDI2Yy4KClBsZWFzZSBzZWUgdGhlIFtDSEFOR0VMT0ddKGh0dHBz
Oi8vZ2l0aHViLmNvbS9saWJpY2FsL2xpYmljYWwvYmxvYi80LjAvQ0hBTkdFTE9HLm1kKSBmb3Ig
bW9yZS4KLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJpY2FsL2xpYmljYWwvZmxhZ3MucGF0
Y2ggICAgICAgICAgICAgICAgfCAyICstCiAuLi4vbGliaWNhbC97bGliaWNhbF80LjAuNC5iYiA9
PiBsaWJpY2FsXzQuMC41LmJifSAgICAgICAgICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJpY2FsL3tsaWJpY2FsXzQuMC40LmJiID0+IGxpYmljYWxfNC4wLjUuYmJ9ICg5NiUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaWNhbC9saWJpY2FsL2ZsYWdz
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaWNhbC9saWJpY2FsL2ZsYWdzLnBhdGNo
CmluZGV4IDg2ODMxNDU5MWMuLjkzZDNiNDFkMDMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYmljYWwvbGliaWNhbC9mbGFncy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJpY2FsL2xpYmljYWwvZmxhZ3MucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGNi
YThmNzYyZjZhMzI3MDUzMDU1MDkxNWQ5NTdjMDFmM2RhOWE2MDEgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGE1OGIwNzk3MTRjYzUwMzdhMzNlMjQ1MDJiNWMxYWFhM2I5OTkxNGMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaWxhbiBDcmhhIDxtY3JoYUByZWRoYXQuY29t
PgogRGF0ZTogV2VkLCAxMCBTZXAgMjAyNSAwOTo1MjozNyArMDIwMAogU3ViamVjdDogW1BBVENI
XSBsaWJpY2FsLWdsaWI6IEhpZGUgc29tZSB0YXJnZXQgb3B0aW9ucyBpbiB0aGUgaW5zdGFsbGVk
IENNYWtlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJpY2FsL2xpYmljYWxf
NC4wLjQuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJpY2FsL2xpYmljYWxfNC4wLjUuYmIK
c2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
aWNhbC9saWJpY2FsXzQuMC40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJp
Y2FsL2xpYmljYWxfNC4wLjUuYmIKaW5kZXggNTE2YzdhOTViMC4uOGVjNjU2ZWRkMiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaWNhbC9saWJpY2FsXzQuMC40LmJiCisrKyBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmljYWwvbGliaWNhbF80LjAuNS5iYgpAQCAtMTMsNyAr
MTMsNyBAQCBTRUNUSU9OID0gImxpYnMiCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9k
b3dubG9hZC92JHtQVn0vJHtCUH0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL2ZsYWdzLnBh
dGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImM4NTFjZGI0NmRhNWU2
Mzk3ODgxZGFmYWE1OTJjNTUxNmZiNDlkYTA1ZGQxYmIwOTVmNzExYTZkMjBlYWM0MjIiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiY2MwOWEzYWM0MWQ2MGU2MTQ0ZTY0NGJkM2ZjZjk3ZDQ3MTA2ZDY1
OWM0YTBiODk2NTEwMjU4MTQwMWU2N2M5YyIKIAogaW5oZXJpdCBjbWFrZSBwa2djb25maWcgZ29i
amVjdC1pbnRyb3NwZWN0aW9uIHZhbGEgZ2l0aHViLXJlbGVhc2VzCiAKLS0gCjIuNDcuMQoK

--===============7294857016426475729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libical: SRC_URI changed from "https://github.com/libical/libical/releases//download/v4.0.4/libical-4.0.4.tar.gz file://flags.patch" to "https://github.com/libical/libical/releases//download/v4.0.5/libical-4.0.5.tar.gz file://flags.patch"
packages/x86-64-v3-poky-linux/libical: PKGV changed from 4.0.4 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/libical: PV changed from "4.0.4" to "4.0.5"
packages/x86-64-v3-poky-linux/libical/libical-dbg: PKGSIZE changed from 5045416 to 5050848 (+0%)
packages/x86-64-v3-poky-linux/libical/libical-dbg: PKGV changed from 4.0.4 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/libical/libical-dbg: FILELIST: removed "/usr/lib/.debug/libicalss_cxx.so.4.0.4 /usr/lib/.debug/libicalvcard.so.4.0.4 /usr/lib/.debug/libical-glib.so.4.0.4 /usr/lib/.debug/libical_cxx.so.4.0.4 /usr/lib/.debug/libicalss.so.4.0.4 /usr/lib/.debug/libicalvcal.so.4.0.4 /usr/lib/.debug/libical.so.4.0.4", added "/usr/lib/.debug/libicalss_cxx.so.4.0.5 /usr/lib/.debug/libicalvcard.so.4.0.5 /usr/lib/.debug/libical-glib.so.4.0.5 /usr/lib/.debug/libical_cxx.so.4.0.5 /usr/lib/.debug/libicalss.so.4.0.5 /usr/lib/.debug/libicalvcal.so.4.0.5 /usr/lib/.debug/libical.so.4.0.5"
packages/x86-64-v3-poky-linux/libical/libical-dbg: PV changed from "4.0.4" to "4.0.5"
packages/x86-64-v3-poky-linux/libical/libical-dev: PKGV changed from 4.0.4 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/libical/libical-dev: PV changed from "4.0.4" to "4.0.5"
packages/x86-64-v3-poky-linux/libical/libical-doc: PKGV changed from 4.0.4 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/libical/libical-doc: PV changed from "4.0.4" to "4.0.5"
packages/x86-64-v3-poky-linux/libical/libical-locale: PKGV changed from 4.0.4 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/libical/libical-locale: PV changed from "4.0.4" to "4.0.5"
packages/x86-64-v3-poky-linux/libical/libical-src: PKGSIZE changed from 4375009 to 4380134 (+0%)
packages/x86-64-v3-poky-linux/libical/libical-src: PKGV changed from 4.0.4 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/libical/libical-src: FILELIST: directory renamed /usr/src/debug/libical/4.0.4/src/libicalss -> /usr/src/debug/libical/4.0.5/src/libicalss, directory renamed /usr/src/debug/libical/4.0.4/src/libical -> /usr/src/debug/libical/4.0.5/src/libical, directory renamed /usr/src/debug/libical/4.0.4/src/libicalvcard -> /usr/src/debug/libical/4.0.5/src/libicalvcard, directory renamed /usr/src/debug/libical/4.0.4 -> /usr/src/debug/libical/4.0.5, directory renamed /usr/src/debug/libical/4.0.4/src/libicalvcal -> /usr/src/debug/libical/4.0.5/src/libicalvcal, directory renamed /usr/src/debug/libical/4.0.4/src/libical-glib -> /usr/src/debug/libical/4.0.5/src/libical-glib
packages/x86-64-v3-poky-linux/libical/libical-src: PV changed from "4.0.4" to "4.0.5"
packages/x86-64-v3-poky-linux/libical/libical-staticdev: PKGV changed from 4.0.4 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/libical/libical-staticdev: PV changed from "4.0.4" to "4.0.5"
packages/x86-64-v3-poky-linux/libical/libical: PKGV changed from 4.0.4 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/libical/libical: FILELIST: removed "/usr/lib/libical_cxx.so.4.0.4 /usr/lib/libical.so.4.0.4 /usr/lib/libical-glib.so.4.0.4 /usr/lib/libicalvcal.so.4.0.4 /usr/lib/libicalss.so.4.0.4 /usr/lib/libicalss_cxx.so.4.0.4 /usr/lib/libicalvcard.so.4.0.4", added "/usr/lib/libical_cxx.so.4.0.5 /usr/lib/libical.so.4.0.5 /usr/lib/libical-glib.so.4.0.5 /usr/lib/libicalvcal.so.4.0.5 /usr/lib/libicalss.so.4.0.5 /usr/lib/libicalvcard.so.4.0.5 /usr/lib/libicalss_cxx.so.4.0.5"
packages/x86-64-v3-poky-linux/libical/libical: PV changed from "4.0.4" to "4.0.5"
Changes to packages/x86-64-v3-poky-linux/libical (sysroot):
  /usr/lib/libical_cxx.so.4.0 changed symlink target from libical_cxx.so.4.0.4 to libical_cxx.so.4.0.5
  /usr/lib/libical-glib.so.4.0 changed symlink target from libical-glib.so.4.0.4 to libical-glib.so.4.0.5
  /usr/lib/libical.so.4.0 changed symlink target from libical.so.4.0.4 to libical.so.4.0.5
  /usr/lib/libicalss_cxx.so.4.0 changed symlink target from libicalss_cxx.so.4.0.4 to libicalss_cxx.so.4.0.5
  /usr/lib/libicalss.so.4.0 changed symlink target from libicalss.so.4.0.4 to libicalss.so.4.0.5
  /usr/lib/libicalvcal.so.4.0 changed symlink target from libicalvcal.so.4.0.4 to libicalvcal.so.4.0.5
  /usr/lib/libicalvcard.so.4.0 changed symlink target from libicalvcard.so.4.0.4 to libicalvcard.so.4.0.5
  /usr/lib/libical_cxx.so.4.0.4 moved to /usr/lib/libical_cxx.so.4.0.5
  /usr/lib/libical-glib.so.4.0.4 moved to /usr/lib/libical-glib.so.4.0.5
  /usr/lib/libical.so.4.0.4 moved to /usr/lib/libical.so.4.0.5
  /usr/lib/libicalss_cxx.so.4.0.4 moved to /usr/lib/libicalss_cxx.so.4.0.5
  /usr/lib/libicalss.so.4.0.4 moved to /usr/lib/libicalss.so.4.0.5
  /usr/lib/libicalvcal.so.4.0.4 moved to /usr/lib/libicalvcal.so.4.0.5
  /usr/lib/libicalvcard.so.4.0.4 moved to /usr/lib/libicalvcard.so.4.0.5

--===============7294857016426475729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libical-changelog.txt"

Changelog for libical: 4.0.4 -> 4.0.5
Source: docs/4.0.5/release.md

# Libical v4.0.5

## Overview

This is a patch release and is fully source and binary compatible with version 4.0.0.

[Note: the libicalvcard is a released as a *Technical Preview*. As such,
its API is not finalized and no source or binary compatibility is guaranteed
with that library in the 4.0.x series.]

## ReleaseNotes

- Fix 32-bit time_t upper bound off by two days.
- Buildsystem: fix libical_deprecated_option() writing the wrong cache value
- Bogus TZIDs no longer cause an error.
- DTEND, DURATION, DUE property types and values are now validated per RFC 5545 Sections 3.8.2.2 - 3.8.2.5.
- Built-in timezones updated to tzdata2026c.

Please see the [CHANGELOG](https://github.com/libical/libical/blob/4.0/CHANGELOG.md) for more.

--===============7294857016426475729==--

