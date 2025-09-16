Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14323CAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:37:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15371.1758015464905985796
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35D7012FC
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 02:37:36 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0A9973F66E
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 02:37:43 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/3] mesa: clean up libopencl-mesa dependencies
Date: Tue, 16 Sep 2025 10:37:38 +0100
Message-ID: <20250916093738.1636562-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916093738.1636562-1-ross.burton@arm.com>
References: <20250916093738.1636562-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 09:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223536

The libraries in spirv-tools and spirv-llvm-translator are linked to
libopencl, so the correct dependencies are generated automatically.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 5dee19fae9e..39924508ca9 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -224,7 +224,7 @@ DEV_PKG_DEPENDENCY =3D ""
 RPROVIDES:libgles2-mesa +=3D "libgles3-mesa"
 RPROVIDES:libgles2-mesa-dev +=3D "libgles3-mesa-dev"
=20
-RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'ope=
ncl', 'libclc spirv-tools spirv-llvm-translator', '', d)}"
+RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'ope=
ncl', 'libclc', '', d)}"
=20
 PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
              libgallium \
--=20
2.43.0


