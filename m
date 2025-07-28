Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B41C83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 16:44:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.86438.1753721063910101857
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 09:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A8A4152B
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 09:44:15 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0C9113F5A1
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 09:44:22 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] spirv-tools: no need for separate lesspipe package
Date: Mon, 28 Jul 2025 17:44:12 +0100
Message-ID: <20250728164412.2732039-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728164412.2732039-1-ross.burton@arm.com>
References: <20250728164412.2732039-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 16:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221016

The lesspipe script hasn't needed bash since 2018[1], so remove the bash
dependency and package the script in the main package as it's only a
few lines long.

[1] spirv-tools f70e9e "tools/lesspipe: Allow generic shell (#2255)"

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb b/meta/r=
ecipes-graphics/spir/spirv-tools_1.4.313.0.bb
index 4594a1a9426..89650702175 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
@@ -45,8 +45,4 @@ do_install:append:class-target() {
 SOLIBS =3D ".so"
 FILES_SOLIBSDEV =3D ""
=20
-PACKAGES =3D+ "${PN}-lesspipe"
-FILES:${PN}-lesspipe =3D "${base_bindir}/spirv-lesspipe.sh"
-RDEPENDS:${PN}-lesspipe +=3D "${PN} bash"
-
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


