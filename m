Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5CBED1D88D
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 16:11:49 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.782.1729008705691303391
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 09:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=oaASC+7C;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8C1AE883D4;
	Tue, 15 Oct 2024 18:11:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729008703;
	bh=8GH1JA+kqqmRO/TQsGCBLthrt5BkKTXljeSSCbjgqIo=;
	h=From:To:Cc:Subject:Date:From;
	b=oaASC+7CRmGyk9pIR/s8OOOExVfnpu/iwB7OunGQ268569h08RnDyfQqZj3qAw4P8
	 V+4tJ1RoEXT7QcZ9eO6EcB5M2itWdL6y2rFk7IjqjzCe+XGr+9cVB2fUhKDANxokq7
	 I8bpeYAvCGRkGgYF6sphRHu86S9dsJ3/e47rmfKKUeMY4+K1prpjF6jhWtczmBcr+J
	 7BnOUJCw6XvkJhX2PsrNP7E+8gHJiToqD1QYtCBobBG3fRxWkjlD332F01T0CbRgWo
	 95PlfzJpc36s4ETRAGF8H2kLeqbRGYt3Ax57bdSUIY5AgWRkfC3WPWfNQntNQkkzus
	 6szfvvdt9t4yg==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Fabio Estevam <festevam@denx.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] maintainers: Switch U-Boot to Fabio
Date: Tue, 15 Oct 2024 18:11:17 +0200
Message-ID: <20241015161133.11326-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 16:11:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205921

Fabio has been keeping the U-Boot recipe up to date for a long time
in a timely manner, doing a great job there, update the maintainers
file.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Fabio Estevam <festevam@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index ad2544741f..7aafa7a2d1 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -818,8 +818,8 @@ RECIPE_MAINTAINER:pn-ttf-bitstream-vera =3D "Anuj Mit=
tal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-ttyrun =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-tzcode-native =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
 RECIPE_MAINTAINER:pn-tzdata =3D "Unassigned <unassigned@yoctoproject.org=
>"
-RECIPE_MAINTAINER:pn-u-boot =3D "Marek Vasut <marek.vasut@gmail.com>"
-RECIPE_MAINTAINER:pn-u-boot-tools =3D "Marek Vasut <marek.vasut@gmail.co=
m>"
+RECIPE_MAINTAINER:pn-u-boot =3D "Fabio Estevam <festevam@denx.de>"
+RECIPE_MAINTAINER:pn-u-boot-tools =3D "Fabio Estevam <festevam@denx.de>"
 RECIPE_MAINTAINER:pn-udev-extraconf =3D "Ross Burton <ross.burton@arm.co=
m>"
 RECIPE_MAINTAINER:pn-unfs3 =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-unifdef =3D "Ross Burton <ross.burton@arm.com>"
--=20
2.45.2


