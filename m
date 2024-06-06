Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44774C27C54
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 17:18:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20605.1717694327815864425
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 10:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D18A12F4
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Jun 2024 10:19:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1858A3F792
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Jun 2024 10:18:46 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gawk: update patch status
Date: Thu,  6 Jun 2024 17:18:45 +0000
Message-Id: <20240606171845.3118157-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 17:18:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200407

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gawk/gawk/0001-m4-readline-add-missing-includes.patch       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing=
-includes.patch b/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-mi=
ssing-includes.patch
index 5be2fd97ee0..6fffd1f373a 100644
--- a/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includ=
es.patch
+++ b/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includ=
es.patch
@@ -14,7 +14,7 @@ conftest.c:146:14: error: implicit declaration of funct=
ion 'open'; did you mean
 Add the missing includes so that the check doesn't always fail due to
 these errors.
=20
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-gawk/=
2024-05/msg00000.html]
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/gawk.git/co=
mmit/?id=3Dc1613c310d71b87f509458e0259ecd10eda2b140]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
  m4/readline.m4 | 2 ++
--=20
2.34.1


