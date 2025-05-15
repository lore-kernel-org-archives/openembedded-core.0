Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC51C61CE7
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:12 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.11262.1747312313830576133
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=k1FkVc0n;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=PgFURqHt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010196d3ee40d0-431bb5a8-e5d3-48ac-a8d7-2429d31b44b6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uUYo/xZmHuyn9Wlcbxx3Wj2NY8qHv5erR3Btv1S1xaQ=;
	b=k1FkVc0n8l8BtFVkF/jTzAekndc8yfQsgKC1ixdlFwJmuD70oIT3XJ9gb6i6F09V
	NR89rKH+KU7VF9fdmoVMXfqYB0mYkI2pYnrE/OGUdwSDViYc/+FotCANuXkG2o/zuDc
	QwZW3F1/ZmaP01a6nZxRSbVG52aRfYEzgaHBf9rQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uUYo/xZmHuyn9Wlcbxx3Wj2NY8qHv5erR3Btv1S1xaQ=;
	b=PgFURqHtAmhF8O2mE+t+yA/3IZ5NK1YYmUhEG2h3Wg1T77Tp5351SCSUJlq/SLa6
	9TsHRZgVeA/j0gSGSQ8+GX5bHqg7QK+BFxz2V17r7IEzJ7fF31aAEpwkzwnmJscs/gJ
	Zj2+zabz7LUnl+z33FyIyDC88zWc3/sXTv7s1c8o=
Content-Type: multipart/mixed; boundary="===============6657003469936472813=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgcrypt: upgrading to 1.11.1 SUCCEEDED
Message-ID: <01010196d3ee40d0-431bb5a8-e5d3-48ac-a8d7-2429d31b44b6-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:32:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216663

--===============6657003469936472813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libgcrypt* to *1.11.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgcrypt-upgrade-1.11.0-1.11.1.patch
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
From dc2cacf7c50a12993fc7719636643203c1bd6468 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 12:24:39 +0000
Subject: [PATCH] libgcrypt: upgrade 1.11.0 -> 1.11.1

---
 ...01-libgcrypt-fix-m4-file-for-oe-core.patch |  8 +--
 ...ilding-error-with-O2-in-sysroot-path.patch | 49 -------------------
 ...m-fix-undefined-reference-to-pthread.patch |  9 ++--
 .../libgcrypt/files/no-bench-slope.patch      | 10 ++--
 .../libgcrypt/files/no-native-gpg-error.patch | 10 +++-
 ...ibgcrypt_1.11.0.bb => libgcrypt_1.11.1.bb} |  3 +-
 6 files changed, 23 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.11.0.bb => libgcrypt_1.11.1.bb} (91%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
index 9615611f6e..7b840644d4 100644
--- a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
@@ -1,4 +1,4 @@
-From bcfd89abdb5110b93314297120412d4c7f2da313 Mon Sep 17 00:00:00 2001
+From fcb53181b18c00083a8b08625db74829cfd6b4b2 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Tue, 29 Oct 2019 14:08:32 -0400
 Subject: [PATCH] libgcrypt: fix m4 file for oe-core
@@ -11,13 +11,12 @@ settings.
 Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
-
 ---
  src/libgcrypt.m4 | 90 +++---------------------------------------------
  1 file changed, 4 insertions(+), 86 deletions(-)
 
 diff --git a/src/libgcrypt.m4 b/src/libgcrypt.m4
-index 353df81b6d..b195e22894 100644
+index 353df81..b195e22 100644
 --- a/src/libgcrypt.m4
 +++ b/src/libgcrypt.m4
 @@ -116,41 +116,6 @@ dnl
@@ -144,6 +143,3 @@ index 353df81b6d..b195e22894 100644
      ifelse([$3], , :, [$3])
    fi
    AC_SUBST(LIBGCRYPT_CFLAGS)
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
deleted file mode 100644
index 78b02eda9d..0000000000
--- a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From e96df0c82e086bf348753d2d0fa37fa6191b4b14 Mon Sep 17 00:00:00 2001
-From: "simit.ghane" <simit.ghane@lge.com>
-Date: Tue, 11 Jun 2024 07:22:28 +0530
-Subject: [PATCH] random:cipher: handle substitution in sed command
-
-Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=e96df0c82e086bf348753d2d0fa37fa6191b4b14]
-
-* cipher/Makefile.am (o_flag_munging): Add 'g' flag for first sed
-expression.
-* random/Makefile.am (o_flag_munging): Likewise.
---
-
-It was there earlier and accidentally removed from
-Makefile.am of cipher and random
-
-Signed-off-by: simit.ghane <simit.ghane@lge.com>
-[jk: add changelog to commit message]
-Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
----
- cipher/Makefile.am | 2 +-
- random/Makefile.am | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/cipher/Makefile.am b/cipher/Makefile.am
-index ea9014cc98..149c9f2101 100644
---- a/cipher/Makefile.am
-+++ b/cipher/Makefile.am
-@@ -169,7 +169,7 @@ gost-s-box$(EXEEXT_FOR_BUILD): gost-s-box.c
- 
- 
- if ENABLE_O_FLAG_MUNGING
--o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /' -e 's/[[:blank:]]-Ofast/ -O1 /g'
-+o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /g' -e 's/[[:blank:]]-Ofast/ -O1 /g'
- else
- o_flag_munging = cat
- endif
-diff --git a/random/Makefile.am b/random/Makefile.am
-index c7100ef8b8..a42e430649 100644
---- a/random/Makefile.am
-+++ b/random/Makefile.am
-@@ -56,7 +56,7 @@ jitterentropy-base.c jitterentropy.h jitterentropy-base-user.h
- 
- # The rndjent module needs to be compiled without optimization.  */
- if ENABLE_O_FLAG_MUNGING
--o_flag_munging = sed -e 's/[[:blank:]]-O\([1-9sgz][1-9sgz]*\)/ -O0 /' -e 's/[[:blank:]]-Ofast/ -O0 /g'
-+o_flag_munging = sed -e 's/[[:blank:]]-O\([1-9sgz][1-9sgz]*\)/ -O0 /g' -e 's/[[:blank:]]-Ofast/ -O0 /g'
- else
- o_flag_munging = cat
- endif
diff --git a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
index 4233fa7877..ccf4e18910 100644
--- a/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
+++ b/meta/recipes-support/libgcrypt/files/0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch
@@ -1,4 +1,4 @@
-From 9182bc2dc676858a823c477d8f45a578b8c4f69f Mon Sep 17 00:00:00 2001
+From c7a99e7a15f1f703ac90fc2a16b2c2115a66a996 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sun, 12 Jun 2016 04:44:29 -0400
 Subject: [PATCH] tests/Makefile.am: fix undefined reference to
@@ -9,16 +9,15 @@ Add missing '-lpthread' to CFLAGS
 Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  tests/Makefile.am | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index e6953fd..f47e1d3 100644
+index 3170a58..9a9e1c2 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -76,7 +76,7 @@ t_mpi_bit_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
+@@ -93,7 +93,7 @@ t_mpi_bit_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_secmem_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  testapi_LDADD = $(standard_ldadd) @LDADD_FOR_TESTS_KLUDGE@
  t_lock_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
@@ -27,7 +26,7 @@ index e6953fd..f47e1d3 100644
  testdrv_LDADD = $(LDADD_FOR_TESTS_KLUDGE)
  
  # Build a version of the test driver for the build platform.
-@@ -95,7 +95,7 @@ else
+@@ -112,7 +112,7 @@ else
  xtestsuite_libs = ../src/.libs/libgcrypt.so*
  xtestsuite_driver = testdrv
  t_kdf_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS) @LDADD_FOR_TESTS_KLUDGE@
diff --git a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
index ed65ed4e67..44aac1913e 100644
--- a/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
+++ b/meta/recipes-support/libgcrypt/files/no-bench-slope.patch
@@ -1,3 +1,8 @@
+From eb3a5bc4d5a212da64c0f9396c7f31f83aa6f36c Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 9 Sep 2022 11:13:37 +0100
+Subject: [PATCH] libgcrypt: disable bench-slope test case
+
 The bench-slope test appears to be aborting fairly frequently, which causes
 failures on the autobuilder.
 
@@ -10,10 +15,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/tests/testdrv.c b/tests/testdrv.c
-index bfca4c2314..5a755f512e 100644
+index 634b718..1e9dddb 100644
 --- a/tests/testdrv.c
 +++ b/tests/testdrv.c
-@@ -77,7 +77,6 @@ static struct {
+@@ -76,7 +76,6 @@ static struct {
     { "t-x448"      },
     { "t-ed448"     },
     { "benchmark"   },
@@ -21,4 +26,3 @@ index bfca4c2314..5a755f512e 100644
     { "hashtest-6g", "hashtest", "--hugeblock --gigs 6 SHA1 SHA256 SHA512 "
                                                       "SHA3-512 SM3 BLAKE2S_256 "
                                                       "BLAKE2B_512 CRC32 "
-
diff --git a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
index b9a607863d..98874ce12a 100644
--- a/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
+++ b/meta/recipes-support/libgcrypt/files/no-native-gpg-error.patch
@@ -1,11 +1,19 @@
+From ede03b847038afc294e206ca345d12d75bbba844 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 26 Aug 2022 15:23:37 +0100
+Subject: [PATCH] libgcrypt: rewrite ptest
+
 Don't depend on a native libgpg-error to build the test driver, as it's
 an optional dependency for some C annotations.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tests/testdrv.c | 1 -
+ 1 file changed, 1 deletion(-)
 
 diff --git a/tests/testdrv.c b/tests/testdrv.c
-index 0ccde326..6d6abd57 100644
+index bfca4c2..634b718 100644
 --- a/tests/testdrv.c
 +++ b/tests/testdrv.c
 @@ -32,7 +32,6 @@
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb
similarity index 91%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb
index ea1f34e8ce..e51a20e5bf 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb
@@ -20,13 +20,12 @@ DEPENDS = "libgpg-error"
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0001-libgcrypt-fix-m4-file-for-oe-core.patch \
-           file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
            file://no-native-gpg-error.patch \
            file://no-bench-slope.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "09120c9867ce7f2081d6aaa1775386b98c2f2f246135761aae47d81f58685b9c"
+SRC_URI[sha256sum] = "24e91c9123a46c54e8371f3a3a2502f1198f2893fbfbf59af95bc1c21499b00e"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-- 
2.47.1


--===============6657003469936472813==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libgcrypt-upgrade-1.11.0-1.11.1.patch"

RnJvbSBkYzJjYWNmN2M1MGExMjk5M2ZjNzcxOTYzNjY0MzIwM2MxYmQ2NDY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMTI6MjQ6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJnY3J5cHQ6IHVwZ3JhZGUgMS4xMS4wIC0+IDEuMTEuMQoKLS0tCiAuLi4wMS1saWJnY3J5cHQt
Zml4LW00LWZpbGUtZm9yLW9lLWNvcmUucGF0Y2ggfCAgOCArLS0KIC4uLmlsZGluZy1lcnJvci13
aXRoLU8yLWluLXN5c3Jvb3QtcGF0aC5wYXRjaCB8IDQ5IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4u
Lm0tZml4LXVuZGVmaW5lZC1yZWZlcmVuY2UtdG8tcHRocmVhZC5wYXRjaCB8ICA5ICsrLS0KIC4u
Li9saWJnY3J5cHQvZmlsZXMvbm8tYmVuY2gtc2xvcGUucGF0Y2ggICAgICB8IDEwICsrLS0KIC4u
Li9saWJnY3J5cHQvZmlsZXMvbm8tbmF0aXZlLWdwZy1lcnJvci5wYXRjaCB8IDEwICsrKy0KIC4u
LmliZ2NyeXB0XzEuMTEuMC5iYiA9PiBsaWJnY3J5cHRfMS4xMS4xLmJifSB8ICAzICstCiA2IGZp
bGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDY2IGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxlcy8wMDAyLWxpYmdj
cnlwdC1maXgtYnVpbGRpbmctZXJyb3Itd2l0aC1PMi1pbi1zeXNyb290LXBhdGgucGF0Y2gKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQve2xpYmdjcnlwdF8xLjExLjAuYmIg
PT4gbGliZ2NyeXB0XzEuMTEuMS5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJnY3J5cHQvZmlsZXMvMDAwMS1saWJnY3J5cHQtZml4LW00LWZpbGUtZm9yLW9l
LWNvcmUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQvZmlsZXMvMDAwMS1s
aWJnY3J5cHQtZml4LW00LWZpbGUtZm9yLW9lLWNvcmUucGF0Y2gKaW5kZXggOTYxNTYxMWY2ZS4u
N2I4NDA2NDRkNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2Zp
bGVzLzAwMDEtbGliZ2NyeXB0LWZpeC1tNC1maWxlLWZvci1vZS1jb3JlLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxlcy8wMDAxLWxpYmdjcnlwdC1maXgtbTQt
ZmlsZS1mb3Itb2UtY29yZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYmNmZDg5YWJkYjUx
MTBiOTMzMTQyOTcxMjA0MTJkNGM3ZjJkYTMxMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gZmNiNTMxODFiMThjMDAwODNhOGIwODYyNWRiNzQ4MjljZmQ2YjRiMiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IFRyZXZvciBHYW1ibGluIDx0cmV2b3IuZ2FtYmxpbkB3aW5kcml2
ZXIuY29tPgogRGF0ZTogVHVlLCAyOSBPY3QgMjAxOSAxNDowODozMiAtMDQwMAogU3ViamVjdDog
W1BBVENIXSBsaWJnY3J5cHQ6IGZpeCBtNCBmaWxlIGZvciBvZS1jb3JlCkBAIC0xMSwxMyArMTEs
MTIgQEAgc2V0dGluZ3MuCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLXNwZWNp
ZmljXQogCiBTaWduZWQtb2ZmLWJ5OiBUcmV2b3IgR2FtYmxpbiA8dHJldm9yLmdhbWJsaW5Ad2lu
ZHJpdmVyLmNvbT4KLQogLS0tCiAgc3JjL2xpYmdjcnlwdC5tNCB8IDkwICsrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDg2IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL2xpYmdjcnlw
dC5tNCBiL3NyYy9saWJnY3J5cHQubTQKLWluZGV4IDM1M2RmODFiNmQuLmIxOTVlMjI4OTQgMTAw
NjQ0CitpbmRleCAzNTNkZjgxLi5iMTk1ZTIyIDEwMDY0NAogLS0tIGEvc3JjL2xpYmdjcnlwdC5t
NAogKysrIGIvc3JjL2xpYmdjcnlwdC5tNAogQEAgLTExNiw0MSArMTE2LDYgQEAgZG5sCkBAIC0x
NDQsNiArMTQzLDMgQEAgaW5kZXggMzUzZGY4MWI2ZC4uYjE5NWUyMjg5NCAxMDA2NDQKICAgICAg
aWZlbHNlKFskM10sICwgOiwgWyQzXSkKICAgIGZpCiAgICBBQ19TVUJTVChMSUJHQ1JZUFRfQ0ZM
QUdTKQotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
Z2NyeXB0L2ZpbGVzLzAwMDItbGliZ2NyeXB0LWZpeC1idWlsZGluZy1lcnJvci13aXRoLU8yLWlu
LXN5c3Jvb3QtcGF0aC5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxl
cy8wMDAyLWxpYmdjcnlwdC1maXgtYnVpbGRpbmctZXJyb3Itd2l0aC1PMi1pbi1zeXNyb290LXBh
dGgucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDc4YjAyZWRhOWQuLjAwMDAw
MDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzLzAwMDItbGli
Z2NyeXB0LWZpeC1idWlsZGluZy1lcnJvci13aXRoLU8yLWluLXN5c3Jvb3QtcGF0aC5wYXRjaAor
KysgL2Rldi9udWxsCkBAIC0xLDQ5ICswLDAgQEAKLUZyb20gZTk2ZGYwYzgyZTA4NmJmMzQ4NzUz
ZDJkMGZhMzdmYTYxOTFiNGIxNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206ICJzaW1p
dC5naGFuZSIgPHNpbWl0LmdoYW5lQGxnZS5jb20+Ci1EYXRlOiBUdWUsIDExIEp1biAyMDI0IDA3
OjIyOjI4ICswNTMwCi1TdWJqZWN0OiBbUEFUQ0hdIHJhbmRvbTpjaXBoZXI6IGhhbmRsZSBzdWJz
dGl0dXRpb24gaW4gc2VkIGNvbW1hbmQKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0
cHM6Ly9naXQuZ251cGcub3JnL2NnaS1iaW4vZ2l0d2ViLmNnaT9wPWxpYmdjcnlwdC5naXQ7YT1j
b21taXQ7aD1lOTZkZjBjODJlMDg2YmYzNDg3NTNkMmQwZmEzN2ZhNjE5MWI0YjE0XQotCi0qIGNp
cGhlci9NYWtlZmlsZS5hbSAob19mbGFnX211bmdpbmcpOiBBZGQgJ2cnIGZsYWcgZm9yIGZpcnN0
IHNlZAotZXhwcmVzc2lvbi4KLSogcmFuZG9tL01ha2VmaWxlLmFtIChvX2ZsYWdfbXVuZ2luZyk6
IExpa2V3aXNlLgotLS0KLQotSXQgd2FzIHRoZXJlIGVhcmxpZXIgYW5kIGFjY2lkZW50YWxseSBy
ZW1vdmVkIGZyb20KLU1ha2VmaWxlLmFtIG9mIGNpcGhlciBhbmQgcmFuZG9tCi0KLVNpZ25lZC1v
ZmYtYnk6IHNpbWl0LmdoYW5lIDxzaW1pdC5naGFuZUBsZ2UuY29tPgotW2prOiBhZGQgY2hhbmdl
bG9nIHRvIGNvbW1pdCBtZXNzYWdlXQotU2lnbmVkLW9mZi1ieTogSnVzc2kgS2l2aWxpbm5hIDxq
dXNzaS5raXZpbGlubmFAaWtpLmZpPgotLS0tCi0gY2lwaGVyL01ha2VmaWxlLmFtIHwgMiArLQot
IHJhbmRvbS9NYWtlZmlsZS5hbSB8IDIgKy0KLSAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL2NpcGhlci9NYWtlZmlsZS5hbSBi
L2NpcGhlci9NYWtlZmlsZS5hbQotaW5kZXggZWE5MDE0Y2M5OC4uMTQ5YzlmMjEwMSAxMDA2NDQK
LS0tLSBhL2NpcGhlci9NYWtlZmlsZS5hbQotKysrIGIvY2lwaGVyL01ha2VmaWxlLmFtCi1AQCAt
MTY5LDcgKzE2OSw3IEBAIGdvc3Qtcy1ib3gkKEVYRUVYVF9GT1JfQlVJTEQpOiBnb3N0LXMtYm94
LmMKLSAKLSAKLSBpZiBFTkFCTEVfT19GTEFHX01VTkdJTkcKLS1vX2ZsYWdfbXVuZ2luZyA9IHNl
ZCAtZSAncy9bWzpibGFuazpdXS1PXChbMi05c2d6XVsyLTlzZ3pdKlwpLyAtTzEgLycgLWUgJ3Mv
W1s6Ymxhbms6XV0tT2Zhc3QvIC1PMSAvZycKLStvX2ZsYWdfbXVuZ2luZyA9IHNlZCAtZSAncy9b
WzpibGFuazpdXS1PXChbMi05c2d6XVsyLTlzZ3pdKlwpLyAtTzEgL2cnIC1lICdzL1tbOmJsYW5r
Ol1dLU9mYXN0LyAtTzEgL2cnCi0gZWxzZQotIG9fZmxhZ19tdW5naW5nID0gY2F0Ci0gZW5kaWYK
LWRpZmYgLS1naXQgYS9yYW5kb20vTWFrZWZpbGUuYW0gYi9yYW5kb20vTWFrZWZpbGUuYW0KLWlu
ZGV4IGM3MTAwZWY4YjguLmE0MmU0MzA2NDkgMTAwNjQ0Ci0tLS0gYS9yYW5kb20vTWFrZWZpbGUu
YW0KLSsrKyBiL3JhbmRvbS9NYWtlZmlsZS5hbQotQEAgLTU2LDcgKzU2LDcgQEAgaml0dGVyZW50
cm9weS1iYXNlLmMgaml0dGVyZW50cm9weS5oIGppdHRlcmVudHJvcHktYmFzZS11c2VyLmgKLSAK
LSAjIFRoZSBybmRqZW50IG1vZHVsZSBuZWVkcyB0byBiZSBjb21waWxlZCB3aXRob3V0IG9wdGlt
aXphdGlvbi4gICovCi0gaWYgRU5BQkxFX09fRkxBR19NVU5HSU5HCi0tb19mbGFnX211bmdpbmcg
PSBzZWQgLWUgJ3MvW1s6Ymxhbms6XV0tT1woWzEtOXNnel1bMS05c2d6XSpcKS8gLU8wIC8nIC1l
ICdzL1tbOmJsYW5rOl1dLU9mYXN0LyAtTzAgL2cnCi0rb19mbGFnX211bmdpbmcgPSBzZWQgLWUg
J3MvW1s6Ymxhbms6XV0tT1woWzEtOXNnel1bMS05c2d6XSpcKS8gLU8wIC9nJyAtZSAncy9bWzpi
bGFuazpdXS1PZmFzdC8gLU8wIC9nJwotIGVsc2UKLSBvX2ZsYWdfbXVuZ2luZyA9IGNhdAotIGVu
ZGlmCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQvZmlsZXMvMDAw
NC10ZXN0cy1NYWtlZmlsZS5hbS1maXgtdW5kZWZpbmVkLXJlZmVyZW5jZS10by1wdGhyZWFkLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzLzAwMDQtdGVzdHMtTWFr
ZWZpbGUuYW0tZml4LXVuZGVmaW5lZC1yZWZlcmVuY2UtdG8tcHRocmVhZC5wYXRjaAppbmRleCA0
MjMzZmE3ODc3Li5jY2Y0ZTE4OTEwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJnY3J5cHQvZmlsZXMvMDAwNC10ZXN0cy1NYWtlZmlsZS5hbS1maXgtdW5kZWZpbmVkLXJlZmVy
ZW5jZS10by1wdGhyZWFkLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlw
dC9maWxlcy8wMDA0LXRlc3RzLU1ha2VmaWxlLmFtLWZpeC11bmRlZmluZWQtcmVmZXJlbmNlLXRv
LXB0aHJlYWQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDkxODJiYzJkYzY3Njg1OGE4MjNj
NDc3ZDhmNDVhNTc4YjhjNGY2OWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGM3YTk5
ZTdhMTVmMWY3MDNhYzkwZmMyYTE2YjJjMjExNWE2NmE5OTYgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBT
dW4sIDEyIEp1biAyMDE2IDA0OjQ0OjI5IC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL01h
a2VmaWxlLmFtOiBmaXggdW5kZWZpbmVkIHJlZmVyZW5jZSB0bwpAQCAtOSwxNiArOSwxNSBAQCBB
ZGQgbWlzc2luZyAnLWxwdGhyZWFkJyB0byBDRkxBR1MKIFVwc3RyZWFtLVN0YXR1czogUGVuZGlu
ZwogCiBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+
Ci0KIC0tLQogIHRlc3RzL01ha2VmaWxlLmFtIHwgNCArKy0tCiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3Rlc3RzL01ha2Vm
aWxlLmFtIGIvdGVzdHMvTWFrZWZpbGUuYW0KLWluZGV4IGU2OTUzZmQuLmY0N2UxZDMgMTAwNjQ0
CitpbmRleCAzMTcwYTU4Li45YTllMWMyIDEwMDY0NAogLS0tIGEvdGVzdHMvTWFrZWZpbGUuYW0K
ICsrKyBiL3Rlc3RzL01ha2VmaWxlLmFtCi1AQCAtNzYsNyArNzYsNyBAQCB0X21waV9iaXRfTERB
REQgPSAkKHN0YW5kYXJkX2xkYWRkKSBATERBRERfRk9SX1RFU1RTX0tMVURHRUAKK0BAIC05Myw3
ICs5Myw3IEBAIHRfbXBpX2JpdF9MREFERCA9ICQoc3RhbmRhcmRfbGRhZGQpIEBMREFERF9GT1Jf
VEVTVFNfS0xVREdFQAogIHRfc2VjbWVtX0xEQUREID0gJChzdGFuZGFyZF9sZGFkZCkgQExEQURE
X0ZPUl9URVNUU19LTFVER0VACiAgdGVzdGFwaV9MREFERCA9ICQoc3RhbmRhcmRfbGRhZGQpIEBM
REFERF9GT1JfVEVTVFNfS0xVREdFQAogIHRfbG9ja19MREFERCA9ICQoc3RhbmRhcmRfbGRhZGQp
ICQoR1BHX0VSUk9SX01UX0xJQlMpIEBMREFERF9GT1JfVEVTVFNfS0xVREdFQApAQCAtMjcsNyAr
MjYsNyBAQCBpbmRleCBlNjk1M2ZkLi5mNDdlMWQzIDEwMDY0NAogIHRlc3RkcnZfTERBREQgPSAk
KExEQUREX0ZPUl9URVNUU19LTFVER0UpCiAgCiAgIyBCdWlsZCBhIHZlcnNpb24gb2YgdGhlIHRl
c3QgZHJpdmVyIGZvciB0aGUgYnVpbGQgcGxhdGZvcm0uCi1AQCAtOTUsNyArOTUsNyBAQCBlbHNl
CitAQCAtMTEyLDcgKzExMiw3IEBAIGVsc2UKICB4dGVzdHN1aXRlX2xpYnMgPSAuLi9zcmMvLmxp
YnMvbGliZ2NyeXB0LnNvKgogIHh0ZXN0c3VpdGVfZHJpdmVyID0gdGVzdGRydgogIHRfa2RmX0xE
QUREID0gJChzdGFuZGFyZF9sZGFkZCkgJChHUEdfRVJST1JfTVRfTElCUykgQExEQUREX0ZPUl9U
RVNUU19LTFVER0VACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5cHQv
ZmlsZXMvbm8tYmVuY2gtc2xvcGUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJnY3J5
cHQvZmlsZXMvbm8tYmVuY2gtc2xvcGUucGF0Y2gKaW5kZXggZWQ2NWVkNGU2Ny4uNDRhYWMxOTEz
ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzL25vLWJl
bmNoLXNsb3BlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9maWxl
cy9uby1iZW5jaC1zbG9wZS5wYXRjaApAQCAtMSwzICsxLDggQEAKK0Zyb20gZWIzYTViYzRkNWEy
MTJkYTY0YzBmOTM5NmM3ZjMxZjgzYWE2ZjM2YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgorRGF0ZTogRnJpLCA5IFNlcCAy
MDIyIDExOjEzOjM3ICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIGxpYmdjcnlwdDogZGlzYWJsZSBi
ZW5jaC1zbG9wZSB0ZXN0IGNhc2UKKwogVGhlIGJlbmNoLXNsb3BlIHRlc3QgYXBwZWFycyB0byBi
ZSBhYm9ydGluZyBmYWlybHkgZnJlcXVlbnRseSwgd2hpY2ggY2F1c2VzCiBmYWlsdXJlcyBvbiB0
aGUgYXV0b2J1aWxkZXIuCiAKQEAgLTEwLDEwICsxNSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBSb3Nz
IEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlv
bigtKQogCiBkaWZmIC0tZ2l0IGEvdGVzdHMvdGVzdGRydi5jIGIvdGVzdHMvdGVzdGRydi5jCi1p
bmRleCBiZmNhNGMyMzE0Li41YTc1NWY1MTJlIDEwMDY0NAoraW5kZXggNjM0YjcxOC4uMWU5ZGRk
YiAxMDA2NDQKIC0tLSBhL3Rlc3RzL3Rlc3RkcnYuYwogKysrIGIvdGVzdHMvdGVzdGRydi5jCi1A
QCAtNzcsNyArNzcsNiBAQCBzdGF0aWMgc3RydWN0IHsKK0BAIC03Niw3ICs3Niw2IEBAIHN0YXRp
YyBzdHJ1Y3QgewogICAgIHsgInQteDQ0OCIgICAgICB9LAogICAgIHsgInQtZWQ0NDgiICAgICB9
LAogICAgIHsgImJlbmNobWFyayIgICB9LApAQCAtMjEsNCArMjYsMyBAQCBpbmRleCBiZmNhNGMy
MzE0Li41YTc1NWY1MTJlIDEwMDY0NAogICAgIHsgImhhc2h0ZXN0LTZnIiwgImhhc2h0ZXN0Iiwg
Ii0taHVnZWJsb2NrIC0tZ2lncyA2IFNIQTEgU0hBMjU2IFNIQTUxMiAiCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiU0hBMy01MTIgU00zIEJM
QUtFMlNfMjU2ICIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJCTEFLRTJCXzUxMiBDUkMzMiAiCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2xpYmdjcnlwdC9maWxlcy9uby1uYXRpdmUtZ3BnLWVycm9yLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzL25vLW5hdGl2ZS1ncGctZXJyb3IucGF0
Y2gKaW5kZXggYjlhNjA3ODYzZC4uOTg4NzRjZTEyYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzL25vLW5hdGl2ZS1ncGctZXJyb3IucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2ZpbGVzL25vLW5hdGl2ZS1ncGctZXJyb3Iu
cGF0Y2gKQEAgLTEsMTEgKzEsMTkgQEAKK0Zyb20gZWRlMDNiODQ3MDM4YWZjMjk0ZTIwNmNhMzQ1
ZDEyZDc1YmJiYTg0NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFJvc3MgQnVydG9u
IDxyb3NzLmJ1cnRvbkBhcm0uY29tPgorRGF0ZTogRnJpLCAyNiBBdWcgMjAyMiAxNToyMzozNyAr
MDEwMAorU3ViamVjdDogW1BBVENIXSBsaWJnY3J5cHQ6IHJld3JpdGUgcHRlc3QKKwogRG9uJ3Qg
ZGVwZW5kIG9uIGEgbmF0aXZlIGxpYmdwZy1lcnJvciB0byBidWlsZCB0aGUgdGVzdCBkcml2ZXIs
IGFzIGl0J3MKIGFuIG9wdGlvbmFsIGRlcGVuZGVuY3kgZm9yIHNvbWUgQyBhbm5vdGF0aW9ucy4K
IAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlCiBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1
cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KKy0tLQorIHRlc3RzL3Rlc3RkcnYuYyB8IDEgLQor
IDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS90ZXN0cy90ZXN0
ZHJ2LmMgYi90ZXN0cy90ZXN0ZHJ2LmMKLWluZGV4IDBjY2RlMzI2Li42ZDZhYmQ1NyAxMDA2NDQK
K2luZGV4IGJmY2E0YzIuLjYzNGI3MTggMTAwNjQ0CiAtLS0gYS90ZXN0cy90ZXN0ZHJ2LmMKICsr
KyBiL3Rlc3RzL3Rlc3RkcnYuYwogQEAgLTMyLDcgKzMyLDYgQEAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9saWJnY3J5cHRfMS4xMS4wLmJiIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGliZ2NyeXB0L2xpYmdjcnlwdF8xLjExLjEuYmIKc2ltaWxhcml0eSBpbmRl
eCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZ2NyeXB0L2xpYmdjcnlw
dF8xLjExLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9saWJn
Y3J5cHRfMS4xMS4xLmJiCmluZGV4IGVhMWYzNGU4Y2UuLmU1MWEyMGU1YmYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9saWJnY3J5cHRfMS4xMS4wLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmdjcnlwdC9saWJnY3J5cHRfMS4xMS4xLmJiCkBAIC0y
MCwxMyArMjAsMTIgQEAgREVQRU5EUyA9ICJsaWJncGctZXJyb3IiCiBVUFNUUkVBTV9DSEVDS19V
UkkgPSAiaHR0cHM6Ly9nbnVwZy5vcmcvZG93bmxvYWQvaW5kZXguaHRtbCIKIFNSQ19VUkkgPSAi
JHtHTlVQR19NSVJST1J9L2xpYmdjcnlwdC9saWJnY3J5cHQtJHtQVn0udGFyLmJ6MiBcCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDAxLWxpYmdjcnlwdC1maXgtbTQtZmlsZS1mb3Itb2UtY29yZS5wYXRj
aCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAyLWxpYmdjcnlwdC1maXgtYnVpbGRpbmctZXJyb3It
d2l0aC1PMi1pbi1zeXNyb290LXBhdGgucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwNC10
ZXN0cy1NYWtlZmlsZS5hbS1maXgtdW5kZWZpbmVkLXJlZmVyZW5jZS10by1wdGhyZWFkLnBhdGNo
IFwKICAgICAgICAgICAgZmlsZTovL25vLW5hdGl2ZS1ncGctZXJyb3IucGF0Y2ggXAogICAgICAg
ICAgICBmaWxlOi8vbm8tYmVuY2gtc2xvcGUucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vcnVu
LXB0ZXN0IFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA5MTIwYzk4Njdj
ZTdmMjA4MWQ2YWFhMTc3NTM4NmI5OGMyZjJmMjQ2MTM1NzYxYWFlNDdkODFmNTg2ODViOWMiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMjRlOTFjOTEyM2E0NmM1NGU4MzcxZjNhM2EyNTAyZjExOThm
Mjg5M2ZiZmJmNTlhZjk1YmMxYzIxNDk5YjAwZSIKIAogQklOQ09ORklHID0gIiR7YmluZGlyfS9s
aWJnY3J5cHQtY29uZmlnIgogCi0tIAoyLjQ3LjEKCg==

--===============6657003469936472813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libgcrypt: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/libgcrypt: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.11.0.tar.bz2 file://0001-libgcrypt-fix-m4-file-for-oe-core.patch file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch file://no-native-gpg-error.patch file://no-bench-slope.patch file://run-ptest" to "https://www.gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.11.1.tar.bz2 file://0001-libgcrypt-fix-m4-file-for-oe-core.patch file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch file://no-native-gpg-error.patch file://no-bench-slope.patch file://run-ptest"
packages/core2-64-poky-linux/libgcrypt: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/libgcrypt/libgcrypt-dbg: FILELIST: removed "/usr/lib/.debug/libgcrypt.so.20.5.0", added "/usr/lib/.debug/libgcrypt.so.20.5.1"
packages/core2-64-poky-linux/libgcrypt/libgcrypt-dbg: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/libgcrypt/libgcrypt-dbg: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/libgcrypt/libgcrypt-dbg: PKGSIZE changed from 18559280 to 18601320 (+0%)
packages/core2-64-poky-linux/libgcrypt/libgcrypt-dev: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/libgcrypt/libgcrypt-dev: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/libgcrypt/libgcrypt-dev: PKGSIZE changed from 128054 to 130113 (+2%)
packages/core2-64-poky-linux/libgcrypt/libgcrypt-doc: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/libgcrypt/libgcrypt-doc: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/libgcrypt/libgcrypt-doc: PKGSIZE changed from 356211 to 357860 (+0%)
packages/core2-64-poky-linux/libgcrypt/libgcrypt-locale: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/libgcrypt/libgcrypt-locale: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/libgcrypt/libgcrypt-ptest: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/libgcrypt/libgcrypt-ptest: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/libgcrypt/libgcrypt-src: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/libgcrypt/libgcrypt-src: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/libgcrypt/libgcrypt-src: PKGSIZE changed from 205698 to 207799 (+1%)
packages/core2-64-poky-linux/libgcrypt/libgcrypt-staticdev: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/libgcrypt/libgcrypt-staticdev: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/libgcrypt/libgcrypt: FILELIST: removed "/usr/lib/libgcrypt.so.20.5.0", added "/usr/lib/libgcrypt.so.20.5.1"
packages/core2-64-poky-linux/libgcrypt/libgcrypt: PV changed from "1.11.0" to "1.11.1"
packages/core2-64-poky-linux/libgcrypt/libgcrypt: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-64-poky-linux/libgcrypt/libgcrypt: PKGSIZE changed from 1102299 to 1114651 (+1%)
Changes to packages/core2-64-poky-linux/libgcrypt (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.5.0 to libgcrypt.so.20.5.1
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.5.0 to libgcrypt.so.20.5.1
  /usr/lib/libgcrypt.so.20.5.0 moved to /usr/lib/libgcrypt.so.20.5.1
Changes to packages/x86_64-linux/libgcrypt-native (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.5.0 to libgcrypt.so.20.5.1
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.5.0 to libgcrypt.so.20.5.1
  /usr/lib/libgcrypt.so.20.5.0 moved to /usr/lib/libgcrypt.so.20.5.1

--===============6657003469936472813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libgcrypt/libgcrypt: FILELIST: removed "/usr/lib/libgcrypt.so.20.5.0", added "/usr/lib/libgcrypt.so.20.5.1"
Changes to packages/core2-64-poky-linux/libgcrypt (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.5.0 to libgcrypt.so.20.5.1
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.5.0 to libgcrypt.so.20.5.1
  /usr/lib/libgcrypt.so.20.5.0 moved to /usr/lib/libgcrypt.so.20.5.1
Changes to packages/x86_64-linux/libgcrypt-native (sysroot):
  /usr/lib/libgcrypt.so.20 changed symlink target from libgcrypt.so.20.5.0 to libgcrypt.so.20.5.1
  /usr/lib/libgcrypt.so changed symlink target from libgcrypt.so.20.5.0 to libgcrypt.so.20.5.1
  /usr/lib/libgcrypt.so.20.5.0 moved to /usr/lib/libgcrypt.so.20.5.1

--===============6657003469936472813==--

