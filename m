Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605C8C83F22
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 11:52:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6330.1752580358983386330
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 04:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CC7512FC
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 04:52:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CD2E83F694
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 04:52:37 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] clang: remove clang-lldb-python package
Date: Tue, 15 Jul 2025 12:52:33 +0100
Message-ID: <20250715115233.1244511-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 11:52:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220293

v1 of the lldb patchset was accidentally merged, which didn't remove
this package from the clang recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index be56b169c29..1daac48edaf 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -298,7 +298,7 @@ PROVIDES:append:class-native =3D " llvm-native libclc=
-native"
 PROVIDES:append:class-target =3D " llvm libclc"
 PROVIDES:append:class-nativesdk =3D " nativesdk-llvm nativesdk-libclc"
=20
-PACKAGES =3D+ "${PN}-libllvm ${PN}-lldb-python ${PN}-libclang-python ${P=
N}-libclang-cpp ${PN}-tidy ${PN}-format ${PN}-tools ${PN}-clc \
+PACKAGES =3D+ "${PN}-libllvm ${PN}-libclang-python ${PN}-libclang-cpp ${=
PN}-tidy ${PN}-format ${PN}-tools ${PN}-clc \
              libclang llvm-linker-tools"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


