Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF82EC54E49
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 12:05:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21592.1709813129513883711
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 04:05:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 397091FB
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Mar 2024 04:06:06 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C554F3F762
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Mar 2024 04:05:28 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-firmware: set LICENSE field for -liquidui and -mellanox
Date: Thu,  7 Mar 2024 12:05:24 +0000
Message-Id: <20240307120526.774895-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240307120526.774895-1-ross.burton@arm.com>
References: <20240307120526.774895-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 12:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196787

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.b=
b b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
index b3884dd3e5a..54e0dc7dc91 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
@@ -1481,8 +1481,10 @@ RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno=
 =3D "${PN}-qcom-sc8280xp-lenovo
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute =3D "${PN}-qcom-sc82=
80xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors =3D "${PN}-qcom-sc82=
80xp-lenovo-x13s-compat"
=20
+LICENSE:${PN}-liquidui =3D "Firmware-cavium_liquidio"
 FILES:${PN}-liquidio =3D "${nonarch_base_libdir}/firmware/liquidio"
=20
+LICENSE:${PN}-mellanox =3D "WHENCE"
 FILES:${PN}-mellanox =3D "${nonarch_base_libdir}/firmware/mellanox"
=20
 LICENSE:${PN}-prestera =3D "Firmware-Marvell"
--=20
2.34.1


