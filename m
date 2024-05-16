Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EAFC25B78
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:06:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10854.1715857601845794556
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FAF0DA7
	for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:07:05 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F26373F762
	for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:06:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] fribidi: upgrade 1.0.13 -> 1.0.14
Date: Thu, 16 May 2024 11:06:37 +0000
Message-Id: <20240516110637.2239854-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516110637.2239854-1-ross.burton@arm.com>
References: <20240516110637.2239854-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:06:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199463

* Updated Unicode tables to version 15.1

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../fribidi/{fribidi_1.0.13.bb =3D> fribidi_1.0.14.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/fribidi/{fribidi_1.0.13.bb =3D> fribidi_1.0.=
14.bb} (89%)

diff --git a/meta/recipes-support/fribidi/fribidi_1.0.13.bb b/meta/recipe=
s-support/fribidi/fribidi_1.0.14.bb
similarity index 89%
rename from meta/recipes-support/fribidi/fribidi_1.0.13.bb
rename to meta/recipes-support/fribidi/fribidi_1.0.14.bb
index 5d0476a3752..51752096de1 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.13.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.14.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b9107=
6e631dd8edb7424769c7"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.xz \
            "
-SRC_URI[sha256sum] =3D "7fa16c80c81bd622f7b198d31356da139cc318a63fc77612=
17af4130903f54a2"
+SRC_URI[sha256sum] =3D "76ae204a7027652ac3981b9fa5817c083ba23114340284c5=
8e756b259cd2259a"
=20
 inherit meson lib_package pkgconfig github-releases
=20
--=20
2.34.1


