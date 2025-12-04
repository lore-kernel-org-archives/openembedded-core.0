Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2ECD216AE
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 16:18:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47548.1764865108164749366
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 08:18:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 779CB339
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Dec 2025 08:18:20 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6A1103F66E
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Dec 2025 08:18:27 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] gcc: fix punctuation in the poisoning help output
Date: Thu,  4 Dec 2025 16:18:19 +0000
Message-ID: <20251204161820.1339988-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204161820.1339988-1-ross.burton@arm.com>
References: <20251204161820.1339988-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 16:18:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227303

The gcc test suite actually verifies the formatting of the --help output,
so add a missing period to fix a test case.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gcc/gcc/0002-gcc-poison-system-directories.patch            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directo=
ries.patch b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directo=
ries.patch
index a58cd590679..f1731ed2e57 100644
--- a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.pa=
tch
+++ b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.pa=
tch
@@ -35,7 +35,7 @@ index e3fa0dacec4..bea1adc0940 100644
 =20
 +Wpoison-system-directories
 +Common Var(flag_poison_system_directories) Init(1) Warning
-+Warn for -I and -L options using system directories if cross compiling
++Warn for -I and -L options using system directories if cross compiling.
 +
  Wshadow
  Common Var(warn_shadow) Warning
--=20
2.43.0


