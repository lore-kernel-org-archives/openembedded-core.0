Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB02C27C5F
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 10:07:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.38223.1717754831151909923
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jun 2024 03:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34D612F4
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jun 2024 03:07:35 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 74F593F64C
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jun 2024 03:07:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] site: move ac_cv_func_posix_getpwnam_r to libc files
Date: Fri,  7 Jun 2024 10:07:05 +0000
Message-Id: <20240607100706.3174227-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607100706.3174227-1-ross.burton@arm.com>
References: <20240607100706.3174227-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 10:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200432

As with the other ac_cv_func_posix_* functions, this is specific to the
libc and not the architecture.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/site/arm-common          | 3 ---
 meta/site/common-glibc        | 1 +
 meta/site/common-musl         | 6 +-----
 meta/site/ix86-common         | 3 ---
 meta/site/mips-linux          | 3 ---
 meta/site/mips64-linux        | 3 ---
 meta/site/mips64el-linux      | 3 ---
 meta/site/mipsel-linux        | 3 ---
 meta/site/mipsisa32r6-linux   | 3 ---
 meta/site/mipsisa32r6el-linux | 3 ---
 meta/site/mipsisa64r6-linux   | 3 ---
 meta/site/mipsisa64r6el-linux | 3 ---
 meta/site/nios2-linux         | 3 ---
 meta/site/powerpc32-linux     | 3 ---
 meta/site/sh-common           | 3 ---
 meta/site/x86_64-linux        | 1 -
 16 files changed, 2 insertions(+), 45 deletions(-)

diff --git a/meta/site/arm-common b/meta/site/arm-common
index 0f9890d3b3d..c4bd29c439d 100644
--- a/meta/site/arm-common
+++ b/meta/site/arm-common
@@ -21,9 +21,6 @@ db_cv_sprintf_count=3D${db_cv_sprintf_count=3Dyes}
 db_cv_align_t=3D${db_cv_align_t=3D'unsigned long long'}
 db_cv_alignp_t=3D${db_cv_alignp_t=3D'unsigned long'}
=20
-# D-BUS
-ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
-
 # edb
 db_cv_spinlocks=3D${db_cv_spinlocks=3Dno}
=20
diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 822e30d3c7f..31123850e0f 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -11,6 +11,7 @@ ac_cv_func_setgrent_void=3Dyes
 ac_cv_func_getgrgid_r=3D${ac_cv_func_getgrgid_r=3Dyes}
 ac_cv_func_getpwuid_r=3D${ac_cv_func_getpwuid_r=3Dyes}
 ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwuid_r=3Dyes}
+ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
 ac_cv_func_posix_getgrgid_r=3D${ac_cv_func_posix_getgrgid_r=3Dyes}
 ac_cv_func_getaddrinfo=3D${ac_cv_func_getaddrinfo=3Dyes}
 ac_cv_func_strtod=3D${ac_cv_func_strtod=3Dyes}
diff --git a/meta/site/common-musl b/meta/site/common-musl
index 4c2c4092a88..8b52d35ea99 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -11,6 +11,7 @@ ac_cv_func_setgrent_void=3Dyes
 ac_cv_func_getgrgid_r=3D${ac_cv_func_getgrgid_r=3Dyes}
 ac_cv_func_getpwuid_r=3D${ac_cv_func_getpwuid_r=3Dyes}
 ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwuid_r=3Dyes}
+ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
 ac_cv_func_posix_getgrgid_r=3D${ac_cv_func_posix_getgrgid_r=3Dyes}
 ac_cv_func_getaddrinfo=3D${ac_cv_func_getaddrinfo=3Dyes}
 ac_cv_func_mmap_fixed_mapped=3D${ac_cv_func_mmap_fixed_mapped=3Dyes}
@@ -48,10 +49,5 @@ ac_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
 ac_cv_func_va_copy=3D${ac_cv_func_va_copy=3Dyes}
 ac_cv_func___va_copy=3D${ac_cv_func___va_copy=3Dyes}
=20
-# posix_getpwuid_r posix_getgrgid_r posix_getpwnam_r
-ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwuid_r=3Dyes}
-ac_cv_func_posix_getgrgid_r=3D${ac_cv_func_posix_getgrgid_r=3Dyes}
-ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
-
 # Xorg
 xorg_cv_malloc0_returns_null=3D${xorg_cv_malloc0_returns_null=3Dyes}
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index 8244b132ac6..685d7b0fb3d 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -60,9 +60,6 @@ db_cv_align_t=3D${db_cv_align_t=3D'unsigned long long'}
 db_cv_fcntl_f_setfd=3D${db_cv_fcntl_f_setfd=3Dyes}
 db_cv_sprintf_count=3D${db_cv_sprintf_count=3Dyes}
=20
-# D-BUS
-ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
-
 # ettercap
 ettercap_cv_type_socklen_t=3D${ettercap_cv_type_socklen_t=3Dyes}
=20
diff --git a/meta/site/mips-linux b/meta/site/mips-linux
index bfb93d91a6e..10aa84fb9d6 100644
--- a/meta/site/mips-linux
+++ b/meta/site/mips-linux
@@ -46,6 +46,3 @@ ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
 # lmbench
 ac_cv_uint=3D${ac_cv_uint=3Dyes}
-
-# D-BUS
-ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
diff --git a/meta/site/mips64-linux b/meta/site/mips64-linux
index bfb93d91a6e..10aa84fb9d6 100644
--- a/meta/site/mips64-linux
+++ b/meta/site/mips64-linux
@@ -46,6 +46,3 @@ ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
 # lmbench
 ac_cv_uint=3D${ac_cv_uint=3Dyes}
-
-# D-BUS
-ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
diff --git a/meta/site/mips64el-linux b/meta/site/mips64el-linux
index 161b4834b94..9a0084dc7fb 100644
--- a/meta/site/mips64el-linux
+++ b/meta/site/mips64el-linux
@@ -47,6 +47,3 @@ ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
 #lmbench
 ac_cv_uint=3D${ac_cv_uint=3Dyes}
-
-# D-BUS
-ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
diff --git a/meta/site/mipsel-linux b/meta/site/mipsel-linux
index 161b4834b94..9a0084dc7fb 100644
--- a/meta/site/mipsel-linux
+++ b/meta/site/mipsel-linux
@@ -47,6 +47,3 @@ ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
 #lmbench
 ac_cv_uint=3D${ac_cv_uint=3Dyes}
-
-# D-BUS
-ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
diff --git a/meta/site/mipsisa32r6-linux b/meta/site/mipsisa32r6-linux
index bfb93d91a6e..10aa84fb9d6 100644
--- a/meta/site/mipsisa32r6-linux
+++ b/meta/site/mipsisa32r6-linux
@@ -46,6 +46,3 @@ ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
 # lmbench
 ac_cv_uint=3D${ac_cv_uint=3Dyes}
-
-# D-BUS
-ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
diff --git a/meta/site/mipsisa32r6el-linux b/meta/site/mipsisa32r6el-linu=
x
index 161b4834b94..9a0084dc7fb 100644
--- a/meta/site/mipsisa32r6el-linux
+++ b/meta/site/mipsisa32r6el-linux
@@ -47,6 +47,3 @@ ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
 #lmbench
 ac_cv_uint=3D${ac_cv_uint=3Dyes}
-
-# D-BUS
-ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
diff --git a/meta/site/mipsisa64r6-linux b/meta/site/mipsisa64r6-linux
index bfb93d91a6e..10aa84fb9d6 100644
--- a/meta/site/mipsisa64r6-linux
+++ b/meta/site/mipsisa64r6-linux
@@ -46,6 +46,3 @@ ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
 # lmbench
 ac_cv_uint=3D${ac_cv_uint=3Dyes}
-
-# D-BUS
-ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
diff --git a/meta/site/mipsisa64r6el-linux b/meta/site/mipsisa64r6el-linu=
x
index 161b4834b94..9a0084dc7fb 100644
--- a/meta/site/mipsisa64r6el-linux
+++ b/meta/site/mipsisa64r6el-linux
@@ -47,6 +47,3 @@ ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
 #lmbench
 ac_cv_uint=3D${ac_cv_uint=3Dyes}
-
-# D-BUS
-ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
diff --git a/meta/site/nios2-linux b/meta/site/nios2-linux
index b1de9eeeb7e..aeddb6bb59d 100644
--- a/meta/site/nios2-linux
+++ b/meta/site/nios2-linux
@@ -33,9 +33,6 @@ db_cv_alignp_t=3D${db_cv_alignp_t=3D'unsigned long'}
 db_cv_posixmutexes=3D${db_cv_posixmutexes=3Dno}
 db_cv_uimutexes=3D${db_cv_uimutexes=3Dno}
=20
-# D-BUS
-ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
-
 # edb
 db_cv_spinlocks=3D${db_cv_spinlocks=3Dno}
=20
diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
index c2f870b432c..ccf4012a89a 100644
--- a/meta/site/powerpc32-linux
+++ b/meta/site/powerpc32-linux
@@ -103,9 +103,6 @@ ettercap_cv_type_socklen_t=3D${ettercap_cv_type_sockl=
en_t=3Dyes}
 # libesmtp
 acx_working_snprintf=3D${acx_working_snprintf=3Dyes}
=20
-# D-BUS
-ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
-
 # httppc
 ac_cv_strerror_r_SUSv3=3D${ac_cv_strerror_r_SUSv3=3Dno}
=20
diff --git a/meta/site/sh-common b/meta/site/sh-common
index f2481652c98..683b3a6c9a5 100644
--- a/meta/site/sh-common
+++ b/meta/site/sh-common
@@ -109,9 +109,6 @@ ettercap_cv_type_socklen_t=3D${ettercap_cv_type_sockl=
en_t=3Dyes}
 # libesmtp
 acx_working_snprintf=3D${acx_working_snprintf=3Dyes}
=20
-# D-BUS
-ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
-
 # httppc
 ac_cv_strerror_r_SUSv3=3D${ac_cv_strerror_r_SUSv3=3Dno}
=20
diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index b9ee141fd5c..dcc6b3408f7 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -2,7 +2,6 @@
 ac_cv_va_val_copy=3D${ac_cv_va_val_copy=3Dno}
 ac_cv_func_lstat_dereferences_slashed_symlink=3D${ac_cv_func_lstat_deref=
erences_slashed_symlink=3Dyes}
 ac_cv_func_lstat_empty_string_bug=3D${ac_cv_func_lstat_empty_string_bug=3D=
no}
-ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
 ac_cv_func_setvbuf_reversed=3D${ac_cv_func_setvbuf_reversed=3Dno}
 ac_cv_func_stat_empty_string_bug=3D${ac_cv_func_stat_empty_string_bug=3D=
no}
 ac_cv_func_stat_ignores_trailing_slash=3D${ac_cv_func_stat_ignores_trail=
ing_slash=3Dno}
--=20
2.34.1


