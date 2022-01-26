Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE24C63684
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 10:28:40 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.10916.1643192918301018161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 02:28:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=gSSNbj6c;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 87768801CF;
	Wed, 26 Jan 2022 11:28:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643192916;
	bh=dbYiiu49dA50KRv+vBC8/2fj+476tio/v2ed8yRKpAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gSSNbj6c/tvxN1Kpm8n5zHLELFwPxQ6wDbDxzRlrSHVKtrF08Gc4Av1J+/8nRkSN9
	 jgyg4Wj43rpQPmgN+ANd3agq/0w29ab7Cq/vjamU602EE0PBDgerYgImW7hnazHYkA
	 jx88DhgqmuPRBeeJZcI8En0ojy0clZyhVrImFNBgMHUUZNY4Ye4z4PIS5h5m8quOPp
	 tM8XDgh4tpmlpByeNKTTkkKsY/VKyBpQ/FTSBgZ0fvb5NAe2sVVKvdoeb4aF+7vfAJ
	 qjW6QafpTje3mBB9/OlhT92EvzSMfggIyRush9awjzg1vrkADT55NU9I5iAd782wrN
	 b96sMpaT5GlrA==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Claudius Heine <ch@denx.de>
Subject: [OE-core][RFC PATCH 05/12] gstreamer1.0-plugins-ugly: 1.18.5 ->
 1.20.0
Date: Wed, 26 Jan 2022 11:28:07 +0100
Message-Id: <20220126102814.4173943-6-ch@denx.de>
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
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 10:28:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160970

Feature `gpl` was added, since it is required to be enabled for gpl
licensed codecs.

Signed-off-by: Claudius Heine <ch@denx.de>
---
 ...y_1.18.5.bb =3D> gstreamer1.0-plugins-ugly_1.20.0.bb} | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.18=
.5.bb =3D> gstreamer1.0-plugins-ugly_1.20.0.bb} (82%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_=
1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1=
.20.0.bb
similarity index 82%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1=
.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2=
0.0.bb
index 9777aaee19..c3b2066ca3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.5.=
bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.0.=
bb
@@ -10,12 +10,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d=
9b6cdffcea4f398e37343 \
 LICENSE =3D "GPLv2+ & LGPLv2.1+ & LGPLv2+"
 LICENSE_FLAGS =3D "commercial"
=20
-SRC_URI =3D " \
-            https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-p=
lugins-ugly-${PV}.tar.xz \
-            "
-SRC_URI[sha256sum] =3D "df32803e98f8a9979373fa2ca7e05e62f977b1097576d3a8=
0619d9f5c69f66d9"
+require gstreamer1.0-source.inc
=20
-S =3D "${WORKDIR}/gst-plugins-ugly-${PV}"
+S =3D "${SRC_BASE}/subprojects/gst-plugins-ugly"
=20
 DEPENDS +=3D "gstreamer1.0-plugins-base"
=20
@@ -23,7 +20,7 @@ GST_PLUGIN_SET_HAS_EXAMPLES =3D "0"
=20
 PACKAGECONFIG ??=3D " \
     ${GSTREAMER_ORC} \
-    a52dec mpeg2dec \
+    a52dec mpeg2dec gpl \
 "
=20
 PACKAGECONFIG[a52dec]   =3D "-Da52dec=3Denabled,-Da52dec=3Ddisabled,liba=
52"
@@ -33,6 +30,7 @@ PACKAGECONFIG[cdio]     =3D "-Dcdio=3Denabled,-Dcdio=3D=
disabled,libcdio"
 PACKAGECONFIG[dvdread]  =3D "-Ddvdread=3Denabled,-Ddvdread=3Ddisabled,li=
bdvdread"
 PACKAGECONFIG[mpeg2dec] =3D "-Dmpeg2dec=3Denabled,-Dmpeg2dec=3Ddisabled,=
mpeg2dec"
 PACKAGECONFIG[x264]     =3D "-Dx264=3Denabled,-Dx264=3Ddisabled,x264"
+PACKAGECONFIG[gpl]      =3D "-Dgpl=3Denabled,-Dgpl=3Ddisabled"
=20
 EXTRA_OEMESON +=3D " \
     -Ddoc=3Ddisabled \
--=20
2.34.1


