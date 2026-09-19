Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0270C982E1
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 05:43:21 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7450.1789796597029604450
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 22:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ODIzgH1S;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=p0nmpXCu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a0b830b752-31d156fb-d939-486d-ba3e-0589b3900177-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789796596;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Qsw7FeTHsWDwG2ccmh04Zh4iZxrep0yAVkher4klabc=;
	b=ODIzgH1SrX7nc8fP6SzZd0ykzms1qyUgDSiR796QERBy55uMpIEGmnD83Sd6CcZX
	mIsVvaZoO9Ac+0clc/12pF8N7sku0+uPWCfqHvfd9w2z4mLzuTaSGMzEL83EAXlflY7
	hgAfNM38k2Wfpi95yieAZrR+rJat83yOCXe+XYQw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789796596;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Qsw7FeTHsWDwG2ccmh04Zh4iZxrep0yAVkher4klabc=;
	b=p0nmpXCuknd/+N4poRqAqTVcudAsXHE/uMC1XJ54aSWswV2XCYzxs4KuSFf0R5xX
	x5JxiaHVUAGMHY5Wo+zjQHVJyzuH6OHJVmLSa4gsX9pVsGbkLmEHm1OyU2/gAsqLZPS
	KZdcIhuL7TFq8tXh7kTEj+Cs9gHEvMdUoU6HAoiA=
Content-Type: multipart/mixed; boundary="===============8967729929046520539=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xxhash: upgrading to 0.8.4 SUCCEEDED
Message-ID: <010101a0b830b752-31d156fb-d939-486d-ba3e-0589b3900177-000000@us-west-2.amazonses.com>
Date: Sat, 19 Sep 2026 05:43:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.19-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 05:43:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246232

--===============8967729929046520539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xxhash* to *0.8.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xxhash-upgrade-0.8.3-0.8.4.patch
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
From 843e0b1d28e7cc80080699c3310328e1dae21dd7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 19 Sep 2026 05:43:09 +0000
Subject: [PATCH] xxhash: upgrade 0.8.3 -> 0.8.4

Source: CHANGELOG

v0.8.4
- perf : added RISC-V Vector extension (RVV) implementation, by @zijianli1234, @BoBoDai and @camel-cdr
- perf : added LoongArch LASX implementation and improved LSX, by @24bit-xjkp
- perf : prefer NEON over SVE on AArch64, improving XXH3 speed by 25-40%, by @Nicoshev
- perf : improved XXH3 streaming speed for very small updates, suggested by @aleksazr
- api  : `XXH_memcpy()`, `XXH_memset()` and `XXH_memcmp()` can be redirected at compile time
- api  : new `XXH_NO_EXTERNC_GUARD` build macro for complex C++ integration
- cli  : added 64-bit seed support (`-s`, `--seed`), by @d06i
- cli  : options can appear after filenames; `--` terminates option parsing, #1098 reported by @unterkomplex
- cli  : continue processing subsequent files after read errors, #1064 reported by @ZoomRmc
- cli  : support long and special Windows paths, #1060, based on #1061 by @t-mat
- cli  : improved benchmark accuracy, error handling and unit labels, #1051 reported by @calgray
- fix  : unaligned reads could be miscompiled by GCC under strict aliasing, #1013 by @lassipulkkinen
- fix  : `XXH_INLINE_ALL` compatibility with `XXH_NAMESPACE` and x86 runtime dispatch, by @pps83, #1071 reported by @Dr-Hex
- fix  : avoid including system headers inside an `extern "C"` block, #1122 reported by @andreas-schwab
- fix  : compilation with MSVC link-time optimization and warnings as errors, #1038 reported by @mi2think
- build: improved runtime dispatch detection for cross-compilation and non-x86 targets, with help from @eworm-de, #1081 reported by @PotMJ
- build: `LIBXXH_DISPATCH=1` now applies to static and dynamic libraries, #1058 reported by @xiota
- build: Make builds now isolate objects by configuration and support parallel test builds
- build: moved CMake integration to `build/cmake` and improved cross-compilation detection
- install: improved package metadata and installation paths on Windows and FreeBSD, by @iwamatsu, @chitao1234 and @sunpoet
- portability: fixed compilation on ARM with GCC < 8, by @mstorsjo
- portability: fixed C++ compilation on Solaris and illumos, by @luqmana
- portability: AVX-512 implementation no longer requires AVX-512BW, by @NexusXe
- doc  : expanded `xxhsum` documentation and clarified the algorithm specification files
- doc  : document non-cryptographic collision properties, notably for XXH3's mid-size path (#1127 by @thomasahle)
---
 .../recipes-support/xxhash/{xxhash_0.8.3.bb => xxhash_0.8.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/xxhash/{xxhash_0.8.3.bb => xxhash_0.8.4.bb} (93%)

diff --git a/meta/recipes-support/xxhash/xxhash_0.8.3.bb b/meta/recipes-support/xxhash/xxhash_0.8.4.bb
similarity index 93%
rename from meta/recipes-support/xxhash/xxhash_0.8.3.bb
rename to meta/recipes-support/xxhash/xxhash_0.8.4.bb
index dc9bbe5563..736270435b 100644
--- a/meta/recipes-support/xxhash/xxhash_0.8.3.bb
+++ b/meta/recipes-support/xxhash/xxhash_0.8.4.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=13be6b481ff5616f77dda971191bb29b \
 SRC_URI = "git://github.com/Cyan4973/xxHash.git;branch=release;protocol=https;tag=v${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-SRCREV = "e626a72bc2321cd320e953a0ccf1584cad60f363"
+SRCREV = "c87183a77d67f7d37e3d2d1b7eaac5e7c695e4f0"
 
 CFLAGS += "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og', '-DXXH_NO_INLINE_HINTS', '', d)}"
 
-- 
2.47.1


--===============8967729929046520539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/xxhash (sysroot):
  /usr/lib/libxxhash.so.0 changed symlink target from libxxhash.so.0.8.3 to libxxhash.so.0.8.4
  /usr/lib/libxxhash.so changed symlink target from libxxhash.so.0.8.3 to libxxhash.so.0
  /usr/lib/libxxhash.so.0.8.3 moved to /usr/lib/libxxhash.so.0.8.4
packages/x86-64-v3-poky-linux/xxhash/xxhash-doc: PKGSIZE changed from 4878 to 6936 (+42%)
packages/x86-64-v3-poky-linux/xxhash/xxhash: FILELIST: removed "/usr/lib/libxxhash.so.0.8.3", added "/usr/lib/libxxhash.so.0.8.4"

--===============8967729929046520539==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xxhash-upgrade-0.8.3-0.8.4.patch"

RnJvbSA4NDNlMGIxZDI4ZTdjYzgwMDgwNjk5YzMzMTAzMjhlMWRhZTIxZGQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTkgU2VwIDIwMjYgMDU6NDM6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
eGhhc2g6IHVwZ3JhZGUgMC44LjMgLT4gMC44LjQKClNvdXJjZTogQ0hBTkdFTE9HCgp2MC44LjQK
LSBwZXJmIDogYWRkZWQgUklTQy1WIFZlY3RvciBleHRlbnNpb24gKFJWVikgaW1wbGVtZW50YXRp
b24sIGJ5IEB6aWppYW5saTEyMzQsIEBCb0JvRGFpIGFuZCBAY2FtZWwtY2RyCi0gcGVyZiA6IGFk
ZGVkIExvb25nQXJjaCBMQVNYIGltcGxlbWVudGF0aW9uIGFuZCBpbXByb3ZlZCBMU1gsIGJ5IEAy
NGJpdC14amtwCi0gcGVyZiA6IHByZWZlciBORU9OIG92ZXIgU1ZFIG9uIEFBcmNoNjQsIGltcHJv
dmluZyBYWEgzIHNwZWVkIGJ5IDI1LTQwJSwgYnkgQE5pY29zaGV2Ci0gcGVyZiA6IGltcHJvdmVk
IFhYSDMgc3RyZWFtaW5nIHNwZWVkIGZvciB2ZXJ5IHNtYWxsIHVwZGF0ZXMsIHN1Z2dlc3RlZCBi
eSBAYWxla3NhenIKLSBhcGkgIDogYFhYSF9tZW1jcHkoKWAsIGBYWEhfbWVtc2V0KClgIGFuZCBg
WFhIX21lbWNtcCgpYCBjYW4gYmUgcmVkaXJlY3RlZCBhdCBjb21waWxlIHRpbWUKLSBhcGkgIDog
bmV3IGBYWEhfTk9fRVhURVJOQ19HVUFSRGAgYnVpbGQgbWFjcm8gZm9yIGNvbXBsZXggQysrIGlu
dGVncmF0aW9uCi0gY2xpICA6IGFkZGVkIDY0LWJpdCBzZWVkIHN1cHBvcnQgKGAtc2AsIGAtLXNl
ZWRgKSwgYnkgQGQwNmkKLSBjbGkgIDogb3B0aW9ucyBjYW4gYXBwZWFyIGFmdGVyIGZpbGVuYW1l
czsgYC0tYCB0ZXJtaW5hdGVzIG9wdGlvbiBwYXJzaW5nLCAjMTA5OCByZXBvcnRlZCBieSBAdW50
ZXJrb21wbGV4Ci0gY2xpICA6IGNvbnRpbnVlIHByb2Nlc3Npbmcgc3Vic2VxdWVudCBmaWxlcyBh
ZnRlciByZWFkIGVycm9ycywgIzEwNjQgcmVwb3J0ZWQgYnkgQFpvb21SbWMKLSBjbGkgIDogc3Vw
cG9ydCBsb25nIGFuZCBzcGVjaWFsIFdpbmRvd3MgcGF0aHMsICMxMDYwLCBiYXNlZCBvbiAjMTA2
MSBieSBAdC1tYXQKLSBjbGkgIDogaW1wcm92ZWQgYmVuY2htYXJrIGFjY3VyYWN5LCBlcnJvciBo
YW5kbGluZyBhbmQgdW5pdCBsYWJlbHMsICMxMDUxIHJlcG9ydGVkIGJ5IEBjYWxncmF5Ci0gZml4
ICA6IHVuYWxpZ25lZCByZWFkcyBjb3VsZCBiZSBtaXNjb21waWxlZCBieSBHQ0MgdW5kZXIgc3Ry
aWN0IGFsaWFzaW5nLCAjMTAxMyBieSBAbGFzc2lwdWxra2luZW4KLSBmaXggIDogYFhYSF9JTkxJ
TkVfQUxMYCBjb21wYXRpYmlsaXR5IHdpdGggYFhYSF9OQU1FU1BBQ0VgIGFuZCB4ODYgcnVudGlt
ZSBkaXNwYXRjaCwgYnkgQHBwczgzLCAjMTA3MSByZXBvcnRlZCBieSBARHItSGV4Ci0gZml4ICA6
IGF2b2lkIGluY2x1ZGluZyBzeXN0ZW0gaGVhZGVycyBpbnNpZGUgYW4gYGV4dGVybiAiQyJgIGJs
b2NrLCAjMTEyMiByZXBvcnRlZCBieSBAYW5kcmVhcy1zY2h3YWIKLSBmaXggIDogY29tcGlsYXRp
b24gd2l0aCBNU1ZDIGxpbmstdGltZSBvcHRpbWl6YXRpb24gYW5kIHdhcm5pbmdzIGFzIGVycm9y
cywgIzEwMzggcmVwb3J0ZWQgYnkgQG1pMnRoaW5rCi0gYnVpbGQ6IGltcHJvdmVkIHJ1bnRpbWUg
ZGlzcGF0Y2ggZGV0ZWN0aW9uIGZvciBjcm9zcy1jb21waWxhdGlvbiBhbmQgbm9uLXg4NiB0YXJn
ZXRzLCB3aXRoIGhlbHAgZnJvbSBAZXdvcm0tZGUsICMxMDgxIHJlcG9ydGVkIGJ5IEBQb3RNSgot
IGJ1aWxkOiBgTElCWFhIX0RJU1BBVENIPTFgIG5vdyBhcHBsaWVzIHRvIHN0YXRpYyBhbmQgZHlu
YW1pYyBsaWJyYXJpZXMsICMxMDU4IHJlcG9ydGVkIGJ5IEB4aW90YQotIGJ1aWxkOiBNYWtlIGJ1
aWxkcyBub3cgaXNvbGF0ZSBvYmplY3RzIGJ5IGNvbmZpZ3VyYXRpb24gYW5kIHN1cHBvcnQgcGFy
YWxsZWwgdGVzdCBidWlsZHMKLSBidWlsZDogbW92ZWQgQ01ha2UgaW50ZWdyYXRpb24gdG8gYGJ1
aWxkL2NtYWtlYCBhbmQgaW1wcm92ZWQgY3Jvc3MtY29tcGlsYXRpb24gZGV0ZWN0aW9uCi0gaW5z
dGFsbDogaW1wcm92ZWQgcGFja2FnZSBtZXRhZGF0YSBhbmQgaW5zdGFsbGF0aW9uIHBhdGhzIG9u
IFdpbmRvd3MgYW5kIEZyZWVCU0QsIGJ5IEBpd2FtYXRzdSwgQGNoaXRhbzEyMzQgYW5kIEBzdW5w
b2V0Ci0gcG9ydGFiaWxpdHk6IGZpeGVkIGNvbXBpbGF0aW9uIG9uIEFSTSB3aXRoIEdDQyA8IDgs
IGJ5IEBtc3RvcnNqbwotIHBvcnRhYmlsaXR5OiBmaXhlZCBDKysgY29tcGlsYXRpb24gb24gU29s
YXJpcyBhbmQgaWxsdW1vcywgYnkgQGx1cW1hbmEKLSBwb3J0YWJpbGl0eTogQVZYLTUxMiBpbXBs
ZW1lbnRhdGlvbiBubyBsb25nZXIgcmVxdWlyZXMgQVZYLTUxMkJXLCBieSBATmV4dXNYZQotIGRv
YyAgOiBleHBhbmRlZCBgeHhoc3VtYCBkb2N1bWVudGF0aW9uIGFuZCBjbGFyaWZpZWQgdGhlIGFs
Z29yaXRobSBzcGVjaWZpY2F0aW9uIGZpbGVzCi0gZG9jICA6IGRvY3VtZW50IG5vbi1jcnlwdG9n
cmFwaGljIGNvbGxpc2lvbiBwcm9wZXJ0aWVzLCBub3RhYmx5IGZvciBYWEgzJ3MgbWlkLXNpemUg
cGF0aCAoIzExMjcgYnkgQHRob21hc2FobGUpCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC94eGhh
c2gve3h4aGFzaF8wLjguMy5iYiA9PiB4eGhhc2hfMC44LjQuYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LXN1cHBvcnQveHhoYXNoL3t4eGhhc2hfMC44LjMuYmIgPT4geHhoYXNoXzAuOC40LmJifSAoOTMl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3h4aGFzaC94eGhhc2hfMC44LjMu
YmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC94eGhhc2gveHhoYXNoXzAuOC40LmJiCnNpbWlsYXJp
dHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3h4aGFzaC94eGhh
c2hfMC44LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3h4aGFzaC94eGhhc2hf
MC44LjQuYmIKaW5kZXggZGM5YmJlNTU2My4uNzM2MjcwNDM1YiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQveHhoYXNoL3h4aGFzaF8wLjguMy5iYgorKysgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC94eGhhc2gveHhoYXNoXzAuOC40LmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTEzYmU2YjQ4MWZmNTYxNmY3N2RkYTk3MTE5
MWJiMjliIFwKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9DeWFuNDk3My94eEhhc2guZ2l0
O2JyYW5jaD1yZWxlYXNlO3Byb3RvY29sPWh0dHBzO3RhZz12JHtQVn0iCiBVUFNUUkVBTV9DSEVD
S19HSVRUQUdSRUdFWCA9ICJ2KD9QPHB2ZXI+XGQrKFwuXGQrKSspIgogCi1TUkNSRVYgPSAiZTYy
NmE3MmJjMjMyMWNkMzIwZTk1M2EwY2NmMTU4NGNhZDYwZjM2MyIKK1NSQ1JFViA9ICJjODcxODNh
NzdkNjdmN2QzN2UzZDJkMWI3ZWFhYzVlN2M2OTVlNGYwIgogCiBDRkxBR1MgKz0gIiR7QGJiLnV0
aWxzLmNvbnRhaW5zKCdTRUxFQ1RFRF9PUFRJTUlaQVRJT04nLCAnLU9nJywgJy1EWFhIX05PX0lO
TElORV9ISU5UUycsICcnLCBkKX0iCiAKLS0gCjIuNDcuMQoK

--===============8967729929046520539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xxhash: SRC_URI changed from "git://github.com/Cyan4973/xxHash.git;branch=release;protocol=https;tag=v0.8.3" to "git://github.com/Cyan4973/xxHash.git;branch=release;protocol=https;tag=v0.8.4"
packages/x86-64-v3-poky-linux/xxhash: PKGV changed from 0.8.3 [default] to 0.8.4 [default]
packages/x86-64-v3-poky-linux/xxhash: PV changed from "0.8.3" to "0.8.4"
Changes to packages/x86-64-v3-poky-linux/xxhash (sysroot):
  /usr/lib/libxxhash.so.0 changed symlink target from libxxhash.so.0.8.3 to libxxhash.so.0.8.4
  /usr/lib/libxxhash.so changed symlink target from libxxhash.so.0.8.3 to libxxhash.so.0
  /usr/lib/libxxhash.so.0.8.3 moved to /usr/lib/libxxhash.so.0.8.4
packages/x86-64-v3-poky-linux/xxhash/xxhash-dbg: PKGSIZE changed from 1226424 to 1216112 (-1%)
packages/x86-64-v3-poky-linux/xxhash/xxhash-dbg: FILELIST: removed "/usr/lib/.debug/libxxhash.so.0.8.3", added "/usr/lib/.debug/libxxhash.so.0.8.4"
packages/x86-64-v3-poky-linux/xxhash/xxhash-dbg: PKGV changed from 0.8.3 [default] to 0.8.4 [default]
packages/x86-64-v3-poky-linux/xxhash/xxhash-dbg: PV changed from "0.8.3" to "0.8.4"
packages/x86-64-v3-poky-linux/xxhash/xxhash-dev: PKGSIZE changed from 271145 to 283231 (+4%)
packages/x86-64-v3-poky-linux/xxhash/xxhash-dev: PKGV changed from 0.8.3 [default] to 0.8.4 [default]
packages/x86-64-v3-poky-linux/xxhash/xxhash-dev: PV changed from "0.8.3" to "0.8.4"
packages/x86-64-v3-poky-linux/xxhash/xxhash-doc: PKGSIZE changed from 4878 to 6936 (+42%)
packages/x86-64-v3-poky-linux/xxhash/xxhash-doc: PKGV changed from 0.8.3 [default] to 0.8.4 [default]
packages/x86-64-v3-poky-linux/xxhash/xxhash-doc: PV changed from "0.8.3" to "0.8.4"
packages/x86-64-v3-poky-linux/xxhash/xxhash-locale: PKGV changed from 0.8.3 [default] to 0.8.4 [default]
packages/x86-64-v3-poky-linux/xxhash/xxhash-locale: PV changed from "0.8.3" to "0.8.4"
packages/x86-64-v3-poky-linux/xxhash/xxhash-src: PKGSIZE changed from 449695 to 471869 (+5%)
packages/x86-64-v3-poky-linux/xxhash/xxhash-src: FILELIST: directory renamed /usr/src/debug/xxhash/0.8.3 -> /usr/src/debug/xxhash/0.8.4, directory renamed /usr/src/debug/xxhash/0.8.3/cli -> /usr/src/debug/xxhash/0.8.4/cli
packages/x86-64-v3-poky-linux/xxhash/xxhash-src: PKGV changed from 0.8.3 [default] to 0.8.4 [default]
packages/x86-64-v3-poky-linux/xxhash/xxhash-src: PV changed from "0.8.3" to "0.8.4"
packages/x86-64-v3-poky-linux/xxhash/xxhash-staticdev: PKGSIZE changed from 408488 to 403112 (-1%)
packages/x86-64-v3-poky-linux/xxhash/xxhash-staticdev: PKGV changed from 0.8.3 [default] to 0.8.4 [default]
packages/x86-64-v3-poky-linux/xxhash/xxhash-staticdev: PV changed from "0.8.3" to "0.8.4"
packages/x86-64-v3-poky-linux/xxhash/xxhash: PKGSIZE changed from 159914 to 164002 (+3%)
packages/x86-64-v3-poky-linux/xxhash/xxhash: FILELIST: removed "/usr/lib/libxxhash.so.0.8.3", added "/usr/lib/libxxhash.so.0.8.4"
packages/x86-64-v3-poky-linux/xxhash/xxhash: PKGV changed from 0.8.3 [default] to 0.8.4 [default]
packages/x86-64-v3-poky-linux/xxhash/xxhash: PV changed from "0.8.3" to "0.8.4"

--===============8967729929046520539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="xxhash-changelog.txt"

Changelog for xxhash: 0.8.3 -> 0.8.4
Source: CHANGELOG

v0.8.4
- perf : added RISC-V Vector extension (RVV) implementation, by @zijianli1234, @BoBoDai and @camel-cdr
- perf : added LoongArch LASX implementation and improved LSX, by @24bit-xjkp
- perf : prefer NEON over SVE on AArch64, improving XXH3 speed by 25-40%, by @Nicoshev
- perf : improved XXH3 streaming speed for very small updates, suggested by @aleksazr
- api  : `XXH_memcpy()`, `XXH_memset()` and `XXH_memcmp()` can be redirected at compile time
- api  : new `XXH_NO_EXTERNC_GUARD` build macro for complex C++ integration
- cli  : added 64-bit seed support (`-s`, `--seed`), by @d06i
- cli  : options can appear after filenames; `--` terminates option parsing, #1098 reported by @unterkomplex
- cli  : continue processing subsequent files after read errors, #1064 reported by @ZoomRmc
- cli  : support long and special Windows paths, #1060, based on #1061 by @t-mat
- cli  : improved benchmark accuracy, error handling and unit labels, #1051 reported by @calgray
- fix  : unaligned reads could be miscompiled by GCC under strict aliasing, #1013 by @lassipulkkinen
- fix  : `XXH_INLINE_ALL` compatibility with `XXH_NAMESPACE` and x86 runtime dispatch, by @pps83, #1071 reported by @Dr-Hex
- fix  : avoid including system headers inside an `extern "C"` block, #1122 reported by @andreas-schwab
- fix  : compilation with MSVC link-time optimization and warnings as errors, #1038 reported by @mi2think
- build: improved runtime dispatch detection for cross-compilation and non-x86 targets, with help from @eworm-de, #1081 reported by @PotMJ
- build: `LIBXXH_DISPATCH=1` now applies to static and dynamic libraries, #1058 reported by @xiota
- build: Make builds now isolate objects by configuration and support parallel test builds
- build: moved CMake integration to `build/cmake` and improved cross-compilation detection
- install: improved package metadata and installation paths on Windows and FreeBSD, by @iwamatsu, @chitao1234 and @sunpoet
- portability: fixed compilation on ARM with GCC < 8, by @mstorsjo
- portability: fixed C++ compilation on Solaris and illumos, by @luqmana
- portability: AVX-512 implementation no longer requires AVX-512BW, by @NexusXe
- doc  : expanded `xxhsum` documentation and clarified the algorithm specification files
- doc  : document non-cryptographic collision properties, notably for XXH3's mid-size path (#1127 by @thomasahle)

--===============8967729929046520539==--

