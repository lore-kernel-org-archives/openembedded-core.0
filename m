Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404EDC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 13:43:17 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.64153.1643809396420853313
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 05:43:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=NMdipUfh;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B0D89838F8;
	Wed,  2 Feb 2022 14:43:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643809389;
	bh=macFAv+UYk0oEEJC/W6NUKAfy2Xhr8m4j97X76j4RXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NMdipUfhboVGhCJt05dMLUMe/4df8BhZLti3+wjZBjhWNGxJ6dAH3CnT+X1AY05so
	 eF0EYOjpLiuwn6x5kGN8KQ1y0Rbhr5nyXbOfs2A0aa2uGJbxUt7Kzoz2sA5dbaJOt4
	 4PUlbHvkb1Snt8svH9nR+DAS3KYSPvwmt0OL5ts34RF7ctKkgvLKK9hdXdnLoV9gin
	 zt0OcjWGQxPcIbPNp2etWZ6iRw5ihEl87ekhu+zQ5y61G1xi1rZUFAr3VxhYN7VqYl
	 B5rTvfvYm7FyCzjVbarKVRokN1AesrlHkoAY6YU7LUMZeYAY32J0mU03f6ESBsd8de
	 YHIWyUum2/fRw==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH 12/12] gst-devtools: 1.18.5 -> 1.19.90
Date: Wed,  2 Feb 2022 14:42:33 +0100
Message-Id: <20220202134233.2091916-13-ch@denx.de>
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
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 13:43:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161208

Signed-off-by: Claudius Heine <ch@denx.de>
---
 .../{gst-devtools_1.18.5.bb =3D> gst-devtools_1.19.90.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.18.5.bb =3D> gs=
t-devtools_1.19.90.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.5.bb b/m=
eta/recipes-multimedia/gstreamer/gst-devtools_1.19.90.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.19.90.bb
index 1b46b89cb9..fc3ecd46a1 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.19.90.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-=
devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
=20
-SRC_URI[sha256sum] =3D "fecffc86447daf5c2a06843c757a991d745caa2069446a0d=
746e99b13f7cb079"
+SRC_URI[sha256sum] =3D "a51061e4a799a24dcc6ccea5350ab1366fcae53331f8067b=
d6f52d50c6d822f3"
=20
 DEPENDS =3D "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.=
0-plugins-base"
 RRECOMMENDS:${PN} =3D "git"
--=20
2.34.1


