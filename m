Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55662C624DB
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 06:28:38 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3449.1788589712311880007
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 23:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=rGh04s3r;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=4dhWc8+b;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a070411f9a-30b57ec9-c728-4e27-b90e-ea3a952988c6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788589711;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=11eNdmthUAzOvCHV2S9TPFKTpzPw82cLh0qrfmKrQ98=;
	b=rGh04s3rR0Tvy2dTuuB5zHoWguZAnG0vrd5mZkTh2VLsHsgIsegMgmFJTP8hHzIk
	J/WZvVKVqpjg5Ui5lMizlPe1yplbf+kfvOAn+eh3orzWreLpOq5x5f+9f3h9PFWe2Ne
	nQcUVgoRA9PNG7qJlf0uZOwULVOWlm9rT6ilzIJg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788589711;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=11eNdmthUAzOvCHV2S9TPFKTpzPw82cLh0qrfmKrQ98=;
	b=4dhWc8+bMTDGJ4z3YbRQWCUo27YvbrkjyfSJ87jAlb6CbnGDf7Uqig7seZThQ2ci
	p2vFHajQe6jRjJ6MSK5rUMJRmpwXpfs/1ludjTEL0jrT2JG2oMkaVUwtr9vhLMFlj/W
	BdP+Uexvod2K6WUj5VVsWdc+tA3gAC2Us8/fdHNI=
Content-Type: multipart/mixed; boundary="===============2224590558091062908=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 3.0.7 SUCCEEDED
Message-ID: <010101a070411f9a-30b57ec9-c728-4e27-b90e-ea3a952988c6-000000@us-west-2.amazonses.com>
Date: Sat, 5 Sep 2026 06:28:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.05-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 06:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245131

--===============2224590558091062908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pkgconf* to *3.0.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-3.0.6-3.0.7.patch
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
From 8866a7044879849f35156cf22efe44dc12b7bae4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 5 Sep 2026 05:38:28 +0000
Subject: [PATCH] pkgconf: upgrade 3.0.6 -> 3.0.7

Source: NEWS

Changes from 3.0.6 to 3.0.7:
----------------------------

* Correctness fixes:
  - spdxtool now serializes the SPDX 3.0 suppliedBy property as a single Agent
    reference instead of a one-element array, as required by the official JSON
    schema.
  - bomtool no longer emits PackageDownloadLocation twice for each package.
  These fixes were contributed by R. Christian McDonald.

* Build, packaging and portability fixes:
  - The Windows installer uses a default installation directory without a
    space in its name.  Patch by Kai Pastor.
  - Skip the spdxtool allocation-failure test for static builds, where linker
    wrapping also intercepts libpkgconf allocations and invalidates the test.
    See https://github.com/pkgconf/pkgconf/issues/593.
  - Use PKGCONF_ITEM_SIZE instead of PATH_MAX in the test runner, allowing it
    to build on systems where PATH_MAX is not declared, such as GNU Hurd.
    See https://github.com/pkgconf/pkgconf/issues/600.
---
 .../pkgconf/{pkgconf_3.0.6.bb => pkgconf_3.0.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_3.0.6.bb => pkgconf_3.0.7.bb} (97%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb b/meta/recipes-devtools/pkgconf/pkgconf_3.0.7.bb
similarity index 97%
rename from meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_3.0.7.bb
index 471433e7b5..4579476ae4 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.6.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.7.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "c88a653fbabfa2a5857a30f6b6ad6c40dbacc3b7c72cc066e5c7dc4571cbddaa"
+SRC_URI[sha256sum] = "c926ff491cbd9a331a589160811bd97ab1749b4d5198a519338f2cdfabe6940a"
 UPSTREAM_CHECK_REGEX = "pkgconf-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)\.tar"
 
 inherit autotools pkgconfig
-- 
2.47.1


--===============2224590558091062908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="pkgconf-changelog.txt"

Changelog for pkgconf: 3.0.6 -> 3.0.7
Source: NEWS

Changes from 3.0.6 to 3.0.7:
----------------------------

* Correctness fixes:
  - spdxtool now serializes the SPDX 3.0 suppliedBy property as a single Agent
    reference instead of a one-element array, as required by the official JSON
    schema.
  - bomtool no longer emits PackageDownloadLocation twice for each package.
  These fixes were contributed by R. Christian McDonald.

* Build, packaging and portability fixes:
  - The Windows installer uses a default installation directory without a
    space in its name.  Patch by Kai Pastor.
  - Skip the spdxtool allocation-failure test for static builds, where linker
    wrapping also intercepts libpkgconf allocations and invalidates the test.
    See https://github.com/pkgconf/pkgconf/issues/593.
  - Use PKGCONF_ITEM_SIZE instead of PATH_MAX in the test runner, allowing it
    to build on systems where PATH_MAX is not declared, such as GNU Hurd.
    See https://github.com/pkgconf/pkgconf/issues/600.

--===============2224590558091062908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.ariadne.space/pkgconf/pkgconf-3.0.6.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.ariadne.space/pkgconf/pkgconf-3.0.7.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/x86-64-v3-poky-linux/pkgconf: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/x86-64-v3-poky-linux/pkgconf: PV changed from "3.0.6" to "3.0.7"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 791752 to 790664 (-0%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dbg: PV changed from "3.0.6" to "3.0.7"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-dev: PV changed from "3.0.6" to "3.0.7"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-doc: PV changed from "3.0.6" to "3.0.7"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-locale: PV changed from "3.0.6" to "3.0.7"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 574060 to 573681 (-0%)
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: FILELIST: directory renamed /usr/src/debug/pkgconf/3.0.6/cli/spdxtool -> /usr/src/debug/pkgconf/3.0.7/cli/spdxtool, directory renamed /usr/src/debug/pkgconf/3.0.6/libpkgconf -> /usr/src/debug/pkgconf/3.0.7/libpkgconf, directory renamed /usr/src/debug/pkgconf/3.0.6/cli/pccritic -> /usr/src/debug/pkgconf/3.0.7/cli/pccritic, directory renamed /usr/src/debug/pkgconf/3.0.6/cli/bomtool -> /usr/src/debug/pkgconf/3.0.7/cli/bomtool, directory renamed /usr/src/debug/pkgconf/3.0.6/cli -> /usr/src/debug/pkgconf/3.0.7/cli
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-src: PV changed from "3.0.6" to "3.0.7"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "3.0.6" to "3.0.7"
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/x86-64-v3-poky-linux/pkgconf/pkgconf: PV changed from "3.0.6" to "3.0.7"
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/libxml2-native (sysroot):
  /usr/lib/libxml2.so.16 changed symlink target from libxml2.so.16.1.4 to libxml2.so.16.1.3
  /usr/lib/libxml2.so changed symlink target from libxml2.so.16.1.4 to libxml2.so.16.1.3
  /usr/lib/libxml2.so.16.1.4 moved to /usr/lib/libxml2.so.16.1.3

--===============2224590558091062908==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-3.0.6-3.0.7.patch"

RnJvbSA4ODY2YTcwNDQ4Nzk4NDlmMzUxNTZjZjIyZWZlNDRkYzEyYjdiYWU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNSBTZXAgMjAyNiAwNTozODoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBr
Z2NvbmY6IHVwZ3JhZGUgMy4wLjYgLT4gMy4wLjcKClNvdXJjZTogTkVXUwoKQ2hhbmdlcyBmcm9t
IDMuMC42IHRvIDMuMC43OgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgoqIENvcnJlY3Ru
ZXNzIGZpeGVzOgogIC0gc3BkeHRvb2wgbm93IHNlcmlhbGl6ZXMgdGhlIFNQRFggMy4wIHN1cHBs
aWVkQnkgcHJvcGVydHkgYXMgYSBzaW5nbGUgQWdlbnQKICAgIHJlZmVyZW5jZSBpbnN0ZWFkIG9m
IGEgb25lLWVsZW1lbnQgYXJyYXksIGFzIHJlcXVpcmVkIGJ5IHRoZSBvZmZpY2lhbCBKU09OCiAg
ICBzY2hlbWEuCiAgLSBib210b29sIG5vIGxvbmdlciBlbWl0cyBQYWNrYWdlRG93bmxvYWRMb2Nh
dGlvbiB0d2ljZSBmb3IgZWFjaCBwYWNrYWdlLgogIFRoZXNlIGZpeGVzIHdlcmUgY29udHJpYnV0
ZWQgYnkgUi4gQ2hyaXN0aWFuIE1jRG9uYWxkLgoKKiBCdWlsZCwgcGFja2FnaW5nIGFuZCBwb3J0
YWJpbGl0eSBmaXhlczoKICAtIFRoZSBXaW5kb3dzIGluc3RhbGxlciB1c2VzIGEgZGVmYXVsdCBp
bnN0YWxsYXRpb24gZGlyZWN0b3J5IHdpdGhvdXQgYQogICAgc3BhY2UgaW4gaXRzIG5hbWUuICBQ
YXRjaCBieSBLYWkgUGFzdG9yLgogIC0gU2tpcCB0aGUgc3BkeHRvb2wgYWxsb2NhdGlvbi1mYWls
dXJlIHRlc3QgZm9yIHN0YXRpYyBidWlsZHMsIHdoZXJlIGxpbmtlcgogICAgd3JhcHBpbmcgYWxz
byBpbnRlcmNlcHRzIGxpYnBrZ2NvbmYgYWxsb2NhdGlvbnMgYW5kIGludmFsaWRhdGVzIHRoZSB0
ZXN0LgogICAgU2VlIGh0dHBzOi8vZ2l0aHViLmNvbS9wa2djb25mL3BrZ2NvbmYvaXNzdWVzLzU5
My4KICAtIFVzZSBQS0dDT05GX0lURU1fU0laRSBpbnN0ZWFkIG9mIFBBVEhfTUFYIGluIHRoZSB0
ZXN0IHJ1bm5lciwgYWxsb3dpbmcgaXQKICAgIHRvIGJ1aWxkIG9uIHN5c3RlbXMgd2hlcmUgUEFU
SF9NQVggaXMgbm90IGRlY2xhcmVkLCBzdWNoIGFzIEdOVSBIdXJkLgogICAgU2VlIGh0dHBzOi8v
Z2l0aHViLmNvbS9wa2djb25mL3BrZ2NvbmYvaXNzdWVzLzYwMC4KLS0tCiAuLi4vcGtnY29uZi97
cGtnY29uZl8zLjAuNi5iYiA9PiBwa2djb25mXzMuMC43LmJifSAgICAgICAgICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi97cGtnY29uZl8zLjAuNi5iYiA9PiBwa2djb25m
XzMuMC43LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2dj
b25mL3BrZ2NvbmZfMy4wLjYuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2dj
b25mXzMuMC43LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMy4wLjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMy4wLjcuYmIKaW5kZXggNDcxNDMzZTdiNS4uNDU3
OTQ3NmFlNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtnY29u
Zl8zLjAuNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzMu
MC43LmJiCkBAIC0yMCw3ICsyMCw3IEBAIFNSQ19VUkkgPSAiXAogICAgIGZpbGU6Ly9wa2ctY29u
ZmlnLW5hdGl2ZS5pbiBcCiAgICAgZmlsZTovL3BrZy1jb25maWctZXNkay5pbiBcCiAiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiYzg4YTY1M2ZiYWJmYTJhNTg1N2EzMGY2YjZhZDZjNDBkYmFjYzNi
N2M3MmNjMDY2ZTVjN2RjNDU3MWNiZGRhYSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjOTI2ZmY0
OTFjYmQ5YTMzMWE1ODkxNjA4MTFiZDk3YWIxNzQ5YjRkNTE5OGE1MTkzMzhmMmNkZmFiZTY5NDBh
IgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicGtnY29uZi0oP1A8cHZlcj5cZCtcLlxkK1wuKD8h
OVxkKylcZCspXC50YXIiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZwotLSAKMi40Ny4x
Cgo=

--===============2224590558091062908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/libxml2-native (sysroot):
  /usr/lib/libxml2.so.16 changed symlink target from libxml2.so.16.1.4 to libxml2.so.16.1.3
  /usr/lib/libxml2.so changed symlink target from libxml2.so.16.1.4 to libxml2.so.16.1.3
  /usr/lib/libxml2.so.16.1.4 moved to /usr/lib/libxml2.so.16.1.3

--===============2224590558091062908==--

