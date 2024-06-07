Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5261AC27C6F
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 10:07:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.38221.1717754830036070807
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jun 2024 03:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2115A2F4
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jun 2024 03:07:34 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 57D233F64C
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jun 2024 03:07:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] site: remove libc definitions in nios2-linux
Date: Fri,  7 Jun 2024 10:07:03 +0000
Message-Id: <20240607100706.3174227-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607100706.3174227-1-ross.burton@arm.com>
References: <20240607100706.3174227-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 10:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200430

These assignments are libc-specific not architecture specific, so are
already set in the glibc and musl site files.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/site/nios2-linux | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/site/nios2-linux b/meta/site/nios2-linux
index 57c3f5b988d..876853925de 100644
--- a/meta/site/nios2-linux
+++ b/meta/site/nios2-linux
@@ -163,13 +163,7 @@ dpkg_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
=20
 # eds-dbus
 ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
-ac_cv_func_getpgrp_void=3Dyes
-ac_cv_func_setpgrp_void=3Dyes
-ac_cv_func_setgrent_void=3Dyes
-ac_cv_func_malloc_0_nonnull=3Dyes
-ac_cv_func_malloc_works=3Dyes
-ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwuid_r=3Dyes}
-ac_cv_func_posix_getgrgid_r=3D${ac_cv_func_posix_getgrgid_r=3Dyes}
+
 ac_cv_func_setvbuf_reversed=3Dno
 ac_cv_sizeof___int64=3D${ac_cv_sizeof___int64=3D0}
 ac_cv_sizeof_char=3D${ac_cv_sizeof_char=3D1}
--=20
2.34.1


