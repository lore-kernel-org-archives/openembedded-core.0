Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634F2C27C75
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 10:07:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.38222.1717754830501270549
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jun 2024 03:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4D1C2F4
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jun 2024 03:07:34 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E50C53F64C
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jun 2024 03:07:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] site: remove obsolete evolution-data-server entries
Date: Fri,  7 Jun 2024 10:07:04 +0000
Message-Id: <20240607100706.3174227-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607100706.3174227-1-ross.burton@arm.com>
References: <20240607100706.3174227-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 10:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200431

evolution-data-server hasn't used autoconf since 2016 (from 3.23.1), so
remove the now redundant entries for it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/site/arm-common          | 4 ----
 meta/site/ix86-common         | 3 ---
 meta/site/mips-linux          | 4 ----
 meta/site/mips64-linux        | 4 ----
 meta/site/mips64el-linux      | 3 ---
 meta/site/mipsel-linux        | 3 ---
 meta/site/mipsisa32r6-linux   | 4 ----
 meta/site/mipsisa32r6el-linux | 3 ---
 meta/site/mipsisa64r6-linux   | 4 ----
 meta/site/mipsisa64r6el-linux | 3 ---
 meta/site/nios2-linux         | 3 ---
 11 files changed, 38 deletions(-)

diff --git a/meta/site/arm-common b/meta/site/arm-common
index d1dd8848118..0f9890d3b3d 100644
--- a/meta/site/arm-common
+++ b/meta/site/arm-common
@@ -119,7 +119,3 @@ lf_cv_sane_realloc=3Dyes
=20
 # xffm
 jm_cv_func_working_readdir=3Dyes
-
-# evolution-data-server
-ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
-
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index a0e57caadf5..8244b132ac6 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -146,9 +146,6 @@ jm_cv_func_working_readdir=3Dyes
 ac_cv_sys_linker_h=3D${ac_cv_sys_linker_h=3Dno}
 ac_cv_file__usr_share_X11_sgml_defs_ent=3D${ac_cv_file__usr_share_X11_sg=
ml_defs_ent=3Dno}
=20
-# evolution-data-server
-ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
-
 #dbus
 ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
=20
diff --git a/meta/site/mips-linux b/meta/site/mips-linux
index 357f2b2ceb2..bfb93d91a6e 100644
--- a/meta/site/mips-linux
+++ b/meta/site/mips-linux
@@ -49,7 +49,3 @@ ac_cv_uint=3D${ac_cv_uint=3Dyes}
=20
 # D-BUS
 ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
-
-# evolution-data-server
-ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
-
diff --git a/meta/site/mips64-linux b/meta/site/mips64-linux
index 0f415cb7181..bfb93d91a6e 100644
--- a/meta/site/mips64-linux
+++ b/meta/site/mips64-linux
@@ -49,7 +49,3 @@ ac_cv_uint=3D${ac_cv_uint=3Dyes}
=20
 # D-BUS
 ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
-
-# eds-dbus
-ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
-
diff --git a/meta/site/mips64el-linux b/meta/site/mips64el-linux
index 2210b6745e8..161b4834b94 100644
--- a/meta/site/mips64el-linux
+++ b/meta/site/mips64el-linux
@@ -50,6 +50,3 @@ ac_cv_uint=3D${ac_cv_uint=3Dyes}
=20
 # D-BUS
 ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
-
-# eds-dbus
-ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
diff --git a/meta/site/mipsel-linux b/meta/site/mipsel-linux
index 0ba6bcfb3ff..161b4834b94 100644
--- a/meta/site/mipsel-linux
+++ b/meta/site/mipsel-linux
@@ -50,6 +50,3 @@ ac_cv_uint=3D${ac_cv_uint=3Dyes}
=20
 # D-BUS
 ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
-
-# evolution-data-server
-ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
diff --git a/meta/site/mipsisa32r6-linux b/meta/site/mipsisa32r6-linux
index 357f2b2ceb2..bfb93d91a6e 100644
--- a/meta/site/mipsisa32r6-linux
+++ b/meta/site/mipsisa32r6-linux
@@ -49,7 +49,3 @@ ac_cv_uint=3D${ac_cv_uint=3Dyes}
=20
 # D-BUS
 ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
-
-# evolution-data-server
-ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
-
diff --git a/meta/site/mipsisa32r6el-linux b/meta/site/mipsisa32r6el-linu=
x
index 0ba6bcfb3ff..161b4834b94 100644
--- a/meta/site/mipsisa32r6el-linux
+++ b/meta/site/mipsisa32r6el-linux
@@ -50,6 +50,3 @@ ac_cv_uint=3D${ac_cv_uint=3Dyes}
=20
 # D-BUS
 ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
-
-# evolution-data-server
-ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
diff --git a/meta/site/mipsisa64r6-linux b/meta/site/mipsisa64r6-linux
index 0f415cb7181..bfb93d91a6e 100644
--- a/meta/site/mipsisa64r6-linux
+++ b/meta/site/mipsisa64r6-linux
@@ -49,7 +49,3 @@ ac_cv_uint=3D${ac_cv_uint=3Dyes}
=20
 # D-BUS
 ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
-
-# eds-dbus
-ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
-
diff --git a/meta/site/mipsisa64r6el-linux b/meta/site/mipsisa64r6el-linu=
x
index 2210b6745e8..161b4834b94 100644
--- a/meta/site/mipsisa64r6el-linux
+++ b/meta/site/mipsisa64r6el-linux
@@ -50,6 +50,3 @@ ac_cv_uint=3D${ac_cv_uint=3Dyes}
=20
 # D-BUS
 ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
-
-# eds-dbus
-ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
diff --git a/meta/site/nios2-linux b/meta/site/nios2-linux
index 876853925de..b1de9eeeb7e 100644
--- a/meta/site/nios2-linux
+++ b/meta/site/nios2-linux
@@ -161,9 +161,6 @@ jm_cv_func_working_readdir=3Dyes
 dpkg_cv_va_copy=3D${ac_cv_va_copy=3Dyes}
 dpkg_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
=20
-# eds-dbus
-ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
-
 ac_cv_func_setvbuf_reversed=3Dno
 ac_cv_sizeof___int64=3D${ac_cv_sizeof___int64=3D0}
 ac_cv_sizeof_char=3D${ac_cv_sizeof_char=3D1}
--=20
2.34.1


