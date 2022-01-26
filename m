Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172F2C2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 10:28:45 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.10918.1643192923520431803
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 02:28:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=T9MHLdBF;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E0B6983381;
	Wed, 26 Jan 2022 11:28:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643192922;
	bh=EGWKaQ5VJQroJH50SRKtUcZzQ1t1gB4Ll/vc23TIHaI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T9MHLdBFpvW10LSevasJcXE2sgEVvsxrdUuOOD7kAop2/ORfq8BkO+Y4O89J9ic+y
	 /n+sOjZ8Cjw63+ysX2FZs4KyDoji/XfPGbKy1Mdq2SYztM+1lL9ewMKFm+Kq0d95Fn
	 k36Gok6FBndoV8ROFM4eyYZZGuRDdzY8Fh7svXTmCBCfdnJC3WuSAPSbXBLWbm1k3b
	 KCTBEGvhlgn63mM06YIYxhRcFPg5Rj5DIzsvSAcsgL1wRj6qax7oWaN0jw9sF6J2Xe
	 jNUwdgJhnQQVIpiWgoziE/Sl4JXQvdrCdEUOGLCCDiET5Cde8NbfpahACyJPnVjE5l
	 4W/YWO0V0bVTA==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Claudius Heine <ch@denx.de>
Subject: [OE-core][RFC PATCH 10/12] gstreamer1.0-rtsp-server: 1.18.5 -> 1.20.0
Date: Wed, 26 Jan 2022 11:28:12 +0100
Message-Id: <20220126102814.4173943-11-ch@denx.de>
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
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 10:28:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160975

Signed-off-by: Claudius Heine <ch@denx.de>
---
 ...erver_1.18.5.bb =3D> gstreamer1.0-rtsp-server_1.20.0.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.18.=
5.bb =3D> gstreamer1.0-rtsp-server_1.20.0.bb} (70%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1=
.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.2=
0.0.bb
similarity index 70%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.=
18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20=
.0.bb
index 50426ad46d..a8cc8f0a09 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.5.b=
b
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.0.b=
b
@@ -2,17 +2,15 @@ SUMMARY =3D "A library on top of GStreamer for building=
 an RTSP server"
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
 PNREAL =3D "gst-rtsp-server"
=20
-SRC_URI =3D "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-$=
{PV}.tar.xz"
+require gstreamer1.0-source.inc
=20
-SRC_URI[sha256sum] =3D "04d63bf48816c6f41c73f6de0f912a7cef0aab39c44162a7=
bcece1923dfc9d1f"
-
-S =3D "${WORKDIR}/${PNREAL}-${PV}"
+S =3D "${SRC_BASE}/subprojects/gst-rtsp-server"
=20
 inherit meson pkgconfig upstream-version-is-even gobject-introspection
=20
--=20
2.34.1


