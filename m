Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F050C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 13:43:07 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.64353.1643809385791178886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 05:43:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=cXkXrF0Q;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 384C7838D2;
	Wed,  2 Feb 2022 14:43:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643809384;
	bh=L2rB61dktqkPWgtO7MVtsshf34hDYITuoV32GVdxkO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cXkXrF0QqhGphn7s2ipCirZdeO23dVDwp29Hlj2WoXV8vItlToLT4iZmuTuQaOPxv
	 9sKAQbYbrGqKi9uTqVz05axLmY7tdv4+YCzay9+ywnB/9UhIda62npaflVa7AbJqSx
	 Dt2GLerhXyeI9P+Wqpzij2Lqe1t+q/v6BF7r/7jauBGHYDqbKGzpmeHYu5psMLIodG
	 Mpb6hkrk8vzWLAqqHq5a6KpgdySvoqIpw87yk5yfsgg2WBXEeQRmX8zMl+JhwiEbaV
	 CbDNL7h54PMZc6JZp7QxBKdcOwEI2B+oZy2fmuwJM0l0PnCSEhhvZIlm1p6zkrzmJr
	 AosOxAlvD28cg==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH 11/12] gst-examples: 1.18.5 -> 1.19.90
Date: Wed,  2 Feb 2022 14:42:32 +0100
Message-Id: <20220202134233.2091916-12-ch@denx.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/161204

Signed-off-by: Claudius Heine <ch@denx.de>
---
 .../gst-examples/0001-Make-player-examples-installable.patch    | 2 +-
 .../{gst-examples_1.18.5.bb =3D> gst-examples_1.19.90.bb}         | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.5.bb =3D> gs=
t-examples_1.19.90.bb} (100%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-pla=
yer-examples-installable.patch b/meta/recipes-multimedia/gstreamer/gst-ex=
amples/0001-Make-player-examples-installable.patch
index ab93c13244..cae00045a3 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-exa=
mples-installable.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-exa=
mples-installable.patch
@@ -32,6 +32,6 @@ index f7a7419..6281130 100644
          gtk_play_resources,
         'gtk-video-renderer.h',
         'gtk-video-renderer.c'],
-+    install: true,
++      install: true,
        dependencies : [glib_dep, gobject_dep, gmodule_dep, gst_dep, gstt=
ag_dep, gstplayer_dep, gtk_dep, x11_dep])
  endif
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb b/m=
eta/recipes-multimedia/gstreamer/gst-examples_1.19.90.bb
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.19.90.bb
--=20
2.34.1


