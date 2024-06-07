Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F74EC41513
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 10:07:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.38319.1717754831701427432
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jun 2024 03:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8C9C339
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jun 2024 03:07:35 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 04B6D3F64C
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jun 2024 03:07:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] site: remove obsolete dbus entry
Date: Fri,  7 Jun 2024 10:07:06 +0000
Message-Id: <20240607100706.3174227-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607100706.3174227-1-ross.burton@arm.com>
References: <20240607100706.3174227-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 10:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200433

The check for working abstract sockets was removed from dbus in 2017[1]
and dbus-glib in 2014[2].

[1] https://gitlab.freedesktop.org/dbus/dbus/-/commit/6a6521746bce81c50d7=
7b560b2ee9948c1a5efd0
[2] https://gitlab.freedesktop.org/dbus/dbus-glib/-/commit/e4a163431f2cd2=
6959c9f46e573fc200c5b9fd3d

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/site/arm-darwin   | 1 -
 meta/site/arm-darwin8  | 1 -
 meta/site/arm-linux    | 3 ---
 meta/site/common-glibc | 3 ---
 meta/site/common-musl  | 3 ---
 meta/site/ix86-common  | 3 ---
 meta/site/nios2-linux  | 3 ---
 7 files changed, 17 deletions(-)

diff --git a/meta/site/arm-darwin b/meta/site/arm-darwin
index 00d9a64aa71..1078d74da4f 100644
--- a/meta/site/arm-darwin
+++ b/meta/site/arm-darwin
@@ -3,7 +3,6 @@ ac_cv_func_posix_spawn=3D${ac_cv_func_posix_spawn=3Dno}
 ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dno}
 ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwuid_r=3Dno}
 ac_cv_func_posix_getgrgid_r=3D${ac_cv_func_posix_getgrgid_r=3Dno}
-ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dno}
 bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
 ac_cv_func_strerror_r=3D${ac_cv_func_strerror_r=3Dno}
 ac_cv_va_copy=3D${ac_cv_va_copy=3Dyes}
diff --git a/meta/site/arm-darwin8 b/meta/site/arm-darwin8
index 00d9a64aa71..1078d74da4f 100644
--- a/meta/site/arm-darwin8
+++ b/meta/site/arm-darwin8
@@ -3,7 +3,6 @@ ac_cv_func_posix_spawn=3D${ac_cv_func_posix_spawn=3Dno}
 ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dno}
 ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwuid_r=3Dno}
 ac_cv_func_posix_getgrgid_r=3D${ac_cv_func_posix_getgrgid_r=3Dno}
-ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dno}
 bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
 ac_cv_func_strerror_r=3D${ac_cv_func_strerror_r=3Dno}
 ac_cv_va_copy=3D${ac_cv_va_copy=3Dyes}
diff --git a/meta/site/arm-linux b/meta/site/arm-linux
index c4205a4a2e7..d3f4939ab8a 100644
--- a/meta/site/arm-linux
+++ b/meta/site/arm-linux
@@ -142,9 +142,6 @@ clamav_av_func_working_snprintf_long=3D${clamav_av_fu=
nc_working_snprintf_long=3Dyes}
 clamav_av_have_in_port_t=3D${clamav_av_have_in_port_t=3Dyes}
 clamav_av_have_in_addr_t=3D${clamav_av_have_in_addr_t=3Dyes}
=20
-#dbus
-ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
-
 # lftp
 ac_cv_file___dev_ptc_=3Dyes
=20
diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 31123850e0f..f5b5c4b5371 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -37,9 +37,6 @@ gl_cv_func_working_mkstemp=3D${gl_cv_func_working_mkste=
mp=3Dyes}
 gl_cv_func_working_mktime=3D${gl_cv_func_working_mktime=3Dyes}
 gl_cv_func_working_utimes=3D${gl_cv_func_working_utimes=3Dyes}
=20
-#dbus-glib
-ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
-
 # gnucash
 am_cv_scanf_lld=3D${am_cv_scanf_lld=3Dyes}
=20
diff --git a/meta/site/common-musl b/meta/site/common-musl
index 8b52d35ea99..b19832d5f63 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -20,9 +20,6 @@ ac_cv_func_strtod=3D${ac_cv_func_strtod=3Dyes}
 ac_cv_sys_file_offset_bits=3D${ac_cv_sys_file_offset_bits=3D64}
 ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
=20
-#dbus-glib
-ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
-
 # bash
 bash_cv_getcwd_malloc=3D${bash_cv_getcwd_malloc=3Dyes}
=20
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index 685d7b0fb3d..ebd8ad6d60f 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -143,9 +143,6 @@ jm_cv_func_working_readdir=3Dyes
 ac_cv_sys_linker_h=3D${ac_cv_sys_linker_h=3Dno}
 ac_cv_file__usr_share_X11_sgml_defs_ent=3D${ac_cv_file__usr_share_X11_sg=
ml_defs_ent=3Dno}
=20
-#dbus
-ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
-
 #libpciaccess
 have_mtrr_h=3Dyes
=20
diff --git a/meta/site/nios2-linux b/meta/site/nios2-linux
index aeddb6bb59d..4fc39648450 100644
--- a/meta/site/nios2-linux
+++ b/meta/site/nios2-linux
@@ -303,9 +303,6 @@ clamav_av_func_working_snprintf_long=3D${clamav_av_fu=
nc_working_snprintf_long=3Dyes}
 clamav_av_have_in_port_t=3D${clamav_av_have_in_port_t=3Dyes}
 clamav_av_have_in_addr_t=3D${clamav_av_have_in_addr_t=3Dyes}
=20
-#dbus
-ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
-
 # lftp
 ac_cv_file___dev_ptc_=3Dyes
=20
--=20
2.34.1


