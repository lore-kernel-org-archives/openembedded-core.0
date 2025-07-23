Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AC9C83F17
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 12:24:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13274.1753273493176133708
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jul 2025 05:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8A3A22C7
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 05:24:46 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 50EAF3F6A8
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 05:24:52 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] lldb: remove incorrect comment about llvm vs clang
Date: Wed, 23 Jul 2025 13:24:47 +0100
Message-ID: <20250723122448.2250339-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 12:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220803

LLDB links to clang libraries, so it really does need clang and not just
LLVM.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/lldb_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/lldb_git.bb b/meta/recipes-devto=
ols/clang/lldb_git.bb
index 10137090ad1..4eec175ff0e 100644
--- a/meta/recipes-devtools/clang/lldb_git.bb
+++ b/meta/recipes-devtools/clang/lldb_git.bb
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM =3D "file://lldb/LICENSE.TXT;md5=3D2e0=
d44968471fcde980034dbb826bea9
=20
 inherit cmake pkgconfig python3native python3targetconfig
=20
-# This actually just depends on LLVM but right now llvm and clang are bu=
ilt together
 DEPENDS =3D "llvm-tblgen-native clang"
=20
 OECMAKE_SOURCEPATH =3D "${S}/lldb"
--=20
2.43.0


