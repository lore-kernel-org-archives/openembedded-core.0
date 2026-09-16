Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3439BC88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 05:44:57 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8414.1789537491990857854
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 22:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Y6OX0FSa;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Xg+AHVWp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a0a8bf18a0-648d441c-b621-40ab-9753-210bd49c0094-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789537491;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DmhcEHqUMY2p0pqh8WK1EdPP3/u0QVcbYzHB2tmlwqA=;
	b=Y6OX0FSabMYpeX4vzDUeC4W7pU9FunQzOn+VrRmwElG1bEXwEyrn8CX+KKryYGJF
	NUMTGaFtvYoqUcyuApFYF6L0xeNgAkQLtlkTgeoj9U5NRhbN1I+gOieFkFQgfvwcIiJ
	rpfMHzPVZ/wWL/3O6+ddXgwg5PXsiw2nLpHBbb/M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789537491;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DmhcEHqUMY2p0pqh8WK1EdPP3/u0QVcbYzHB2tmlwqA=;
	b=Xg+AHVWpZfShl8pg9Bz0h9rQRepXRanc9T6Oga59dDtkGWqOYOr+mZ+apZsER93U
	kmS41BgO5PFuZ2ej+zEMzONLDwGyP0MY8R3IXkkDCRk5vKzOZwep8y3iPIf1vONdtaS
	kZFRyLeUk9WprAfD1x3gzw7E09yxLiRhsAzNGMnI=
Content-Type: multipart/mixed; boundary="===============1165908048589202325=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fastfloat: upgrading to 8.3.0 SUCCEEDED
Message-ID: <010101a0a8bf18a0-648d441c-b621-40ab-9753-210bd49c0094-000000@us-west-2.amazonses.com>
Date: Wed, 16 Sep 2026 05:44:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 05:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245916

--===============1165908048589202325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fastfloat* to *8.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fastfloat-upgrade-8.2.10-8.3.0.patch
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
From d9d1263f70664b76c4bd589acf79ab2cdf50ca58 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Sep 2026 05:15:47 +0000
Subject: [PATCH] fastfloat: upgrade 8.2.10 -> 8.3.0

b0ab987 Version 8.3.0
3254622 Add chars_format::javascript_sloppy (Annex B NonOctalDecimalIntegerLiteral)
e0e355c Merge pull request #407 from fastfloat/javascript-format
4fcb7e3 Fix clang-format 17 on FASTFLOAT_ASSERT macros
f837a78 Add chars_format::javascript (ECMAScript DecimalLiteral)
a8a02f7 Merge pull request #405 from fastfloat/old-style-cast
12e310a Avoid old-style casts
13ecd70 Merge pull request #399 from dg0yt/max
a1f63a8 Merge pull request #404 from latent-9/docs/fix-strtod-typo
37fb7d7 docs: fix strtod function name in README
c335514 Fix compat with min() macro
ec239e0 Fix compat with max() macro
f6df0f2 Merge pull request #398 from redis-performance/exp062-063-combo
11c390b Merge pull request #396 from fastfloat/dependabot/github_actions/github-actions-640176b5ab
1fa146e Bump actions/checkout in the github-actions group across 1 directory
ce25f0d Remove Stars section from README
46b2fba Reconcile redis-perf/optim: content superseded by upstream #381/#382/#387
5082489 EXP-063: test the mode-independent mantissa bound before the rounds_to_nearest probe
f4f36e0 EXP-062: enable the 4-digit SWAR fraction follow-up on all compilers (drop __clang__ gate)
8ec5d23 Merge pull request #395 from sahvx655-wq/is-space-signed-compare
c539b53 guard is_space against negative signed code units
3ff2c0b EXP-053: clang-format (reflow comment + expression wrap; no semantic change)
a30c1f3 EXP-053: 4-digit SWAR follow-up in loop_parse_if_eight_digits, GCC path (ffc EXP-001)
ee84946 EXP-052: 2x unroll of char loop_parse_if_eight_digits (ported from ffc EXP-044)
8db9edb EXP-050: straight-line nested-if integer-part scan (ported from ffc EXP-026/028)
---
 .../fastfloat/{fastfloat_8.2.10.bb => fastfloat_8.3.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.2.10.bb => fastfloat_8.3.0.bb} (90%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.2.10.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.3.0.bb
similarity index 90%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.2.10.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.3.0.bb
index 3a5635bdeb..a041f32988 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.2.10.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.3.0.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "34164f547b7df3f5d794ff67e9f885c36819ebfc"
+SRCREV = "b0ab987b3dfdde13fa1915f65ef2a5c068d9208c"
 
 inherit cmake
-- 
2.47.1


--===============1165908048589202325==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fastfloat-upgrade-8.2.10-8.3.0.patch"

RnJvbSBkOWQxMjYzZjcwNjY0Yjc2YzRiZDU4OWFjZjc5YWIyY2RmNTBjYTU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgU2VwIDIwMjYgMDU6MTU6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
YXN0ZmxvYXQ6IHVwZ3JhZGUgOC4yLjEwIC0+IDguMy4wCgpiMGFiOTg3IFZlcnNpb24gOC4zLjAK
MzI1NDYyMiBBZGQgY2hhcnNfZm9ybWF0OjpqYXZhc2NyaXB0X3Nsb3BweSAoQW5uZXggQiBOb25P
Y3RhbERlY2ltYWxJbnRlZ2VyTGl0ZXJhbCkKZTBlMzU1YyBNZXJnZSBwdWxsIHJlcXVlc3QgIzQw
NyBmcm9tIGZhc3RmbG9hdC9qYXZhc2NyaXB0LWZvcm1hdAo0ZmNiN2UzIEZpeCBjbGFuZy1mb3Jt
YXQgMTcgb24gRkFTVEZMT0FUX0FTU0VSVCBtYWNyb3MKZjgzN2E3OCBBZGQgY2hhcnNfZm9ybWF0
OjpqYXZhc2NyaXB0IChFQ01BU2NyaXB0IERlY2ltYWxMaXRlcmFsKQphOGEwMmY3IE1lcmdlIHB1
bGwgcmVxdWVzdCAjNDA1IGZyb20gZmFzdGZsb2F0L29sZC1zdHlsZS1jYXN0CjEyZTMxMGEgQXZv
aWQgb2xkLXN0eWxlIGNhc3RzCjEzZWNkNzAgTWVyZ2UgcHVsbCByZXF1ZXN0ICMzOTkgZnJvbSBk
ZzB5dC9tYXgKYTFmNjNhOCBNZXJnZSBwdWxsIHJlcXVlc3QgIzQwNCBmcm9tIGxhdGVudC05L2Rv
Y3MvZml4LXN0cnRvZC10eXBvCjM3ZmI3ZDcgZG9jczogZml4IHN0cnRvZCBmdW5jdGlvbiBuYW1l
IGluIFJFQURNRQpjMzM1NTE0IEZpeCBjb21wYXQgd2l0aCBtaW4oKSBtYWNybwplYzIzOWUwIEZp
eCBjb21wYXQgd2l0aCBtYXgoKSBtYWNybwpmNmRmMGYyIE1lcmdlIHB1bGwgcmVxdWVzdCAjMzk4
IGZyb20gcmVkaXMtcGVyZm9ybWFuY2UvZXhwMDYyLTA2My1jb21ibwoxMWMzOTBiIE1lcmdlIHB1
bGwgcmVxdWVzdCAjMzk2IGZyb20gZmFzdGZsb2F0L2RlcGVuZGFib3QvZ2l0aHViX2FjdGlvbnMv
Z2l0aHViLWFjdGlvbnMtNjQwMTc2YjVhYgoxZmExNDZlIEJ1bXAgYWN0aW9ucy9jaGVja291dCBp
biB0aGUgZ2l0aHViLWFjdGlvbnMgZ3JvdXAgYWNyb3NzIDEgZGlyZWN0b3J5CmNlMjVmMGQgUmVt
b3ZlIFN0YXJzIHNlY3Rpb24gZnJvbSBSRUFETUUKNDZiMmZiYSBSZWNvbmNpbGUgcmVkaXMtcGVy
Zi9vcHRpbTogY29udGVudCBzdXBlcnNlZGVkIGJ5IHVwc3RyZWFtICMzODEvIzM4Mi8jMzg3CjUw
ODI0ODkgRVhQLTA2MzogdGVzdCB0aGUgbW9kZS1pbmRlcGVuZGVudCBtYW50aXNzYSBib3VuZCBi
ZWZvcmUgdGhlIHJvdW5kc190b19uZWFyZXN0IHByb2JlCmY0ZjM2ZTAgRVhQLTA2MjogZW5hYmxl
IHRoZSA0LWRpZ2l0IFNXQVIgZnJhY3Rpb24gZm9sbG93LXVwIG9uIGFsbCBjb21waWxlcnMgKGRy
b3AgX19jbGFuZ19fIGdhdGUpCjhlYzVkMjMgTWVyZ2UgcHVsbCByZXF1ZXN0ICMzOTUgZnJvbSBz
YWh2eDY1NS13cS9pcy1zcGFjZS1zaWduZWQtY29tcGFyZQpjNTM5YjUzIGd1YXJkIGlzX3NwYWNl
IGFnYWluc3QgbmVnYXRpdmUgc2lnbmVkIGNvZGUgdW5pdHMKM2ZmMmMwYiBFWFAtMDUzOiBjbGFu
Zy1mb3JtYXQgKHJlZmxvdyBjb21tZW50ICsgZXhwcmVzc2lvbiB3cmFwOyBubyBzZW1hbnRpYyBj
aGFuZ2UpCmEzMGMxZjMgRVhQLTA1MzogNC1kaWdpdCBTV0FSIGZvbGxvdy11cCBpbiBsb29wX3Bh
cnNlX2lmX2VpZ2h0X2RpZ2l0cywgR0NDIHBhdGggKGZmYyBFWFAtMDAxKQplZTg0OTQ2IEVYUC0w
NTI6IDJ4IHVucm9sbCBvZiBjaGFyIGxvb3BfcGFyc2VfaWZfZWlnaHRfZGlnaXRzIChwb3J0ZWQg
ZnJvbSBmZmMgRVhQLTA0NCkKOGRiOWVkYiBFWFAtMDUwOiBzdHJhaWdodC1saW5lIG5lc3RlZC1p
ZiBpbnRlZ2VyLXBhcnQgc2NhbiAocG9ydGVkIGZyb20gZmZjIEVYUC0wMjYvMDI4KQotLS0KIC4u
Li9mYXN0ZmxvYXQve2Zhc3RmbG9hdF84LjIuMTAuYmIgPT4gZmFzdGZsb2F0XzguMy4wLmJifSAg
ICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9mYXN0ZmxvYXQve2Zhc3RmbG9hdF84LjIu
MTAuYmIgPT4gZmFzdGZsb2F0XzguMy4wLmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9mYXN0ZmxvYXQvZmFzdGZsb2F0XzguMi4xMC5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9mYXN0ZmxvYXQvZmFzdGZsb2F0XzguMy4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9mYXN0ZmxvYXQvZmFzdGZsb2F0
XzguMi4xMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Zhc3RmbG9hdC9mYXN0
ZmxvYXRfOC4zLjAuYmIKaW5kZXggM2E1NjM1YmRlYi4uYTA0MWYzMjk4OCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2Zhc3RmbG9hdC9mYXN0ZmxvYXRfOC4yLjEwLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9mYXN0ZmxvYXQvZmFzdGZsb2F0XzguMy4wLmJiCkBAIC05
LDYgKzksNiBAQCBMSUNfRklMRVNfQ0hLU1VNID0gIiBcCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0
aHViLmNvbS9mYXN0ZmxvYXQvZmFzdF9mbG9hdC5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1h
aW47dGFnPXYke1BWfSIKIAotU1JDUkVWID0gIjM0MTY0ZjU0N2I3ZGYzZjVkNzk0ZmY2N2U5Zjg4
NWMzNjgxOWViZmMiCitTUkNSRVYgPSAiYjBhYjk4N2IzZGZkZGUxM2ZhMTkxNWY2NWVmMmE1YzA2
OGQ5MjA4YyIKIAogaW5oZXJpdCBjbWFrZQotLSAKMi40Ny4xCgo=

--===============1165908048589202325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="fastfloat-changelog.txt"

Changelog for fastfloat: 8.2.10 -> 8.3.0

b0ab987 Version 8.3.0
3254622 Add chars_format::javascript_sloppy (Annex B NonOctalDecimalIntegerLiteral)
e0e355c Merge pull request #407 from fastfloat/javascript-format
4fcb7e3 Fix clang-format 17 on FASTFLOAT_ASSERT macros
f837a78 Add chars_format::javascript (ECMAScript DecimalLiteral)
a8a02f7 Merge pull request #405 from fastfloat/old-style-cast
12e310a Avoid old-style casts
13ecd70 Merge pull request #399 from dg0yt/max
a1f63a8 Merge pull request #404 from latent-9/docs/fix-strtod-typo
37fb7d7 docs: fix strtod function name in README
c335514 Fix compat with min() macro
ec239e0 Fix compat with max() macro
f6df0f2 Merge pull request #398 from redis-performance/exp062-063-combo
11c390b Merge pull request #396 from fastfloat/dependabot/github_actions/github-actions-640176b5ab
1fa146e Bump actions/checkout in the github-actions group across 1 directory
ce25f0d Remove Stars section from README
46b2fba Reconcile redis-perf/optim: content superseded by upstream #381/#382/#387
5082489 EXP-063: test the mode-independent mantissa bound before the rounds_to_nearest probe
f4f36e0 EXP-062: enable the 4-digit SWAR fraction follow-up on all compilers (drop __clang__ gate)
8ec5d23 Merge pull request #395 from sahvx655-wq/is-space-signed-compare
c539b53 guard is_space against negative signed code units
3ff2c0b EXP-053: clang-format (reflow comment + expression wrap; no semantic change)
a30c1f3 EXP-053: 4-digit SWAR follow-up in loop_parse_if_eight_digits, GCC path (ffc EXP-001)
ee84946 EXP-052: 2x unroll of char loop_parse_if_eight_digits (ported from ffc EXP-044)
8db9edb EXP-050: straight-line nested-if integer-part scan (ported from ffc EXP-026/028)

--===============1165908048589202325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dbg: PKGV changed from 8.2.10 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dbg: PV changed from "8.2.10" to "8.3.0"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PKGSIZE changed from 181252 to 185076 (+2%)
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PKGV changed from 8.2.10 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PV changed from "8.2.10" to "8.3.0"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-doc: PKGV changed from 8.2.10 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-doc: PV changed from "8.2.10" to "8.3.0"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-locale: PKGV changed from 8.2.10 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-locale: PV changed from "8.2.10" to "8.3.0"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-src: PKGV changed from 8.2.10 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-src: PV changed from "8.2.10" to "8.3.0"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-staticdev: PKGV changed from 8.2.10 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-staticdev: PV changed from "8.2.10" to "8.3.0"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat: PKGV changed from 8.2.10 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat: PV changed from "8.2.10" to "8.3.0"
packages/x86-64-v3-poky-linux/fastfloat: SRC_URI changed from "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v8.2.10" to "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v8.3.0"
packages/x86-64-v3-poky-linux/fastfloat: PKGV changed from 8.2.10 [default] to 8.3.0 [default]
packages/x86-64-v3-poky-linux/fastfloat: PV changed from "8.2.10" to "8.3.0"

--===============1165908048589202325==--

