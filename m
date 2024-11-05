Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50513D36121
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 19:49:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.29594.1730836144223539711
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 11:49:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF65411FB
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Nov 2024 11:49:33 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 812553F528
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Nov 2024 11:49:03 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] images/*-sdk: remove debug-tweaks from IMAGE_FEATURES
Date: Tue,  5 Nov 2024 19:48:55 +0000
Message-Id: <20241105194857.3351281-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105194857.3351281-1-ross.burton@arm.com>
References: <20241105194857.3351281-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 19:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206749

There's no need for the SDK images to explicitly list debug-tweaks, this
is typically added via EXTRA_IMAGE_FEATURES when needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/images/core-image-weston-sdk.bb | 2 +-
 meta/recipes-rt/images/core-image-rt-sdk.bb           | 2 +-
 meta/recipes-sato/images/core-image-sato-sdk.bb       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/images/core-image-weston-sdk.bb b/meta=
/recipes-graphics/images/core-image-weston-sdk.bb
index 09e87b5b65c..888ebdc6e2b 100644
--- a/meta/recipes-graphics/images/core-image-weston-sdk.bb
+++ b/meta/recipes-graphics/images/core-image-weston-sdk.bb
@@ -6,7 +6,7 @@ form a standalone SDK."
 HOMEPAGE =3D "https://www.yoctoproject.org/"
=20
 IMAGE_FEATURES +=3D "dev-pkgs tools-sdk \
-	tools-debug eclipse-debug tools-profile tools-testapps debug-tweaks ssh=
-server-openssh"
+	tools-debug eclipse-debug tools-profile tools-testapps ssh-server-opens=
sh"
=20
 IMAGE_INSTALL +=3D "kernel-devsrc"
=20
diff --git a/meta/recipes-rt/images/core-image-rt-sdk.bb b/meta/recipes-r=
t/images/core-image-rt-sdk.bb
index 624b7d9430c..fbe617cadf9 100644
--- a/meta/recipes-rt/images/core-image-rt-sdk.bb
+++ b/meta/recipes-rt/images/core-image-rt-sdk.bb
@@ -13,7 +13,7 @@ tools for real-time use. It includes the full meta-tool=
chain, development \
 headers and libraries to form a standalone SDK."
 DEPENDS +=3D "linux-yocto-rt"
=20
-IMAGE_FEATURES +=3D "dev-pkgs tools-sdk tools-debug eclipse-debug tools-=
profile tools-testapps debug-tweaks"
+IMAGE_FEATURES +=3D "dev-pkgs tools-sdk tools-debug eclipse-debug tools-=
profile tools-testapps"
=20
 IMAGE_INSTALL +=3D "rt-tests hwlatdetect kernel-dev"
=20
diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recip=
es-sato/images/core-image-sato-sdk.bb
index afab473b52c..b5315a19a00 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
@@ -6,7 +6,7 @@ form a standalone SDK."
 HOMEPAGE =3D "https://www.yoctoproject.org/"
=20
 IMAGE_FEATURES +=3D "dev-pkgs tools-sdk \
-	tools-debug eclipse-debug tools-profile tools-testapps debug-tweaks ssh=
-server-openssh"
+	tools-debug eclipse-debug tools-profile tools-testapps ssh-server-opens=
sh"
=20
 IMAGE_INSTALL +=3D "kernel-devsrc"
=20
--=20
2.34.1


