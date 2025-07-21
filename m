Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E93CC83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 13:24:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.40562.1753104274864999893
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 06:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABD77153B
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 06:24:28 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1BDE43F6A8
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 06:24:33 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 4/5] clang: remove PYTHON_EXECUTABLE assignments
Date: Mon, 21 Jul 2025 14:24:25 +0100
Message-ID: <20250721132426.3321928-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250721132426.3321928-1-ross.burton@arm.com>
References: <20250721132426.3321928-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 13:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220690

The cmake.bbclass already does this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index 5a3893c0474..d551be72e63 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -161,9 +161,6 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
                   -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=3D'${LLVM_EXPERIM=
ENTAL_TARGETS_TO_BUILD}' \
 "
=20
-EXTRA_OECMAKE:append:class-native =3D "\
-                  -DPYTHON_EXECUTABLE=3D'${PYTHON}' \
-"
 EXTRA_OECMAKE:append:class-nativesdk =3D "\
                   -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DCMAKE_TOOLCHAIN_FI=
LE=3D${WORKDIR}/toolchain-native.cmake' \
                   -DCMAKE_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_=
PREFIX}llvm-ranlib \
@@ -174,7 +171,6 @@ EXTRA_OECMAKE:append:class-nativesdk =3D "\
                   -DLLVM_HEADERS_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llv=
m-min-tblgen \
                   -DPYTHON_LIBRARY=3D${STAGING_LIBDIR}/lib${PYTHON_DIR}$=
{PYTHON_ABI}.so \
                   -DPYTHON_INCLUDE_DIR=3D${STAGING_INCDIR}/${PYTHON_DIR}=
${PYTHON_ABI} \
-                  -DPYTHON_EXECUTABLE=3D'${PYTHON}' \
 "
 EXTRA_OECMAKE:append:class-target =3D "\
                   -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
--=20
2.43.0


