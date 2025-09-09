Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4259FCAC587
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 14:31:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15041.1757428283995233173
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 07:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 394881424
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Sep 2025 07:31:15 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1AECF3F66E
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Sep 2025 07:31:22 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] grub2: mark CVE-2024-2312 as not applicable
Date: Tue,  9 Sep 2025 15:31:17 +0100
Message-ID: <20250909143118.3819968-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 14:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223115

This issue is specific to the peimage module that Ubuntu add, and is not
an upstream issue.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-bsp/grub/grub2.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub=
2.inc
index ffa04e415d3..e87d2691704 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -43,6 +43,7 @@ SRC_URI[sha256sum] =3D "b30919fa5be280417c17ac561bb1650=
f60cfb80cc6237fa1e2b6f56154
 CVE_STATUS[CVE-2019-14865] =3D "not-applicable-platform: applies only to=
 RHEL"
 CVE_STATUS[CVE-2023-4001]  =3D "not-applicable-platform: Applies only to=
 RHEL/Fedora"
 CVE_STATUS[CVE-2024-1048]  =3D "not-applicable-platform: Applies only to=
 RHEL/Fedora"
+CVE_STATUS[CVE-2024-2312]  =3D "not-applicable-platform: Applies only to=
 Ubuntu"
=20
 DEPENDS =3D "flex-native bison-native gettext-native"
=20
--=20
2.43.0


