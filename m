Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9DEC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 13:43:05 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.64350.1643809383678384416
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 05:43:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=iswreg4b;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0BD96838C9;
	Wed,  2 Feb 2022 14:43:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643809382;
	bh=2pIEaI1Y3N2CA+zmh/6TU2d3KRKBQuF+UiH5JPlF+Yw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iswreg4bbMRbVRY++2I+Hioe6IvHqMfgx2SD/8PaP/BIMU3swpFJJxMD7PY1YUKuv
	 xWQ/LgtfRXC2KqmTy8/j1uuL5ZE+S1QCo2f3XYJQW+wPj6AydI89smBqzf6U94piWD
	 jniI37S+U5UmirGdRcwwC886ywaRJAD/D3q8j72T6KT+L1ewuRmxS8XdplJ3DRBoWy
	 0VE7jdwdfeiwLX//BEW4tF7rMLBL4ts7HgHjwWShF0A4em02NTKY+RwBuKDx6+T7AI
	 SJVhb+kcRAAOBm5hL0W1NbGudV+I7N9XSeJ+D43Ri0YczAG+I5PG5b/fyJBmRSCnLO
	 2THeuLH9WBDUw==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH 07/12] gstreamer1.0-python: 1.18.5 -> 1.19.90
Date: Wed,  2 Feb 2022 14:42:28 +0100
Message-Id: <20220202134233.2091916-8-ch@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220202134233.2091916-1-ch@denx.de>
References: <20220202134233.2091916-1-ch@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 13:43:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161202

Signed-off-by: Claudius Heine <ch@denx.de>
---
 ...eamer1.0-python_1.18.5.bb =3D> gstreamer1.0-python_1.19.90.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.18.5.bb =
=3D> gstreamer1.0-python_1.19.90.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5=
.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.19.90.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.=
bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.19.90.b=
b
index 1dd7d0d09a..448bfa8bea 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.19.90.bb
@@ -8,7 +8,7 @@ LICENSE =3D "LGPLv2.1"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc34deae4e395ca07e725ab0076a5f=
740"
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "533685871305959d6db89507f3b3aa6c765c2f2b0dacdc32=
c5a6543e72e5bc52"
+SRC_URI[sha256sum] =3D "5945f2295318e76e9102a77efabccb440e820c5de83a094e=
2dc5ad0e92d2d78d"
=20
 DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} +=3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pygo=
bject"
--=20
2.34.1


