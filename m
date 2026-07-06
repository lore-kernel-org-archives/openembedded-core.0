Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0DCC43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 10:21:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.147077.1783333304864632934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 03:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=TVyMjOCY;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E99812454
	for <openembedded-core@lists.openembedded.org>; Mon,  6 Jul 2026 03:21:39 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CE3FD3F85F
	for <openembedded-core@lists.openembedded.org>; Mon,  6 Jul 2026 03:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783333304; bh=lu1C299ek6JlxCVusRWQXoQjhkHFBQgOo4G4b98qQPQ=;
	h=From:To:Subject:Date:From;
	b=TVyMjOCY2Vs9OyKrNsDUfARnSYn0zBRrE0OS/AB7x9OGkFsuK1sEvXbhvPf/NutSa
	 GJbavMjtkVjnwG8yZuDzBtXCMc1EuOVDA3nbo+5yuri4Dqu3ij4JmeEYZ5/9mBQdRs
	 TlqMeA2WkY67ZH9Fg4XzbGdjhlYfJ8YbZcer73Ro=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] busybox: enable xxd
Date: Mon,  6 Jul 2026 11:21:38 +0100
Message-ID: <20260706102138.1157202-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240237

The xxd binary is very small and a non-zero number of test suites use
xxd to generate test data.

Enable xxd in busybox to avoid having to pull vim's xxd into builds. It
does not have feature parity with vim's xxd, but it's close enough for
many tests and vim's xxd still exists for the others.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-c=
ore/busybox/busybox/defconfig
index 93d9207c827..1f4b5e3d1eb 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -645,7 +645,7 @@ CONFIG_FSTRIM=3Dy
 # CONFIG_FEATURE_GETOPT_LONG is not set
 CONFIG_HEXDUMP=3Dy
 # CONFIG_HD is not set
-# CONFIG_XXD is not set
+CONFIG_XXD=3Dy
 CONFIG_HWCLOCK=3Dy
 CONFIG_FEATURE_HWCLOCK_ADJTIME_FHS=3Dy
 # CONFIG_IONICE is not set
--=20
2.43.0


