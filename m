Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BF0CA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 14:30:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.18369.1757687445533826784
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 07:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE18B16A3
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 07:30:36 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 94C653F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 07:30:44 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] clang: add option for llvm-exegesis
Date: Fri, 12 Sep 2025 15:30:35 +0100
Message-ID: <20250912143038.3345369-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912143038.3345369-1-ross.burton@arm.com>
References: <20250912143038.3345369-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 14:30:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223315

Quoting from the README:

    llvm-exegesis is a benchmarking tool that accepts or generates
    snippets and can measure characteristics of those snippets by
    executing it while keeping track of performance counters.

Potentially useful but not essential. This reduces the size of llvm-bin
by ~30MB and llvm-dbg by ~1100MB.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index 09dda563bd3..f5550e1b44b 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -54,6 +54,7 @@ PACKAGECONFIG[clangd-dexp] =3D "-DCLANGD_BUILD_DEXP=3DO=
N,-DCLANGD_BUILD_DEXP=3DOFF,,"
=20
 PACKAGECONFIG[compiler-rt] =3D "-DCLANG_DEFAULT_RTLIB=3Dcompiler-rt,,"
 PACKAGECONFIG[eh] =3D "-DLLVM_ENABLE_EH=3DON,-DLLVM_ENABLE_EH=3DOFF,,"
+PACKAGECONFIG[exegesis] =3D "-DLLVM_TOOL_LLVM_EXEGESIS_BUILD=3DON,-DLLVM=
_TOOL_LLVM_EXEGESIS_BUILD=3DOFF"
 PACKAGECONFIG[libcplusplus] =3D "-DCLANG_DEFAULT_CXX_STDLIB=3Dlibc++,,"
 PACKAGECONFIG[libedit] =3D "-DLLVM_ENABLE_LIBEDIT=3DON,-DLLVM_ENABLE_LIB=
EDIT=3DOFF,libedit libedit-native"
 PACKAGECONFIG[libomp] =3D "-DCLANG_DEFAULT_OPENMP_RUNTIME=3Dlibomp,,"
--=20
2.43.0


