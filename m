Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A76C27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 13:21:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.41803.1717766470168321290
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jun 2024 06:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D845A13D5
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jun 2024 06:21:33 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 11DE03F762
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jun 2024 06:21:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] site: fix ac_cv_uint typo
Date: Fri,  7 Jun 2024 13:21:06 +0000
Message-Id: <20240607132106.4031449-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 13:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200441

Copy-pasting has resulted in a ac_cv_uint -> ac_cv_unit typo spreading
across the mips* site files, fix this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/site/mips-linux          | 2 +-
 meta/site/mips64-linux        | 2 +-
 meta/site/mips64el-linux      | 2 +-
 meta/site/mipsel-linux        | 2 +-
 meta/site/mipsisa32r6-linux   | 2 +-
 meta/site/mipsisa32r6el-linux | 2 +-
 meta/site/mipsisa64r6-linux   | 2 +-
 meta/site/mipsisa64r6el-linux | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/site/mips-linux b/meta/site/mips-linux
index dbd2ae5d1f4..357f2b2ceb2 100644
--- a/meta/site/mips-linux
+++ b/meta/site/mips-linux
@@ -45,7 +45,7 @@ samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIME=
OFDAY_TZ=3Dyes}
 ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
 # lmbench
-ac_cv_uint=3D${ac_cv_unit=3Dyes}
+ac_cv_uint=3D${ac_cv_uint=3Dyes}
=20
 # D-BUS
 ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
diff --git a/meta/site/mips64-linux b/meta/site/mips64-linux
index da804d4ae6f..0f415cb7181 100644
--- a/meta/site/mips64-linux
+++ b/meta/site/mips64-linux
@@ -45,7 +45,7 @@ samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIME=
OFDAY_TZ=3Dyes}
 ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
 # lmbench
-ac_cv_uint=3D${ac_cv_unit=3Dyes}
+ac_cv_uint=3D${ac_cv_uint=3Dyes}
=20
 # D-BUS
 ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
diff --git a/meta/site/mips64el-linux b/meta/site/mips64el-linux
index 060bf81807e..2210b6745e8 100644
--- a/meta/site/mips64el-linux
+++ b/meta/site/mips64el-linux
@@ -46,7 +46,7 @@ samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIME=
OFDAY_TZ=3Dyes}
 ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
 #lmbench
-ac_cv_uint=3D${ac_cv_unit=3Dyes}
+ac_cv_uint=3D${ac_cv_uint=3Dyes}
=20
 # D-BUS
 ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
diff --git a/meta/site/mipsel-linux b/meta/site/mipsel-linux
index ae190b74f38..0ba6bcfb3ff 100644
--- a/meta/site/mipsel-linux
+++ b/meta/site/mipsel-linux
@@ -46,7 +46,7 @@ samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIME=
OFDAY_TZ=3Dyes}
 ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
 #lmbench
-ac_cv_uint=3D${ac_cv_unit=3Dyes}
+ac_cv_uint=3D${ac_cv_uint=3Dyes}
=20
 # D-BUS
 ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
diff --git a/meta/site/mipsisa32r6-linux b/meta/site/mipsisa32r6-linux
index dbd2ae5d1f4..357f2b2ceb2 100644
--- a/meta/site/mipsisa32r6-linux
+++ b/meta/site/mipsisa32r6-linux
@@ -45,7 +45,7 @@ samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIME=
OFDAY_TZ=3Dyes}
 ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
 # lmbench
-ac_cv_uint=3D${ac_cv_unit=3Dyes}
+ac_cv_uint=3D${ac_cv_uint=3Dyes}
=20
 # D-BUS
 ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
diff --git a/meta/site/mipsisa32r6el-linux b/meta/site/mipsisa32r6el-linu=
x
index ae190b74f38..0ba6bcfb3ff 100644
--- a/meta/site/mipsisa32r6el-linux
+++ b/meta/site/mipsisa32r6el-linux
@@ -46,7 +46,7 @@ samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIME=
OFDAY_TZ=3Dyes}
 ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
 #lmbench
-ac_cv_uint=3D${ac_cv_unit=3Dyes}
+ac_cv_uint=3D${ac_cv_uint=3Dyes}
=20
 # D-BUS
 ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
diff --git a/meta/site/mipsisa64r6-linux b/meta/site/mipsisa64r6-linux
index da804d4ae6f..0f415cb7181 100644
--- a/meta/site/mipsisa64r6-linux
+++ b/meta/site/mipsisa64r6-linux
@@ -45,7 +45,7 @@ samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIME=
OFDAY_TZ=3Dyes}
 ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
 # lmbench
-ac_cv_uint=3D${ac_cv_unit=3Dyes}
+ac_cv_uint=3D${ac_cv_uint=3Dyes}
=20
 # D-BUS
 ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
diff --git a/meta/site/mipsisa64r6el-linux b/meta/site/mipsisa64r6el-linu=
x
index 060bf81807e..2210b6745e8 100644
--- a/meta/site/mipsisa64r6el-linux
+++ b/meta/site/mipsisa64r6el-linux
@@ -46,7 +46,7 @@ samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIME=
OFDAY_TZ=3Dyes}
 ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
=20
 #lmbench
-ac_cv_uint=3D${ac_cv_unit=3Dyes}
+ac_cv_uint=3D${ac_cv_uint=3Dyes}
=20
 # D-BUS
 ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
--=20
2.34.1


