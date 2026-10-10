Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C101DCA9EC7
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 05:38:00 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4310.1791610673397867346
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 22:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LQf54rhY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=1+sw8Oaf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a1245154ae-a64ed4e4-dc15-46bf-ae1f-2e18ba6d1f60-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791610672;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5KizAGSpO9v4/aezb01Qwt/YplHCdxZYsmJuDJtCw0k=;
	b=LQf54rhYIeD4sKMrnx1gt803H+L44UNepnFo6EJ5Z7RZGHNewJDhRRgELC0xwpKu
	CrEmLtS1JjdAZ8feOZdRNdhaQbxFNmBpNiTVNc1FGh9OsbY71hd+U6VbNLd5p+4KjYy
	BK3XM+2NzXjhIyivZ9GpVlzoOSGKabTzYKmA47yQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791610672;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5KizAGSpO9v4/aezb01Qwt/YplHCdxZYsmJuDJtCw0k=;
	b=1+sw8Oaf1ZKIoTYX/ZaURPiuzDHcxJaZ3eiHjs/iSdjiOU9C/MOlbIVSKl1Wu2VN
	wbWkYz3lWpZjXcbnbGxQXqiD32Vl8gUVu5xoEbW2XjUCVowLbDcRbPJpxwOxJHSj12K
	QeHBsij7L1/r3O83Ruq+GAfza047mT3tgWKC0Spc=
Content-Type: multipart/mixed; boundary="===============2957223677937362529=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fastfloat: upgrading to 8.3.2 SUCCEEDED
Message-ID: <010101a1245154ae-a64ed4e4-dc15-46bf-ae1f-2e18ba6d1f60-000000@us-west-2.amazonses.com>
Date: Sat, 10 Oct 2026 05:37:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.10-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2026 05:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247489

--===============2957223677937362529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fastfloat* to *8.3.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fastfloat-upgrade-8.3.0-8.3.2.patch
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
From 57a7b3331887daede05bebc5936e1e0e6ab2ffe6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 10 Oct 2026 05:06:24 +0000
Subject: [PATCH] fastfloat: upgrade 8.3.0 -> 8.3.2

Version 8.3.2
Merge pull request #422 from sahvx655-wq/is-integer-signed-overflow
avoid signed overflow in is_integer for negative code units
Merge pull request #421 from sahvx655-wq/times-pow10-int64-min
avoid signed negation overflow in integer_times_pow10
Version 8.3.1
Merge pull request #420 from fastfloat/release-workflow
Add manually triggered release workflow; fix on-release asset upload
Merge pull request #419 from fastfloat/fix-418-struct-layout
Reorder parsed_number_string_t fields to avoid padding (fixes #418)
Merge pull request #417 from fastfloat/fix-alpine-ci
CI: pin Alpine to v3.22 (setup-alpine v1 fails with apk-tools v3)
Merge pull request #409 from caolanm/main
Merge pull request #415 from Algunenano/fix-benchmark-branch-misses
Average branch misses over the repetitions in the benchmark
Merge pull request #408 from jadidbourbaki/float16-exactness
Avoid right-shifting a negative value in subnormal_ties_possible()
Merge pull request #413 from fastfloat/clang-format-fold
Fold the format at compile time under clang, mark cold checks unlikely
Merge pull request #412 from fastfloat/strncasecmp-simple
Restore the simple loop in fastfloat_strncasecmp
Merge pull request #410 from Algunenano/javascript-fmt-hot-path
Keep chars_format::javascript out of the common hot path
Gate the subnormal tie test on a compile-time predicate
drop the unreachable tail of parse_mantissa
Fix std::float16_t rounding of subnormal ties and fast-path overflow
---
 .../fastfloat/{fastfloat_8.3.0.bb => fastfloat_8.3.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fastfloat/{fastfloat_8.3.0.bb => fastfloat_8.3.2.bb} (90%)

diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.3.0.bb b/meta/recipes-devtools/fastfloat/fastfloat_8.3.2.bb
similarity index 90%
rename from meta/recipes-devtools/fastfloat/fastfloat_8.3.0.bb
rename to meta/recipes-devtools/fastfloat/fastfloat_8.3.2.bb
index a041f32988..db4312bfd9 100644
--- a/meta/recipes-devtools/fastfloat/fastfloat_8.3.0.bb
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.3.2.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "b0ab987b3dfdde13fa1915f65ef2a5c068d9208c"
+SRCREV = "42f254836ee416ffcf2f4e6576260003ac33d48c"
 
 inherit cmake
-- 
2.47.1


--===============2957223677937362529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="fastfloat-changelog.txt"

Version 8.3.2
Merge pull request #422 from sahvx655-wq/is-integer-signed-overflow
avoid signed overflow in is_integer for negative code units
Merge pull request #421 from sahvx655-wq/times-pow10-int64-min
avoid signed negation overflow in integer_times_pow10
Version 8.3.1
Merge pull request #420 from fastfloat/release-workflow
Add manually triggered release workflow; fix on-release asset upload
Merge pull request #419 from fastfloat/fix-418-struct-layout
Reorder parsed_number_string_t fields to avoid padding (fixes #418)
Merge pull request #417 from fastfloat/fix-alpine-ci
CI: pin Alpine to v3.22 (setup-alpine v1 fails with apk-tools v3)
Merge pull request #409 from caolanm/main
Merge pull request #415 from Algunenano/fix-benchmark-branch-misses
Average branch misses over the repetitions in the benchmark
Merge pull request #408 from jadidbourbaki/float16-exactness
Avoid right-shifting a negative value in subnormal_ties_possible()
Merge pull request #413 from fastfloat/clang-format-fold
Fold the format at compile time under clang, mark cold checks unlikely
Merge pull request #412 from fastfloat/strncasecmp-simple
Restore the simple loop in fastfloat_strncasecmp
Merge pull request #410 from Algunenano/javascript-fmt-hot-path
Keep chars_format::javascript out of the common hot path
Gate the subnormal tie test on a compile-time predicate
drop the unreachable tail of parse_mantissa
Fix std::float16_t rounding of subnormal ties and fast-path overflow

--===============2957223677937362529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dbg: PKGV changed from 8.3.0 [default] to 8.3.2 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dbg: PV changed from "8.3.0" to "8.3.2"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PKGSIZE changed from 185076 to 191509 (+3%)
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PKGV changed from 8.3.0 [default] to 8.3.2 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-dev: PV changed from "8.3.0" to "8.3.2"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-doc: PKGV changed from 8.3.0 [default] to 8.3.2 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-doc: PV changed from "8.3.0" to "8.3.2"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-locale: PKGV changed from 8.3.0 [default] to 8.3.2 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-locale: PV changed from "8.3.0" to "8.3.2"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-src: PKGV changed from 8.3.0 [default] to 8.3.2 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-src: PV changed from "8.3.0" to "8.3.2"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-staticdev: PKGV changed from 8.3.0 [default] to 8.3.2 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat-staticdev: PV changed from "8.3.0" to "8.3.2"
packages/x86-64-v3-poky-linux/fastfloat/fastfloat: PKGV changed from 8.3.0 [default] to 8.3.2 [default]
packages/x86-64-v3-poky-linux/fastfloat/fastfloat: PV changed from "8.3.0" to "8.3.2"
packages/x86-64-v3-poky-linux/fastfloat: PKGV changed from 8.3.0 [default] to 8.3.2 [default]
packages/x86-64-v3-poky-linux/fastfloat: SRC_URI changed from "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v8.3.0" to "git://github.com/fastfloat/fast_float.git;protocol=https;branch=main;tag=v8.3.2"
packages/x86-64-v3-poky-linux/fastfloat: PV changed from "8.3.0" to "8.3.2"

--===============2957223677937362529==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fastfloat-upgrade-8.3.0-8.3.2.patch"

RnJvbSA1N2E3YjMzMzE4ODdkYWVkZTA1YmViYzU5MzZlMWUwZTZhYjJmZmU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTAgT2N0IDIwMjYgMDU6MDY6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
YXN0ZmxvYXQ6IHVwZ3JhZGUgOC4zLjAgLT4gOC4zLjIKClZlcnNpb24gOC4zLjIKTWVyZ2UgcHVs
bCByZXF1ZXN0ICM0MjIgZnJvbSBzYWh2eDY1NS13cS9pcy1pbnRlZ2VyLXNpZ25lZC1vdmVyZmxv
dwphdm9pZCBzaWduZWQgb3ZlcmZsb3cgaW4gaXNfaW50ZWdlciBmb3IgbmVnYXRpdmUgY29kZSB1
bml0cwpNZXJnZSBwdWxsIHJlcXVlc3QgIzQyMSBmcm9tIHNhaHZ4NjU1LXdxL3RpbWVzLXBvdzEw
LWludDY0LW1pbgphdm9pZCBzaWduZWQgbmVnYXRpb24gb3ZlcmZsb3cgaW4gaW50ZWdlcl90aW1l
c19wb3cxMApWZXJzaW9uIDguMy4xCk1lcmdlIHB1bGwgcmVxdWVzdCAjNDIwIGZyb20gZmFzdGZs
b2F0L3JlbGVhc2Utd29ya2Zsb3cKQWRkIG1hbnVhbGx5IHRyaWdnZXJlZCByZWxlYXNlIHdvcmtm
bG93OyBmaXggb24tcmVsZWFzZSBhc3NldCB1cGxvYWQKTWVyZ2UgcHVsbCByZXF1ZXN0ICM0MTkg
ZnJvbSBmYXN0ZmxvYXQvZml4LTQxOC1zdHJ1Y3QtbGF5b3V0ClJlb3JkZXIgcGFyc2VkX251bWJl
cl9zdHJpbmdfdCBmaWVsZHMgdG8gYXZvaWQgcGFkZGluZyAoZml4ZXMgIzQxOCkKTWVyZ2UgcHVs
bCByZXF1ZXN0ICM0MTcgZnJvbSBmYXN0ZmxvYXQvZml4LWFscGluZS1jaQpDSTogcGluIEFscGlu
ZSB0byB2My4yMiAoc2V0dXAtYWxwaW5lIHYxIGZhaWxzIHdpdGggYXBrLXRvb2xzIHYzKQpNZXJn
ZSBwdWxsIHJlcXVlc3QgIzQwOSBmcm9tIGNhb2xhbm0vbWFpbgpNZXJnZSBwdWxsIHJlcXVlc3Qg
IzQxNSBmcm9tIEFsZ3VuZW5hbm8vZml4LWJlbmNobWFyay1icmFuY2gtbWlzc2VzCkF2ZXJhZ2Ug
YnJhbmNoIG1pc3NlcyBvdmVyIHRoZSByZXBldGl0aW9ucyBpbiB0aGUgYmVuY2htYXJrCk1lcmdl
IHB1bGwgcmVxdWVzdCAjNDA4IGZyb20gamFkaWRib3VyYmFraS9mbG9hdDE2LWV4YWN0bmVzcwpB
dm9pZCByaWdodC1zaGlmdGluZyBhIG5lZ2F0aXZlIHZhbHVlIGluIHN1Ym5vcm1hbF90aWVzX3Bv
c3NpYmxlKCkKTWVyZ2UgcHVsbCByZXF1ZXN0ICM0MTMgZnJvbSBmYXN0ZmxvYXQvY2xhbmctZm9y
bWF0LWZvbGQKRm9sZCB0aGUgZm9ybWF0IGF0IGNvbXBpbGUgdGltZSB1bmRlciBjbGFuZywgbWFy
ayBjb2xkIGNoZWNrcyB1bmxpa2VseQpNZXJnZSBwdWxsIHJlcXVlc3QgIzQxMiBmcm9tIGZhc3Rm
bG9hdC9zdHJuY2FzZWNtcC1zaW1wbGUKUmVzdG9yZSB0aGUgc2ltcGxlIGxvb3AgaW4gZmFzdGZs
b2F0X3N0cm5jYXNlY21wCk1lcmdlIHB1bGwgcmVxdWVzdCAjNDEwIGZyb20gQWxndW5lbmFuby9q
YXZhc2NyaXB0LWZtdC1ob3QtcGF0aApLZWVwIGNoYXJzX2Zvcm1hdDo6amF2YXNjcmlwdCBvdXQg
b2YgdGhlIGNvbW1vbiBob3QgcGF0aApHYXRlIHRoZSBzdWJub3JtYWwgdGllIHRlc3Qgb24gYSBj
b21waWxlLXRpbWUgcHJlZGljYXRlCmRyb3AgdGhlIHVucmVhY2hhYmxlIHRhaWwgb2YgcGFyc2Vf
bWFudGlzc2EKRml4IHN0ZDo6ZmxvYXQxNl90IHJvdW5kaW5nIG9mIHN1Ym5vcm1hbCB0aWVzIGFu
ZCBmYXN0LXBhdGggb3ZlcmZsb3cKLS0tCiAuLi4vZmFzdGZsb2F0L3tmYXN0ZmxvYXRfOC4zLjAu
YmIgPT4gZmFzdGZsb2F0XzguMy4yLmJifSAgICAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZmFzdGZsb2F0L3tmYXN0ZmxvYXRfOC4zLjAuYmIgPT4gZmFzdGZsb2F0XzguMy4yLmJifSAo
OTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mYXN0ZmxvYXQvZmFzdGZs
b2F0XzguMy4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Zhc3RmbG9hdC9mYXN0ZmxvYXRf
OC4zLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2Zhc3RmbG9hdC9mYXN0ZmxvYXRfOC4zLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9mYXN0ZmxvYXQvZmFzdGZsb2F0XzguMy4yLmJiCmluZGV4IGEwNDFmMzI5ODgu
LmRiNDMxMmJmZDkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mYXN0ZmxvYXQv
ZmFzdGZsb2F0XzguMy4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mYXN0ZmxvYXQv
ZmFzdGZsb2F0XzguMy4yLmJiCkBAIC05LDYgKzksNiBAQCBMSUNfRklMRVNfQ0hLU1VNID0gIiBc
CiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9mYXN0ZmxvYXQvZmFzdF9mbG9hdC5naXQ7
cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW47dGFnPXYke1BWfSIKIAotU1JDUkVWID0gImIwYWI5
ODdiM2RmZGRlMTNmYTE5MTVmNjVlZjJhNWMwNjhkOTIwOGMiCitTUkNSRVYgPSAiNDJmMjU0ODM2
ZWU0MTZmZmNmMmY0ZTY1NzYyNjAwMDNhYzMzZDQ4YyIKIAogaW5oZXJpdCBjbWFrZQotLSAKMi40
Ny4xCgo=

--===============2957223677937362529==--

