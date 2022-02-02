Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4430DC4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 13:43:03 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.63775.1643809381316197943
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 05:43:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=K6pjcLBu;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id BE376838D8;
	Wed,  2 Feb 2022 14:42:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643809379;
	bh=fzOvSt6YVr95G5OC84liag/ME3Bxc56AkjzFf4M1REQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K6pjcLBu1VT3YjLxW1O2sd2h7OQSXxH/6IBNawhce0fhcAg2fSFcAQ08GhPeTsQvG
	 rr12lEZ1tWQtsBtvLz2JauGqUwQD2nM4ZH1iqwIC4v3v9uV9htOCuu85/wXlwbmVcV
	 jZUBvFarsQDPIMmG3MEGH+UQ4jI+qcXrVW27L3+Izq+fY56OF84lcBW8fWO1tfMyvl
	 ydPVET3g6O6ro5xicczw/5Q1Z48U2pp/UUm/cJSELdxPKHXtpl3TuMpne8KhWG/Lk1
	 MFXwS+VGQna+j2hbVDA7Ljwn73dCOSz9TZNaijmIFf4Edcma9yJxXfwoBOdZMvToDq
	 BfQ/SHBz15Zmw==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH 03/12] gstreamer1.0-plugins-good: 1.18.5 -> 1.19.90
Date: Wed,  2 Feb 2022 14:42:24 +0100
Message-Id: <20220202134233.2091916-4-ch@denx.de>
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
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 13:43:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161199

Signed-off-by: Claudius Heine <ch@denx.de>
---
 ...gins-good_1.18.5.bb =3D> gstreamer1.0-plugins-good_1.19.90.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.18=
.5.bb =3D> gstreamer1.0-plugins-good_1.19.90.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_=
1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1=
.19.90.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1=
.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.1=
9.90.bb
index ade935df9e..fbf521e4cf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.5.=
bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.19.90=
.bb
@@ -8,7 +8,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-pl=
ugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gst=
glf.patch \
            "
=20
-SRC_URI[sha256sum] =3D "3aaeeea7765fbf8801acce4a503a9b05f73f04e8a35352e9=
d00232cfd555796b"
+SRC_URI[sha256sum] =3D "76c74ad1f2b62ee751c40d7d24544c3c0c580e2b7153d852=
72bd8b9dafa1a43e"
=20
 S =3D "${WORKDIR}/gst-plugins-good-${PV}"
=20
--=20
2.34.1


