Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA4CCD13D9
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 16:48:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.893.1777481311540197538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 09:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=H5fbEqIS;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73C5D1BB0
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:48:25 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 831053F62B
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777481310; bh=TTRg0UB/LKLXJx70QRK6IotZBo1JW+gVp7g3zfUUUgM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=H5fbEqISkiVVXFvTKXnVk1Rc5qHpRwPACu2J6iRWj80weBAiKRcnIZph6TFbjlw6g
	 l1JQzXZ/4Y1BPq2bTUQmsvQPyLurwo41Z98/RIJjkh9o3TjIFPc1a5bv77/BsQiXH3
	 buELV1RwJH7yxA3sHge3RrhrDGcM3eA+7sieVSwY=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/10] wpa_supplicant: recommend the wireless regulatory database
Date: Wed, 29 Apr 2026 17:48:17 +0100
Message-ID: <20260429164821.3425757-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429164821.3425757-1-ross.burton@arm.com>
References: <20260429164821.3425757-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 16:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236118

This often gets pulled into images via packagegroup-base-wifi but not
always, and the regulatory database is important to have.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11=
.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index 7c7a8bd9c13..4c94f4fe4e5 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -123,7 +123,7 @@ FILES:${PN}-dbg +=3D "${sbindir}/.debug ${libdir}/.de=
bug"
=20
 CONFFILES:${PN} +=3D "${sysconfdir}/wpa_supplicant.conf"
=20
-RRECOMMENDS:${PN} =3D "${PN}-passphrase ${PN}-cli ${PN}-plugins"
+RRECOMMENDS:${PN} =3D "${PN}-passphrase ${PN}-cli ${PN}-plugins wireless=
-regdb-static"
=20
 SYSTEMD_SERVICE:${PN} =3D "wpa_supplicant.service"
 SYSTEMD_AUTO_ENABLE =3D "disable"
--=20
2.43.0


