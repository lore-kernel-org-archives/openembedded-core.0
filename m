Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D015BC30653
	for <webhook@archiver.kernel.org>; Sun,  7 Jul 2024 14:29:31 +0000 (UTC)
Received: from smtp-out.freemail.hu (smtp-out.freemail.hu [46.107.16.212])
 by mx.groups.io with SMTP id smtpd.web10.58685.1720362563314777452
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jul 2024 07:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@freemail.hu header.s=20181004 header.b=q6I2/t/Q;
 spf=pass (domain: freemail.hu, ip: 46.107.16.212, mailfrom: egyszeregy@freemail.hu)
Received: from localhost.localdomain (catv-80-98-74-198.catv.fixed.vodafone.hu [80.98.74.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.freemail.hu (Postfix) with ESMTPSA id 4WH8lN4KT0z4r6;
	Sun,  7 Jul 2024 16:29:20 +0200 (CEST)
From: egyszeregy@freemail.hu
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Benjamin=20Sz=C5=91ke?= <egyszeregy@freemail.hu>
Subject: [PATCH] mc: fix source URL
Date: Sun,  7 Jul 2024 16:29:10 +0200
Message-ID: <20240707142910.1620-1-egyszeregy@freemail.hu>
X-Mailer: git-send-email 2.45.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/relaxed; t=1720362561;
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Jul 2024 14:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201625

	s=20181004; d=freemail.hu;

	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;

	l=945; bh=sdXM5VkCkcvjZkW2k82aIK37d3ju0QxOeL3JzE4SYz8=;

	b=q6I2/t/QdGJUF4mrQ+R/cZzR+//Nu4KybG0+6Egi9VHnTzwOG/Wv/R3baW2Ehmck

	SJqi1RRGBkfPpEUSQpcwlkG6aWcxBX5e+45qknvOr/M+MpSVXDNQlCT8dFT8Mj24HNr

	VAeH0h3iKd3nIP8WjBFvm4SiWbNI6eXswobgggfBFqqKsooe36BJ1Ejn+oIgWge1NHb

	jl6++2z6srBcny/P7PI60TDZU4sYPGRnFeYPOgy1IhgV8pBjFaUe/k/8mAE9gZffcAH

	hfBmaiLVqbUCq5X/38HlMj7IoyxUejP6aLnxefax0rP/18yzge90L6VAtQQpt6+bDyi

	+fM5DvHDCA==
Content-Transfer-Encoding: quoted-printable

From: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>

new URL for sources: http://ftp.midnight-commander.org/

Signed-off-by: Benjamin Sz=C5=91ke <egyszeregy@freemail.hu>
---
 meta/recipes-extended/mc/mc_4.8.31.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mc/mc_4.8.31.bb b/meta/recipes-extende=
d/mc/mc_4.8.31.bb
index 69c32887a2..5f8257f71f 100644
--- a/meta/recipes-extended/mc/mc_4.8.31.bb
+++ b/meta/recipes-extended/mc/mc_4.8.31.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "ncurses glib-2.0 util-linux file-replacement=
-native"
 RDEPENDS:${PN} =3D "ncurses-terminfo-base"
 RRECOMMENDS:${PN} =3D "ncurses-terminfo"
=20
-SRC_URI =3D "http://www.midnight-commander.org/downloads/${BPN}-${PV}.ta=
r.bz2 \
+SRC_URI =3D "http://ftp.midnight-commander.org/${BPN}-${PV}.tar.bz2 \
            file://nomandate.patch \
            "
 SRC_URI[sha256sum] =3D "f42f4114ed42f6cf9995f1d896fa6c797ccb36dac57760dd=
a8dd9f78ac462841"
--=20
2.45.2.windows.1


