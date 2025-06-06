Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77403C61DB8
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 14:28:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.34910.1749220113719306779
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 07:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D55A152B
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Jun 2025 07:28:15 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F32B13F673
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Jun 2025 07:28:32 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 12/16] unfs3: clean up DEPENDS
Date: Fri,  6 Jun 2025 15:28:17 +0100
Message-ID: <20250606142822.3387675-12-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606142822.3387675-1-ross.burton@arm.com>
References: <20250606142822.3387675-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 14:28:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218153

flex-nativesdk is both the wrong name (should be nativesdk-flex), and in
nativesdk builds it will be a dependency anyway thanks to the DEPENDS
remapping.

Merge multiple assignments into a single line.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/unfs3/unfs3_0.10.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/unfs3/unfs3_0.10.0.bb b/meta/recipes-d=
evtools/unfs3/unfs3_0.10.0.bb
index 045e496ccdb..d5c2a03371c 100644
--- a/meta/recipes-devtools/unfs3/unfs3_0.10.0.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_0.10.0.bb
@@ -7,9 +7,7 @@ SECTION =3D "console/network"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9475885294e17c0cc0067820d0427=
92e"
=20
-DEPENDS =3D "flex-native bison-native flex"
-DEPENDS +=3D "libtirpc"
-DEPENDS:append:class-nativesdk =3D " flex-nativesdk"
+DEPENDS =3D "flex-native bison-native flex libtirpc"
=20
 S =3D "${WORKDIR}/git"
 SRC_URI =3D "git://github.com/unfs3/unfs3.git;protocol=3Dhttps;branch=3D=
master \
--=20
2.43.0


