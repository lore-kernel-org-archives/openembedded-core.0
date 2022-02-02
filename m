Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBEDC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 13:43:13 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.64151.1643809392457568134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 05:43:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=JpA8hPiU;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id CFAC7838C3;
	Wed,  2 Feb 2022 14:43:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643809380;
	bh=CKUokWTIzDG2filvpGGYhgYew3Q/+xsCPZKrtWxhUdI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JpA8hPiU8OEAu74H8Cfnv/F6frNyfvoL6i9evrFvLxoMU45ANYOLhyigyd2C3ygNF
	 raYSotDu536Z2vhmbSZqcDBNcOhDWmGQaKVJtb5xxaNtU0bZtiYwndb3xHsmxS0CNc
	 b1rxHmi14FyFa6OBVywgH/lMUapvsz6CR6c4aP/sCQgdGk+FwrErD58XV/fgDl232Z
	 u2qq4P+YLikZ1hsjm6zTaq398BCxHzMvlI9dCz1AfBJ1TKh8ibeEUJR+g7mSLm2MUp
	 Az5N7ooTu66/u0gFJMgGsxgOsqhXWm2G7emg4loDMpcuXtrp6u0BIMf//UhK2bKCm0
	 ZZ3SpeIEPxydg==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH 05/12] gstreamer1.0-plugins-ugly: 1.18.5 -> 1.19.90
Date: Wed,  2 Feb 2022 14:42:26 +0100
Message-Id: <20220202134233.2091916-6-ch@denx.de>
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
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 13:43:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161206

Feature `gpl` was added, which allows building gpl licensed codecs.

Signed-off-by: Claudius Heine <ch@denx.de>
---
 ...s-ugly_1.18.5.bb =3D> gstreamer1.0-plugins-ugly_1.19.90.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.18=
.5.bb =3D> gstreamer1.0-plugins-ugly_1.19.90.bb} (89%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_=
1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1=
.19.90.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1=
.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.1=
9.90.bb
index 9777aaee19..53d8d0ed07 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.5.=
bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.19.90=
.bb
@@ -13,7 +13,7 @@ LICENSE_FLAGS =3D "commercial"
 SRC_URI =3D " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-p=
lugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] =3D "df32803e98f8a9979373fa2ca7e05e62f977b1097576d3a8=
0619d9f5c69f66d9"
+SRC_URI[sha256sum] =3D "5242a42c3fad209030bd2e8630b08ae93821384c22789657=
64a039d31ab2a246"
=20
 S =3D "${WORKDIR}/gst-plugins-ugly-${PV}"
=20
@@ -23,7 +23,7 @@ GST_PLUGIN_SET_HAS_EXAMPLES =3D "0"
=20
 PACKAGECONFIG ??=3D " \
     ${GSTREAMER_ORC} \
-    a52dec mpeg2dec \
+    a52dec mpeg2dec gpl \
 "
=20
 PACKAGECONFIG[a52dec]   =3D "-Da52dec=3Denabled,-Da52dec=3Ddisabled,liba=
52"
@@ -33,6 +33,7 @@ PACKAGECONFIG[cdio]     =3D "-Dcdio=3Denabled,-Dcdio=3D=
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


