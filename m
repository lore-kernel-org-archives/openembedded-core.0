Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D8ACAC597
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 14:30:46 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18199.1757687445975836669
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 07:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6070716A3
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 07:30:37 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4625B3F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 07:30:45 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] clang: remove obsolete install steps
Date: Fri, 12 Sep 2025 15:30:36 +0100
Message-ID: <20250912143038.3345369-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912143038.3345369-1-ross.burton@arm.com>
References: <20250912143038.3345369-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 14:30:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223316

clang-pseudo and clang-rename have both been removed from upstream, so
don't try to install them anymore:

  llvm 40c45b6b4318 ("Remove clang-rename (#108988)")
  llvm ed8f78827895 ("Remove clang-pseudo (#109154)")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index f5550e1b44b..9a19cefc961 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -168,12 +168,6 @@ do_configure:append:class-nativesdk() {
 }
=20
 do_install:append() {
-    for t in clang-pseudo clang-pseudo-gen clang-rename; do
-        if [ -e ${B}${BINPATHPREFIX}/bin/$t ]; then
-            install -Dm 0755 ${B}${BINPATHPREFIX}/bin/$t ${D}${bindir}/$=
t
-        fi
-    done
-
     oe_multilib_header llvm/Config/llvm-config.h
     oe_multilib_header clang/Config/config.h
 }
--=20
2.43.0


