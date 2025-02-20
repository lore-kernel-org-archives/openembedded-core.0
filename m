Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD0DC021B2
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 15:56:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.53091.1740066957697738403
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 07:55:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DCCA16F3
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 07:56:15 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B1E423F5A1
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 07:55:56 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] documentation: remove AUTHOR[doc]
Date: Thu, 20 Feb 2025 15:55:51 +0000
Message-ID: <20250220155551.1869500-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 15:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211767

The variable was mostly removed in oe-core 9d5edd12 but the documentation
remained.

[ YOCTO #15758 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/documentation.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 2dcf85f7672..3dd7bce5155 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -69,7 +69,6 @@ ANY_OF_DISTRO_FEATURES[doc] =3D "When a recipe inherits=
 the features_check class,
 ANY_OF_MACHINE_FEATURES[doc] =3D "When a recipe inherits the features_ch=
eck class, at least one item in this variable must be included in MACHINE=
_FEATURES."
 ASSUME_PROVIDED[doc] =3D "List of packages (recipes actually) that are a=
ssumed to be implicitly available. BitBake does not build these packages.=
"
 ASSUME_SHLIBS[doc] =3D "List of shlib:package[_version] mappings. Useful=
 for lib packages in ASSUME_PROVIDED, for which automatic shlib dependenc=
y tracking does not work."
-AUTHOR[doc] =3D "Email address used to contact the original author(s) in=
 order to send patches and forward bugs."
 AUTO_SYSLINUXMENU[doc] =3D "Enables creating an automatic menu for the s=
yslinux bootloader."
 AUTOREV[doc] =3D "When SRCREV is set to the value of this variable, it s=
pecifies to use the latest source revision in the repository."
=20
--=20
2.43.0


