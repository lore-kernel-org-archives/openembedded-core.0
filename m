Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166C1C63682
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 10:28:43 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.10917.1643192922423373721
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 02:28:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=rMTnyLL8;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id C6C1C83217;
	Wed, 26 Jan 2022 11:28:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643192920;
	bh=He+1P5D8BsNd6kGPACsC5Mr2wTReiKm4KGLkw5Mc+uo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rMTnyLL8pnidQn9GP6wg6FyDEb9lnyhAHFDka9y1pVdZZdsc6VWln2TkeyJ1Dz2AH
	 0sgx0Lb927DRmUfKVMxZVWNP+zUpQI2R3iEDVBwbdMM9729+CUlzq0pSGirBhZ/0+I
	 80EtqWiu2WRNOE4yCU4jsEmvqHbbwFQ0e/q0eM5Q4BPXmX4jhtqL67WTeakKNJR3sV
	 /7jPi3nUiBEacU0wUmKwWY7SPE4UvxNDS6xO/wcaJyie7mQ+N4ZZ2aBpeZTjrROERG
	 Lgb+fECyeIAYkYH94JZb1TsO3bU99p0oxJrIFh7CKtHFz6nn5nsU4OQFyninMZAO1t
	 n7rkZD0Xjj7yg==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Claudius Heine <ch@denx.de>
Subject: [OE-core][RFC PATCH 09/12] gstreamer1.0-vaapi: 1.18.5 -> 1.20.0
Date: Wed, 26 Jan 2022 11:28:11 +0100
Message-Id: <20220126102814.4173943-10-ch@denx.de>
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
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 10:28:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160974

Signed-off-by: Claudius Heine <ch@denx.de>
---
 ...eamer1.0-vaapi_1.18.5.bb =3D> gstreamer1.0-vaapi_1.20.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.18.5.bb =3D=
> gstreamer1.0-vaapi_1.20.0.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.5.=
bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.5.b=
b
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb
index 9a68a3fadf..49e9d93837 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb
@@ -9,11 +9,10 @@ REALPN =3D "gstreamer-vaapi"
 LICENSE =3D "LGPLv2.1+"
 LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b=
364516c"
=20
-SRC_URI =3D "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-$=
{PV}.tar.xz"
+require gstreamer1.0-source.inc
=20
-SRC_URI[sha256sum] =3D "4a460fb95559f41444eb24864ad2d9e37922b6eea9415103=
10319fc3e0ba727b"
+S =3D "${SRC_BASE}/subprojects/gstreamer-vaapi"
=20
-S =3D "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS =3D "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-p=
lugins-bad"
=20
 inherit meson pkgconfig features_check upstream-version-is-even
--=20
2.34.1


