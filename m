Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0FDC4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 10:57:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10663.1714647459274759816
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 03:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 091D32F4
	for <openembedded-core@lists.openembedded.org>; Thu,  2 May 2024 03:58:04 -0700 (PDT)
Received: from e133390.cambridge.arm.com (unknown [10.1.34.146])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0C4C3F793
	for <openembedded-core@lists.openembedded.org>; Thu,  2 May 2024 03:57:37 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] u-boot: Enable devupstream
Date: Thu,  2 May 2024 11:57:21 +0100
Message-Id: <20240502105721.775868-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 10:57:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198911

To enable downstream testing of the bleeding edge of U-Boot,
add devupstream to the recipe, with SRCREV set to automatically
track the latest revision.

Signed-off-by: Peter Hoyes <peter.hoyes@arm.com>
---
 meta/recipes-bsp/u-boot/u-boot_2024.04.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot_2024.04.bb b/meta/recipes-bsp=
/u-boot/u-boot_2024.04.bb
index b15bcaa818..dc2e2da8ae 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2024.04.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2024.04.bb
@@ -3,3 +3,6 @@ require u-boot.inc
=20
 DEPENDS +=3D "bc-native dtc-native python3-pyelftools-native"
=20
+BBCLASSEXTEND +=3D "devupstream:target"
+SRCREV:class-devupstream =3D "${AUTOREV}"
+PV:class-devupstream =3D "dev+git"
--=20
2.34.1


