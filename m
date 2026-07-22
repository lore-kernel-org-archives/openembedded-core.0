Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13D7C44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 15:42:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3156.1784734977044123870
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 08:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=rl18XwpD;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4968E168F
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:42:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 200973F66F
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784734976; bh=FP11oabAp6K0ErWZZVetCgy/wwlNhQgkVUlDM1VusOo=;
	h=From:To:Subject:Date:From;
	b=rl18XwpDbABzPIAMA9WWNwCt9HRylQlG008akpjFBSjWULr+ldCsWUyuXIz5A3Ol7
	 cbIk2fxd6rdntWn+x8LT2fB6WAHQDL6wLcG6O4zbbwWO30HQPhjPLrjxmqe36a6m1M
	 c472e3/Yf6fNgnDR3CRZCpTCG0vzpVMxnVUtbmHc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] site: remove obsolete xorg_cv_malloc0_returns_null
Date: Wed, 22 Jul 2026 16:42:43 +0100
Message-ID: <20260722154247.2987545-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 15:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241699

xorg-macros 1.20.2 dropped the runtime check entirely[1], so these
cached values are not being read.

[1] util/macros b9f5184 ("XORG_CHECK_MALLOC_ZERO: stop testing malloc,
    assume the worst")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/site/common-glibc | 3 ---
 meta/site/common-musl  | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index f5b5c4b5371..29f96da48d6 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -73,6 +73,3 @@ ac_cv_va_copy=3D${ac_cv_va_copy=3Dyes}
 ac_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
 ac_cv_func_va_copy=3D${ac_cv_func_va_copy=3Dyes}
 ac_cv_func___va_copy=3D${ac_cv_func___va_copy=3Dyes}
-
-# Xorg
-xorg_cv_malloc0_returns_null=3D${xorg_cv_malloc0_returns_null=3Dyes}
diff --git a/meta/site/common-musl b/meta/site/common-musl
index b19832d5f63..9eac6b9b6c6 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -45,6 +45,3 @@ ac_cv_va_copy=3D${ac_cv_va_copy=3Dyes}
 ac_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
 ac_cv_func_va_copy=3D${ac_cv_func_va_copy=3Dyes}
 ac_cv_func___va_copy=3D${ac_cv_func___va_copy=3Dyes}
-
-# Xorg
-xorg_cv_malloc0_returns_null=3D${xorg_cv_malloc0_returns_null=3Dyes}
--=20
2.43.0


