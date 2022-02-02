Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D96C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 13:43:07 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.64503.1643809385558307084
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 05:43:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=SrppUOlp;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A0FB9838EC;
	Wed,  2 Feb 2022 14:43:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643809383;
	bh=MTQEnIkw+ecqXi846/88vMi5uWesYsNtI0zDd/MaQmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SrppUOlpLNJcop6iLrCiD0HQ1upny+D9ZiGs2Ekjp3lk/n+WYmZd2NH+/Vm+QNrgz
	 q5S/XOHeUkzYMsGJN2ojq9tyqwKN8iFJ7I+51MnoUZPnHyJ8TRoNeGeDIXnX+gJttE
	 x6VIPBotRFy6322f8nE3RAgVTxJyp+bGFpDHZolcXwWvPHeIxfCoL7j0XJRemMdLvM
	 ER3tYumG8d74KOrx8TIGb/s+IZ57zKfz1CItlXoYqmjSt2xMvR76QZMsQOOPBdR7V+
	 8O9F6j42nSJofFKnFBsHDuuY/SPHZxQ8/cfjjNwEVSue8L4WCqkZcxUfIDKkaJr23K
	 b66TmHiNjIxLA==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH 10/12] gstreamer1.0-rtsp-server: 1.18.5 -> 1.19.90
Date: Wed,  2 Feb 2022 14:42:31 +0100
Message-Id: <20220202134233.2091916-11-ch@denx.de>
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
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 13:43:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161203

Signed-off-by: Claudius Heine <ch@denx.de>
---
 ...p-server_1.18.5.bb =3D> gstreamer1.0-rtsp-server_1.19.90.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.18.=
5.bb =3D> gstreamer1.0-rtsp-server_1.19.90.bb} (82%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1=
.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.1=
9.90.bb
similarity index 82%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.=
18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.19=
.90.bb
index 50426ad46d..1b877edd6d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.5.b=
b
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.19.90.=
bb
@@ -2,7 +2,7 @@ SUMMARY =3D "A library on top of GStreamer for building a=
n RTSP server"
 HOMEPAGE =3D "http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
 SECTION =3D "multimedia"
 LICENSE =3D "LGPLv2"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6762ed442b3822387a51c92d928ea=
d0d"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D69333daa044cb77e486cc36129f7a=
770"
=20
 DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base"
=20
@@ -10,7 +10,7 @@ PNREAL =3D "gst-rtsp-server"
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-$=
{PV}.tar.xz"
=20
-SRC_URI[sha256sum] =3D "04d63bf48816c6f41c73f6de0f912a7cef0aab39c44162a7=
bcece1923dfc9d1f"
+SRC_URI[sha256sum] =3D "eb610cad65101c1df68ec8771a60ff3a3ba0d00a7f81b4b0=
048d7f49dd02d06c"
=20
 S =3D "${WORKDIR}/${PNREAL}-${PV}"
=20
--=20
2.34.1


