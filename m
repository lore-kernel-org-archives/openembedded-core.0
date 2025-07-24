Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD10C87FCA
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 18:38:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1343.1753382337952516997
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 11:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FC41266C
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 11:38:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 41B8E3F66E
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 11:38:57 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] spirv-llvm-translator: depend on llvm, not clang
Date: Thu, 24 Jul 2025 19:38:49 +0100
Message-ID: <20250724183849.3546823-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724183849.3546823-1-ross.burton@arm.com>
References: <20250724183849.3546823-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 18:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220858

At the moment the clang recipe provides llvm, but they could be split
in the future and this makes it clear that the translator just needs
libllvm and not the clang tools.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb b=
/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
index 14e4bb74ace..64a73ce55aa 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
@@ -13,7 +13,7 @@ SRC_URI =3D " \
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
-DEPENDS =3D "clang spirv-tools spirv-headers"
+DEPENDS =3D "llvm spirv-tools spirv-headers"
=20
 inherit cmake pkgconfig python3native
=20
--=20
2.43.0


