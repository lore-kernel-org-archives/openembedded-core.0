Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8959C7EE21
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 13:10:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.49424.1683205814763199496
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 06:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEA3F2F4;
	Thu,  4 May 2023 06:10:58 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E98103F67D;
	Thu,  4 May 2023 06:10:13 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] ffmpeg: add v4l2 PACKAGECONFIG
Date: Thu,  4 May 2023 14:10:10 +0100
Message-Id: <20230504131010.2182417-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504131010.2182417-1-ross.burton@arm.com>
References: <20230504131010.2182417-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 13:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180874

From: Ross Burton <ross.burton@arm.com>

Can't be enabled by default as v4l-utils is in meta-oe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb b/meta/recipes-=
multimedia/ffmpeg/ffmpeg_6.0.bb
index 1cd98e63c37..f84d9bb6d03 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
@@ -70,6 +70,7 @@ PACKAGECONFIG[sdl2] =3D "--enable-sdl2,--disable-sdl2,v=
irtual/libsdl2"
 PACKAGECONFIG[speex] =3D "--enable-libspeex,--disable-libspeex,speex"
 PACKAGECONFIG[srt] =3D "--enable-libsrt,--disable-libsrt,srt"
 PACKAGECONFIG[theora] =3D "--enable-libtheora,--disable-libtheora,libthe=
ora libogg"
+PACKAGECONFIG[v4l2] =3D "--enable-libv4l2,--disable-libv4l2,v4l-utils"
 PACKAGECONFIG[vaapi] =3D "--enable-vaapi,--disable-vaapi,libva"
 PACKAGECONFIG[vdpau] =3D "--enable-vdpau,--disable-vdpau,libvdpau"
 PACKAGECONFIG[vpx] =3D "--enable-libvpx,--disable-libvpx,libvpx"
--=20
2.34.1


