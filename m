Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29A9C6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 09:37:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10191.1693388215016809100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 02:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D17392F4;
	Wed, 30 Aug 2023 02:37:33 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E34713F64C;
	Wed, 30 Aug 2023 02:36:53 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] site: remove at-spi2-core values
Date: Wed, 30 Aug 2023 10:36:52 +0100
Message-Id: <20230830093652.3914257-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 09:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186876

From: Ross Burton <ross.burton@arm.com>

at-spi2-core is built with Meson now, so these values are not needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/site/arm-32         | 10 ----------
 meta/site/arm-64         |  9 ---------
 meta/site/ix86-common    | 10 ----------
 meta/site/mips-common    | 10 ----------
 meta/site/powerpc-common |  9 ---------
 meta/site/x86_64-linux   | 10 ----------
 6 files changed, 58 deletions(-)
 delete mode 100644 meta/site/powerpc-common

diff --git a/meta/site/arm-32 b/meta/site/arm-32
index c6af852354e..be741617b67 100644
--- a/meta/site/arm-32
+++ b/meta/site/arm-32
@@ -6,13 +6,3 @@ ac_cv_sizeof_ssize_t=3D${ac_cv_sizeof_ssize_t=3D4}
=20
 # jikes
 ac_cv_sizeof_wchar_t=3D4
-
-# at-spi2-core
-ac_cv_alignof_char=3D1
-ac_cv_alignof_dbind_pointer=3D4
-ac_cv_alignof_dbind_struct=3D1
-ac_cv_alignof_dbus_bool_t=3D4
-ac_cv_alignof_dbus_int16_t=3D2
-ac_cv_alignof_dbus_int32_t=3D4
-ac_cv_alignof_dbus_int64_t=3D8
-ac_cv_alignof_double=3D8
diff --git a/meta/site/arm-64 b/meta/site/arm-64
index 79c10dab0e8..f4eae88471e 100644
--- a/meta/site/arm-64
+++ b/meta/site/arm-64
@@ -6,12 +6,3 @@ ac_cv_sizeof_size_t=3D8
 ac_cv_sizeof_ssize_t=3D8
 ac_cv_alignof_char=3D1
 ac_cv_alignof_double=3D8
-
-# at-spi2-core
-ac_cv_alignof_dbind_pointer=3D8
-ac_cv_alignof_dbind_struct=3D1
-ac_cv_alignof_dbus_bool_t=3D4
-ac_cv_alignof_dbus_int16_t=3D2
-ac_cv_alignof_dbus_int32_t=3D4
-ac_cv_alignof_dbus_int64_t=3D8
-
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index b97b2e3f60c..eae5670d937 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -170,13 +170,3 @@ ac_cv_lib_c_signalfd=3D${ac_cv_lib_c_signalfd=3Dyes}
 nfsd_cv_broken_setfsuid=3D${nfsd_cv_broken_setfsuid=3D0}
 nfsd_cv_func_statfs=3D${nfsd_cv_func_statfs=3Dstatfs2_bsize}
 nfsd_cv_bsd_signals=3D${nfsd_cv_bsd_signals=3Dyes}
-
-# at-spi2-core
-ac_cv_alignof_char=3D1
-ac_cv_alignof_dbind_pointer=3D4
-ac_cv_alignof_dbind_struct=3D1
-ac_cv_alignof_dbus_bool_t=3D4
-ac_cv_alignof_dbus_int16_t=3D2
-ac_cv_alignof_dbus_int32_t=3D4
-ac_cv_alignof_dbus_int64_t=3D4
-ac_cv_alignof_double=3D4
diff --git a/meta/site/mips-common b/meta/site/mips-common
index ff1b7f4e5e0..55dc50beb18 100644
--- a/meta/site/mips-common
+++ b/meta/site/mips-common
@@ -20,13 +20,3 @@ ac_cv_sizeof_ssize_t=3D${ac_cv_sizeof_ssize_t=3D4}
=20
 # slrn
 slrn_cv_va_val_copy=3D${slrn_cv_va_val_copy=3Dyes}
-
-# at-spi2-core
-ac_cv_alignof_char=3D1
-ac_cv_alignof_dbind_pointer=3D4
-ac_cv_alignof_dbind_struct=3D1
-ac_cv_alignof_dbus_bool_t=3D4
-ac_cv_alignof_dbus_int16_t=3D2
-ac_cv_alignof_dbus_int32_t=3D4
-ac_cv_alignof_dbus_int64_t=3D8
-ac_cv_alignof_double=3D8
diff --git a/meta/site/powerpc-common b/meta/site/powerpc-common
deleted file mode 100644
index 02217c70f94..00000000000
--- a/meta/site/powerpc-common
+++ /dev/null
@@ -1,9 +0,0 @@
-# at-spi2-core
-ac_cv_alignof_char=3D1
-ac_cv_alignof_dbind_pointer=3D4
-ac_cv_alignof_dbind_struct=3D1
-ac_cv_alignof_dbus_bool_t=3D4
-ac_cv_alignof_dbus_int16_t=3D2
-ac_cv_alignof_dbus_int32_t=3D4
-ac_cv_alignof_dbus_int64_t=3D8
-ac_cv_alignof_double=3D8
diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index d7b7a530ff5..b9ee141fd5c 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -83,13 +83,3 @@ ac_cv_func__restgpr_14_x=3Dno
=20
 # cvs
 cvs_cv_func_printf_ptr=3D${cvs_cv_func_printf_ptr=3Dyes}
-
-# at-spi2-core
-ac_cv_alignof_char=3D1
-ac_cv_alignof_dbind_pointer=3D8
-ac_cv_alignof_dbind_struct=3D1
-ac_cv_alignof_dbus_bool_t=3D4
-ac_cv_alignof_dbus_int16_t=3D2
-ac_cv_alignof_dbus_int32_t=3D4
-ac_cv_alignof_dbus_int64_t=3D8
-ac_cv_alignof_double=3D8
--=20
2.34.1


