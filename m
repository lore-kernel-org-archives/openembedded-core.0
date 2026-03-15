Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 662BCEFCBBB
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:09 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28965.1773582112022947695
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Hz+/Co+7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=FlRjl99R;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019cf1bb93fb-fbe98ef8-18b8-4893-a9fb-8697456036eb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582128;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BZ33k6asEbDNjN1ywurFwZlrkvoAtttNIyju2tG2QYg=;
	b=Hz+/Co+7SwJG934bY+5XfWMtGr/QLb6ezlO9urrDd1FBodVF2vni3L2KqOOjNHsp
	1O8JjBYGVwNQvRieLrYQRTyIRt9KSJ8J7qUE8q7QJ1w21uaTcl2CIgzrVEucWaGFbpE
	9U0qsCdkEjsGvcVLBSnTIeRwXmZz2O0QcP0nH9qg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582128;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BZ33k6asEbDNjN1ywurFwZlrkvoAtttNIyju2tG2QYg=;
	b=FlRjl99Rt07pdSFwlYtFA+h3VoRWfh3qD0s3NnDy4giOpmb6ugCu22ApDaSTtfDD
	jcZrYI2srerZJ4aOBHjX8hIphnGl2i2KS6bs4upbc+3hdWlhgadf9lKs3x7TT0ZgV46
	vRI3ONWjoRk5kBTex32L26Ov8Hbk2S3m/oin3uw4=
Content-Type: multipart/mixed; boundary="===============1749981012368000723=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgcrypt: upgrading to 1.12.1 SUCCEEDED
Message-ID: <0101019cf1bb93fb-fbe98ef8-18b8-4893-a9fb-8697456036eb-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:42:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233193

--===============1749981012368000723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libgcrypt* to *1.12.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgcrypt-upgrade-1.12.0-1.12.1.patch
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
From 2ea3b5d5cc9ec171e9e66d31a4bc677337b4defb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 13:20:39 +0000
Subject: [PATCH] libgcrypt: upgrade 1.12.0 -> 1.12.1

---
 .../0001-libgcrypt-fix-m4-file-for-oe-core.patch      |  2 +-
 ...001-tests-Fix-link-errors-for-t-thread-local.patch |  9 +++------
 ...kefile.am-fix-undefined-reference-to-pthread.patch | 11 ++++-------
 .../libgcrypt/files/no-bench-slope.patch              |  2 +-
 .../libgcrypt/files/no-native-gpg-error.patch         |  4 ++--
 .../{libgcrypt_1.12.0.bb => libgcrypt_1.12.1.bb}      |  2 +-
 6 files changed, 12 insertions(+), 18 deletions(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.12.0.bb => libgcrypt_1.12.1.bb} (95%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
index e60507e636..4c08b73cf8 100644
--- a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
@@ -1,4 +1,4 @@
-From 3bc536529c9bbe1e62d1c1127abee6183ed64298 Mon Sep 17 00:00:00 2001
+From 2ac3d5d09ee8fabfc6ca75dbc238bbd215d3e6ac Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Tue, 29 Oct 2019 14:08:32 -0400
 Subject: [PATCH] libgcrypt: fix m4 file for oe-core
diff --git a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
index 8dc2fe328c..ba439ca675 100644
--- a/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-tests-Fix-link-errors-for-t-thread-local.patch
@@ -1,4 +1,4 @@
-From 942e232ded48fa08d2bda417ae8ad8c03d644372 Mon Sep 17 00:00:00 2001
+From dd98542d8ae0476beb5368e4eda6711e1e9617fc Mon Sep 17 00:00:00 2001
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
index bbd48ebeee..ea5c20d804 100644
--- a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
+++ b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
@@ -1,4 +1,4 @@
-From a3496435dcc223a914eec5e61e853934fd4eb635 Mon Sep 17 00:00:00 2001
+From 03021f9a060ab32b3c0eec69f0e1bd56cbe97692 Mon Sep 17 00:00:00 2001
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
index 606cca1344..b47cdad81d 100644
--- a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
+++ b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
@@ -1,4 +1,4 @@
-From 254821a620c1f7d6542c23dbe555e7c02637a3f8 Mon Sep 17 00:00:00 2001
+From f05fd2d4551e8a2c8c5217c83ec6b0304a253513 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 9 Sep 2022 11:13:37 +0100
 Subject: [PATCH] libgcrypt: disable bench-slope test case
diff --git a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
index 98874ce12a..cf36ee9cc1 100644
--- a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
+++ b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
@@ -1,4 +1,4 @@
-From ede03b847038afc294e206ca345d12d75bbba844 Mon Sep 17 00:00:00 2001
+From 6b782efe2ccbdf88de427a52838724193993a6d0 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.0.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
similarity index 95%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.12.0.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
index 7638cb0847..b3c0d050b7 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.0.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
@@ -26,7 +26,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-bench-slope.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "0311454e678189bad62a7e9402a9dd793025efff6e7449898616e2fc75e0f4f5"
+SRC_URI[sha256sum] = "7df5c08d952ba33f9b6bdabdb06a61a78b2cf62d2122c2d1d03a91a79832aa3c"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-- 
2.47.1


--===============1749981012368000723==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgcrypt-upgrade-1.12.0-1.12.1.patch"

RnJvbSAyZWEzYjVkNWNjOWVjMTcxZTllNjZkMzFhNGJjNjc3MzM3YjRkZWZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMTM6MjA6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJnY3J5cHQ6IHVwZ3JhZGUgMS4xMi4wIC0+IDEuMTIuMQoKLS0tCiAuLi4vMDAwMS1saWJnY3J5
cHQtZml4LW00LWZpbGUtZm9yLW9lLWNvcmUucGF0Y2ggICAgICB8ICAyICstCiAuLi4wMDEtdGVz
dHMtRml4LWxpbmstZXJyb3JzLWZvci10LXRocmVhZC1sb2NhbC5wYXRjaCB8ICA5ICsrKy0tLS0t
LQogLi4ua2VmaWxlLmFtLWZpeC11bmRlZmluZWQtcmVmZXJlbmNlLXRvLXB0aHJlYWQucGF0Y2gg
fCAxMSArKysrLS0tLS0tLQogLi4uL2xpYmdjcnlwdC9maWxlcy9uby1iZW5jaC1zbG9wZS5wYXRj
aCAgICAgICAgICAgICAgfCAgMiArLQogLi4uL2xpYmdjcnlwdC9maWxlcy9uby1uYXRpdmUtZ3Bn
LWVycm9yLnBhdGNoICAgICAgICAgfCAgNCArKy0tCiAuLi4ve2xpYmdjcnlwdF8xLjEyLjAuYmIg
PT4gbGliZ2NyeXB0XzEuMTIuMS5iYn0gICAgICB8ICAyICstCiA2IGZpbGVzIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2xpYmdjcnlwdC97bGliZ2NyeXB0XzEuMTIuMC5iYiA9PiBsaWJnY3J5cHRfMS4xMi4xLmJi
fSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxl
cy8wMDAxLWxpYmdjcnlwdC1maXgtbTQtZmlsZS1mb3Itb2UtY29yZS5wYXRjaCBiL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxlcy8wMDAxLWxpYmdjcnlwdC1maXgtbTQtZmlsZS1m
b3Itb2UtY29yZS5wYXRjaAppbmRleCBlNjA1MDdlNjM2Li40YzA4YjczY2Y4IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQvZmlsZXMvMDAwMS1saWJnY3J5cHQtZml4
LW00LWZpbGUtZm9yLW9lLWNvcmUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
Z2NyeXB0L2ZpbGVzLzAwMDEtbGliZ2NyeXB0LWZpeC1tNC1maWxlLWZvci1vZS1jb3JlLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzYmM1MzY1MjljOWJiZTFlNjJkMWMxMTI3YWJlZTYxODNl
ZDY0Mjk4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyYWMzZDVkMDllZThmYWJmYzZj
YTc1ZGJjMjM4YmJkMjE1ZDNlNmFjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogVHJl
dm9yIEdhbWJsaW4gPHRyZXZvci5nYW1ibGluQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDI5
IE9jdCAyMDE5IDE0OjA4OjMyIC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxpYmdjcnlwdDogZml4
IG00IGZpbGUgZm9yIG9lLWNvcmUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YmdjcnlwdC9maWxlcy8wMDAxLXRlc3RzLUZpeC1saW5rLWVycm9ycy1mb3ItdC10aHJlYWQtbG9j
YWwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQvZmlsZXMvMDAwMS10ZXN0
cy1GaXgtbGluay1lcnJvcnMtZm9yLXQtdGhyZWFkLWxvY2FsLnBhdGNoCmluZGV4IDhkYzJmZTMy
OGMuLmJhNDM5Y2E2NzUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlw
dC9maWxlcy8wMDAxLXRlc3RzLUZpeC1saW5rLWVycm9ycy1mb3ItdC10aHJlYWQtbG9jYWwucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzLzAwMDEtdGVzdHMt
Rml4LWxpbmstZXJyb3JzLWZvci10LXRocmVhZC1sb2NhbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gOTQyZTIzMmRlZDQ4ZmEwOGQyYmRhNDE3YWU4YWQ4YzAzZDY0NDM3MiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gZGQ5ODU0MmQ4YWUwNDc2YmViNTM2OGU0ZWRhNjcxMWUxZTk2
MTdmYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENvbGxpbiBGdW5rIDxjb2xsaW4u
ZnVuazFAZ21haWwuY29tPgogRGF0ZTogV2VkLCAyNyBBdWcgMjAyNSAxMTo0OTowNiArMDgwMAog
U3ViamVjdDogW1BBVENIXSB0ZXN0czogRml4IGxpbmsgZXJyb3JzIGZvciB0LXRocmVhZC1sb2Nh
bC4KQEAgLTIxLDEwICsyMSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUu
amlhQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS90ZXN0cy9NYWtlZmlsZS5hbSBiL3Rlc3RzL01ha2Vm
aWxlLmFtCi1pbmRleCA0ODAwMTM1Li5mMGY3YWRiIDEwMDY0NAoraW5kZXggYjVhZDc0Yy4uYjdk
ZTI3ZCAxMDA2NDQKIC0tLSBhL3Rlc3RzL01ha2VmaWxlLmFtCiArKysgYi90ZXN0cy9NYWtlZmls
ZS5hbQotQEAgLTk4LDcgKzk4LDcgQEAgdGVzdGFwaV9MREFERCA9ICQoc3RhbmRhcmRfbGRhZGQp
IEBMREFERF9GT1JfVEVTVFNfS0xVREdFQAorQEAgLTEwMiw3ICsxMDIsNyBAQCB0ZXN0YXBpX0xE
QUREID0gJChzdGFuZGFyZF9sZGFkZCkgQExEQUREX0ZPUl9URVNUU19LTFVER0VACiAgdF9sb2Nr
X0xEQUREID0gJChzdGFuZGFyZF9sZGFkZCkgJChHUEdfRVJST1JfTVRfTElCUykgQExEQUREX0ZP
Ul9URVNUU19LTFVER0VACiAgdF9sb2NrX0NGTEFHUyA9ICQoR1BHX0VSUk9SX01UX0NGTEFHUykg
LWxwdGhyZWFkCiAgdF90aHJlYWRfbG9jYWxfTERBREQgPSAkKHN0YW5kYXJkX2xkYWRkKSAkKEdQ
R19FUlJPUl9NVF9MSUJTKSBATERBRERfRk9SX1RFU1RTX0tMVURHRUAKQEAgLTMzLDYgKzMzLDMg
QEAgaW5kZXggNDgwMDEzNS4uZjBmN2FkYiAxMDA2NDQKICB0ZXN0ZHJ2X0xEQUREID0gJChMREFE
RF9GT1JfVEVTVFNfS0xVREdFKQogIAogICMgQnVpbGQgYSB2ZXJzaW9uIG9mIHRoZSB0ZXN0IGRy
aXZlciBmb3IgdGhlIGJ1aWxkIHBsYXRmb3JtLgotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzLzAwMDQtdGVzdHMtTWFrZWZpbGUu
YW0tZml4LXVuZGVmaW5lZC1yZWZlcmVuY2UtdG8tcHRocmVhZC5wYXRjaCBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2xpYmdjcnlwdC9maWxlcy8wMDA0LXRlc3RzLU1ha2VmaWxlLmFtLWZpeC11bmRl
ZmluZWQtcmVmZXJlbmNlLXRvLXB0aHJlYWQucGF0Y2gKaW5kZXggYmJkNDhlYmVlZS4uZWE1YzIw
ZDgwNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzLzAw
MDQtdGVzdHMtTWFrZWZpbGUuYW0tZml4LXVuZGVmaW5lZC1yZWZlcmVuY2UtdG8tcHRocmVhZC5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQvZmlsZXMvMDAwNC10ZXN0
cy1NYWtlZmlsZS5hbS1maXgtdW5kZWZpbmVkLXJlZmVyZW5jZS10by1wdGhyZWFkLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBhMzQ5NjQzNWRjYzIyM2E5MTRlZWM1ZTYxZTg1MzkzNGZkNGVi
NjM1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwMzAyMWY5YTA2MGFiMzJiM2MwZWVj
NjlmMGUxYmQ1NmNiZTk3NjkyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1
IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAyNyBBdWcgMjAyNSAx
MTo0NjoxNyArMDgwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0cy9NYWtlZmlsZS5hbTogZml4IHVu
ZGVmaW5lZCByZWZlcmVuY2UgdG8KQEAgLTE0LDEwICsxNCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBI
b25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3Rlc3RzL01ha2Vm
aWxlLmFtIGIvdGVzdHMvTWFrZWZpbGUuYW0KLWluZGV4IDkzZGFmM2MuLjQ4MDAxMzUgMTAwNjQ0
CitpbmRleCA0ZjQyOTI1Li5iNWFkNzRjIDEwMDY0NAogLS0tIGEvdGVzdHMvTWFrZWZpbGUuYW0K
ICsrKyBiL3Rlc3RzL01ha2VmaWxlLmFtCi1AQCAtOTYsNyArOTYsNyBAQCB0X21waV9iaXRfTERB
REQgPSAkKHN0YW5kYXJkX2xkYWRkKSBATERBRERfRk9SX1RFU1RTX0tMVURHRUAKK0BAIC0xMDAs
NyArMTAwLDcgQEAgdF9tcGlfYml0X0xEQUREID0gJChzdGFuZGFyZF9sZGFkZCkgQExEQUREX0ZP
Ul9URVNUU19LTFVER0VACiAgdF9zZWNtZW1fTERBREQgPSAkKHN0YW5kYXJkX2xkYWRkKSBATERB
RERfRk9SX1RFU1RTX0tMVURHRUAKICB0ZXN0YXBpX0xEQUREID0gJChzdGFuZGFyZF9sZGFkZCkg
QExEQUREX0ZPUl9URVNUU19LTFVER0VACiAgdF9sb2NrX0xEQUREID0gJChzdGFuZGFyZF9sZGFk
ZCkgJChHUEdfRVJST1JfTVRfTElCUykgQExEQUREX0ZPUl9URVNUU19LTFVER0VACkBAIC0yNiw3
ICsyNiw3IEBAIGluZGV4IDkzZGFmM2MuLjQ4MDAxMzUgMTAwNjQ0CiAgdF90aHJlYWRfbG9jYWxf
TERBREQgPSAkKHN0YW5kYXJkX2xkYWRkKSAkKEdQR19FUlJPUl9NVF9MSUJTKSBATERBRERfRk9S
X1RFU1RTX0tMVURHRUAKICB0X3RocmVhZF9sb2NhbF9DRkxBR1MgPSAkKEdQR19FUlJPUl9NVF9D
RkxBR1MpCiAgdGVzdGRydl9MREFERCA9ICQoTERBRERfRk9SX1RFU1RTX0tMVURHRSkKLUBAIC0x
MTcsNyArMTE3LDcgQEAgZWxzZQorQEAgLTEyMiw3ICsxMjIsNyBAQCBlbHNlCiAgeHRlc3RzdWl0
ZV9saWJzID0gLi4vc3JjLy5saWJzL2xpYmdjcnlwdC5zbyoKICB4dGVzdHN1aXRlX2RyaXZlciA9
IHRlc3RkcnYKICB0X2tkZl9MREFERCA9ICQoc3RhbmRhcmRfbGRhZGQpICQoR1BHX0VSUk9SX01U
X0xJQlMpIEBMREFERF9GT1JfVEVTVFNfS0xVREdFQApAQCAtMzUsNiArMzUsMyBAQCBpbmRleCA5
M2RhZjNjLi40ODAwMTM1IDEwMDY0NAogIGVuZGlmCiAgCiAgIyB4Y2hlY2sgdXNlcyBvdXIgbmV3
IHRlc3RkcnYgaW5zdGVhZCBvZiB0aGUgYXV0b21ha2UgdGVzdCBydW5uZXIuCi0tLSAKLTIuMzQu
MQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQvZmlsZXMvbm8t
YmVuY2gtc2xvcGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQvZmlsZXMv
bm8tYmVuY2gtc2xvcGUucGF0Y2gKaW5kZXggNjA2Y2NhMTM0NC4uYjQ3Y2RhZDgxZCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzL25vLWJlbmNoLXNsb3Bl
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxlcy9uby1iZW5j
aC1zbG9wZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjU0ODIxYTYyMGMxZjdkNjU0MmMy
M2RiZTU1NWU3YzAyNjM3YTNmOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjA1ZmQy
ZDQ1NTFlOGEyYzhjNTIxN2M4M2VjNmIwMzA0YTI1MzUxMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogRGF0ZTogRnJpLCA5
IFNlcCAyMDIyIDExOjEzOjM3ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxpYmdjcnlwdDogZGlz
YWJsZSBiZW5jaC1zbG9wZSB0ZXN0IGNhc2UKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2xpYmdjcnlwdC9maWxlcy9uby1uYXRpdmUtZ3BnLWVycm9yLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzL25vLW5hdGl2ZS1ncGctZXJyb3IucGF0Y2gKaW5k
ZXggOTg4NzRjZTEyYS4uY2YzNmVlOWNjMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGliZ2NyeXB0L2ZpbGVzL25vLW5hdGl2ZS1ncGctZXJyb3IucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzL25vLW5hdGl2ZS1ncGctZXJyb3IucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGVkZTAzYjg0NzAzOGFmYzI5NGUyMDZjYTM0NWQxMmQ3NWJi
YmE4NDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDZiNzgyZWZlMmNjYmRmODhkZTQy
N2E1MjgzODcyNDE5Mzk5M2E2ZDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3Nz
IEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERhdGU6IEZyaSwgMjYgQXVnIDIwMjIgMTU6
MjM6MzcgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliZ2NyeXB0OiByZXdyaXRlIHB0ZXN0CkBA
IC0xMyw3ICsxMyw3IEBAIFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBh
cm0uY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS90
ZXN0cy90ZXN0ZHJ2LmMgYi90ZXN0cy90ZXN0ZHJ2LmMKLWluZGV4IGJmY2E0YzIuLjYzNGI3MTgg
MTAwNjQ0CitpbmRleCA3NzQzMjU4Li5iZmZhM2NjIDEwMDY0NAogLS0tIGEvdGVzdHMvdGVzdGRy
di5jCiArKysgYi90ZXN0cy90ZXN0ZHJ2LmMKIEBAIC0zMiw3ICszMiw2IEBACmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQvbGliZ2NyeXB0XzEuMTIuMC5iYiBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9saWJnY3J5cHRfMS4xMi4xLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9s
aWJnY3J5cHRfMS4xMi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5
cHQvbGliZ2NyeXB0XzEuMTIuMS5iYgppbmRleCA3NjM4Y2IwODQ3Li5iM2MwZDA1MGI3IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQvbGliZ2NyeXB0XzEuMTIuMC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQvbGliZ2NyeXB0XzEuMTIuMS5i
YgpAQCAtMjYsNyArMjYsNyBAQCBTUkNfVVJJID0gIiR7R05VUEdfTUlSUk9SfS9saWJnY3J5cHQv
bGliZ2NyeXB0LSR7UFZ9LnRhci5iejIgXAogICAgICAgICAgICBmaWxlOi8vbm8tYmVuY2gtc2xv
cGUucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAgIgot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjAzMTE0NTRlNjc4MTg5YmFkNjJhN2U5NDAyYTlkZDc5MzAy
NWVmZmY2ZTc0NDk4OTg2MTZlMmZjNzVlMGY0ZjUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2Rm
NWMwOGQ5NTJiYTMzZjliNmJkYWJkYjA2YTYxYTc4YjJjZjYyZDIxMjJjMmQxZDAzYTkxYTc5ODMy
YWEzYyIKIAogQklOQ09ORklHID0gIiR7YmluZGlyfS9saWJnY3J5cHQtY29uZmlnIgogCi0tIAoy
LjQ3LjEKCg==

--===============1749981012368000723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libgcrypt: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/libgcrypt: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/libgcrypt: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.12.0.tar.bz2 file://0001-libgcrypt-fix-m4-file-for-oe-core.patch file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch file://0001-tests-Fix-link-errors-for-t-thread-local.patch file://no-native-gpg-error.patch file://no-bench-slope.patch file://run-ptest" to "https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.12.1.tar.bz2 file://0001-libgcrypt-fix-m4-file-for-oe-core.patch file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch file://0001-tests-Fix-link-errors-for-t-thread-local.patch file://no-native-gpg-error.patch file://no-bench-slope.patch file://run-ptest"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dbg: PKGSIZE changed from 19179512 to 19178808 (-0%)
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dbg: FILELIST: removed "/usr/lib/.debug/libgcrypt.so.20.7.0", added "/usr/lib/.debug/libgcrypt.so.20.7.1"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dbg: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dbg: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dev: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-dev: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-doc: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-doc: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-locale: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-locale: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-ptest: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-ptest: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-src: PKGSIZE changed from 5961782 to 5963041 (+0%)
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-src: FILELIST: directory renamed /usr/src/debug/libgcrypt/1.12.0/src -> /usr/src/debug/libgcrypt/1.12.1/src, directory renamed /usr/src/debug/libgcrypt/1.12.0/random -> /usr/src/debug/libgcrypt/1.12.1/random, directory renamed /usr/src/debug/libgcrypt/1.12.0/mpi -> /usr/src/debug/libgcrypt/1.12.1/mpi, directory renamed /usr/src/debug/libgcrypt/1.12.0/compat -> /usr/src/debug/libgcrypt/1.12.1/compat, directory renamed /usr/src/debug/libgcrypt/1.12.0/cipher -> /usr/src/debug/libgcrypt/1.12.1/cipher, directory renamed /usr/src/debug/libgcrypt/1.12.0/tests -> /usr/src/debug/libgcrypt/1.12.1/tests
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-src: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-src: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-staticdev: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt-staticdev: PV changed from "1.12.0" to "1.12.1"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt: FILELIST: removed "/usr/lib/libgcrypt.so.20.7.0", added "/usr/lib/libgcrypt.so.20.7.1"
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt: PKGV changed from 1.12.0 [default] to 1.12.1 [default]
packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt: PV changed from "1.12.0" to "1.12.1"
Changes to packages/x86-64-v3-poky-linux/libgcrypt (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.7.0 to libgcrypt.so.20.7.1
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.7.0 to libgcrypt.so.20.7.1
  /usr/lib/libgcrypt.so.20.7.0 moved to /usr/lib/libgcrypt.so.20.7.1
Changes to packages/x86_64-linux/libgcrypt-native (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.7.0 to libgcrypt.so.20.7.1
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.7.0 to libgcrypt.so.20.7.1
  /usr/lib/libgcrypt.so.20.7.0 moved to /usr/lib/libgcrypt.so.20.7.1

--===============1749981012368000723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libgcrypt/libgcrypt: FILELIST: removed "/usr/lib/libgcrypt.so.20.7.0", added "/usr/lib/libgcrypt.so.20.7.1"
Changes to packages/x86-64-v3-poky-linux/libgcrypt (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.7.0 to libgcrypt.so.20.7.1
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.7.0 to libgcrypt.so.20.7.1
  /usr/lib/libgcrypt.so.20.7.0 moved to /usr/lib/libgcrypt.so.20.7.1
Changes to packages/x86_64-linux/libgcrypt-native (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.7.0 to libgcrypt.so.20.7.1
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.7.0 to libgcrypt.so.20.7.1
  /usr/lib/libgcrypt.so.20.7.0 moved to /usr/lib/libgcrypt.so.20.7.1

--===============1749981012368000723==--

