Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF134C88E5A
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 06:46:08 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1970.1789195563117324356
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 23:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PfIl5nQI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OB8wRRDW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a0945dacb4-1f5d322d-101d-485f-8f7c-868bfe05438c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789195562;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tsTI09+mf9FNkSjYDFYNDR8fFN4z+fvsXZ9RtTbI5AI=;
	b=PfIl5nQIqMIAoRG9xJyP8XIigfCEgXOcgeatO/IzjVymAwB+So0Zj2XiQqQeOJfZ
	Hm/Q5DVAXZmGp4v9V6Wz2NgysUJLzZKypwPdnCqBb6rUh0AeUxM9K7a4fcHN6+k9SOQ
	B2Jr/0k3UiwYItWR9OXJHYn1FcKzFqjMaEFjmYzc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789195562;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tsTI09+mf9FNkSjYDFYNDR8fFN4z+fvsXZ9RtTbI5AI=;
	b=OB8wRRDW/9t2ko2gO4CUHKk/7XUGdOwqCZBHGTOUaRz8P53mmldNXNIUZ9jaMxnT
	Gm4EVtZ2qcDp/Grk5BX3t4bNZSp3ojRBx9Bpodcoc05x4quGTKktdQtdpQP67Xfo752
	LvzTXkapRXzXFynY55d7wDl3AAf+UQl11YofPzyI=
Content-Type: multipart/mixed; boundary="===============8250391629396372949=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgcrypt: upgrading to 1.12.4 SUCCEEDED
Message-ID: <010101a0945dacb4-1f5d322d-101d-485f-8f7c-868bfe05438c-000000@us-west-2.amazonses.com>
Date: Sat, 12 Sep 2026 06:46:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.12-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 06:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245692

--===============8250391629396372949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libgcrypt* to *1.12.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgcrypt-upgrade-1.12.3-1.12.4.patch
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
From a7cf2cb50c413f37939b380380204646d03f9e5c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 12 Sep 2026 06:39:58 +0000
Subject: [PATCH] libgcrypt: upgrade 1.12.3 -> 1.12.4

Source: ChangeLog

2026-09-11  Werner Koch  <wk@gnupg.org>

	Release 1.12.4.
	+ commit 9a53b01742be48c50c3f4340b8e839010bc55d92

2026-09-11  NIIBE Yutaka  <gniibe@fsij.org>

	cipher:keccak: Fix padding in cSHAKE.
	+ commit f54ce47180e23850fa1ff3f76cd3d880fb99808a
	* cipher/keccak.c (cshake_input_s): Fix PADLEN calculation.

2026-09-02  Jussi Kivilinna  <jussi.kivilinna@iki.fi>

	sm4: add separate configure check for AVX512 SM4 instructions.
	+ commit f0bc379e0f3585908707095db5d3c505e664726f
	* cipher/sm4-intel-avx512-amd64.S: Check for
	HAVE_GCC_INLINE_ASM_SM4_AVX512 instead of HAVE_GCC_INLINE_ASM_SM4.
	* cipher/sm4.c (USE_INTEL_SM4_AVX512): Require USE_INTEL_SM4_AVX2 and
	HAVE_GCC_INLINE_ASM_SM4_AVX512.
	* configure.ac (gcry_cv_gcc_inline_asm_sm4_avx512)
	(HAVE_GCC_INLINE_ASM_SM4_AVX512): New.

2026-08-28  NIIBE Yutaka  <gniibe@fsij.org>

	cipher:rsa:pss: Fix SALT-LENGTH handling.
	+ commit 3ed69d3fb85bac0901dc5b4899d7983cf1f7bbe7
	* cipher/pubkey-util.c (_gcry_pk_util_data_to_mpi): For
	PUBKEY_OP_SIGN, just like for PUBKEY_OP_VERIFY, reject larger
	SALT-LENGTH as the comment says.  Fix releasing LIST on error.

2026-08-27  NIIBE Yutaka  <gniibe@fsij.org>

	cipher:rsa:pss: Validate the length of hashed input.
	+ commit 612eb8c157c057feeaf17d30644fd65b05c5ea25
	* cipher/rsa-common.c (_gcry_rsa_pss_verify): Reject invalid input.

	cipher:rsa:oaep: Validate all-zero PS.
	+ commit cf55ce42d0268f9cfd7abc43aa4ec62d2e8c3f53
	* cipher/rsa-common.c (_gcry_rsa_oaep_decode): Reject non-zero PS.
---
 .../files/0001-libgcrypt-fix-m4-file-for-oe-core.patch          | 2 +-
 .../files/0001-tests-Fix-link-errors-for-t-thread-local.patch   | 2 +-
 ...4-tests-Makefile.am-fix-undefined-reference-to-pthread.patch | 2 +-
 meta/recipes-support/libgcrypt/files/no-bench-slope.patch       | 2 +-
 meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch  | 2 +-
 .../libgcrypt/{libgcrypt_1.12.3.bb => libgcrypt_1.12.4.bb}      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.12.3.bb => libgcrypt_1.12.4.bb} (95%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
index ad071e07f5..1000bfdec4 100644
--- a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
@@ -1,4 +1,4 @@
-From 4f27b68f509c94739d8d7c5e5c8bc1b0b17259ad Mon Sep 17 00:00:00 2001
+From 647eb747057fc56104eeae7108ac772612725326 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Tue, 29 Oct 2019 14:08:32 -0400
 Subject: [PATCH] libgcrypt: fix m4 file for oe-core
diff --git a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
index 6200ac0a31..51d310317a 100644
--- a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
@@ -1,4 +1,4 @@
-From 4a8d31b6e1af1d2764e159d5825ad2241a74fe7b Mon Sep 17 00:00:00 2001
+From 322faef0418e345d012b9fd6d0bc2b2e3655621a Mon Sep 17 00:00:00 2001
 From: Collin Funk <collin.funk1@gmail.com>
 Date: Wed, 27 Aug 2025 11:49:06 +0800
 Subject: [PATCH] tests: Fix link errors for t-thread-local.
diff --git a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
index 924ece8b8e..cd63c5486e 100644
--- a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
+++ b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
@@ -1,4 +1,4 @@
-From 6322f759b58ba78d5b01c09c19d91571e999334c Mon Sep 17 00:00:00 2001
+From 7394a5bf89760822515ea5b153c83f6d90ef95ab Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 27 Aug 2025 11:46:17 +0800
 Subject: [PATCH] tests/Makefile.am: fix undefined reference to
diff --git a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
index 849f8b0361..907aa0999d 100644
--- a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
+++ b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
@@ -1,4 +1,4 @@
-From 50bfe58f1ffa6a8519377f4c10e5d41133d8782a Mon Sep 17 00:00:00 2001
+From 24172e2cac95d2f4d66ce55575ff14bd23e48674 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 9 Sep 2022 11:13:37 +0100
 Subject: [PATCH] libgcrypt: disable bench-slope test case
diff --git a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
index f22f6993a2..e5e3b7cfff 100644
--- a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
+++ b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
@@ -1,4 +1,4 @@
-From a7778057e08273041c48e10ff2f4c7dcce9220c1 Mon Sep 17 00:00:00 2001
+From d757657cfecf9d1268b4a004546cf15562d58a49 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 26 Aug 2022 15:23:37 +0100
 Subject: [PATCH] libgcrypt: rewrite ptest
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb
similarity index 95%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb
index a7f8147228..1b2b1dc13b 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb
@@ -26,7 +26,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-bench-slope.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "98d1b0b3202d2b03fa754a35aa3cbbfcf526a3260d8d2ee213748001b1043006"
+SRC_URI[sha256sum] = "d77f68f48879510e79a2f65977ccc68981781ea0923e5bdffac2a193ea3d660e"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-- 
2.47.1


--===============8250391629396372949==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgcrypt-upgrade-1.12.3-1.12.4.patch"

RnJvbSBhN2NmMmNiNTBjNDEzZjM3OTM5YjM4MDM4MDIwNDY0NmQwM2Y5ZTVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTIgU2VwIDIwMjYgMDY6Mzk6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJnY3J5cHQ6IHVwZ3JhZGUgMS4xMi4zIC0+IDEuMTIuNAoKU291cmNlOiBDaGFuZ2VMb2cKCjIw
MjYtMDktMTEgIFdlcm5lciBLb2NoICA8d2tAZ251cGcub3JnPgoKCVJlbGVhc2UgMS4xMi40LgoJ
KyBjb21taXQgOWE1M2IwMTc0MmJlNDhjNTBjM2Y0MzQwYjhlODM5MDEwYmM1NWQ5MgoKMjAyNi0w
OS0xMSAgTklJQkUgWXV0YWthICA8Z25paWJlQGZzaWoub3JnPgoKCWNpcGhlcjprZWNjYWs6IEZp
eCBwYWRkaW5nIGluIGNTSEFLRS4KCSsgY29tbWl0IGY1NGNlNDcxODBlMjM4NTBmYTFmZjNmNzZj
ZDNkODgwZmI5OTgwOGEKCSogY2lwaGVyL2tlY2Nhay5jIChjc2hha2VfaW5wdXRfcyk6IEZpeCBQ
QURMRU4gY2FsY3VsYXRpb24uCgoyMDI2LTA5LTAyICBKdXNzaSBLaXZpbGlubmEgIDxqdXNzaS5r
aXZpbGlubmFAaWtpLmZpPgoKCXNtNDogYWRkIHNlcGFyYXRlIGNvbmZpZ3VyZSBjaGVjayBmb3Ig
QVZYNTEyIFNNNCBpbnN0cnVjdGlvbnMuCgkrIGNvbW1pdCBmMGJjMzc5ZTBmMzU4NTkwODcwNzA5
NWRiNWQzYzUwNWU2NjQ3MjZmCgkqIGNpcGhlci9zbTQtaW50ZWwtYXZ4NTEyLWFtZDY0LlM6IENo
ZWNrIGZvcgoJSEFWRV9HQ0NfSU5MSU5FX0FTTV9TTTRfQVZYNTEyIGluc3RlYWQgb2YgSEFWRV9H
Q0NfSU5MSU5FX0FTTV9TTTQuCgkqIGNpcGhlci9zbTQuYyAoVVNFX0lOVEVMX1NNNF9BVlg1MTIp
OiBSZXF1aXJlIFVTRV9JTlRFTF9TTTRfQVZYMiBhbmQKCUhBVkVfR0NDX0lOTElORV9BU01fU000
X0FWWDUxMi4KCSogY29uZmlndXJlLmFjIChnY3J5X2N2X2djY19pbmxpbmVfYXNtX3NtNF9hdng1
MTIpCgkoSEFWRV9HQ0NfSU5MSU5FX0FTTV9TTTRfQVZYNTEyKTogTmV3LgoKMjAyNi0wOC0yOCAg
TklJQkUgWXV0YWthICA8Z25paWJlQGZzaWoub3JnPgoKCWNpcGhlcjpyc2E6cHNzOiBGaXggU0FM
VC1MRU5HVEggaGFuZGxpbmcuCgkrIGNvbW1pdCAzZWQ2OWQzZmI4NWJhYzA5MDFkYzViNDg5OWQ3
OTgzY2YxZjdiYmU3CgkqIGNpcGhlci9wdWJrZXktdXRpbC5jIChfZ2NyeV9wa191dGlsX2RhdGFf
dG9fbXBpKTogRm9yCglQVUJLRVlfT1BfU0lHTiwganVzdCBsaWtlIGZvciBQVUJLRVlfT1BfVkVS
SUZZLCByZWplY3QgbGFyZ2VyCglTQUxULUxFTkdUSCBhcyB0aGUgY29tbWVudCBzYXlzLiAgRml4
IHJlbGVhc2luZyBMSVNUIG9uIGVycm9yLgoKMjAyNi0wOC0yNyAgTklJQkUgWXV0YWthICA8Z25p
aWJlQGZzaWoub3JnPgoKCWNpcGhlcjpyc2E6cHNzOiBWYWxpZGF0ZSB0aGUgbGVuZ3RoIG9mIGhh
c2hlZCBpbnB1dC4KCSsgY29tbWl0IDYxMmViOGMxNTdjMDU3ZmVlYWYxN2QzMDY0NGZkNjViMDVj
NWVhMjUKCSogY2lwaGVyL3JzYS1jb21tb24uYyAoX2djcnlfcnNhX3Bzc192ZXJpZnkpOiBSZWpl
Y3QgaW52YWxpZCBpbnB1dC4KCgljaXBoZXI6cnNhOm9hZXA6IFZhbGlkYXRlIGFsbC16ZXJvIFBT
LgoJKyBjb21taXQgY2Y1NWNlNDJkMDI2OGY5Y2ZkN2FiYzQzYWE0ZWM2MmQyZThjM2Y1MwoJKiBj
aXBoZXIvcnNhLWNvbW1vbi5jIChfZ2NyeV9yc2Ffb2FlcF9kZWNvZGUpOiBSZWplY3Qgbm9uLXpl
cm8gUFMuCi0tLQogLi4uL2ZpbGVzLzAwMDEtbGliZ2NyeXB0LWZpeC1tNC1maWxlLWZvci1vZS1j
b3JlLnBhdGNoICAgICAgICAgIHwgMiArLQogLi4uL2ZpbGVzLzAwMDEtdGVzdHMtRml4LWxpbmst
ZXJyb3JzLWZvci10LXRocmVhZC1sb2NhbC5wYXRjaCAgIHwgMiArLQogLi4uNC10ZXN0cy1NYWtl
ZmlsZS5hbS1maXgtdW5kZWZpbmVkLXJlZmVyZW5jZS10by1wdGhyZWFkLnBhdGNoIHwgMiArLQog
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzL25vLWJlbmNoLXNsb3BlLnBhdGNo
ICAgICAgIHwgMiArLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzL25vLW5h
dGl2ZS1ncGctZXJyb3IucGF0Y2ggIHwgMiArLQogLi4uL2xpYmdjcnlwdC97bGliZ2NyeXB0XzEu
MTIuMy5iYiA9PiBsaWJnY3J5cHRfMS4xMi40LmJifSAgICAgIHwgMiArLQogNiBmaWxlcyBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGliZ2NyeXB0L3tsaWJnY3J5cHRfMS4xMi4zLmJiID0+IGxpYmdjcnlwdF8xLjEy
LjQuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0
L2ZpbGVzLzAwMDEtbGliZ2NyeXB0LWZpeC1tNC1maWxlLWZvci1vZS1jb3JlLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzLzAwMDEtbGliZ2NyeXB0LWZpeC1tNC1m
aWxlLWZvci1vZS1jb3JlLnBhdGNoCmluZGV4IGFkMDcxZTA3ZjUuLjEwMDBiZmRlYzQgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxlcy8wMDAxLWxpYmdjcnlw
dC1maXgtbTQtZmlsZS1mb3Itb2UtY29yZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9saWJnY3J5cHQvZmlsZXMvMDAwMS1saWJnY3J5cHQtZml4LW00LWZpbGUtZm9yLW9lLWNvcmUu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDRmMjdiNjhmNTA5Yzk0NzM5ZDhkN2M1ZTVjOGJj
MWIwYjE3MjU5YWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDY0N2ViNzQ3MDU3ZmM1
NjEwNGVlYWU3MTA4YWM3NzI2MTI3MjUzMjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBUcmV2b3IgR2FtYmxpbiA8dHJldm9yLmdhbWJsaW5Ad2luZHJpdmVyLmNvbT4KIERhdGU6IFR1
ZSwgMjkgT2N0IDIwMTkgMTQ6MDg6MzIgLTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliZ2NyeXB0
OiBmaXggbTQgZmlsZSBmb3Igb2UtY29yZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGliZ2NyeXB0L2ZpbGVzLzAwMDEtdGVzdHMtRml4LWxpbmstZXJyb3JzLWZvci10LXRocmVh
ZC1sb2NhbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxlcy8wMDAx
LXRlc3RzLUZpeC1saW5rLWVycm9ycy1mb3ItdC10aHJlYWQtbG9jYWwucGF0Y2gKaW5kZXggNjIw
MGFjMGEzMS4uNTFkMzEwMzE3YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
Z2NyeXB0L2ZpbGVzLzAwMDEtdGVzdHMtRml4LWxpbmstZXJyb3JzLWZvci10LXRocmVhZC1sb2Nh
bC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQvZmlsZXMvMDAwMS10
ZXN0cy1GaXgtbGluay1lcnJvcnMtZm9yLXQtdGhyZWFkLWxvY2FsLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA0YThkMzFiNmUxYWYxZDI3NjRlMTU5ZDU4MjVhZDIyNDFhNzRmZTdiIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzMjJmYWVmMDQxOGUzNDVkMDEyYjlmZDZkMGJjMmIy
ZTM2NTU2MjFhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ29sbGluIEZ1bmsgPGNv
bGxpbi5mdW5rMUBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDI3IEF1ZyAyMDI1IDExOjQ5OjA2ICsw
ODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzOiBGaXggbGluayBlcnJvcnMgZm9yIHQtdGhyZWFk
LWxvY2FsLgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVz
LzAwMDQtdGVzdHMtTWFrZWZpbGUuYW0tZml4LXVuZGVmaW5lZC1yZWZlcmVuY2UtdG8tcHRocmVh
ZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxlcy8wMDA0LXRlc3Rz
LU1ha2VmaWxlLmFtLWZpeC11bmRlZmluZWQtcmVmZXJlbmNlLXRvLXB0aHJlYWQucGF0Y2gKaW5k
ZXggOTI0ZWNlOGI4ZS4uY2Q2M2M1NDg2ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGliZ2NyeXB0L2ZpbGVzLzAwMDQtdGVzdHMtTWFrZWZpbGUuYW0tZml4LXVuZGVmaW5lZC1y
ZWZlcmVuY2UtdG8tcHRocmVhZC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJn
Y3J5cHQvZmlsZXMvMDAwNC10ZXN0cy1NYWtlZmlsZS5hbS1maXgtdW5kZWZpbmVkLXJlZmVyZW5j
ZS10by1wdGhyZWFkLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2MzIyZjc1OWI1OGJhNzhk
NWIwMWMwOWMxOWQ5MTU3MWU5OTkzMzRjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3
Mzk0YTViZjg5NzYwODIyNTE1ZWE1YjE1M2M4M2Y2ZDkwZWY5NWFiIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0
ZTogV2VkLCAyNyBBdWcgMjAyNSAxMTo0NjoxNyArMDgwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0
cy9NYWtlZmlsZS5hbTogZml4IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8KZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxlcy9uby1iZW5jaC1zbG9wZS5wYXRjaCBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxlcy9uby1iZW5jaC1zbG9wZS5wYXRj
aAppbmRleCA4NDlmOGIwMzYxLi45MDdhYTA5OTlkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJnY3J5cHQvZmlsZXMvbm8tYmVuY2gtc2xvcGUucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzL25vLWJlbmNoLXNsb3BlLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSA1MGJmZTU4ZjFmZmE2YTg1MTkzNzdmNGMxMGU1ZDQxMTMzZDg3ODJh
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyNDE3MmUyY2FjOTVkMmY0ZDY2Y2U1NTU3
NWZmMTRiZDIzZTQ4Njc0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0
b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiBEYXRlOiBGcmksIDkgU2VwIDIwMjIgMTE6MTM6Mzcg
KzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliZ2NyeXB0OiBkaXNhYmxlIGJlbmNoLXNsb3BlIHRl
c3QgY2FzZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVz
L25vLW5hdGl2ZS1ncGctZXJyb3IucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5
cHQvZmlsZXMvbm8tbmF0aXZlLWdwZy1lcnJvci5wYXRjaAppbmRleCBmMjJmNjk5M2EyLi5lNWUz
YjdjZmZmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQvZmlsZXMv
bm8tbmF0aXZlLWdwZy1lcnJvci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJn
Y3J5cHQvZmlsZXMvbm8tbmF0aXZlLWdwZy1lcnJvci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gYTc3NzgwNTdlMDgyNzMwNDFjNDhlMTBmZjJmNGM3ZGNjZTkyMjBjMSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gZDc1NzY1N2NmZWNmOWQxMjY4YjRhMDA0NTQ2Y2YxNTU2MmQ1OGE0
OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRv
bkBhcm0uY29tPgogRGF0ZTogRnJpLCAyNiBBdWcgMjAyMiAxNToyMzozNyArMDEwMAogU3ViamVj
dDogW1BBVENIXSBsaWJnY3J5cHQ6IHJld3JpdGUgcHRlc3QKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9saWJnY3J5cHRfMS4xMi4zLmJiIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGliZ2NyeXB0L2xpYmdjcnlwdF8xLjEyLjQuYmIKc2ltaWxhcml0eSBpbmRleCA5
NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2xpYmdjcnlwdF8x
LjEyLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9saWJnY3J5
cHRfMS4xMi40LmJiCmluZGV4IGE3ZjgxNDcyMjguLjFiMmIxZGMxM2IgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9saWJnY3J5cHRfMS4xMi4zLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9saWJnY3J5cHRfMS4xMi40LmJiCkBAIC0yNiw3
ICsyNiw3IEBAIFNSQ19VUkkgPSAiJHtHTlVQR19NSVJST1J9L2xpYmdjcnlwdC9saWJnY3J5cHQt
JHtQVn0udGFyLmJ6MiBcCiAgICAgICAgICAgIGZpbGU6Ly9uby1iZW5jaC1zbG9wZS5wYXRjaCBc
CiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICAiCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiOThkMWIwYjMyMDJkMmIwM2ZhNzU0YTM1YWEzY2JiZmNmNTI2YTMyNjBkOGQy
ZWUyMTM3NDgwMDFiMTA0MzAwNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkNzdmNjhmNDg4Nzk1
MTBlNzlhMmY2NTk3N2NjYzY4OTgxNzgxZWEwOTIzZTViZGZmYWMyYTE5M2VhM2Q2NjBlIgogCiBC
SU5DT05GSUcgPSAiJHtiaW5kaXJ9L2xpYmdjcnlwdC1jb25maWciCiAKLS0gCjIuNDcuMQoK

--===============8250391629396372949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libgcrypt-changelog.txt"

Changelog for libgcrypt: 1.12.3 -> 1.12.4
Source: ChangeLog

2026-09-11  Werner Koch  <wk@gnupg.org>

	Release 1.12.4.
	+ commit 9a53b01742be48c50c3f4340b8e839010bc55d92

2026-09-11  NIIBE Yutaka  <gniibe@fsij.org>

	cipher:keccak: Fix padding in cSHAKE.
	+ commit f54ce47180e23850fa1ff3f76cd3d880fb99808a
	* cipher/keccak.c (cshake_input_s): Fix PADLEN calculation.

2026-09-02  Jussi Kivilinna  <jussi.kivilinna@iki.fi>

	sm4: add separate configure check for AVX512 SM4 instructions.
	+ commit f0bc379e0f3585908707095db5d3c505e664726f
	* cipher/sm4-intel-avx512-amd64.S: Check for
	HAVE_GCC_INLINE_ASM_SM4_AVX512 instead of HAVE_GCC_INLINE_ASM_SM4.
	* cipher/sm4.c (USE_INTEL_SM4_AVX512): Require USE_INTEL_SM4_AVX2 and
	HAVE_GCC_INLINE_ASM_SM4_AVX512.
	* configure.ac (gcry_cv_gcc_inline_asm_sm4_avx512)
	(HAVE_GCC_INLINE_ASM_SM4_AVX512): New.

2026-08-28  NIIBE Yutaka  <gniibe@fsij.org>

	cipher:rsa:pss: Fix SALT-LENGTH handling.
	+ commit 3ed69d3fb85bac0901dc5b4899d7983cf1f7bbe7
	* cipher/pubkey-util.c (_gcry_pk_util_data_to_mpi): For
	PUBKEY_OP_SIGN, just like for PUBKEY_OP_VERIFY, reject larger
	SALT-LENGTH as the comment says.  Fix releasing LIST on error.

2026-08-27  NIIBE Yutaka  <gniibe@fsij.org>

	cipher:rsa:pss: Validate the length of hashed input.
	+ commit 612eb8c157c057feeaf17d30644fd65b05c5ea25
	* cipher/rsa-common.c (_gcry_rsa_pss_verify): Reject invalid input.

	cipher:rsa:oaep: Validate all-zero PS.
	+ commit cf55ce42d0268f9cfd7abc43aa4ec62d2e8c3f53
	* cipher/rsa-common.c (_gcry_rsa_oaep_decode): Reject non-zero PS.

--===============8250391629396372949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt: FILELIST: removed "/usr/lib/libgcrypt.so.20.8.8", added "/usr/lib/libgcrypt.so.20.8.9"
Changes to packages/x86-64-v3-poky-linux/libgcrypt (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.8.8 to libgcrypt.so.20.8.9
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.8.8 to libgcrypt.so.20.8.9
  /usr/lib/libgcrypt.so.20.8.8 moved to /usr/lib/libgcrypt.so.20.8.9
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/libgcrypt-native (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.8.8 to libgcrypt.so.20.8.9
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.8.8 to libgcrypt.so.20.8.9
  /usr/lib/libgcrypt.so.20.8.8 moved to /usr/lib/libgcrypt.so.20.8.9

--===============8250391629396372949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libgcrypt: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.12.3.tar.bz2 file://0001-libgcrypt-fix-m4-file-for-oe-core.patch file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch file://0001-tests-Fix-link-errors-for-t-thread-local.patch file://no-native-gpg-error.patch file://no-bench-slope.patch file://run-ptest" to "https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.12.4.tar.bz2 file://0001-libgcrypt-fix-m4-file-for-oe-core.patch file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch file://0001-tests-Fix-link-errors-for-t-thread-local.patch file://no-native-gpg-error.patch file://no-bench-slope.patch file://run-ptest"
packages/x86-64-v3-poky-linux/libgcrypt: PKGV changed from 1.12.3 [default] to 1.12.4 [default]
packages/x86-64-v3-poky-linux/libgcrypt: PV changed from "1.12.3" to "1.12.4"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dbg: FILELIST: removed "/usr/lib/.debug/libgcrypt.so.20.8.8", added "/usr/lib/.debug/libgcrypt.so.20.8.9"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dbg: PKGV changed from 1.12.3 [default] to 1.12.4 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dbg: PKGSIZE changed from 19491720 to 19491832 (+0%)
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dbg: PV changed from "1.12.3" to "1.12.4"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dev: PKGV changed from 1.12.3 [default] to 1.12.4 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dev: PV changed from "1.12.3" to "1.12.4"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-doc: PKGV changed from 1.12.3 [default] to 1.12.4 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-doc: PV changed from "1.12.3" to "1.12.4"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-locale: PKGV changed from 1.12.3 [default] to 1.12.4 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-locale: PV changed from "1.12.3" to "1.12.4"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-ptest: PKGV changed from 1.12.3 [default] to 1.12.4 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-ptest: PV changed from "1.12.3" to "1.12.4"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-src: FILELIST: directory renamed /usr/src/debug/libgcrypt/1.12.3/cipher -> /usr/src/debug/libgcrypt/1.12.4/cipher, directory renamed /usr/src/debug/libgcrypt/1.12.3/random -> /usr/src/debug/libgcrypt/1.12.4/random, directory renamed /usr/src/debug/libgcrypt/1.12.3/src -> /usr/src/debug/libgcrypt/1.12.4/src, directory renamed /usr/src/debug/libgcrypt/1.12.3/mpi -> /usr/src/debug/libgcrypt/1.12.4/mpi, directory renamed /usr/src/debug/libgcrypt/1.12.3/tests -> /usr/src/debug/libgcrypt/1.12.4/tests, directory renamed /usr/src/debug/libgcrypt/1.12.3/compat -> /usr/src/debug/libgcrypt/1.12.4/compat
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-src: PKGV changed from 1.12.3 [default] to 1.12.4 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-src: PKGSIZE changed from 6009146 to 6009449 (+0%)
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-src: PV changed from "1.12.3" to "1.12.4"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-staticdev: PKGV changed from 1.12.3 [default] to 1.12.4 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-staticdev: PV changed from "1.12.3" to "1.12.4"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt: FILELIST: removed "/usr/lib/libgcrypt.so.20.8.8", added "/usr/lib/libgcrypt.so.20.8.9"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt: PKGV changed from 1.12.3 [default] to 1.12.4 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt: PV changed from "1.12.3" to "1.12.4"
Changes to packages/x86-64-v3-poky-linux/libgcrypt (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.8.8 to libgcrypt.so.20.8.9
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.8.8 to libgcrypt.so.20.8.9
  /usr/lib/libgcrypt.so.20.8.8 moved to /usr/lib/libgcrypt.so.20.8.9
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added
Changes to packages/x86_64-linux/libgcrypt-native (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.8.8 to libgcrypt.so.20.8.9
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.8.8 to libgcrypt.so.20.8.9
  /usr/lib/libgcrypt.so.20.8.8 moved to /usr/lib/libgcrypt.so.20.8.9

--===============8250391629396372949==--

