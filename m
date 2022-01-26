Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16AA0C63684
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 10:28:42 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.10706.1643192921402734740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 02:28:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=PV35C19I;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id BD480801CF;
	Wed, 26 Jan 2022 11:28:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643192919;
	bh=TM+S8qfYWCGHVyf8WbSq1woaDjBhFt8hNIENMxd9eLY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PV35C19IeIKaLTAjNwabuEUHgy9AiBxGyAvkUZ4Smt6BG51rSw7ubGBrRAunGnDij
	 s/l9f+5zpUnNgtdHj/GTS4KpixM8RCpgfRbg+4AycaOtKVlerzUCgYzefRTJUbLkZ7
	 SC1fygCVjX+igmjgHUljXg1LOaxCO6WYE3jqhjyw74lcbYXJhspcX5JK7JW8GMmv22
	 4bTdxCwgvLnWdI8APrh42/Uf4D0v849NCbJfvcxGlc3MIgh4eZfGtDVf00SHnmzhhj
	 7b+pEE+ZIr0PHmkWhfnH0EwXeK3LrfIPHUXOUssQHZN14fNb8jiCXpXjQ21Ndeaxbi
	 zn1p8kVvcHyBw==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Claudius Heine <ch@denx.de>
Subject: [OE-core][RFC PATCH 08/12] gstreamer1.0-omx: 1.18.5 -> 1.20.0
Date: Wed, 26 Jan 2022 11:28:10 +0100
Message-Id: <20220126102814.4173943-9-ch@denx.de>
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
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 10:28:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160973

Signed-off-by: Claudius Heine <ch@denx.de>
---
 ...streamer1.0-omx_1.18.5.bb =3D> gstreamer1.0-omx_1.20.0.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.18.5.bb =3D=
> gstreamer1.0-omx_1.20.0.bb} (89%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb=
 b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb
index b2c1eb3ea0..1ff5bf6f74 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.0.bb
@@ -8,11 +8,9 @@ LICENSE_FLAGS =3D "commercial"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c \
                     file://omx/gstomx.h;beginline=3D1;endline=3D21;md5=3D=
5c8e1fca32704488e76d2ba9ddfa935f"
=20
-SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}=
.tar.xz"
+require gstreamer1.0-source.inc
=20
-SRC_URI[sha256sum] =3D "2cd457c1e8deb1a9b39608048fb36a44f6c9a864a6b6115b=
1453a32e7be93b42"
-
-S =3D "${WORKDIR}/gst-omx-${PV}"
+S =3D "${SRC_BASE}/subprojects/gst-omx"
=20
 DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins=
-bad virtual/libomxil"
=20
--=20
2.34.1


