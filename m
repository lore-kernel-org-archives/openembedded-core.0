Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FABC2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 10:28:41 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.11074.1643192920374461633
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 02:28:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=hIQ1lfTj;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9C1FF830CE;
	Wed, 26 Jan 2022 11:28:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643192918;
	bh=5tLlC+LJWNOomySa3bdMstrmGPGtSNdPDoQuakWUgAA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hIQ1lfTj3hyJzh0JeXwmSAnjSqOJafGWF/CceYQY02/1NX7uE6L9UDHnpwvWbe7wy
	 +KEaRE2RMiH5hFfixLFvu0OYe9sMjEEUQ2nnULnN6Flws0eXgZD86wEr5DSBEpXPW5
	 XDbr3Syz1oMzPKJ71gEwlUQoZMxUFfFpgmYKW3wBU9jg/jnhw6Ja2Gjppr/btoy81E
	 tBUamYFQMRi125QXodtoZEFs2PwdDN7p4lJei91squpnqyTsPhFAgOb/OuJwrr49KF
	 Xvp3eS6SoROlBqQQkSBryyHw3PhhFDJPa6pNrRLmMxDza2zTAqrIoDppHlhCDYSEGk
	 Wi0KnI6w2KrUw==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Claudius Heine <ch@denx.de>
Subject: [OE-core][RFC PATCH 07/12] gstreamer1.0-python: 1.18.5 -> 1.20.0
Date: Wed, 26 Jan 2022 11:28:09 +0100
Message-Id: <20220126102814.4173943-8-ch@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126102814.4173943-1-ch@denx.de>
References: <20220126102814.4173943-1-ch@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 10:28:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160972

Signed-off-by: Claudius Heine <ch@denx.de>
---
 ...r1.0-python_1.18.5.bb =3D> gstreamer1.0-python_1.20.0.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.18.5.bb =
=3D> gstreamer1.0-python_1.20.0.bb} (79%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5=
.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.0.bb
similarity index 79%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.=
bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.0.bb
index 1dd7d0d09a..eaba1e23bc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.20.0.bb
@@ -7,16 +7,15 @@ SECTION =3D "multimedia"
 LICENSE =3D "LGPLv2.1"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc34deae4e395ca07e725ab0076a5f=
740"
=20
-SRC_URI =3D "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "533685871305959d6db89507f3b3aa6c765c2f2b0dacdc32=
c5a6543e72e5bc52"
+require gstreamer1.0-source.inc
+
+S =3D "${SRC_BASE}/subprojects/gst-python"
=20
 DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} +=3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pygo=
bject"
=20
 PNREAL =3D "gst-python"
=20
-S =3D "${WORKDIR}/${PNREAL}-${PV}"
-
 EXTRA_OEMESON +=3D "-Dlibpython-dir=3D${libdir}"
=20
 # gobject-introspection is mandatory and cannot be configured
--=20
2.34.1


