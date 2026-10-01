Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB93CA5FD7
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 06:31:53 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5425.1790836304317151112
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 23:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=mPKyO+Qv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=3TyC5kse;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a0f62965ff-365a260b-5a0a-4c59-ac01-e840d45b41bd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790836303;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=HES4qXKJrae95bHcuSpqpbalA1WQ1NvVeVnDfyJika0=;
	b=mPKyO+QvLFrPlYWBZkHBkDoaK078CnYzfB6KSGfU1eKjUf6c0G2RWueO+wvcL8+Q
	e99JQ0NolA2xg5BUMoCNVcF1HHh7XVQiHd1jTxZ8HRev5KLN7Wsm/ddCcsUduCy/76+
	nFRTqfmHbY5uhDVCi+KpSYquUOvMYQN+LTNmjTU0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790836303;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=HES4qXKJrae95bHcuSpqpbalA1WQ1NvVeVnDfyJika0=;
	b=3TyC5ksemLWY5VB1Kl+THjimjKaSGzZ2RxqEwdNAYLb8ZLXzSlXQpdWRlpGONUhr
	I8fwdKX8MScxAX0EDMNwGjpDWE5HexEVhrF4rSd66WGd38TJfb/3SP5+mdwsBTeP9+l
	3E+80fKgUkJMNsnrXDzxDBrQvO5JrwIkgQ3Mzg9w=
Content-Type: multipart/mixed; boundary="===============5418216839901937385=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 14.5.1 SUCCEEDED
Message-ID: <010101a0f62965ff-365a260b-5a0a-4c59-ac01-e840d45b41bd-000000@us-west-2.amazonses.com>
Date: Thu, 1 Oct 2026 06:31:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 06:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247007

--===============5418216839901937385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *harfbuzz* to *14.5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-14.5.0-14.5.1.patch
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
From cc1bd71f146542e1d3003495b7106ced1fe062e2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Oct 2026 06:11:55 +0000
Subject: [PATCH] harfbuzz: upgrade 14.5.0 -> 14.5.1

Overview of changes leading to 14.5.1
Thursday, October 1, 2026
=====================================
- Map the `fonupa` (Uralic Phonetic Alphabet) BCP 47 variant to the `UPPH`
  OpenType language system tag.
- Produce smaller `cmap` subtables and drop no-op variation device tables when
  subsetting.
- Fix possible deadlock in `hb_font_destroy()` after `hb_ft_font_set_funcs()`,
  a regression from 14.5.0.
- Fix signed integer overflows when scaling glyph extents and applying
  synthetic slant and emboldening.
- Fix float-to-int overflow in `VARC` component axis coordinates with
  malformed fonts.
- Fix a memory leak in the experimental WebAssembly shaper when shaping with
  features.
- Fix accumulator overflows in the experimental raster library when rendering
  glyphs with very many overlapping edges.
- Fix heap buffer overflow in the experimental GPU library with malicious
  `COLR` fonts.
- Various build and CI fixes.
---
 .../harfbuzz/{harfbuzz_14.5.0.bb => harfbuzz_14.5.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_14.5.0.bb => harfbuzz_14.5.1.bb} (96%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.1.bb
similarity index 96%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_14.5.1.bb
index 438aa23133..d10f1bfa01 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b7132e148358a45185c9feafd049dbaf243649d3c44414b3534d9c95d18592b9"
+SRC_URI[sha256sum] = "7e2fa4e8c7c98e8d8140671f5772542afaaa6acccfbd746506886b6d85f7f8d6"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
 
-- 
2.47.1


--===============5418216839901937385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61450.0", added "/usr/lib/libharfbuzz-cairo.so.0.61451.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61450.0", added "/usr/lib/libharfbuzz-gobject.so.0.61451.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61450.0", added "/usr/lib/libharfbuzz-icu.so.0.61451.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61450.0", added "/usr/lib/libharfbuzz-subset.so.0.61451.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61450.0", added "/usr/lib/libharfbuzz.so.0.61451.0"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61450.0 to libharfbuzz-cairo.so.0.61451.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61450.0 to libharfbuzz-gobject.so.0.61451.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61450.0 to libharfbuzz-icu.so.0.61451.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61450.0 to libharfbuzz.so.0.61451.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61450.0 to libharfbuzz-subset.so.0.61451.0
  /usr/lib/libharfbuzz-cairo.so.0.61450.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61451.0
  /usr/lib/libharfbuzz-gobject.so.0.61450.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61451.0
  /usr/lib/libharfbuzz-icu.so.0.61450.0 moved to /usr/lib/libharfbuzz-icu.so.0.61451.0
  /usr/lib/libharfbuzz.so.0.61450.0 moved to /usr/lib/libharfbuzz.so.0.61451.0
  /usr/lib/libharfbuzz-subset.so.0.61450.0 moved to /usr/lib/libharfbuzz-subset.so.0.61451.0

--===============5418216839901937385==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-14.5.0-14.5.1.patch"

RnJvbSBjYzFiZDcxZjE0NjU0MmUxZDMwMDM0OTViNzEwNmNlZDFmZTA2MmUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBPY3QgMjAyNiAwNjoxMTo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGhh
cmZidXp6OiB1cGdyYWRlIDE0LjUuMCAtPiAxNC41LjEKCk92ZXJ2aWV3IG9mIGNoYW5nZXMgbGVh
ZGluZyB0byAxNC41LjEKVGh1cnNkYXksIE9jdG9iZXIgMSwgMjAyNgo9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09Ci0gTWFwIHRoZSBgZm9udXBhYCAoVXJhbGljIFBob25ldGlj
IEFscGhhYmV0KSBCQ1AgNDcgdmFyaWFudCB0byB0aGUgYFVQUEhgCiAgT3BlblR5cGUgbGFuZ3Vh
Z2Ugc3lzdGVtIHRhZy4KLSBQcm9kdWNlIHNtYWxsZXIgYGNtYXBgIHN1YnRhYmxlcyBhbmQgZHJv
cCBuby1vcCB2YXJpYXRpb24gZGV2aWNlIHRhYmxlcyB3aGVuCiAgc3Vic2V0dGluZy4KLSBGaXgg
cG9zc2libGUgZGVhZGxvY2sgaW4gYGhiX2ZvbnRfZGVzdHJveSgpYCBhZnRlciBgaGJfZnRfZm9u
dF9zZXRfZnVuY3MoKWAsCiAgYSByZWdyZXNzaW9uIGZyb20gMTQuNS4wLgotIEZpeCBzaWduZWQg
aW50ZWdlciBvdmVyZmxvd3Mgd2hlbiBzY2FsaW5nIGdseXBoIGV4dGVudHMgYW5kIGFwcGx5aW5n
CiAgc3ludGhldGljIHNsYW50IGFuZCBlbWJvbGRlbmluZy4KLSBGaXggZmxvYXQtdG8taW50IG92
ZXJmbG93IGluIGBWQVJDYCBjb21wb25lbnQgYXhpcyBjb29yZGluYXRlcyB3aXRoCiAgbWFsZm9y
bWVkIGZvbnRzLgotIEZpeCBhIG1lbW9yeSBsZWFrIGluIHRoZSBleHBlcmltZW50YWwgV2ViQXNz
ZW1ibHkgc2hhcGVyIHdoZW4gc2hhcGluZyB3aXRoCiAgZmVhdHVyZXMuCi0gRml4IGFjY3VtdWxh
dG9yIG92ZXJmbG93cyBpbiB0aGUgZXhwZXJpbWVudGFsIHJhc3RlciBsaWJyYXJ5IHdoZW4gcmVu
ZGVyaW5nCiAgZ2x5cGhzIHdpdGggdmVyeSBtYW55IG92ZXJsYXBwaW5nIGVkZ2VzLgotIEZpeCBo
ZWFwIGJ1ZmZlciBvdmVyZmxvdyBpbiB0aGUgZXhwZXJpbWVudGFsIEdQVSBsaWJyYXJ5IHdpdGgg
bWFsaWNpb3VzCiAgYENPTFJgIGZvbnRzLgotIFZhcmlvdXMgYnVpbGQgYW5kIENJIGZpeGVzLgot
LS0KIC4uLi9oYXJmYnV6ei97aGFyZmJ1enpfMTQuNS4wLmJiID0+IGhhcmZidXp6XzE0LjUuMS5i
Yn0gICAgICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei97aGFyZmJ1enpf
MTQuNS4wLmJiID0+IGhhcmZidXp6XzE0LjUuMS5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMTQuNS4wLmJiIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZidXp6XzE0LjUuMS5iYgpzaW1pbGFyaXR5IGluZGV4
IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpf
MTQuNS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1
enpfMTQuNS4xLmJiCmluZGV4IDQzOGFhMjMxMzMuLmQxMGYxYmZhMDEgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8xNC41LjAuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZidXp6XzE0LjUuMS5iYgpAQCAtOSw3ICs5
LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9Yjk4NDI5YjhlOGUz
YzJhNjdjZmVmMDFlOTllNDg5M2QgXAogICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkg
PSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9LyR7QlBOfS0ke1BWfS50YXIueHoi
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjcxMzJlMTQ4MzU4YTQ1MTg1YzlmZWFmZDA0OWRiYWYy
NDM2NDlkM2M0NDQxNGIzNTM0ZDljOTVkMTg1OTJiOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3
ZTJmYTRlOGM3Yzk4ZThkODE0MDY3MWY1NzcyNTQyYWZhYWE2YWNjY2ZiZDc0NjUwNjg4NmI2ZDg1
ZjdmOGQ2IgogCiBpbmhlcml0IG1lc29uIHBrZ2NvbmZpZyBsaWJfcGFja2FnZSBndGstZG9jIGdv
YmplY3QtaW50cm9zcGVjdGlvbiBnaXRodWItcmVsZWFzZXMKIAotLSAKMi40Ny4xCgo=

--===============5418216839901937385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="harfbuzz-changelog.txt"

Overview of changes leading to 14.5.1
Thursday, October 1, 2026
=====================================
- Map the `fonupa` (Uralic Phonetic Alphabet) BCP 47 variant to the `UPPH`
  OpenType language system tag.
- Produce smaller `cmap` subtables and drop no-op variation device tables when
  subsetting.
- Fix possible deadlock in `hb_font_destroy()` after `hb_ft_font_set_funcs()`,
  a regression from 14.5.0.
- Fix signed integer overflows when scaling glyph extents and applying
  synthetic slant and emboldening.
- Fix float-to-int overflow in `VARC` component axis coordinates with
  malformed fonts.
- Fix a memory leak in the experimental WebAssembly shaper when shaping with
  features.
- Fix accumulator overflows in the experimental raster library when rendering
  glyphs with very many overlapping edges.
- Fix heap buffer overflow in the experimental GPU library with malicious
  `COLR` fonts.
- Various build and CI fixes.

--===============5418216839901937385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 14.5.0 [default] to 14.5.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "14.5.0" to "14.5.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: PKGV changed from 14.5.0 [default] to 14.5.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: PV changed from "14.5.0" to "14.5.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILES: removed "/usr/lib/libharfbuzz-cairo.so.0.61450.0", added "/usr/lib/libharfbuzz-cairo.so.0.61451.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61450.0", added "/usr/lib/libharfbuzz-cairo.so.0.61451.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 14.5.0 [default] to 14.5.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "14.5.0" to "14.5.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz-icu.so.0.61450.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61450.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61450.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61450.0 /usr/lib/.debug/libharfbuzz.so.0.61450.0", added "/usr/lib/.debug/libharfbuzz-gobject.so.0.61451.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61451.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.61451.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61451.0 /usr/lib/.debug/libharfbuzz.so.0.61451.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 97929352 to 97890400 (-0%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 14.5.0 [default] to 14.5.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "14.5.0" to "14.5.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 14.5.0 [default] to 14.5.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "14.5.0" to "14.5.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: PKGV changed from 14.5.0 [default] to 14.5.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: PV changed from "14.5.0" to "14.5.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILES: removed "/usr/lib/libharfbuzz-gobject.so.0.61450.0", added "/usr/lib/libharfbuzz-gobject.so.0.61451.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61450.0", added "/usr/lib/libharfbuzz-gobject.so.0.61451.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 14.5.0 [default] to 14.5.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "14.5.0" to "14.5.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILES: removed "/usr/lib/libharfbuzz-icu.so.0.61450.0", added "/usr/lib/libharfbuzz-icu.so.0.61451.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61450.0", added "/usr/lib/libharfbuzz-icu.so.0.61451.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 14.5.0 [default] to 14.5.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "14.5.0" to "14.5.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 14.5.0 [default] to 14.5.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PV changed from "14.5.0" to "14.5.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: FILELIST: directory renamed /usr/src/debug/harfbuzz/14.5.0/src/OT/Color/CBDT -> /usr/src/debug/harfbuzz/14.5.1/src/OT/Color/CBDT, directory renamed /usr/src/debug/harfbuzz/14.5.0/src/OT/Color/CPAL -> /usr/src/debug/harfbuzz/14.5.1/src/OT/Color/CPAL, directory renamed /usr/src/debug/harfbuzz/14.5.0/src -> /usr/src/debug/harfbuzz/14.5.1/src, directory renamed /usr/src/debug/harfbuzz/14.5.0/src/OT/Color/COLR -> /usr/src/debug/harfbuzz/14.5.1/src/OT/Color/COLR, directory renamed /usr/src/debug/harfbuzz/14.5.0/src/OT/glyf -> /usr/src/debug/harfbuzz/14.5.1/src/OT/glyf, directory renamed /usr/src/debug/harfbuzz/14.5.0/src/OT/Layout/GPOS -> /usr/src/debug/harfbuzz/14.5.1/src/OT/Layout/GPOS, directory renamed /usr/src/debug/harfbuzz/14.5.0/src/OT/Var/VARC -> /usr/src/debug/harfbuzz/14.5.1/src/OT/Var/VARC, directory renamed /usr/src/debug/harfbuzz/14.5.0/src/OT/name -> /usr/src/debug/harfbuzz/14.5.1/src/OT/name, directory renamed /usr/src/de
 bug/harfbuzz/14.5.0/src/OT/Color/sbix -> /usr/src/debug/harfbuzz/14.5.1/src/OT/Color/sbix, directory renamed /usr/src/debug/harfbuzz/14.5.0/src/graph -> /usr/src/debug/harfbuzz/14.5.1/src/graph, directory renamed /usr/src/debug/harfbuzz/14.5.0/src/OT/Color/svg -> /usr/src/debug/harfbuzz/14.5.1/src/OT/Color/svg, directory renamed /usr/src/debug/harfbuzz/14.5.0/src/OT/Layout/Common -> /usr/src/debug/harfbuzz/14.5.1/src/OT/Layout/Common, directory renamed /usr/src/debug/harfbuzz/14.5.0/src/OT/Layout -> /usr/src/debug/harfbuzz/14.5.1/src/OT/Layout, directory renamed /usr/src/debug/harfbuzz/14.5.0/src/OT/Layout/GSUB -> /usr/src/debug/harfbuzz/14.5.1/src/OT/Layout/GSUB, directory renamed /usr/src/debug/harfbuzz/14.5.0/src/OT/Layout/GDEF -> /usr/src/debug/harfbuzz/14.5.1/src/OT/Layout/GDEF, directory renamed /usr/src/debug/harfbuzz/14.5.0/util -> /usr/src/debug/harfbuzz/14.5.1/util
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 5711926 to 5714639 (+0%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 14.5.0 [default] to 14.5.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "14.5.0" to "14.5.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 14.5.0 [default] to 14.5.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "14.5.0" to "14.5.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILES: removed "/usr/lib/libharfbuzz-subset.so.0.61450.0", added "/usr/lib/libharfbuzz-subset.so.0.61451.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61450.0", added "/usr/lib/libharfbuzz-subset.so.0.61451.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 1091751 to 1087655 (-0%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGV changed from 14.5.0 [default] to 14.5.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PV changed from "14.5.0" to "14.5.1"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61450.0", added "/usr/lib/libharfbuzz.so.0.61451.0"
packages/x86-64-v3-poky-linux/harfbuzz: PKGV changed from 14.5.0 [default] to 14.5.1 [default]
packages/x86-64-v3-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/14.5.0/harfbuzz-14.5.0.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases//download/14.5.1/harfbuzz-14.5.1.tar.xz"
packages/x86-64-v3-poky-linux/harfbuzz: PV changed from "14.5.0" to "14.5.1"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61450.0 to libharfbuzz-cairo.so.0.61451.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61450.0 to libharfbuzz-gobject.so.0.61451.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61450.0 to libharfbuzz-icu.so.0.61451.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61450.0 to libharfbuzz.so.0.61451.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61450.0 to libharfbuzz-subset.so.0.61451.0
  /usr/lib/libharfbuzz-cairo.so.0.61450.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61451.0
  /usr/lib/libharfbuzz-gobject.so.0.61450.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61451.0
  /usr/lib/libharfbuzz-icu.so.0.61450.0 moved to /usr/lib/libharfbuzz-icu.so.0.61451.0
  /usr/lib/libharfbuzz.so.0.61450.0 moved to /usr/lib/libharfbuzz.so.0.61451.0
  /usr/lib/libharfbuzz-subset.so.0.61450.0 moved to /usr/lib/libharfbuzz-subset.so.0.61451.0

--===============5418216839901937385==--

