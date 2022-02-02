Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F101C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 13:43:11 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.63777.1643809389832643999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 05:43:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=Mn7hnTj+;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 1AF48838E4;
	Wed,  2 Feb 2022 14:43:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643809383;
	bh=wtmLQaDaDvRucfNWSuWDvy3sigUKPqcYZuPtALZ4u2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mn7hnTj+LMsiMUWrJ8iv/gat+vFNNnOadtYtaL2+q8Sc+j8fV3xTMOrdWvqdFvAy7
	 6fGRNDeUg4xprqRJTfGTlBJM8vzp5TG3getWvOxyspBSLxAkj8A6y1/AOOpSRfqLVd
	 HobI/hGGoxTO9CkKHJBObeP/9wteYsefaF73RpFo3SYFr86zZ0dfUQzEnz0ii6q5Wu
	 GtV0Kv1JpMXYnjOUz4elXxX4UZbGH17TZSNLilOL23mdFpuAOkEDtT6bDSqPWGqrie
	 YFNyYx4QjID7ayyBxXQUrXfyt5v4DjQU/0Gvf3MiPBZzof+zWvbwx4GmX+++5Bqkhs
	 D3CGN45PQYUDw==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH 09/12] gstreamer1.0-vaapi: 1.18.5 -> 1.19.90
Date: Wed,  2 Feb 2022 14:42:30 +0100
Message-Id: <20220202134233.2091916-10-ch@denx.de>
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
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 13:43:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161205

Signed-off-by: Claudius Heine <ch@denx.de>
---
 ...treamer1.0-vaapi_1.18.5.bb =3D> gstreamer1.0-vaapi_1.19.90.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.18.5.bb =3D=
> gstreamer1.0-vaapi_1.19.90.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.5.=
bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.19.90.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.5.b=
b
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.19.90.bb
index 9a68a3fadf..aa3509c7bb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.19.90.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D4fbd6538=
0cdd255951079008b364516c"
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-$=
{PV}.tar.xz"
=20
-SRC_URI[sha256sum] =3D "4a460fb95559f41444eb24864ad2d9e37922b6eea9415103=
10319fc3e0ba727b"
+SRC_URI[sha256sum] =3D "437f614d6fc8904f97feb6a297e42f09d9cd9c6c05f1ebc9=
6a95f1c1b89f2f69"
=20
 S =3D "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS =3D "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-p=
lugins-bad"
--=20
2.34.1


