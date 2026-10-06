Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC96CA6002
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 06:25:06 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39331.1791267900170713878
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 23:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=i6tF8rac;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=yYBTmRt3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a10fe308f6-49bcaeff-6a13-42af-ae64-44bc6d895059-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791267899;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=f+4AMIRWj+FdV+e2GQ8NZLho/8m0Uip7X7c8L7dbrrg=;
	b=i6tF8racZbs48GeDSiVsydAAMemYo5z2GakTHTVJ+KwNbu6MoDKaNz/6EHsFa8n7
	gZKgErLTJCEkKAdfnItUW22KB3Sw0+xL5rS4DlV/Xv00mCJ0VBeVeLw0IFtjpadQF/3
	oc5KWJw8oKB4loU970I4R6s2yPwc1nANxx3FDB7w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791267899;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=f+4AMIRWj+FdV+e2GQ8NZLho/8m0Uip7X7c8L7dbrrg=;
	b=yYBTmRt3JpX/562JNAVySyXzTY2egIqU2NRb8Bs0TDGAqti1XI3LwGw79nSOcXHC
	0Smc71Xs5uBVjV3qzT0FD8YUyHqKsOAezyrTynigPS/hicluHYT7RLMmSc5HfgQ9c68
	uiWRXAu1Hus98kbD3G+aSgvklRkoKPuUEfzqtvu0=
Content-Type: multipart/mixed; boundary="===============6858272748055877402=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 14.6.0 SUCCEEDED
Message-ID: <010101a10fe308f6-49bcaeff-6a13-42af-ae64-44bc6d895059-000000@us-west-2.amazonses.com>
Date: Tue, 6 Oct 2026 06:24:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.06-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 06:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247272

--===============6858272748055877402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *harfbuzz* to *14.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-14.5.1-14.6.0.patch
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
From 2975249c2cb750abe301b00689d8e409dee264c7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 6 Oct 2026 06:24:49 +0000
Subject: [PATCH] harfbuzz: upgrade 14.5.1 -> 14.6.0

Overview of changes leading to 14.6.0
Monday, October 5, 2026
=====================================
- Fix shaping failures caused by out-of-range glyph IDs, a regression from
  11.4.0.
- Update experimental beyond-64k support to the final ISO Open Font Format
  5th edition. This support remains disabled by default.
- Add support for the `DMAP` table.
- Support `FeatureVariations` 1.1 lookup variations, including subsetting and
  instancing.
- Update `VARC` to the revised variation-store format. The new format is
  incompatible with the previous one.
- Various `VARC` fixes.
- Fix background color and stride handling in the experimental raster library.
- Improve the experimental Rust shaper (HarfRust) and font functions
  (`fontations`), and update HarfRust to 0.14.
- Various subsetting fixes and improvements.
- Various fixes for malformed fonts.
- Various build and CI fixes.
---
 .../harfbuzz/{harfbuzz_14.5.1.bb => harfbuzz_14.6.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_14.5.1.bb => harfbuzz_14.6.0.bb} (96%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_14.6.0.bb
similarity index 96%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_14.5.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_14.6.0.bb
index d10f1bfa01..7ef0897a18 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_14.6.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7e2fa4e8c7c98e8d8140671f5772542afaaa6acccfbd746506886b6d85f7f8d6"
+SRC_URI[sha256sum] = "d07a007327277708a2a73ae437887cdbaf282937f6d03ca5467723e9099af586"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
 
-- 
2.47.1


--===============6858272748055877402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61451.0", added "/usr/lib/libharfbuzz-cairo.so.0.61460.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61451.0", added "/usr/lib/libharfbuzz-gobject.so.0.61460.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61451.0", added "/usr/lib/libharfbuzz-icu.so.0.61460.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61451.0", added "/usr/lib/libharfbuzz-subset.so.0.61460.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61451.0", added "/usr/lib/libharfbuzz.so.0.61460.0"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61451.0 to libharfbuzz-cairo.so.0.61460.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61451.0 to libharfbuzz-gobject.so.0.61460.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61451.0 to libharfbuzz-icu.so.0.61460.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61451.0 to libharfbuzz.so.0.61460.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61451.0 to libharfbuzz-subset.so.0.61460.0
  /usr/lib/libharfbuzz-cairo.so.0.61451.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61460.0
  /usr/lib/libharfbuzz-gobject.so.0.61451.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61460.0
  /usr/lib/libharfbuzz-icu.so.0.61451.0 moved to /usr/lib/libharfbuzz-icu.so.0.61460.0
  /usr/lib/libharfbuzz.so.0.61451.0 moved to /usr/lib/libharfbuzz.so.0.61460.0
  /usr/lib/libharfbuzz-subset.so.0.61451.0 moved to /usr/lib/libharfbuzz-subset.so.0.61460.0

--===============6858272748055877402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="harfbuzz-changelog.txt"

Overview of changes leading to 14.6.0
Monday, October 5, 2026
=====================================
- Fix shaping failures caused by out-of-range glyph IDs, a regression from
  11.4.0.
- Update experimental beyond-64k support to the final ISO Open Font Format
  5th edition. This support remains disabled by default.
- Add support for the `DMAP` table.
- Support `FeatureVariations` 1.1 lookup variations, including subsetting and
  instancing.
- Update `VARC` to the revised variation-store format. The new format is
  incompatible with the previous one.
- Various `VARC` fixes.
- Fix background color and stride handling in the experimental raster library.
- Improve the experimental Rust shaper (HarfRust) and font functions
  (`fontations`), and update HarfRust to 0.14.
- Various subsetting fixes and improvements.
- Various fixes for malformed fonts.
- Various build and CI fixes.

--===============6858272748055877402==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-14.5.1-14.6.0.patch"

RnJvbSAyOTc1MjQ5YzJjYjc1MGFiZTMwMWIwMDY4OWQ4ZTQwOWRlZTI2NGM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgNiBPY3QgMjAyNiAwNjoyNDo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGhh
cmZidXp6OiB1cGdyYWRlIDE0LjUuMSAtPiAxNC42LjAKCk92ZXJ2aWV3IG9mIGNoYW5nZXMgbGVh
ZGluZyB0byAxNC42LjAKTW9uZGF5LCBPY3RvYmVyIDUsIDIwMjYKPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PQotIEZpeCBzaGFwaW5nIGZhaWx1cmVzIGNhdXNlZCBieSBvdXQt
b2YtcmFuZ2UgZ2x5cGggSURzLCBhIHJlZ3Jlc3Npb24gZnJvbQogIDExLjQuMC4KLSBVcGRhdGUg
ZXhwZXJpbWVudGFsIGJleW9uZC02NGsgc3VwcG9ydCB0byB0aGUgZmluYWwgSVNPIE9wZW4gRm9u
dCBGb3JtYXQKICA1dGggZWRpdGlvbi4gVGhpcyBzdXBwb3J0IHJlbWFpbnMgZGlzYWJsZWQgYnkg
ZGVmYXVsdC4KLSBBZGQgc3VwcG9ydCBmb3IgdGhlIGBETUFQYCB0YWJsZS4KLSBTdXBwb3J0IGBG
ZWF0dXJlVmFyaWF0aW9uc2AgMS4xIGxvb2t1cCB2YXJpYXRpb25zLCBpbmNsdWRpbmcgc3Vic2V0
dGluZyBhbmQKICBpbnN0YW5jaW5nLgotIFVwZGF0ZSBgVkFSQ2AgdG8gdGhlIHJldmlzZWQgdmFy
aWF0aW9uLXN0b3JlIGZvcm1hdC4gVGhlIG5ldyBmb3JtYXQgaXMKICBpbmNvbXBhdGlibGUgd2l0
aCB0aGUgcHJldmlvdXMgb25lLgotIFZhcmlvdXMgYFZBUkNgIGZpeGVzLgotIEZpeCBiYWNrZ3Jv
dW5kIGNvbG9yIGFuZCBzdHJpZGUgaGFuZGxpbmcgaW4gdGhlIGV4cGVyaW1lbnRhbCByYXN0ZXIg
bGlicmFyeS4KLSBJbXByb3ZlIHRoZSBleHBlcmltZW50YWwgUnVzdCBzaGFwZXIgKEhhcmZSdXN0
KSBhbmQgZm9udCBmdW5jdGlvbnMKICAoYGZvbnRhdGlvbnNgKSwgYW5kIHVwZGF0ZSBIYXJmUnVz
dCB0byAwLjE0LgotIFZhcmlvdXMgc3Vic2V0dGluZyBmaXhlcyBhbmQgaW1wcm92ZW1lbnRzLgot
IFZhcmlvdXMgZml4ZXMgZm9yIG1hbGZvcm1lZCBmb250cy4KLSBWYXJpb3VzIGJ1aWxkIGFuZCBD
SSBmaXhlcy4KLS0tCiAuLi4vaGFyZmJ1enove2hhcmZidXp6XzE0LjUuMS5iYiA9PiBoYXJmYnV6
el8xNC42LjAuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enov
e2hhcmZidXp6XzE0LjUuMS5iYiA9PiBoYXJmYnV6el8xNC42LjAuYmJ9ICg5NiUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZidXp6XzE0LjUuMS5iYiBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xNC42LjAuYmIKc2ltaWxh
cml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6
L2hhcmZidXp6XzE0LjUuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZi
dXp6L2hhcmZidXp6XzE0LjYuMC5iYgppbmRleCBkMTBmMWJmYTAxLi43ZWYwODk3YTE4IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMTQuNS4xLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xNC42LjAuYmIK
QEAgLTksNyArOSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWI5
ODQyOWI4ZThlM2MyYTY3Y2ZlZjAxZTk5ZTQ4OTNkIFwKICAgICAgICAgICAgICAgICAgICAgIgog
CiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS8ke0JQTn0tJHtQ
Vn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdlMmZhNGU4YzdjOThlOGQ4MTQwNjcx
ZjU3NzI1NDJhZmFhYTZhY2NjZmJkNzQ2NTA2ODg2YjZkODVmN2Y4ZDYiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiZDA3YTAwNzMyNzI3NzcwOGEyYTczYWU0Mzc4ODdjZGJhZjI4MjkzN2Y2ZDAzY2E1
NDY3NzIzZTkwOTlhZjU4NiIKIAogaW5oZXJpdCBtZXNvbiBwa2djb25maWcgbGliX3BhY2thZ2Ug
Z3RrLWRvYyBnb2JqZWN0LWludHJvc3BlY3Rpb24gZ2l0aHViLXJlbGVhc2VzCiAKLS0gCjIuNDcu
MQoK

--===============6858272748055877402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "14.5.1" to "14.6.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 14.5.1 [default] to 14.6.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61451.0", added "/usr/lib/libharfbuzz-cairo.so.0.61460.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: PV changed from "14.5.1" to "14.6.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: PKGV changed from 14.5.1 [default] to 14.6.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILES: removed "/usr/lib/libharfbuzz-cairo.so.0.61451.0", added "/usr/lib/libharfbuzz-cairo.so.0.61460.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz.so.0.61451.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61451.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61451.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61451.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61451.0", added "/usr/lib/.debug/libharfbuzz-subset.so.0.61460.0 /usr/lib/.debug/libharfbuzz.so.0.61460.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61460.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61460.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61460.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "14.5.1" to "14.6.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 14.5.1 [default] to 14.6.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 97890400 to 99305920 (+1%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "14.5.1" to "14.6.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 14.5.1 [default] to 14.6.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "14.5.1" to "14.6.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 14.5.1 [default] to 14.6.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61451.0", added "/usr/lib/libharfbuzz-gobject.so.0.61460.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: PV changed from "14.5.1" to "14.6.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: PKGV changed from 14.5.1 [default] to 14.6.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILES: removed "/usr/lib/libharfbuzz-gobject.so.0.61451.0", added "/usr/lib/libharfbuzz-gobject.so.0.61460.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61451.0", added "/usr/lib/libharfbuzz-icu.so.0.61460.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "14.5.1" to "14.6.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 14.5.1 [default] to 14.6.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILES: removed "/usr/lib/libharfbuzz-icu.so.0.61451.0", added "/usr/lib/libharfbuzz-icu.so.0.61460.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "14.5.1" to "14.6.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 14.5.1 [default] to 14.6.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: FILELIST: directory renamed /usr/src/debug/harfbuzz/14.5.1/src/OT/Color/CBDT -> /usr/src/debug/harfbuzz/14.6.0/src/OT/Color/CBDT, directory renamed /usr/src/debug/harfbuzz/14.5.1/src/graph -> /usr/src/debug/harfbuzz/14.6.0/src/graph, directory renamed /usr/src/debug/harfbuzz/14.5.1/src/OT/glyf -> /usr/src/debug/harfbuzz/14.6.0/src/OT/glyf, directory renamed /usr/src/debug/harfbuzz/14.5.1/src/OT/Layout/GSUB -> /usr/src/debug/harfbuzz/14.6.0/src/OT/Layout/GSUB, directory renamed /usr/src/debug/harfbuzz/14.5.1/src/OT/Layout/GPOS -> /usr/src/debug/harfbuzz/14.6.0/src/OT/Layout/GPOS, directory renamed /usr/src/debug/harfbuzz/14.5.1/util -> /usr/src/debug/harfbuzz/14.6.0/util, directory renamed /usr/src/debug/harfbuzz/14.5.1/src/OT/Var/VARC -> /usr/src/debug/harfbuzz/14.6.0/src/OT/Var/VARC, directory renamed /usr/src/debug/harfbuzz/14.5.1/src/OT/Color/sbix -> /usr/src/debug/harfbuzz/14.6.0/src/OT/Color/sbix, directory renamed /usr/src/de
 bug/harfbuzz/14.5.1/src/OT/Color/svg -> /usr/src/debug/harfbuzz/14.6.0/src/OT/Color/svg, directory renamed /usr/src/debug/harfbuzz/14.5.1/src/OT/Color/CPAL -> /usr/src/debug/harfbuzz/14.6.0/src/OT/Color/CPAL, directory renamed /usr/src/debug/harfbuzz/14.5.1/src/OT/Layout/Common -> /usr/src/debug/harfbuzz/14.6.0/src/OT/Layout/Common, directory renamed /usr/src/debug/harfbuzz/14.5.1/src/OT/name -> /usr/src/debug/harfbuzz/14.6.0/src/OT/name, directory renamed /usr/src/debug/harfbuzz/14.5.1/src/OT/Layout/GDEF -> /usr/src/debug/harfbuzz/14.6.0/src/OT/Layout/GDEF, directory renamed /usr/src/debug/harfbuzz/14.5.1/src/OT/Color/COLR -> /usr/src/debug/harfbuzz/14.6.0/src/OT/Color/COLR, removed "/usr/src/debug/harfbuzz/14.5.1/src/hb-ft.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-fetch.h /usr/src/debug/harfbuzz/14.5.1/src/hb-font.h /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-paint-extents.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-iter.hh /usr/src/deb
 ug/harfbuzz/14.5.1/src/hb-ot-shaper-arabic-joining-list.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-unicode.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-var-cvar-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-var-fvar-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-null.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ucd.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-unicode-emoji-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-gobject-enums.h /usr/src/debug/harfbuzz/14.5.1/src/hb-static.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-number.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-version.h /usr/src/debug/harfbuzz/14.5.1/src/hb-font.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/14.5.1/s
 rc/hb-subset-instancer-solver.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-limits.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-math.h /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-deprecated.h /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-subset.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-shaper.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-depend-data.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shaper-arabic-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-aat-map.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-color.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-common.h /usr/src/debug/harfbuzz/14.5.1/src/hb-glib.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-map.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/14.
 5.1/src/hb-paint-bounded.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-draw.h /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-var.h /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-table-color.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-table-other.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-name.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-result.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-name-language.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-open-file.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-aat-layout.h /usr/src/debug/harfbuzz/14.5.1/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-cairo-utils.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-open-type.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-tag
 .cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-face.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-face.h /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-serialize.h /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-plan-var.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-buffer.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-style.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-layout-base-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-cairo-utils.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-common.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-repacker.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-style.h /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-o
 t-kern-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-maxp-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-meta-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-post-macroman.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shape-normalize.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-instancer-iup.cc /usr/src/debug/harfbuzz/14.5.1/src/OT/Layout/types.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-draw.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-buffer.h /usr/src/debug/harfbuzz/14.5.1/src/hb-paint-bounded.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-utf.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-face.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-cff-specializer.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-outline.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-shape.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shaper-vowel-constraints.cc /usr/src/debu
 g/harfbuzz/14.5.1/src/hb-paint.h /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-cff2-to-cff1.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-draw.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-var.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-depend.h /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-plan-layout.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shaper-myanmar.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-multimap.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-map.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-dispatch.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-color.h /usr/src/debug/harfbuzz/14.5.1/src/hb-set-digest.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-accelerator.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-subset.h /usr/src/debug/harfbuzz/14.5.1/src/hb-kern.hh 
 /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shape-normalize.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-cache.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-cff2-table.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-bimap.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-cff-width-optimizer.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shaper-thai.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-vector.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-mutex.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-table-layout.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-layout-gsubgpos.hh 
 /usr/src/debug/harfbuzz/14.5.1/src/hb-depend.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-input.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-string-array.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-unicode.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shaper-arabic.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-instancer-solver.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-paint.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ft.h /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-buffer-verify.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-cairo.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-cairo.h /usr/src/debug/harfbuzz/14.5.1/src/hb.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-geometry.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-table-cff.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-table-var.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-atomic.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-face.cc /usr/src/debug/
 harfbuzz/14.5.1/src/hb-aat-map.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-unicode.h /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/14.5.1/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-map.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-meta.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-map.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-os2-unicode-ranges.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shaper-syllabic.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-paint.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-blob.h /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shaper-use-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-fetch.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-buffer-serialize.cc /u
 sr/src/debug/harfbuzz/14.5.1/src/hb-ot-layout.h /usr/src/debug/harfbuzz/14.5.1/src/hb-depend.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-sanitize.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-face.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-subset.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-meta.h /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-name.h /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-math.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-bit-set.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-aat-layout-kerx-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-buffer.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-free-pool.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-shaper.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-font.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-plan-member-list.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-paint-extents.cc /us
 r/src/debug/harfbuzz/14.5.1/src/hb-set.h /usr/src/debug/harfbuzz/14.5.1/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-cff-interp-common.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-head-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-blob.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-layout-common.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-fallback-shape.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-bit-page.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-outline.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-shape.h /usr/src/debug/harfbuzz/14.5.1/src/hb-machinery.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-cff-common.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-s
 ubset-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-post-table-v2subset.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-serialize.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-debug.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-alloc-pool.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-map.h /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-deprecated.h /usr/src/debug/harfbuzz/14.5.1/src/hb-ft-colr.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-instancer-iup.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-script-list.h /usr/src/debug/harfbuzz/14.5.1/src/hb-algs.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-blob.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-number.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-set.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-icu.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-fac
 e-builder.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-name-language-static.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-object.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-font.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shaper-arabic-win1256.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-subset-input.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-shape-plan.h /usr/src/debug/harfbuzz/14.5.1/src/hb-decycler.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-font.h /usr/src/debug/harfbuzz/14.5.1/src/hb-array.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-serialize.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-set.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-cff-common.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-shaper-hangul.cc /usr/src/debug/har
 fbuzz/14.5.1/src/hb-ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-ot-meta.cc /usr/src/debug/harfbuzz/14.5.1/src/hb-shape-plan.cc", added "/usr/src/debug/harfbuzz/14.6.0/src/hb-ft.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-fetch.h /usr/src/debug/harfbuzz/14.6.0/src/hb-font.h /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-paint-extents.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-iter.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-arabic-joining-list.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-unicode.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-var-cvar-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-var-fvar-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-null.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/14.6.0/src/h
 b-ucd.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-unicode-emoji-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-gobject-enums.h /usr/src/debug/harfbuzz/14.6.0/src/hb-static.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-number.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-version.h /usr/src/debug/harfbuzz/14.6.0/src/hb-font.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-instancer-solver.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-limits.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-math.h /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-deprecated.h /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-subset.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-shaper.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-depend-data.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-arabic-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-map.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot
 -color.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-common.h /usr/src/debug/harfbuzz/14.6.0/src/hb-glib.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-map.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-paint-bounded.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-draw.h /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-var.h /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-table-color.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-table-other.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-name.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-result.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-name-language.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/14.6.0/src/
 hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-open-file.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-layout.h /usr/src/debug/harfbuzz/14.6.0/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-cairo-utils.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-open-type.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-tag.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-face.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-face.h /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-dual.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-serialize.h /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-plan-var.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-buffer.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-style.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-layout-base-table.hh /usr/sr
 c/debug/harfbuzz/14.6.0/src/hb-cairo-utils.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-common.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-repacker.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-style.h /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-kern-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-maxp-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-meta-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-post-macroman.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shape-normalize.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-instancer-iup.cc /usr/src/debug/harfbuzz/14
 .6.0/src/hb-draw.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-buffer.h /usr/src/debug/harfbuzz/14.6.0/src/hb-paint-bounded.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-utf.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-face.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-cff-specializer.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-outline.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-shape.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-vowel-constraints.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-paint.h /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-cff2-to-cff1.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-draw.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-var.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-depend.h /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-plan-layout.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-myanmar.cc /us
 r/src/debug/harfbuzz/14.6.0/src/hb-multimap.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-map.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-dispatch.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-color.h /usr/src/debug/harfbuzz/14.6.0/src/hb-set-digest.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-accelerator.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset.h /usr/src/debug/harfbuzz/14.6.0/src/hb-kern.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shape-normalize.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-cache.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-cff2-table.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-bimap.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-cff-width-optimizer.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-sha
 per-thai.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-vector.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-mutex.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-table-layout.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-layout-gsubgpos.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-depend.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-input.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-string-array.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-unicode.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-arabic.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-instancer-solver.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-paint.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ft.h /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-buffer-verify.cc /usr/src/debug/har
 fbuzz/14.6.0/src/hb-cairo.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-cairo.h /usr/src/debug/harfbuzz/14.6.0/src/hb.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-geometry.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-table-cff.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-table-var.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-atomic.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-face.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-map.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-unicode.h /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/14.6.0/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-map.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-meta.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-map.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-os2-unicode-r
 anges.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-syllabic.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-paint.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-blob.h /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-use-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-fetch.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-buffer-serialize.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-layout.h /usr/src/debug/harfbuzz/14.6.0/src/hb-depend.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-sanitize.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-face.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-meta.h /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-name.h /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-math.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-bit-set.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-layout-
 kerx-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-buffer.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-free-pool.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-shaper.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-font.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-plan-member-list.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-paint-extents.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-set.h /usr/src/debug/harfbuzz/14.6.0/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-cff-interp-common.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-head-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-blob.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-layout-common.hh /usr/src/deb
 ug/harfbuzz/14.6.0/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-fallback-shape.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-bit-page.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-outline.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-shape.h /usr/src/debug/harfbuzz/14.6.0/src/hb-machinery.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-cff-common.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-post-table-v2subset.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-serialize.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-debug.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-alloc-pool.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-map.h /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-deprecated.h /usr/src/debug/harfbuzz/14.6.0/src/hb-ft-colr.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-instancer-iu
 p.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-script-list.h /usr/src/debug/harfbuzz/14.6.0/src/hb-algs.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-blob.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-number.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-set.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-icu.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-face-builder.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-name-language-static.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-object.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-font.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-arabic-win1256.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-subset-input.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-shape-plan.h /usr/src/debug/harfbuzz/14.6.0/src/hb-decycler.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-
 ot-font.h /usr/src/debug/harfbuzz/14.6.0/src/hb-array.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-serialize.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-set.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-cff-common.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-ot-meta.cc /usr/src/debug/harfbuzz/14.6.0/src/hb-shape-plan.cc"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PV changed from "14.5.1" to "14.6.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 14.5.1 [default] to 14.6.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 5714639 to 5786657 (+1%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "14.5.1" to "14.6.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 14.5.1 [default] to 14.6.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61451.0", added "/usr/lib/libharfbuzz-subset.so.0.61460.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "14.5.1" to "14.6.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 14.5.1 [default] to 14.6.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 1087655 to 1116327 (+3%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILES: removed "/usr/lib/libharfbuzz-subset.so.0.61451.0", added "/usr/lib/libharfbuzz-subset.so.0.61460.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61451.0", added "/usr/lib/libharfbuzz.so.0.61460.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PV changed from "14.5.1" to "14.6.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGV changed from 14.5.1 [default] to 14.6.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1084192 to 1088288 (+0%)
packages/x86-64-v3-poky-linux/harfbuzz: PV changed from "14.5.1" to "14.6.0"
packages/x86-64-v3-poky-linux/harfbuzz: PKGV changed from 14.5.1 [default] to 14.6.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/14.5.1/harfbuzz-14.5.1.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases//download/14.6.0/harfbuzz-14.6.0.tar.xz"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61451.0 to libharfbuzz-cairo.so.0.61460.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61451.0 to libharfbuzz-gobject.so.0.61460.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61451.0 to libharfbuzz-icu.so.0.61460.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61451.0 to libharfbuzz.so.0.61460.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61451.0 to libharfbuzz-subset.so.0.61460.0
  /usr/lib/libharfbuzz-cairo.so.0.61451.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61460.0
  /usr/lib/libharfbuzz-gobject.so.0.61451.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61460.0
  /usr/lib/libharfbuzz-icu.so.0.61451.0 moved to /usr/lib/libharfbuzz-icu.so.0.61460.0
  /usr/lib/libharfbuzz.so.0.61451.0 moved to /usr/lib/libharfbuzz.so.0.61460.0
  /usr/lib/libharfbuzz-subset.so.0.61451.0 moved to /usr/lib/libharfbuzz-subset.so.0.61460.0

--===============6858272748055877402==--

