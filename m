Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D42C63700
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:14 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.web11.30760.1650899285405738482
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org
 header.s=mail20150812 header.b=Ce5XKYtC;
 spf=pass (domain: mailbox.org, ip: 80.241.56.171,
 mailfrom: crg7475@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:3:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Kn7g62dxVz9sZK
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 17:08:02 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1650899282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+gLI4pSQeON8cPqra5cXsYHRS004XYqBexDk2V0OlYI=;
	b=Ce5XKYtC4Ut4sloLes57O0/OKQxDtsUoRBB6K7oZzBDmthCTFKSbGNWq7m2XuNM69y0Zyj
	pgy9F4qoPdEnDHx2fJQGC/uzhT32SAGxY7N4dBdaZ8988wudQCWwq9W4DbqK9wdBH1cov1
	jP2DFUNpRM5O3PmkTY9mmDVRnDxNCDozUP/EzhcF0AS5UCVhCWH/VcAktk0M5l8mmZbAJT
	G0t1qDBd6q15I0mdtTz5lrl9dr0gxXymlIaOKeGCB2wa2sgYRDv6WgTyoAvIynz716zyat
	DegqTUt2BEyapnJBqT+KEcpWbAWysl4NtoniEVcL9Po8A68eXht8Wb3YScogfw==
To: openembedded-core@lists.openembedded.org
Subject: [master][kirkstone][PATCH] gstreamer1.0: Minor documentation addition
Date: Mon, 25 Apr 2022 17:01:04 +0200
Message-Id: <20220425150104.1001838-2-crg7475@mailbox.org>
In-Reply-To: <20220425150104.1001838-1-crg7475@mailbox.org>
References: <20220425150104.1001838-1-crg7475@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: rtnsn8kinyqadyq5nhs363uip3w3qqdk
X-MBO-RS-ID: 47141bca881c960a978
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164826

This clears up some confusing packageconfigs.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb                | 2 ++
 .../gstreamer/gstreamer1.0-plugins-base_1.20.1.bb               | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1=
.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2=
0.1.bb
index 78e8f35025..f139281149 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.b=
b
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.b=
b
@@ -83,6 +83,8 @@ PACKAGECONFIG[srtp]            =3D "-Dsrtp=3Denabled,-D=
srtp=3Ddisabled,libsrtp"
 PACKAGECONFIG[tinyalsa]        =3D "-Dtinyalsa=3Denabled,-Dtinyalsa=3Ddi=
sabled,tinyalsa"
 PACKAGECONFIG[ttml]            =3D "-Dttml=3Denabled,-Dttml=3Ddisabled,l=
ibxml2 pango cairo"
 PACKAGECONFIG[uvch264]         =3D "-Duvch264=3Denabled,-Duvch264=3Ddisa=
bled,libusb1 libgudev"
+# this enables support for stateless V4L2 mem2mem codecs, which is a new=
er form of
+# V4L2 codec; the V4L2 code in -base supports the older stateful V4L2 me=
m2mem codecs
 PACKAGECONFIG[v4l2codecs]      =3D "-Dv4l2codecs=3Denabled,-Dv4l2codecs=3D=
disabled,libgudev"
 PACKAGECONFIG[va]              =3D "-Dva=3Denabled,-Dva=3Ddisabled,libva=
"
 PACKAGECONFIG[voaacenc]        =3D "-Dvoaacenc=3Denabled,-Dvoaacenc=3Ddi=
sabled,vo-aacenc"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_=
1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1=
.20.1.bb
index 9b9be0d326..0953261a98 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.=
bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.=
bb
@@ -46,6 +46,8 @@ PACKAGECONFIG[ogg]          =3D "-Dogg=3Denabled,-Dogg=3D=
disabled,libogg"
 PACKAGECONFIG[opus]         =3D "-Dopus=3Denabled,-Dopus=3Ddisabled,libo=
pus"
 PACKAGECONFIG[pango]        =3D "-Dpango=3Denabled,-Dpango=3Ddisabled,pa=
ngo"
 PACKAGECONFIG[png]          =3D "-Dgl-png=3Denabled,-Dgl-png=3Ddisabled,=
libpng"
+# This enables Qt5 QML examples in -base. The Qt5 GStreamer
+# qmlglsink and qmlglsrc plugins still exist in -good.
 PACKAGECONFIG[qt5]          =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,qtbase=
 qtdeclarative qtbase-native"
 PACKAGECONFIG[theora]       =3D "-Dtheora=3Denabled,-Dtheora=3Ddisabled,=
libtheora"
 PACKAGECONFIG[tremor]       =3D "-Dtremor=3Denabled,-Dtremor=3Ddisabled,=
tremor"
--=20
2.32.0


