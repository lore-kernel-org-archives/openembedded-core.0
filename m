Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D458C47DB3
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 18:19:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2290.1706552362397007381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 10:19:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA29ADA7
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 10:20:05 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AD2283F738
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 10:19:21 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] grub2: ignore CVE-2023-4001, this is Red Hat-specific
Date: Mon, 29 Jan 2024 18:19:20 +0000
Message-Id: <20240129181920.2171316-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 18:19:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194476

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-bsp/grub/grub2.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub=
2.inc
index 5685cae0ab4..47dc9217985 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -25,6 +25,7 @@ SRC_URI[sha256sum] =3D "b30919fa5be280417c17ac561bb1650=
f60cfb80cc6237fa1e2b6f56154
=20
 CVE_STATUS[CVE-2019-14865] =3D "not-applicable-platform: applies only to=
 RHEL"
 CVE_STATUS[CVE-2021-46705] =3D "not-applicable-platform: Applies only to=
 SUSE"
+CVE_STATUS[CVE-2023-4001]  =3D "not-applicable-platform: Applies only to=
 RHEL/Fedora"
=20
 DEPENDS =3D "flex-native bison-native gettext-native"
=20
--=20
2.34.1


