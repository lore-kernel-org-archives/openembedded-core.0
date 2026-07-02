Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E519C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 12:56:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68472.1782996993369113444
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 05:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=EdmuiTyy;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 737941FCD
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Jul 2026 05:56:28 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 72F993F673
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Jul 2026 05:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782996992; bh=bD/gx2ZFs+o1xIbBA7BH10Wso3K8p8eDPKWX2D21qeE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EdmuiTyyNxwyQZ4GG6Se4lvepOY00necUy9GeTTHKoSM4Ip9lWMl0jsYjYB1SbzpN
	 EuqG99O1NRMvQa++1y3cGL56kdYdJ6ZbeKlqNTECFbsy0XvdZyNAS0zfvNbfTni6vI
	 E1O6v6wV/9A7B+huz7CY0kPsw14pV//sP6e67Wmw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 6/6] kea: remove obsolete staticdev packaging
Date: Thu,  2 Jul 2026 13:56:27 +0100
Message-ID: <20260702125627.977563-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702125627.977563-1-ross.burton@arm.com>
References: <20260702125627.977563-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 12:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240042

Kea doesn't build pointless static libraries for dynamically loaded
modules anymore, so remove this line.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/kea/kea_3.2.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-connectivity/kea/kea_3.2.0.bb b/meta/recipes-co=
nnectivity/kea/kea_3.2.0.bb
index 1b6693c2c80..5136e9e41ca 100644
--- a/meta/recipes-connectivity/kea/kea_3.2.0.bb
+++ b/meta/recipes-connectivity/kea/kea_3.2.0.bb
@@ -101,5 +101,4 @@ PACKAGES =3D+ "${PN}-python"
 FILES:${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}"
 RDEPENDS:${PN}-python =3D "python3"
=20
-FILES:${PN}-staticdev +=3D "${libdir}/kea/hooks/*.a ${libdir}/hooks/*.a"
 FILES:${PN} +=3D "${libdir}/hooks/*.so"
--=20
2.43.0


