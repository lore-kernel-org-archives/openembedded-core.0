Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9DEC83F27
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 12:29:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.21004.1752668975633162309
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 05:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E634612FC
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 05:29:26 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BE22B3F694
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 05:29:34 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lldb: fix typo in lzma PACKAGECONFIG
Date: Wed, 16 Jul 2025 13:29:29 +0100
Message-ID: <20250716122929.1319495-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 12:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220448

Accidentally duplicated the beginning of the variable name.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/lldb_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/lldb_git.bb b/meta/recipes-devto=
ols/clang/lldb_git.bb
index a07be0e3d4c..10137090ad1 100644
--- a/meta/recipes-devtools/clang/lldb_git.bb
+++ b/meta/recipes-devtools/clang/lldb_git.bb
@@ -30,7 +30,7 @@ EXTRA_OECMAKE =3D "-DLLDB_INCLUDE_TESTS=3DOFF \
 PACKAGECONFIG ??=3D "libedit libxml2 lzma"
 PACKAGECONFIG[libedit] =3D "-DLLDB_ENABLE_LIBEDIT=3DON,-DLLDB_ENABLE_LIB=
EDIT=3DOFF,libedit"
 PACKAGECONFIG[libxml2] =3D "-DLLDB_ENABLE_LIBXML2=3DON,-DLLDB_ENABLE_LIB=
XML2=3DOFF,libxml2"
-PACKAGECONFIG[lzma] =3D "-DLLDB_ENABLE_LLDB_ENABLE_LZMA=3DON,-DLLDB_ENAB=
LE_LLDB_ENABLE_LZMA=3DOFF,xz"
+PACKAGECONFIG[lzma] =3D "-DLLDB_ENABLE_LZMA=3DON,-DLLDB_ENABLE_LZMA=3DOF=
F,xz"
 PACKAGECONFIG[python] =3D "-DLLDB_ENABLE_PYTHON=3DON,-DLLDB_ENABLE_PYTHO=
N=3DOFF,swig-native"
=20
 do_install:append() {
--=20
2.43.0


