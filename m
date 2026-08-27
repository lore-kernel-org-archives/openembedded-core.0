Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABF5C61DC4
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 05:18:35 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29504.1787807910348591276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 22:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=D6wEyICQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=S2PZnFir;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a041a7c708-60916899-3ae2-48bb-b232-56609e67418c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787807909;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=ExLDN6htEi4aNT1aoPqmKczzCkLru27v+9lCDzG878g=;
	b=D6wEyICQtffKNZYKHR/y77LywO6M84f6KJnZzANt0T/leOXYEEycDhXu7NSrvPLO
	q88DDBNjpVtmLAXewVp7yWaggZH/0BeSLYK/OTEzYfKHHwVEkAyJ2o7IdCrsS5E50PN
	/xuiDo1ZYvK+qZO5eG/Sd+pIAzOh3YAOMNTXM7qo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787807909;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=ExLDN6htEi4aNT1aoPqmKczzCkLru27v+9lCDzG878g=;
	b=S2PZnFirVR2T4GGUVfUgYpkYePcxST/aNHv9eem6nCktNJhvyYBdg3uSpMaHJxGQ
	Pv1Sge0T8gIld9g4na5G12GZpp8+NWFAt+JzMWKsZq0pSYXBAb6NiYqCHOS/1xIAFeC
	jmeegkEWzDP1haiHIpsVRqK6awd3ClloD0NA8JqA=
Content-Type: multipart/mixed; boundary="===============0854479835279081204=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 14.4.0 SUCCEEDED
Message-ID: <010101a041a7c708-60916899-3ae2-48bb-b232-56609e67418c-000000@us-west-2.amazonses.com>
Date: Thu, 27 Aug 2026 05:18:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.27-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 05:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244449

--===============0854479835279081204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *harfbuzz* to *14.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-14.3.1-14.4.0.patch
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
From 2a903e185b92611d1633199439dea2442db0e2d1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 27 Aug 2026 05:18:23 +0000
Subject: [PATCH] harfbuzz: upgrade 14.3.1 -> 14.4.0

Source: NEWS

Overview of changes leading to 14.4.0
Wednesday, August 26, 2026
=====================================
- Glyph positions and extents now saturate instead of overflowing.
- Arabic Windows-1256 fallback shaping is now enabled on all platforms.
- Fix cluster values and a dropped glyph advance in the Graphite shaper.
- Fix `avar` axis value mapping in fonts that repeat the boundary entries.
- Fix `avar` version 2 partial instancing.
- Fix `COLR` sweep gradient truncation and unbounded memory use.
- Faster subsetting, especially for large `GSUB`/`GPOS` and `CFF` tables.
- Faster extraction of the experimental glyph dependency graph.
- Various shaping speedups.
- Various fixes for crashes and hangs with malformed fonts.
- Various fixes to the experimental raster, vector, and GPU libraries.
- Various improvements to the HarfRust integration shaper.
- The DirectWrite backend no longer uses the C++ runtime.
- Various build, portability, and fuzzing fixes.

- New API:
  +hb_set_intersects()
---
 .../harfbuzz/{harfbuzz_14.3.1.bb => harfbuzz_14.4.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_14.3.1.bb => harfbuzz_14.4.0.bb} (96%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_14.3.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb
similarity index 96%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_14.3.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb
index 4f0d5d3ec2..a5c601b1de 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_14.3.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9dae9538aae2ffdf70cec31f2c27bf68e2aaeeae3112688467697d5faf6194f7"
+SRC_URI[sha256sum] = "2357ed966c6ced7bfa720b0640c0231065af01158fbea215093ffa15aed44371"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
 
-- 
2.47.1


--===============0854479835279081204==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-14.3.1-14.4.0.patch"

RnJvbSAyYTkwM2UxODViOTI2MTFkMTYzMzE5OTQzOWRlYTI0NDJkYjBlMmQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjcgQXVnIDIwMjYgMDU6MTg6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
YXJmYnV6ejogdXBncmFkZSAxNC4zLjEgLT4gMTQuNC4wCgpTb3VyY2U6IE5FV1MKCk92ZXJ2aWV3
IG9mIGNoYW5nZXMgbGVhZGluZyB0byAxNC40LjAKV2VkbmVzZGF5LCBBdWd1c3QgMjYsIDIwMjYK
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotIEdseXBoIHBvc2l0aW9ucyBh
bmQgZXh0ZW50cyBub3cgc2F0dXJhdGUgaW5zdGVhZCBvZiBvdmVyZmxvd2luZy4KLSBBcmFiaWMg
V2luZG93cy0xMjU2IGZhbGxiYWNrIHNoYXBpbmcgaXMgbm93IGVuYWJsZWQgb24gYWxsIHBsYXRm
b3Jtcy4KLSBGaXggY2x1c3RlciB2YWx1ZXMgYW5kIGEgZHJvcHBlZCBnbHlwaCBhZHZhbmNlIGlu
IHRoZSBHcmFwaGl0ZSBzaGFwZXIuCi0gRml4IGBhdmFyYCBheGlzIHZhbHVlIG1hcHBpbmcgaW4g
Zm9udHMgdGhhdCByZXBlYXQgdGhlIGJvdW5kYXJ5IGVudHJpZXMuCi0gRml4IGBhdmFyYCB2ZXJz
aW9uIDIgcGFydGlhbCBpbnN0YW5jaW5nLgotIEZpeCBgQ09MUmAgc3dlZXAgZ3JhZGllbnQgdHJ1
bmNhdGlvbiBhbmQgdW5ib3VuZGVkIG1lbW9yeSB1c2UuCi0gRmFzdGVyIHN1YnNldHRpbmcsIGVz
cGVjaWFsbHkgZm9yIGxhcmdlIGBHU1VCYC9gR1BPU2AgYW5kIGBDRkZgIHRhYmxlcy4KLSBGYXN0
ZXIgZXh0cmFjdGlvbiBvZiB0aGUgZXhwZXJpbWVudGFsIGdseXBoIGRlcGVuZGVuY3kgZ3JhcGgu
Ci0gVmFyaW91cyBzaGFwaW5nIHNwZWVkdXBzLgotIFZhcmlvdXMgZml4ZXMgZm9yIGNyYXNoZXMg
YW5kIGhhbmdzIHdpdGggbWFsZm9ybWVkIGZvbnRzLgotIFZhcmlvdXMgZml4ZXMgdG8gdGhlIGV4
cGVyaW1lbnRhbCByYXN0ZXIsIHZlY3RvciwgYW5kIEdQVSBsaWJyYXJpZXMuCi0gVmFyaW91cyBp
bXByb3ZlbWVudHMgdG8gdGhlIEhhcmZSdXN0IGludGVncmF0aW9uIHNoYXBlci4KLSBUaGUgRGly
ZWN0V3JpdGUgYmFja2VuZCBubyBsb25nZXIgdXNlcyB0aGUgQysrIHJ1bnRpbWUuCi0gVmFyaW91
cyBidWlsZCwgcG9ydGFiaWxpdHksIGFuZCBmdXp6aW5nIGZpeGVzLgoKLSBOZXcgQVBJOgogICto
Yl9zZXRfaW50ZXJzZWN0cygpCi0tLQogLi4uL2hhcmZidXp6L3toYXJmYnV6el8xNC4zLjEuYmIg
PT4gaGFyZmJ1enpfMTQuNC4wLmJifSAgICAgICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L2hhcmZidXp6L3toYXJmYnV6el8xNC4zLjEuYmIgPT4gaGFyZmJ1enpfMTQuNC4wLmJifSAoOTYl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el8x
NC4zLjEuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfMTQuNC4w
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy9oYXJmYnV6ei9oYXJmYnV6el8xNC4zLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy9oYXJmYnV6ei9oYXJmYnV6el8xNC40LjAuYmIKaW5kZXggNGYwZDVkM2VjMi4uYTVjNjAx
YjFkZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZidXp6
XzE0LjMuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpf
MTQuNC4wLmJiCkBAIC05LDcgKzksNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZ
SU5HO21kNT1iOTg0MjliOGU4ZTNjMmE2N2NmZWYwMWU5OWU0ODkzZCBcCiAgICAgICAgICAgICAg
ICAgICAgICIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0v
JHtCUE59LSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5ZGFlOTUzOGFhZTJm
ZmRmNzBjZWMzMWYyYzI3YmY2OGUyYWFlZWFlMzExMjY4ODQ2NzY5N2Q1ZmFmNjE5NGY3IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjIzNTdlZDk2NmM2Y2VkN2JmYTcyMGIwNjQwYzAyMzEwNjVhZjAx
MTU4ZmJlYTIxNTA5M2ZmYTE1YWVkNDQzNzEiCiAKIGluaGVyaXQgbWVzb24gcGtnY29uZmlnIGxp
Yl9wYWNrYWdlIGd0ay1kb2MgZ29iamVjdC1pbnRyb3NwZWN0aW9uIGdpdGh1Yi1yZWxlYXNlcwog
Ci0tIAoyLjQ3LjEKCg==

--===============0854479835279081204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61431.0", added "/usr/lib/libharfbuzz-cairo.so.0.61440.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61431.0", added "/usr/lib/libharfbuzz-gobject.so.0.61440.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61431.0", added "/usr/lib/libharfbuzz-icu.so.0.61440.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61431.0", added "/usr/lib/libharfbuzz-subset.so.0.61440.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61431.0", added "/usr/lib/libharfbuzz.so.0.61440.0"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61431.0 to libharfbuzz-cairo.so.0.61440.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61431.0 to libharfbuzz-gobject.so.0.61440.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61431.0 to libharfbuzz-icu.so.0.61440.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61431.0 to libharfbuzz.so.0.61440.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61431.0 to libharfbuzz-subset.so.0.61440.0
  /usr/lib/libharfbuzz-cairo.so.0.61431.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61440.0
  /usr/lib/libharfbuzz-gobject.so.0.61431.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61440.0
  /usr/lib/libharfbuzz-icu.so.0.61431.0 moved to /usr/lib/libharfbuzz-icu.so.0.61440.0
  /usr/lib/libharfbuzz.so.0.61431.0 moved to /usr/lib/libharfbuzz.so.0.61440.0
  /usr/lib/libharfbuzz-subset.so.0.61431.0 moved to /usr/lib/libharfbuzz-subset.so.0.61440.0

--===============0854479835279081204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="harfbuzz-changelog.txt"

Changelog for harfbuzz: 14.3.1 -> 14.4.0
Source: NEWS

Overview of changes leading to 14.4.0
Wednesday, August 26, 2026
=====================================
- Glyph positions and extents now saturate instead of overflowing.
- Arabic Windows-1256 fallback shaping is now enabled on all platforms.
- Fix cluster values and a dropped glyph advance in the Graphite shaper.
- Fix `avar` axis value mapping in fonts that repeat the boundary entries.
- Fix `avar` version 2 partial instancing.
- Fix `COLR` sweep gradient truncation and unbounded memory use.
- Faster subsetting, especially for large `GSUB`/`GPOS` and `CFF` tables.
- Faster extraction of the experimental glyph dependency graph.
- Various shaping speedups.
- Various fixes for crashes and hangs with malformed fonts.
- Various fixes to the experimental raster, vector, and GPU libraries.
- Various improvements to the HarfRust integration shaper.
- The DirectWrite backend no longer uses the C++ runtime.
- Various build, portability, and fuzzing fixes.

- New API:
  +hb_set_intersects()

--===============0854479835279081204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 14.3.1 [default] to 14.4.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "14.3.1" to "14.4.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILES: removed "/usr/lib/libharfbuzz-cairo.so.0.61431.0", added "/usr/lib/libharfbuzz-cairo.so.0.61440.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: FILELIST: removed "/usr/lib/libharfbuzz-cairo.so.0.61431.0", added "/usr/lib/libharfbuzz-cairo.so.0.61440.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: PKGV changed from 14.3.1 [default] to 14.4.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-cairo: PV changed from "14.3.1" to "14.4.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 91914040 to 93279368 (+1%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz-cairo.so.0.61431.0 /usr/lib/.debug/libharfbuzz.so.0.61431.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61431.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61431.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61431.0", added "/usr/lib/.debug/libharfbuzz-cairo.so.0.61440.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.61440.0 /usr/lib/.debug/libharfbuzz-icu.so.0.61440.0 /usr/lib/.debug/libharfbuzz.so.0.61440.0 /usr/lib/.debug/libharfbuzz-subset.so.0.61440.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 14.3.1 [default] to 14.4.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "14.3.1" to "14.4.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1900436 to 1901691 (+0%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 14.3.1 [default] to 14.4.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "14.3.1" to "14.4.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 14.3.1 [default] to 14.4.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "14.3.1" to "14.4.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILES: removed "/usr/lib/libharfbuzz-gobject.so.0.61431.0", added "/usr/lib/libharfbuzz-gobject.so.0.61440.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.61431.0", added "/usr/lib/libharfbuzz-gobject.so.0.61440.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: PKGV changed from 14.3.1 [default] to 14.4.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-gobject: PV changed from "14.3.1" to "14.4.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILES: removed "/usr/lib/libharfbuzz-icu.so.0.61431.0", added "/usr/lib/libharfbuzz-icu.so.0.61440.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.61431.0", added "/usr/lib/libharfbuzz-icu.so.0.61440.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 14.3.1 [default] to 14.4.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "14.3.1" to "14.4.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 14.3.1 [default] to 14.4.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "14.3.1" to "14.4.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 5512119 to 5580319 (+1%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: FILELIST: directory renamed /usr/src/debug/harfbuzz/14.3.1/src/OT/Layout -> /usr/src/debug/harfbuzz/14.4.0/src/OT/Layout, directory renamed /usr/src/debug/harfbuzz/14.3.1/src/OT/Color/COLR -> /usr/src/debug/harfbuzz/14.4.0/src/OT/Color/COLR, directory renamed /usr/src/debug/harfbuzz/14.3.1/src/OT/Layout/GPOS -> /usr/src/debug/harfbuzz/14.4.0/src/OT/Layout/GPOS, directory renamed /usr/src/debug/harfbuzz/14.3.1/src/OT/glyf -> /usr/src/debug/harfbuzz/14.4.0/src/OT/glyf, directory renamed /usr/src/debug/harfbuzz/14.3.1/src/OT/Color/svg -> /usr/src/debug/harfbuzz/14.4.0/src/OT/Color/svg, directory renamed /usr/src/debug/harfbuzz/14.3.1/src/OT/Color/sbix -> /usr/src/debug/harfbuzz/14.4.0/src/OT/Color/sbix, directory renamed /usr/src/debug/harfbuzz/14.3.1/src/OT/Var/VARC -> /usr/src/debug/harfbuzz/14.4.0/src/OT/Var/VARC, directory renamed /usr/src/debug/harfbuzz/14.3.1/util -> /usr/src/debug/harfbuzz/14.4.0/util, directory renamed /usr/sr
 c/debug/harfbuzz/14.3.1/src/OT/Layout/GDEF -> /usr/src/debug/harfbuzz/14.4.0/src/OT/Layout/GDEF, directory renamed /usr/src/debug/harfbuzz/14.3.1/src/graph -> /usr/src/debug/harfbuzz/14.4.0/src/graph, directory renamed /usr/src/debug/harfbuzz/14.3.1/src/OT/Color/CBDT -> /usr/src/debug/harfbuzz/14.4.0/src/OT/Color/CBDT, directory renamed /usr/src/debug/harfbuzz/14.3.1/src/OT/name -> /usr/src/debug/harfbuzz/14.4.0/src/OT/name, directory renamed /usr/src/debug/harfbuzz/14.3.1/src/OT/Layout/Common -> /usr/src/debug/harfbuzz/14.4.0/src/OT/Layout/Common, directory renamed /usr/src/debug/harfbuzz/14.3.1/src/OT/Layout/GSUB -> /usr/src/debug/harfbuzz/14.4.0/src/OT/Layout/GSUB, directory renamed /usr/src/debug/harfbuzz/14.3.1/src/OT/Color/CPAL -> /usr/src/debug/harfbuzz/14.4.0/src/OT/Color/CPAL, removed "/usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-face.h /usr/src/debug/harfbuzz/14.3.1/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-p
 aint.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-serialize.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-var.h /usr/src/debug/harfbuzz/14.3.1/src/hb-style.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-layout.h /usr/src/debug/harfbuzz/14.3.1/src/hb-unicode-emoji-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-paint-extents.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-fetch.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-cairo.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-layout-gsubgpos.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-set.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-layout-base-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-fallback-shape.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-array.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-debug.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-face.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-cff1-table.hh
  /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-kern-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-cairo-utils.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-cff-specializer.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-maxp-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-meta-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-bit-set.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-kern.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-object.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-bit-page.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-math.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-meta.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-outline.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-paint-bounded.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-paint-extents.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-font.cc /usr
 /src/debug/harfbuzz/14.3.1/src/hb-glib.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-static.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shaper-arabic.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-post-table-v2subset.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-shaper.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-draw.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-buffer-verify.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-name.h /usr/src/debug/harfbuzz/14.3.1/src/hb-shape-plan.h /usr/src/debug/harfbuzz/14.3.1/src/hb-outline.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-accelerator.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shaper-arabic-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-paint-bounded.cc /usr/src/debug/h
 arfbuzz/14.3.1/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-set-digest.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-map.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-depend.h /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/14.3.1/src/hb.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-multimap.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-input.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-meta.h /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-map.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-serialize.h /usr/src/debug/harfbuzz/14.3.1/src/hb-repacker.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-iter.hh
  /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-utf.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-table-layout.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-atomic.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/14.3.1/src/hb-shape-plan.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-bimap.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-mutex.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-table-cff.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-table-var.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-machinery.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-decycler.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-fetch.h /usr/src/debug/harfbuzz/14.3.1/src/hb-set.h /usr/src/debug/harfbuzz/14.3.1/src/hb-cairo.h /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ma
 p.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shape-normalize.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-shaper.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ucd.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-buffer-serialize.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-algs.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-meta.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-layout-common.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-blob.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-free-pool.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-face-builder.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-icu.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-cff-width-optimizer.hh /usr/src/debug/harfbuzz/
 14.3.1/src/hb-depend.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-common.h /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-input.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shaper-arabic-joining-list.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-vector.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-aat-map.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-shape.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-style.h /usr/src/debug/harfbuzz/14.3.1/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-number.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-shape.h /usr/src/debug/harfbuzz/14.3.1/src/hb-string-array.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-alloc-pool.hh /usr/src/debug/harfbuzz/14.
 3.1/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-deprecated.h /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-version.h /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-var.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-sanitize.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-color.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-cff2-to-cff1.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-draw.h /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-face.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-font.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ft-colr.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-subset.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shaper-use-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-open-file.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-buffer.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-head-
 table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-unicode.h /usr/src/debug/harfbuzz/14.3.1/src/hb-draw.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ft.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-instancer-solver.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shaper-syllabic.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-subset.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-buffer.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-cff2-table.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-color.h /usr/src/debug/harfbuzz/14.3.1/src/hb-cairo-utils.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-aat-map.hh /usr/src/debug/harfbuzz/14.3.1/sr
 c/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-math.h /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-face.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-blob.h /usr/src/debug/harfbuzz/14.3.1/src/hb-depend-data.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-common.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shaper-thai.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-tag.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-instancer-solver.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-font.h /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-name-language.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-depend.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-set.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-aat-layout-kerx-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-cache.hh /usr/src/debug/harf
 buzz/14.3.1/src/hb-blob.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-plan-var.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-subset.h /usr/src/debug/harfbuzz/14.3.1/src/hb-number.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-instancer-iup.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-plan-layout.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shaper-myanmar.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-cff-interp-common.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-unicode.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-script-list.h /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-cff-common.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-plan-member-list.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-dispatch.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-bit-set-invertible.hh /usr/src/debug/harfbu
 zz/14.3.1/src/hb-paint.h /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-font.h /usr/src/debug/harfbuzz/14.3.1/src/hb-null.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-buffer.h /usr/src/debug/harfbuzz/14.3.1/src/hb-deprecated.h /usr/src/debug/harfbuzz/14.3.1/src/hb-font.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-cff-common.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-aat-layout.h /usr/src/debug/harfbuzz/14.3.1/src/hb-gobject-enums.h /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-name-language-static.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-name.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-instancer-iup.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-unicode.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-var-cvar-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-var-fvar-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-var-hvar-ta
 ble.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-map.h /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-table-color.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-table-other.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-face.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-geometry.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-post-macroman.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-map.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-os2-unicode-ranges.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-ft.h /usr/src/debug/harfbuzz/14.3.1/src/hb-subset-serialize.cc /usr/src/debug/harfbuzz/14.3.1/src/hb-ot-shape-normalize.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-open-type.hh /usr/src/debug/harfbuzz/14.3.1/src/hb-paint.cc /usr/src/debug/harfbuzz/14.3.1/s
 rc/hb-ot-shaper-vowel-constraints.cc", added "/usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-face.h /usr/src/debug/harfbuzz/14.4.0/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-paint.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-serialize.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-var.h /usr/src/debug/harfbuzz/14.4.0/src/hb-style.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-arabic-win1256.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-layout.h /usr/src/debug/harfbuzz/14.4.0/src/hb-unicode-emoji-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-paint-extents.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-fetch.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-cairo.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-layout-gsubgpos.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-set.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-layout-base-table.hh /u
 sr/src/debug/harfbuzz/14.4.0/src/hb-fallback-shape.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-array.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-debug.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-face.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-kern-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-cairo-utils.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-cff-specializer.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-maxp-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-meta-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-bit-set.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-kern.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-object.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-bit-page.hh /usr/sr
 c/debug/harfbuzz/14.4.0/src/hb-ot-math.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-meta.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-outline.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-paint-bounded.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-paint-extents.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-font.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-glib.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-static.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-arabic.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-post-table-v2subset.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-shaper.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-draw.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-buffer-verify.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot
 -name.h /usr/src/debug/harfbuzz/14.4.0/src/hb-shape-plan.h /usr/src/debug/harfbuzz/14.4.0/src/hb-outline.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-accelerator.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-arabic-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-paint-bounded.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-set-digest.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-map.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-depend.h /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/14.4.0/src/hb.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-multimap.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-input.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-meta.h /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-map.cc /usr/src/debug/ha
 rfbuzz/14.4.0/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-serialize.h /usr/src/debug/harfbuzz/14.4.0/src/hb-repacker.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-iter.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-utf.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-table-layout.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-atomic.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/14.4.0/src/hb-shape-plan.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-bimap.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-mutex.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-table-cff.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-table-var.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-machinery.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-decycler.hh /usr
 /src/debug/harfbuzz/14.4.0/src/hb-ot-fetch.h /usr/src/debug/harfbuzz/14.4.0/src/hb-set.h /usr/src/debug/harfbuzz/14.4.0/src/hb-cairo.h /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-map.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shape-normalize.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-shaper.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ucd.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-buffer-serialize.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-algs.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-meta.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-layout-common.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-blob.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-free-
 pool.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-face-builder.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-icu.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-cff-width-optimizer.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-depend.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-common.h /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-input.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-arabic-joining-list.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-vector.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-map.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-shape.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-style.h /usr/src/debug/harfbuzz/14.4.0
 /src/hb-priority-queue.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-number.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-shape.h /usr/src/debug/harfbuzz/14.4.0/src/hb-string-array.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-alloc-pool.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-deprecated.h /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-version.h /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-var.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-sanitize.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-color.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-cff2-to-cff1.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-draw.h /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-face.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-font.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ft-colr.hh /usr/s
 rc/debug/harfbuzz/14.4.0/src/hb-subset.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-use-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-open-file.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-buffer.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-head-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-unicode.h /usr/src/debug/harfbuzz/14.4.0/src/hb-draw.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ft.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-instancer-solver.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-syllabic.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-b
 uffer.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-cff2-table.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-color.h /usr/src/debug/harfbuzz/14.4.0/src/hb-cairo-utils.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-map.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-math.h /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-face.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-blob.h /usr/src/debug/harfbuzz/14.4.0/src/hb-depend-data.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-common.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-thai.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-tag.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-instancer-solver.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-font.h /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-name-language.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-depend.
 cc /usr/src/debug/harfbuzz/14.4.0/src/hb-set.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-layout-kerx-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-cache.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-blob.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-plan-var.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset.h /usr/src/debug/harfbuzz/14.4.0/src/hb-number.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-instancer-iup.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-plan-layout.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-myanmar.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-cff-interp-common.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-unicode.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-script-list.h /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-cff-common.hh /usr/sr
 c/debug/harfbuzz/14.4.0/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-plan-member-list.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-dispatch.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-paint.h /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-font.h /usr/src/debug/harfbuzz/14.4.0/src/hb-null.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-buffer.h /usr/src/debug/harfbuzz/14.4.0/src/hb-deprecated.h /usr/src/debug/harfbuzz/14.4.0/src/hb-font.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-cff-common.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-aat-layout.h /usr/src/debug/harfbuzz/14.4.0/src/hb-gobject-enums.h /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-name-language-static.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-name.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-instancer-iup.hh /usr/src/debug/harfbuzz/14.4.0/src
 /hb-unicode.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-var-cvar-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-var-fvar-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-map.h /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-table-color.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-table-other.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-face.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-geometry.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-post-macroman.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-map.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-os2-unicod
 e-ranges.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-ft.h /usr/src/debug/harfbuzz/14.4.0/src/hb-subset-serialize.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shape-normalize.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-open-type.hh /usr/src/debug/harfbuzz/14.4.0/src/hb-paint.cc /usr/src/debug/harfbuzz/14.4.0/src/hb-ot-shaper-vowel-constraints.cc"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 14.3.1 [default] to 14.4.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-src: PV changed from "14.3.1" to "14.4.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 14.3.1 [default] to 14.4.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "14.3.1" to "14.4.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILES: removed "/usr/lib/libharfbuzz-subset.so.0.61431.0", added "/usr/lib/libharfbuzz-subset.so.0.61440.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 1018015 to 1042591 (+2%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.61431.0", added "/usr/lib/libharfbuzz-subset.so.0.61440.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 14.3.1 [default] to 14.4.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "14.3.1" to "14.4.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1044292 to 1060784 (+2%)
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.61431.0", added "/usr/lib/libharfbuzz.so.0.61440.0"
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PKGV changed from 14.3.1 [default] to 14.4.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz/harfbuzz: PV changed from "14.3.1" to "14.4.0"
packages/x86-64-v3-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/14.3.1/harfbuzz-14.3.1.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases//download/14.4.0/harfbuzz-14.4.0.tar.xz"
packages/x86-64-v3-poky-linux/harfbuzz: PKGV changed from 14.3.1 [default] to 14.4.0 [default]
packages/x86-64-v3-poky-linux/harfbuzz: PV changed from "14.3.1" to "14.4.0"
Changes to packages/x86-64-v3-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.61431.0 to libharfbuzz-cairo.so.0.61440.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.61431.0 to libharfbuzz-gobject.so.0.61440.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.61431.0 to libharfbuzz-icu.so.0.61440.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.61431.0 to libharfbuzz.so.0.61440.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.61431.0 to libharfbuzz-subset.so.0.61440.0
  /usr/lib/libharfbuzz-cairo.so.0.61431.0 moved to /usr/lib/libharfbuzz-cairo.so.0.61440.0
  /usr/lib/libharfbuzz-gobject.so.0.61431.0 moved to /usr/lib/libharfbuzz-gobject.so.0.61440.0
  /usr/lib/libharfbuzz-icu.so.0.61431.0 moved to /usr/lib/libharfbuzz-icu.so.0.61440.0
  /usr/lib/libharfbuzz.so.0.61431.0 moved to /usr/lib/libharfbuzz.so.0.61440.0
  /usr/lib/libharfbuzz-subset.so.0.61431.0 moved to /usr/lib/libharfbuzz-subset.so.0.61440.0

--===============0854479835279081204==--

