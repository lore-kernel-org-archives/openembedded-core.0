Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3118EC27C53
	for <webhook@archiver.kernel.org>; Sun,  9 Jun 2024 21:13:47 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.5821.1717967624757256896
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jun 2024 14:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout12.t-online.de (Postfix) with SMTP id E84FC10997
	for <openembedded-core@lists.openembedded.org>; Sun,  9 Jun 2024 23:13:42 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.44.230]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sGPrC-3R33JZ0; Sun, 9 Jun 2024 23:13:42 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] gstreamer1.0-plugins-bad: drop PACKAGECONFIG for sctp and srtp
Date: Sun,  9 Jun 2024 23:14:13 +0200
Message-ID: <20240609211413.955929-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1717967622-68D8B3C7-7565D845/0/0 CLEAN NORMAL
X-TOI-MSGID: c23a67b6-28af-4a2a-9c34-b080a15f86ba
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jun 2024 21:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200465

- connect them to webrtc

This avoids:
 ../gst-plugins-bad-1.24.3/ext/sctp/meson.build:8:33: ERROR: Feature sctp=
 cannot be disabled: webrtc option is enabled
 ../gst-plugins-bad-1.24.3/ext/srtp/meson.build:10:33: ERROR: Feature srt=
p cannot be disabled: webrtc option is enabled

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb              | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1=
.24.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2=
4.3.bb
index dbd504e87d..a990faf3bb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.b=
b
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.b=
b
@@ -74,11 +74,9 @@ PACKAGECONFIG[resindvd]        =3D "-Dresindvd=3Denabl=
ed,-Dresindvd=3Ddisabled,libdvdr
 PACKAGECONFIG[rsvg]            =3D "-Drsvg=3Denabled,-Drsvg=3Ddisabled,l=
ibrsvg"
 PACKAGECONFIG[rtmp]            =3D "-Drtmp=3Denabled,-Drtmp=3Ddisabled,r=
tmpdump"
 PACKAGECONFIG[sbc]             =3D "-Dsbc=3Denabled,-Dsbc=3Ddisabled,sbc=
"
-PACKAGECONFIG[sctp]            =3D "-Dsctp=3Denabled,-Dsctp=3Ddisabled"
 PACKAGECONFIG[smoothstreaming] =3D "-Dsmoothstreaming=3Denabled,-Dsmooth=
streaming=3Ddisabled,libxml2"
 PACKAGECONFIG[sndfile]         =3D "-Dsndfile=3Denabled,-Dsndfile=3Ddisa=
bled,libsndfile1"
 PACKAGECONFIG[srt]             =3D "-Dsrt=3Denabled,-Dsrt=3Ddisabled,srt=
"
-PACKAGECONFIG[srtp]            =3D "-Dsrtp=3Denabled,-Dsrtp=3Ddisabled,l=
ibsrtp"
 PACKAGECONFIG[tinyalsa]        =3D "-Dtinyalsa=3Denabled,-Dtinyalsa=3Ddi=
sabled,tinyalsa"
 PACKAGECONFIG[ttml]            =3D "-Dttml=3Denabled,-Dttml=3Ddisabled,l=
ibxml2 pango cairo"
 PACKAGECONFIG[uvch264]         =3D "-Duvch264=3Denabled,-Duvch264=3Ddisa=
bled,libusb1 libgudev"
@@ -91,7 +89,7 @@ PACKAGECONFIG[voamrwbenc]      =3D "-Dvoamrwbenc=3Denab=
led,-Dvoamrwbenc=3Ddisabled,vo-
 PACKAGECONFIG[vulkan]          =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabl=
ed,vulkan-loader shaderc-native"
 PACKAGECONFIG[wayland]         =3D "-Dwayland=3Denabled,-Dwayland=3Ddisa=
bled,wayland-native wayland wayland-protocols libdrm"
 PACKAGECONFIG[webp]            =3D "-Dwebp=3Denabled,-Dwebp=3Ddisabled,l=
ibwebp"
-PACKAGECONFIG[webrtc]          =3D "-Dwebrtc=3Denabled,-Dwebrtc=3Ddisabl=
ed,libnice"
+PACKAGECONFIG[webrtc]          =3D "-Dwebrtc=3Denabled -Dsctp=3Denabled =
-Dsrtp=3Denabled,-Dwebrtc=3Ddisabled -Dsctp=3Ddisabled -Dsrtp=3Ddisabled,=
libnice libsrtp"
 PACKAGECONFIG[webrtcdsp]       =3D "-Dwebrtcdsp=3Denabled,-Dwebrtcdsp=3D=
disabled,webrtc-audio-processing-1"
 PACKAGECONFIG[zbar]            =3D "-Dzbar=3Denabled,-Dzbar=3Ddisabled,z=
bar"
 PACKAGECONFIG[x11]             =3D "-Dx11=3Denabled,-Dx11=3Ddisabled,lib=
xcb libxkbcommon"
--=20
2.45.1


