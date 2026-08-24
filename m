Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9040AC5DF9D
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 05:36:34 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10367.1787549783834674995
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 22:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cnPgewaH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nf/2AfWE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a032451321-0471d02c-632f-4a7e-aee7-c2e668358492-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787549782;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Um/ZC3w7W0sxPu7nLOboMBol9kMq+h3+X2CP3flzxKI=;
	b=cnPgewaHlcfdl2XB3MPs+e+8aTotLwwtbjoLtdGBiRxDNJ2IUfH6fduaTYr/1Bpa
	rrX3BYfFdMZuSBUWiCNmUx/31R5IjgWaM5/ck6wg3EvTLnKba7zI9QVx/a4Tc+aCffh
	yyc/Gh0mov1BsByBxNt8nPCjWWMVoqa6/XGWW6bk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787549782;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Um/ZC3w7W0sxPu7nLOboMBol9kMq+h3+X2CP3flzxKI=;
	b=nf/2AfWE/DFX8i/0qCJni4gX91YdXY0I3l3dLXpPeh4fkQFqwAC/V9HlVamCRYuD
	7PsHJo553EO6HtjnniWaRJBgM9eo+gGE7/WBAISjvVQyRvSD4ZZigRm3m7PyhfONcX6
	yKRaJxyLDRfM1zAK8ak+CIS7sAoUtPIAVx/5aCSo=
Content-Type: multipart/mixed; boundary="===============4973109378968113246=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] utfcpp: upgrading to 4.2.0 SUCCEEDED
Message-ID: <010101a032451321-0471d02c-632f-4a7e-aee7-c2e668358492-000000@us-west-2.amazonses.com>
Date: Mon, 24 Aug 2026 05:36:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.24-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 05:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244060

--===============4973109378968113246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *utfcpp* to *4.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-utfcpp-upgrade-4.1.1-4.2.0.patch
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
From 2737bf10c816274c2e6bd6424533879d8ae74151 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 24 Aug 2026 05:36:19 +0000
Subject: [PATCH] utfcpp: upgrade 4.1.1 -> 4.2.0

2d8e20b Release 4.2.0
44fdb26 Update README with project history link
5caca3f Fix exception type in API_REFERENCE.md
87ca49f next16 properly reports errors
c5585ef Reordered validity checks to preserve the earlier behavior.
4f46292 Fixed some warnings in benchmark.cpp
2f74d3b Removed unused is_overlong_sequence()
ef75b56 Rewrote validate_next that returns a code point.
85d5927 Fix bench/compare_commits.py
3145774 Revert the "minor optimization for ASCII range" as it actually hurts performance.
ca9e9bc Forgot to include the change for benchmark.cpp
ee0712e Fix the benchmarking script
9fb955a Python script to easily compare performance of two commits.
bf99533 A minor optimization for ASCII range.
---
 .../recipes-support/utfcpp/{utfcpp_4.1.1.bb => utfcpp_4.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/utfcpp/{utfcpp_4.1.1.bb => utfcpp_4.2.0.bb} (94%)

diff --git a/meta/recipes-support/utfcpp/utfcpp_4.1.1.bb b/meta/recipes-support/utfcpp/utfcpp_4.2.0.bb
similarity index 94%
rename from meta/recipes-support/utfcpp/utfcpp_4.1.1.bb
rename to meta/recipes-support/utfcpp/utfcpp_4.2.0.bb
index c2ad0939a1..c56d03b7c7 100644
--- a/meta/recipes-support/utfcpp/utfcpp_4.1.1.bb
+++ b/meta/recipes-support/utfcpp/utfcpp_4.2.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c \
 SRC_URI = "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v${PV} \
            file://run-ptest"
 
-SRCREV = "819011bb01628fe1aa2f1da9f2c842a48fd5680b"
+SRCREV = "2d8e20b22dcb3e9b3c4f52103182ebda949c6089"
 
 inherit cmake ptest
 
-- 
2.47.1


--===============4973109378968113246==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-utfcpp-upgrade-4.1.1-4.2.0.patch"

RnJvbSAyNzM3YmYxMGM4MTYyNzRjMmU2YmQ2NDI0NTMzODc5ZDhhZTc0MTUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMjQgQXVnIDIwMjYgMDU6MzY6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
dGZjcHA6IHVwZ3JhZGUgNC4xLjEgLT4gNC4yLjAKCjJkOGUyMGIgUmVsZWFzZSA0LjIuMAo0NGZk
YjI2IFVwZGF0ZSBSRUFETUUgd2l0aCBwcm9qZWN0IGhpc3RvcnkgbGluawo1Y2FjYTNmIEZpeCBl
eGNlcHRpb24gdHlwZSBpbiBBUElfUkVGRVJFTkNFLm1kCjg3Y2E0OWYgbmV4dDE2IHByb3Blcmx5
IHJlcG9ydHMgZXJyb3JzCmM1NTg1ZWYgUmVvcmRlcmVkIHZhbGlkaXR5IGNoZWNrcyB0byBwcmVz
ZXJ2ZSB0aGUgZWFybGllciBiZWhhdmlvci4KNGY0NjI5MiBGaXhlZCBzb21lIHdhcm5pbmdzIGlu
IGJlbmNobWFyay5jcHAKMmY3NGQzYiBSZW1vdmVkIHVudXNlZCBpc19vdmVybG9uZ19zZXF1ZW5j
ZSgpCmVmNzViNTYgUmV3cm90ZSB2YWxpZGF0ZV9uZXh0IHRoYXQgcmV0dXJucyBhIGNvZGUgcG9p
bnQuCjg1ZDU5MjcgRml4IGJlbmNoL2NvbXBhcmVfY29tbWl0cy5weQozMTQ1Nzc0IFJldmVydCB0
aGUgIm1pbm9yIG9wdGltaXphdGlvbiBmb3IgQVNDSUkgcmFuZ2UiIGFzIGl0IGFjdHVhbGx5IGh1
cnRzIHBlcmZvcm1hbmNlLgpjYTllOWJjIEZvcmdvdCB0byBpbmNsdWRlIHRoZSBjaGFuZ2UgZm9y
IGJlbmNobWFyay5jcHAKZWUwNzEyZSBGaXggdGhlIGJlbmNobWFya2luZyBzY3JpcHQKOWZiOTU1
YSBQeXRob24gc2NyaXB0IHRvIGVhc2lseSBjb21wYXJlIHBlcmZvcm1hbmNlIG9mIHR3byBjb21t
aXRzLgpiZjk5NTMzIEEgbWlub3Igb3B0aW1pemF0aW9uIGZvciBBU0NJSSByYW5nZS4KLS0tCiAu
Li4vcmVjaXBlcy1zdXBwb3J0L3V0ZmNwcC97dXRmY3BwXzQuMS4xLmJiID0+IHV0ZmNwcF80LjIu
MC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC91dGZjcHAve3V0ZmNwcF80LjEuMS5iYiA9
PiB1dGZjcHBfNC4yLjAuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvdXRmY3BwL3V0ZmNwcF80LjEuMS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3V0ZmNwcC91
dGZjcHBfNC4yLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvdXRmY3BwL3V0ZmNwcF80LjEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvdXRmY3BwL3V0ZmNwcF80LjIuMC5iYgppbmRleCBjMmFkMDkzOWExLi5jNTZkMDNi
N2M3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC91dGZjcHAvdXRmY3BwXzQuMS4x
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3V0ZmNwcC91dGZjcHBfNC4yLjAuYmIKQEAg
LTExLDcgKzExLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZTQy
MjRjY2FlY2IxNGQ5NDJjNzFkMzFiZWYyMGQ3OGMgXAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIu
Y29tL25lbXRyaWYvdXRmY3BwO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXI7dGFnPXYke1BW
fSBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QiCiAKLVNSQ1JFViA9ICI4MTkwMTFiYjAx
NjI4ZmUxYWEyZjFkYTlmMmM4NDJhNDhmZDU2ODBiIgorU1JDUkVWID0gIjJkOGUyMGIyMmRjYjNl
OWIzYzRmNTIxMDMxODJlYmRhOTQ5YzYwODkiCiAKIGluaGVyaXQgY21ha2UgcHRlc3QKIAotLSAK
Mi40Ny4xCgo=

--===============4973109378968113246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/utfcpp: PV changed from "4.1.1" to "4.2.0"
packages/x86-64-v3-poky-linux/utfcpp: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/utfcpp: SRC_URI changed from "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v4.1.1 file://run-ptest" to "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v4.2.0 file://run-ptest"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PV changed from "4.1.1" to "4.2.0"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PKGSIZE changed from 3547704 to 3581640 (+1%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dev: PV changed from "4.1.1" to "4.2.0"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dev: PKGSIZE changed from 64363 to 64666 (+0%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dev: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-doc: PV changed from "4.1.1" to "4.2.0"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-doc: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-locale: PV changed from "4.1.1" to "4.2.0"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-locale: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-ptest: PV changed from "4.1.1" to "4.2.0"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-ptest: PKGSIZE changed from 328657 to 332777 (+1%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-ptest: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: FILELIST: directory renamed /usr/src/debug/utfcpp/4.1.1/tests -> /usr/src/debug/utfcpp/4.2.0/tests, directory renamed /usr/src/debug/utfcpp/4.1.1/source/utf8 -> /usr/src/debug/utfcpp/4.2.0/source/utf8
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PV changed from "4.1.1" to "4.2.0"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PKGSIZE changed from 104766 to 106614 (+2%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-staticdev: PV changed from "4.1.1" to "4.2.0"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-staticdev: PKGV changed from 4.1.1 [default] to 4.2.0 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp: PV changed from "4.1.1" to "4.2.0"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp: PKGV changed from 4.1.1 [default] to 4.2.0 [default]

--===============4973109378968113246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="utfcpp-changelog.txt"

Changelog for utfcpp: 4.1.1 -> 4.2.0

2d8e20b Release 4.2.0
44fdb26 Update README with project history link
5caca3f Fix exception type in API_REFERENCE.md
87ca49f next16 properly reports errors
c5585ef Reordered validity checks to preserve the earlier behavior.
4f46292 Fixed some warnings in benchmark.cpp
2f74d3b Removed unused is_overlong_sequence()
ef75b56 Rewrote validate_next that returns a code point.
85d5927 Fix bench/compare_commits.py
3145774 Revert the "minor optimization for ASCII range" as it actually hurts performance.
ca9e9bc Forgot to include the change for benchmark.cpp
ee0712e Fix the benchmarking script
9fb955a Python script to easily compare performance of two commits.
bf99533 A minor optimization for ASCII range.

--===============4973109378968113246==--

