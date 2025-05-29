Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF083C54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 12:42:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20097.1748522543186013303
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 05:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3521B1764
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 05:42:06 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4A1EB3F673
	for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 05:42:22 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] core-image-ptest: increase the size of the util-linux image
Date: Thu, 29 May 2025 13:42:18 +0100
Message-ID: <20250529124218.122333-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 12:42:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217412

The util-linux test suite since 2.41 needs at least 300MB of free space
for logs, and the standard image only has 250MB when it's booted.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/images/core-image-ptest.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-=
core/images/core-image-ptest.bb
index 73270d10676..017f05f81b7 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -23,6 +23,7 @@ IMAGE_ROOTFS_EXTRA_SPACE =3D "324288"
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-mdadm =3D "1524288"
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-strace =3D "1524288"
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools =3D "1524288"
+IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-util-linux =3D "1524288"
=20
 # tar-ptest in particular needs more space
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-tar =3D "1524288"
--=20
2.43.0


