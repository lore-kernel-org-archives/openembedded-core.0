Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1685EE743C3
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 15:38:44 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.84017.1696258641440904525
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 07:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=PtFydjtT;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: festevam@denx.de)
Received: from mail-internal.denx.de (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: noc@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 1A64086DF6;
	Mon,  2 Oct 2023 16:57:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1696258639;
	bh=OgQteGHNtwcFO4VWPGXDv3AeSUjF3wTnVMsN6jdbpLg=;
	h=From:To:Cc:Subject:Date:From;
	b=PtFydjtTN7DQztrT6Leka2UVzIS6qIndmQ/xP1y3tLquReCm1sRVoCSOsUWE2Jwx2
	 gVDbgGA2kfc71vKj1Xg3T/drL2WA+e/4i9Cy9Gutz/0CLWLD86tPjLpEpV//jnqGcn
	 Sd/pEsxG3Hwh+Z/GCkVn9eNdwaKnYm1V160rEc8yhUx3Bx2fO8AJp2zmV1g0IcEN0T
	 kt11Oz50Uxxme8Tnev8jgrzElBxORaV7aHJrE1SAZYFZTOCl/Xlgvgs1Rd8yYv88eM
	 ihJF/Ke4bn2KWbXDaF6qZcuX2Df4jlhwwD7Wn1GyWxchqiX8SaWYePuQ/FYGiJfk5o
	 VCWHFFzyYkuVw==
Received: from pollux.denx.de (pollux [192.168.1.1])
	by mail-internal.denx.de (Postfix) with ESMTPS id 5AD02180A15;
	Mon,  2 Oct 2023 16:57:16 +0200 (CEST)
Received: by pollux.denx.de (Postfix, from userid 520)
	id 219B21A8BFA; Mon,  2 Oct 2023 16:57:16 +0200 (CEST)
From: "Fabio Estevam" <festevam@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: festevam@gmail.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] u-boot: Upgrade to 2023.10
Date: Mon,  2 Oct 2023 16:57:11 +0200
Message-Id: <20231002145711.1145814-1-festevam@denx.de>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 15:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188615

Upgrade to U-Boot 2023.10.

The U-Boot 2023.10 tag is in the master branch, so switch the branch
back to master.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                     | 4 ++--
 .../{u-boot-tools_2023.07.02.bb =3D> u-boot-tools_2023.10.bb}   | 0
 .../u-boot/{u-boot_2023.07.02.bb =3D> u-boot_2023.10.bb}        | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2023.07.02.bb =3D> u-boot-t=
ools_2023.10.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2023.07.02.bb =3D> u-boot_2023.10=
.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp=
/u-boot/u-boot-common.inc
index 111914827d..ab1a7c2a67 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,9 +12,9 @@ PE =3D "1"
=20
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV =3D "83cdab8b2c6ea0fc0860f8444d083353b47f1d5c"
+SRCREV =3D "4459ed60cb1e0562bc5b40405e2b4b9bbf766d57"
=20
-SRC_URI =3D "git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;bra=
nch=3Du-boot-2023.07.y"
+SRC_URI =3D "git://source.denx.de/u-boot/u-boot.git;protocol=3Dhttps;bra=
nch=3Dmaster"
=20
 S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2023.07.02.bb b/meta/re=
cipes-bsp/u-boot/u-boot-tools_2023.10.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2023.07.02.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2023.10.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2023.07.02.bb b/meta/recipes-=
bsp/u-boot/u-boot_2023.10.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2023.07.02.bb
rename to meta/recipes-bsp/u-boot/u-boot_2023.10.bb
--=20
2.37.3


