Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958D2CD4849
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:58 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15722.1777645547891219740
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=C6o1W3z5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=sn8qOH9J;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019de3ee8e72-4393aa39-46f1-408a-88b1-6d539eeb2c99-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6VD3yi2OMIiJuyL/EvFJSFFthtXGawzyfdV9ua2WX1Q=;
	b=C6o1W3z5q/cMHZ11byvbWWTWZiGDUSuruA/rz8fwDAjMVlZg+j/wIMqDTWVvafh+
	sMaBWXiEblzsfS5F2JgtTLDcka8RH1EiTSY6i4jjGIwfcEWqQiEYA5plDqxY2LGSan6
	Ax0C3CRt7FtNYXFdIRBJGs6jgs0DmCzIqInoi5sM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6VD3yi2OMIiJuyL/EvFJSFFthtXGawzyfdV9ua2WX1Q=;
	b=sn8qOH9JIslZdr5TlqPbf5NP5fL8LPMxmcChYFrD8ScKIID9tlH4CgH1CyHwp6zD
	QPN9dQXfEbkDqh5SFgO6Ei1uU5xGbhKmpxjTn4EhT3qTCk3guNXhXIKwS0QYcAYPh9u
	ZvRjKS4GRojTMD1AYbvKS3lS1e3dgcOnBcf9nBUQ=
Content-Type: multipart/mixed; boundary="===============3388073704110638846=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgcrypt: upgrading to 1.12.2 SUCCEEDED
Message-ID: <0101019de3ee8e72-4393aa39-46f1-408a-88b1-6d539eeb2c99-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236293

--===============3388073704110638846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libgcrypt* to *1.12.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgcrypt-upgrade-1.12.1-1.12.2.patch
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
From 5800df13f47f057930e3715e6fd9322231e55acb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 13:47:04 +0000
Subject: [PATCH] libgcrypt: upgrade 1.12.1 -> 1.12.2

---
 .../0001-libgcrypt-fix-m4-file-for-oe-core.patch      |  2 +-
 ...001-tests-Fix-link-errors-for-t-thread-local.patch |  9 +++------
 ...kefile.am-fix-undefined-reference-to-pthread.patch | 11 ++++-------
 .../libgcrypt/files/no-bench-slope.patch              |  2 +-
 .../libgcrypt/files/no-native-gpg-error.patch         |  4 ++--
 .../{libgcrypt_1.12.1.bb => libgcrypt_1.12.2.bb}      |  2 +-
 6 files changed, 12 insertions(+), 18 deletions(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.12.1.bb => libgcrypt_1.12.2.bb} (95%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
index e60507e636..9f4baff00f 100644
--- a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
@@ -1,4 +1,4 @@
-From 3bc536529c9bbe1e62d1c1127abee6183ed64298 Mon Sep 17 00:00:00 2001
+From f78c2dc171ed1f84260f5d8cb38a1c9e42550065 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Tue, 29 Oct 2019 14:08:32 -0400
 Subject: [PATCH] libgcrypt: fix m4 file for oe-core
diff --git a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
index 8dc2fe328c..cbfa6af0ef 100644
--- a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
@@ -1,4 +1,4 @@
-From 942e232ded48fa08d2bda417ae8ad8c03d644372 Mon Sep 17 00:00:00 2001
+From 9b6967df2ebe1824204ad0875352f44878a3a9c2 Mon Sep 17 00:00:00 2001
 From: Collin Funk <collin.funk1@gmail.com>
 Date: Wed, 27 Aug 2025 11:49:06 +0800
 Subject: [PATCH] tests: Fix link errors for t-thread-local.
@@ -21,10 +21,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 4800135..f0f7adb 100644
+index b5ad74c..b7de27d 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -98,7 +98,7 @@ testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
+@@ -102,7 +102,7 @@ testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_CFLAGS = $(GPG_ERROR_MT_CFLAGS) -lpthread
  t_thread_local_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
@@ -33,6 +33,3 @@ index 4800135..f0f7adb 100644
  testdrv_LDADD = $(LDADD_FOR_TESTS_KLUDGE)
  
  # Build a version of the test driver for the build platform.
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
index bbd48ebeee..d57e055b5a 100644
--- a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
+++ b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
@@ -1,4 +1,4 @@
-From a3496435dcc223a914eec5e61e853934fd4eb635 Mon Sep 17 00:00:00 2001
+From 92f5bf2a511bef2d38413736f6997b9627f15f7f Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 27 Aug 2025 11:46:17 +0800
 Subject: [PATCH] tests/Makefile.am: fix undefined reference to
@@ -14,10 +14,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 93daf3c..4800135 100644
+index 4f42925..b5ad74c 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -96,7 +96,7 @@ t_mpi_bit_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
+@@ -100,7 +100,7 @@ t_mpi_bit_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_secmem_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
@@ -26,7 +26,7 @@ index 93daf3c..4800135 100644
  t_thread_local_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
  t_thread_local_CFLAGS = $(GPG_ERROR_MT_CFLAGS)
  testdrv_LDADD = $(LDADD_FOR_TESTS_KLUDGE)
-@@ -117,7 +117,7 @@ else
+@@ -122,7 +122,7 @@ else
  xtestsuite_libs = ../src/.libs/libgcrypt.so*
  xtestsuite_driver = testdrv
  t_kdf_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
@@ -35,6 +35,3 @@ index 93daf3c..4800135 100644
  endif
  
  # xcheck uses our new testdrv instead of the automake test runner.
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
index 606cca1344..988f9044c0 100644
--- a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
+++ b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
@@ -1,4 +1,4 @@
-From 254821a620c1f7d6542c23dbe555e7c02637a3f8 Mon Sep 17 00:00:00 2001
+From a4ad0acc649abaaace2940a2bdb88fa56836b3bb Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 9 Sep 2022 11:13:37 +0100
 Subject: [PATCH] libgcrypt: disable bench-slope test case
diff --git a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
index 98874ce12a..9c43669486 100644
--- a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
+++ b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
@@ -1,4 +1,4 @@
-From ede03b847038afc294e206ca345d12d75bbba844 Mon Sep 17 00:00:00 2001
+From 2068315e64c8e1b887643a383135d2443a373379 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 26 Aug 2022 15:23:37 +0100
 Subject: [PATCH] libgcrypt: rewrite ptest
@@ -13,7 +13,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/tests/testdrv.c b/tests/testdrv.c
-index bfca4c2..634b718 100644
+index 7743258..bffa3cc 100644
 --- a/tests/testdrv.c
 +++ b/tests/testdrv.c
 @@ -32,7 +32,6 @@
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb
similarity index 95%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb
index b3c0d050b7..1eb6c472a3 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb
@@ -26,7 +26,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-bench-slope.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "7df5c08d952ba33f9b6bdabdb06a61a78b2cf62d2122c2d1d03a91a79832aa3c"
+SRC_URI[sha256sum] = "7ce33c2492221a0436f96a8500215e9f3e3dcb5fd26a757cd415e7a843babd5e"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-- 
2.47.1


--===============3388073704110638846==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgcrypt-upgrade-1.12.1-1.12.2.patch"

RnJvbSA1ODAwZGYxM2Y0N2YwNTc5MzBlMzcxNWU2ZmQ5MzIyMjMxZTU1YWNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMzo0NzowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmdjcnlwdDogdXBncmFkZSAxLjEyLjEgLT4gMS4xMi4yCgotLS0KIC4uLi8wMDAxLWxpYmdjcnlw
dC1maXgtbTQtZmlsZS1mb3Itb2UtY29yZS5wYXRjaCAgICAgIHwgIDIgKy0KIC4uLjAwMS10ZXN0
cy1GaXgtbGluay1lcnJvcnMtZm9yLXQtdGhyZWFkLWxvY2FsLnBhdGNoIHwgIDkgKysrLS0tLS0t
CiAuLi5rZWZpbGUuYW0tZml4LXVuZGVmaW5lZC1yZWZlcmVuY2UtdG8tcHRocmVhZC5wYXRjaCB8
IDExICsrKystLS0tLS0tCiAuLi4vbGliZ2NyeXB0L2ZpbGVzL25vLWJlbmNoLXNsb3BlLnBhdGNo
ICAgICAgICAgICAgICB8ICAyICstCiAuLi4vbGliZ2NyeXB0L2ZpbGVzL25vLW5hdGl2ZS1ncGct
ZXJyb3IucGF0Y2ggICAgICAgICB8ICA0ICsrLS0KIC4uLi97bGliZ2NyeXB0XzEuMTIuMS5iYiA9
PiBsaWJnY3J5cHRfMS4xMi4yLmJifSAgICAgIHwgIDIgKy0KIDYgZmlsZXMgY2hhbmdlZCwgMTIg
aW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGliZ2NyeXB0L3tsaWJnY3J5cHRfMS4xMi4xLmJiID0+IGxpYmdjcnlwdF8xLjEyLjIuYmJ9
ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVz
LzAwMDEtbGliZ2NyeXB0LWZpeC1tNC1maWxlLWZvci1vZS1jb3JlLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzLzAwMDEtbGliZ2NyeXB0LWZpeC1tNC1maWxlLWZv
ci1vZS1jb3JlLnBhdGNoCmluZGV4IGU2MDUwN2U2MzYuLjlmNGJhZmYwMGYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxlcy8wMDAxLWxpYmdjcnlwdC1maXgt
bTQtZmlsZS1mb3Itb2UtY29yZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJn
Y3J5cHQvZmlsZXMvMDAwMS1saWJnY3J5cHQtZml4LW00LWZpbGUtZm9yLW9lLWNvcmUucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDNiYzUzNjUyOWM5YmJlMWU2MmQxYzExMjdhYmVlNjE4M2Vk
NjQyOTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGY3OGMyZGMxNzFlZDFmODQyNjBm
NWQ4Y2IzOGExYzllNDI1NTAwNjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBUcmV2
b3IgR2FtYmxpbiA8dHJldm9yLmdhbWJsaW5Ad2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMjkg
T2N0IDIwMTkgMTQ6MDg6MzIgLTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliZ2NyeXB0OiBmaXgg
bTQgZmlsZSBmb3Igb2UtY29yZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
Z2NyeXB0L2ZpbGVzLzAwMDEtdGVzdHMtRml4LWxpbmstZXJyb3JzLWZvci10LXRocmVhZC1sb2Nh
bC5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxlcy8wMDAxLXRlc3Rz
LUZpeC1saW5rLWVycm9ycy1mb3ItdC10aHJlYWQtbG9jYWwucGF0Y2gKaW5kZXggOGRjMmZlMzI4
Yy4uY2JmYTZhZjBlZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0
L2ZpbGVzLzAwMDEtdGVzdHMtRml4LWxpbmstZXJyb3JzLWZvci10LXRocmVhZC1sb2NhbC5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQvZmlsZXMvMDAwMS10ZXN0cy1G
aXgtbGluay1lcnJvcnMtZm9yLXQtdGhyZWFkLWxvY2FsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSA5NDJlMjMyZGVkNDhmYTA4ZDJiZGE0MTdhZThhZDhjMDNkNjQ0MzcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSA5YjY5NjdkZjJlYmUxODI0MjA0YWQwODc1MzUyZjQ0ODc4YTNh
OWMyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ29sbGluIEZ1bmsgPGNvbGxpbi5m
dW5rMUBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDI3IEF1ZyAyMDI1IDExOjQ5OjA2ICswODAwCiBT
dWJqZWN0OiBbUEFUQ0hdIHRlc3RzOiBGaXggbGluayBlcnJvcnMgZm9yIHQtdGhyZWFkLWxvY2Fs
LgpAQCAtMjEsMTAgKzIxLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5q
aWFAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3Rlc3RzL01ha2VmaWxlLmFtIGIvdGVzdHMvTWFrZWZp
bGUuYW0KLWluZGV4IDQ4MDAxMzUuLmYwZjdhZGIgMTAwNjQ0CitpbmRleCBiNWFkNzRjLi5iN2Rl
MjdkIDEwMDY0NAogLS0tIGEvdGVzdHMvTWFrZWZpbGUuYW0KICsrKyBiL3Rlc3RzL01ha2VmaWxl
LmFtCi1AQCAtOTgsNyArOTgsNyBAQCB0ZXN0YXBpX0xEQUREID0gJChzdGFuZGFyZF9sZGFkZCkg
QExEQUREX0ZPUl9URVNUU19LTFVER0VACitAQCAtMTAyLDcgKzEwMiw3IEBAIHRlc3RhcGlfTERB
REQgPSAkKHN0YW5kYXJkX2xkYWRkKSBATERBRERfRk9SX1RFU1RTX0tMVURHRUAKICB0X2xvY2tf
TERBREQgPSAkKHN0YW5kYXJkX2xkYWRkKSAkKEdQR19FUlJPUl9NVF9MSUJTKSBATERBRERfRk9S
X1RFU1RTX0tMVURHRUAKICB0X2xvY2tfQ0ZMQUdTID0gJChHUEdfRVJST1JfTVRfQ0ZMQUdTKSAt
bHB0aHJlYWQKICB0X3RocmVhZF9sb2NhbF9MREFERCA9ICQoc3RhbmRhcmRfbGRhZGQpICQoR1BH
X0VSUk9SX01UX0xJQlMpIEBMREFERF9GT1JfVEVTVFNfS0xVREdFQApAQCAtMzMsNiArMzMsMyBA
QCBpbmRleCA0ODAwMTM1Li5mMGY3YWRiIDEwMDY0NAogIHRlc3RkcnZfTERBREQgPSAkKExEQURE
X0ZPUl9URVNUU19LTFVER0UpCiAgCiAgIyBCdWlsZCBhIHZlcnNpb24gb2YgdGhlIHRlc3QgZHJp
dmVyIGZvciB0aGUgYnVpbGQgcGxhdGZvcm0uCi0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQvZmlsZXMvMDAwNC10ZXN0cy1NYWtlZmlsZS5h
bS1maXgtdW5kZWZpbmVkLXJlZmVyZW5jZS10by1wdGhyZWFkLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzLzAwMDQtdGVzdHMtTWFrZWZpbGUuYW0tZml4LXVuZGVm
aW5lZC1yZWZlcmVuY2UtdG8tcHRocmVhZC5wYXRjaAppbmRleCBiYmQ0OGViZWVlLi5kNTdlMDU1
YjVhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQvZmlsZXMvMDAw
NC10ZXN0cy1NYWtlZmlsZS5hbS1maXgtdW5kZWZpbmVkLXJlZmVyZW5jZS10by1wdGhyZWFkLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxlcy8wMDA0LXRlc3Rz
LU1ha2VmaWxlLmFtLWZpeC11bmRlZmluZWQtcmVmZXJlbmNlLXRvLXB0aHJlYWQucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGEzNDk2NDM1ZGNjMjIzYTkxNGVlYzVlNjFlODUzOTM0ZmQ0ZWI2
MzUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDkyZjViZjJhNTExYmVmMmQzODQxMzcz
NmY2OTk3Yjk2MjdmMTVmN2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUg
SmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDI3IEF1ZyAyMDI1IDEx
OjQ2OjE3ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL01ha2VmaWxlLmFtOiBmaXggdW5k
ZWZpbmVkIHJlZmVyZW5jZSB0bwpAQCAtMTQsMTAgKzE0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEhv
bmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvdGVzdHMvTWFrZWZp
bGUuYW0gYi90ZXN0cy9NYWtlZmlsZS5hbQotaW5kZXggOTNkYWYzYy4uNDgwMDEzNSAxMDA2NDQK
K2luZGV4IDRmNDI5MjUuLmI1YWQ3NGMgMTAwNjQ0CiAtLS0gYS90ZXN0cy9NYWtlZmlsZS5hbQog
KysrIGIvdGVzdHMvTWFrZWZpbGUuYW0KLUBAIC05Niw3ICs5Niw3IEBAIHRfbXBpX2JpdF9MREFE
RCA9ICQoc3RhbmRhcmRfbGRhZGQpIEBMREFERF9GT1JfVEVTVFNfS0xVREdFQAorQEAgLTEwMCw3
ICsxMDAsNyBAQCB0X21waV9iaXRfTERBREQgPSAkKHN0YW5kYXJkX2xkYWRkKSBATERBRERfRk9S
X1RFU1RTX0tMVURHRUAKICB0X3NlY21lbV9MREFERCA9ICQoc3RhbmRhcmRfbGRhZGQpIEBMREFE
RF9GT1JfVEVTVFNfS0xVREdFQAogIHRlc3RhcGlfTERBREQgPSAkKHN0YW5kYXJkX2xkYWRkKSBA
TERBRERfRk9SX1RFU1RTX0tMVURHRUAKICB0X2xvY2tfTERBREQgPSAkKHN0YW5kYXJkX2xkYWRk
KSAkKEdQR19FUlJPUl9NVF9MSUJTKSBATERBRERfRk9SX1RFU1RTX0tMVURHRUAKQEAgLTI2LDcg
KzI2LDcgQEAgaW5kZXggOTNkYWYzYy4uNDgwMDEzNSAxMDA2NDQKICB0X3RocmVhZF9sb2NhbF9M
REFERCA9ICQoc3RhbmRhcmRfbGRhZGQpICQoR1BHX0VSUk9SX01UX0xJQlMpIEBMREFERF9GT1Jf
VEVTVFNfS0xVREdFQAogIHRfdGhyZWFkX2xvY2FsX0NGTEFHUyA9ICQoR1BHX0VSUk9SX01UX0NG
TEFHUykKICB0ZXN0ZHJ2X0xEQUREID0gJChMREFERF9GT1JfVEVTVFNfS0xVREdFKQotQEAgLTEx
Nyw3ICsxMTcsNyBAQCBlbHNlCitAQCAtMTIyLDcgKzEyMiw3IEBAIGVsc2UKICB4dGVzdHN1aXRl
X2xpYnMgPSAuLi9zcmMvLmxpYnMvbGliZ2NyeXB0LnNvKgogIHh0ZXN0c3VpdGVfZHJpdmVyID0g
dGVzdGRydgogIHRfa2RmX0xEQUREID0gJChzdGFuZGFyZF9sZGFkZCkgJChHUEdfRVJST1JfTVRf
TElCUykgQExEQUREX0ZPUl9URVNUU19LTFVER0VACkBAIC0zNSw2ICszNSwzIEBAIGluZGV4IDkz
ZGFmM2MuLjQ4MDAxMzUgMTAwNjQ0CiAgZW5kaWYKICAKICAjIHhjaGVjayB1c2VzIG91ciBuZXcg
dGVzdGRydiBpbnN0ZWFkIG9mIHRoZSBhdXRvbWFrZSB0ZXN0IHJ1bm5lci4KLS0tIAotMi4zNC4x
Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxlcy9uby1i
ZW5jaC1zbG9wZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxlcy9u
by1iZW5jaC1zbG9wZS5wYXRjaAppbmRleCA2MDZjY2ExMzQ0Li45ODhmOTA0NGMwIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQvZmlsZXMvbm8tYmVuY2gtc2xvcGUu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzL25vLWJlbmNo
LXNsb3BlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyNTQ4MjFhNjIwYzFmN2Q2NTQyYzIz
ZGJlNTU1ZTdjMDI2MzdhM2Y4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhNGFkMGFj
YzY0OWFiYWFhY2UyOTQwYTJiZGI4OGZhNTY4MzZiM2JiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiBEYXRlOiBGcmksIDkg
U2VwIDIwMjIgMTE6MTM6MzcgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliZ2NyeXB0OiBkaXNh
YmxlIGJlbmNoLXNsb3BlIHRlc3QgY2FzZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGliZ2NyeXB0L2ZpbGVzL25vLW5hdGl2ZS1ncGctZXJyb3IucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9saWJnY3J5cHQvZmlsZXMvbm8tbmF0aXZlLWdwZy1lcnJvci5wYXRjaAppbmRl
eCA5ODg3NGNlMTJhLi45YzQzNjY5NDg2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9saWJnY3J5cHQvZmlsZXMvbm8tbmF0aXZlLWdwZy1lcnJvci5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJnY3J5cHQvZmlsZXMvbm8tbmF0aXZlLWdwZy1lcnJvci5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gZWRlMDNiODQ3MDM4YWZjMjk0ZTIwNmNhMzQ1ZDEyZDc1YmJi
YTg0NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjA2ODMxNWU2NGM4ZTFiODg3NjQz
YTM4MzEzNWQyNDQzYTM3MzM3OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3Mg
QnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogRGF0ZTogRnJpLCAyNiBBdWcgMjAyMiAxNToy
MzozNyArMDEwMAogU3ViamVjdDogW1BBVENIXSBsaWJnY3J5cHQ6IHJld3JpdGUgcHRlc3QKQEAg
LTEzLDcgKzEzLDcgQEAgU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFy
bS5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3Rl
c3RzL3Rlc3RkcnYuYyBiL3Rlc3RzL3Rlc3RkcnYuYwotaW5kZXggYmZjYTRjMi4uNjM0YjcxOCAx
MDA2NDQKK2luZGV4IDc3NDMyNTguLmJmZmEzY2MgMTAwNjQ0CiAtLS0gYS90ZXN0cy90ZXN0ZHJ2
LmMKICsrKyBiL3Rlc3RzL3Rlc3RkcnYuYwogQEAgLTMyLDcgKzMyLDYgQEAKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9saWJnY3J5cHRfMS4xMi4xLmJiIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2xpYmdjcnlwdF8xLjEyLjIuYmIKc2ltaWxhcml0
eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2xp
YmdjcnlwdF8xLjEyLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlw
dC9saWJnY3J5cHRfMS4xMi4yLmJiCmluZGV4IGIzYzBkMDUwYjcuLjFlYjZjNDcyYTMgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9saWJnY3J5cHRfMS4xMi4xLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9saWJnY3J5cHRfMS4xMi4yLmJi
CkBAIC0yNiw3ICsyNiw3IEBAIFNSQ19VUkkgPSAiJHtHTlVQR19NSVJST1J9L2xpYmdjcnlwdC9s
aWJnY3J5cHQtJHtQVn0udGFyLmJ6MiBcCiAgICAgICAgICAgIGZpbGU6Ly9uby1iZW5jaC1zbG9w
ZS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICAiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiN2RmNWMwOGQ5NTJiYTMzZjliNmJkYWJkYjA2YTYxYTc4YjJj
ZjYyZDIxMjJjMmQxZDAzYTkxYTc5ODMyYWEzYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3Y2Uz
M2MyNDkyMjIxYTA0MzZmOTZhODUwMDIxNWU5ZjNlM2RjYjVmZDI2YTc1N2NkNDE1ZTdhODQzYmFi
ZDVlIgogCiBCSU5DT05GSUcgPSAiJHtiaW5kaXJ9L2xpYmdjcnlwdC1jb25maWciCiAKLS0gCjIu
NDcuMQoK

--===============3388073704110638846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt: FILELIST: removed "/usr/lib/libgcrypt.so.20.7.1", added "/usr/lib/libgcrypt.so.20.7.2"
Changes to packages/x86-64-v3-poky-linux/libgcrypt (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.7.1 to libgcrypt.so.20.7.2
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.7.1 to libgcrypt.so.20.7.2
  /usr/lib/libgcrypt.so.20.7.1 moved to /usr/lib/libgcrypt.so.20.7.2
Changes to packages/x86_64-linux/libgcrypt-native (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.7.1 to libgcrypt.so.20.7.2
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.7.1 to libgcrypt.so.20.7.2
  /usr/lib/libgcrypt.so.20.7.1 moved to /usr/lib/libgcrypt.so.20.7.2

--===============3388073704110638846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9883625 to 9685472 (-2%)
packages/x86-64-v3-poky-linux/libgcrypt: PV changed from "1.12.1" to "1.12.2"
packages/x86-64-v3-poky-linux/libgcrypt: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.12.1.tar.bz2 file://0001-libgcrypt-fix-m4-file-for-oe-core.patch file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch file://0001-tests-Fix-link-errors-for-t-thread-local.patch file://no-native-gpg-error.patch file://no-bench-slope.patch file://run-ptest" to "https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.12.2.tar.bz2 file://0001-libgcrypt-fix-m4-file-for-oe-core.patch file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch file://0001-tests-Fix-link-errors-for-t-thread-local.patch file://no-native-gpg-error.patch file://no-bench-slope.patch file://run-ptest"
packages/x86-64-v3-poky-linux/libgcrypt: PKGV changed from 1.12.1 [default] to 1.12.2 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dbg: PV changed from "1.12.1" to "1.12.2"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dbg: FILELIST: removed "/usr/lib/.debug/libgcrypt.so.20.7.1", added "/usr/lib/.debug/libgcrypt.so.20.7.2"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dbg: PKGV changed from 1.12.1 [default] to 1.12.2 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dbg: PKGSIZE changed from 19178808 to 19178520 (-0%)
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dev: PV changed from "1.12.1" to "1.12.2"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dev: PKGV changed from 1.12.1 [default] to 1.12.2 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dev: PKGSIZE changed from 131391 to 131434 (+0%)
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-doc: PV changed from "1.12.1" to "1.12.2"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-doc: PKGV changed from 1.12.1 [default] to 1.12.2 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-locale: PV changed from "1.12.1" to "1.12.2"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-locale: PKGV changed from 1.12.1 [default] to 1.12.2 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-ptest: PV changed from "1.12.1" to "1.12.2"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-ptest: PKGV changed from 1.12.1 [default] to 1.12.2 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-src: PV changed from "1.12.1" to "1.12.2"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-src: FILELIST: directory renamed /usr/src/debug/libgcrypt/1.12.1/compat -> /usr/src/debug/libgcrypt/1.12.2/compat, directory renamed /usr/src/debug/libgcrypt/1.12.1/random -> /usr/src/debug/libgcrypt/1.12.2/random, directory renamed /usr/src/debug/libgcrypt/1.12.1/mpi -> /usr/src/debug/libgcrypt/1.12.2/mpi, directory renamed /usr/src/debug/libgcrypt/1.12.1/src -> /usr/src/debug/libgcrypt/1.12.2/src, directory renamed /usr/src/debug/libgcrypt/1.12.1/tests -> /usr/src/debug/libgcrypt/1.12.2/tests, directory renamed /usr/src/debug/libgcrypt/1.12.1/cipher -> /usr/src/debug/libgcrypt/1.12.2/cipher
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-src: PKGV changed from 1.12.1 [default] to 1.12.2 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-src: PKGSIZE changed from 5963041 to 5965573 (+0%)
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-staticdev: PV changed from "1.12.1" to "1.12.2"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-staticdev: PKGV changed from 1.12.1 [default] to 1.12.2 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt: PV changed from "1.12.1" to "1.12.2"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt: FILELIST: removed "/usr/lib/libgcrypt.so.20.7.1", added "/usr/lib/libgcrypt.so.20.7.2"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt: PKGV changed from 1.12.1 [default] to 1.12.2 [default]
Changes to packages/x86-64-v3-poky-linux/libgcrypt (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.7.1 to libgcrypt.so.20.7.2
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.7.1 to libgcrypt.so.20.7.2
  /usr/lib/libgcrypt.so.20.7.1 moved to /usr/lib/libgcrypt.so.20.7.2
Changes to packages/x86_64-linux/libgcrypt-native (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.7.1 to libgcrypt.so.20.7.2
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.7.1 to libgcrypt.so.20.7.2
  /usr/lib/libgcrypt.so.20.7.1 moved to /usr/lib/libgcrypt.so.20.7.2

--===============3388073704110638846==--

