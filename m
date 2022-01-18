Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A43C433EF
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 18:50:56 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.1213.1642531853807732432
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 10:50:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=WBLEZYMw;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9A29D8309D;
	Tue, 18 Jan 2022 19:50:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1642531850;
	bh=KqwTA7N0xzO5ISyeczteYVh6XG3gWRRtw+luzg9AQa4=;
	h=From:To:Cc:Subject:Date:From;
	b=WBLEZYMwm8zcY6PcC0XN/l8OpgYVrHhUvx1TRMDM48awuhKbJnhdMhvr0vtUpAwGk
	 4yduJXk7zd7wsHqNbIogWb6TQKQpe90drLeh5PFr/01U57NE5IyEb3yLuYxcQXEaY3
	 iwd+/MjtUSBoSCDu2y7rebua1ZVEY5nU1XkkXmTFeTQGIuXliNpiGsHoOKYtunjRPd
	 mCnVHQIs/9Lxb8xr+PEKmgq3mb5ChpjBdsEoBwgSYgKVMDK9DzRGvQjSi0CR8sXCGE
	 6aGGpIGVTdPGMSeF6eNY+Hs4bdrwdd9PYyuCtRiW1gHfEaNvlBdiYCd57xtLezfME1
	 WCF29QwAo6sLQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexander Kanavin <alex@linutronix.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] ffmpeg: Update from 4.4.1 to 5.0
Date: Tue, 18 Jan 2022 19:50:43 +0100
Message-Id: <20220118185043.1778569-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jan 2022 18:50:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160676

Update ffmpeg to 5.0 , release notes and changelog below:
https://git.ffmpeg.org/gitweb/ffmpeg.git/blob/refs/heads/release/5.0:/REL=
EASE_NOTES
https://git.ffmpeg.org/gitweb/ffmpeg.git/shortlog/n5.0

The avresample has been removed before 5.0 release in ffmpeg commit
420cedd497 ("libavresample: Remove deprecated library")

The ffmpeg 5.0 might be an LTS release, see:
http://www.jbkempf.com/blog/post/2022/FFmpeg-5.0

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alex@linutronix.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ffmpeg/{ffmpeg_4.4.1.bb =3D> ffmpeg_5.0.bb}            | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.4.1.bb =3D> ffmpeg_5.0.b=
b} (95%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_5.0.bb
similarity index 95%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
index 3ba07c31d6..4ba5ff4537 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
@@ -11,7 +11,6 @@ LICENSE:libavcodec =3D "${@bb.utils.contains('PACKAGECO=
NFIG', 'gpl', 'GPLv2+', 'LG
 LICENSE:libavdevice =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'G=
PLv2+', 'LGPLv2.1+', d)}"
 LICENSE:libavfilter =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'G=
PLv2+', 'LGPLv2.1+', d)}"
 LICENSE:libavformat =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'G=
PLv2+', 'LGPLv2.1+', d)}"
-LICENSE:libavresample =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl', =
'GPLv2+', 'LGPLv2.1+', d)}"
 LICENSE:libavutil =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPL=
v2+', 'LGPLv2.1+', d)}"
 LICENSE:libpostproc =3D "GPLv2+"
 LICENSE:libswresample =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl', =
'GPLv2+', 'LGPLv2.1+', d)}"
@@ -26,7 +25,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.GPLv2;md5=3Db234ee=
4d69f5fce4486a80fdaf4a4263 \
 SRC_URI =3D "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://0001-libavutil-include-assembly-with-full-path-from-so=
urc.patch \
            "
-SRC_URI[sha256sum] =3D "eadbad9e9ab30b25f5520fbfde99fae4a92a1ae3c0257a8d=
68569a4651e30e02"
+SRC_URI[sha256sum] =3D "51e919f7d205062c0fd4fae6243a84850391115104ccf1ef=
c451733bc0ac7298"
=20
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/s=
how_bug.cgi?id=3D7717
 ARM_INSTRUCTION_SET:armv4 =3D "arm"
@@ -41,7 +40,7 @@ DEPENDS =3D "nasm-native"
=20
 inherit autotools pkgconfig
=20
-PACKAGECONFIG ??=3D "avdevice avfilter avcodec avformat swresample swsca=
le postproc avresample \
+PACKAGECONFIG ??=3D "avdevice avfilter avcodec avformat swresample swsca=
le postproc \
                    alsa bzlib lzma pic pthreads shared theora zlib \
                    ${@bb.utils.contains('AVAILTUNES', 'mips32r2', 'mips3=
2r2', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xv xc=
b', '', d)}"
@@ -54,7 +53,6 @@ PACKAGECONFIG[avformat] =3D "--enable-avformat,--disabl=
e-avformat"
 PACKAGECONFIG[swresample] =3D "--enable-swresample,--disable-swresample"
 PACKAGECONFIG[swscale] =3D "--enable-swscale,--disable-swscale"
 PACKAGECONFIG[postproc] =3D "--enable-postproc,--disable-postproc"
-PACKAGECONFIG[avresample] =3D "--enable-avresample,--disable-avresample"
=20
 # features to support
 PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib"
@@ -153,7 +151,6 @@ PACKAGES =3D+ "libavcodec \
              libavdevice \
              libavfilter \
              libavformat \
-             libavresample \
              libavutil \
              libpostproc \
              libswresample \
@@ -163,7 +160,6 @@ FILES:libavcodec =3D "${libdir}/libavcodec${SOLIBS}"
 FILES:libavdevice =3D "${libdir}/libavdevice${SOLIBS}"
 FILES:libavfilter =3D "${libdir}/libavfilter${SOLIBS}"
 FILES:libavformat =3D "${libdir}/libavformat${SOLIBS}"
-FILES:libavresample =3D "${libdir}/libavresample${SOLIBS}"
 FILES:libavutil =3D "${libdir}/libavutil${SOLIBS}"
 FILES:libpostproc =3D "${libdir}/libpostproc${SOLIBS}"
 FILES:libswresample =3D "${libdir}/libswresample${SOLIBS}"
@@ -175,7 +171,6 @@ INSANE_SKIP:${MLPREFIX}libavdevice =3D "textrel"
 INSANE_SKIP:${MLPREFIX}libavfilter =3D "textrel"
 INSANE_SKIP:${MLPREFIX}libavformat =3D "textrel"
 INSANE_SKIP:${MLPREFIX}libavutil =3D "textrel"
-INSANE_SKIP:${MLPREFIX}libavresample =3D "textrel"
 INSANE_SKIP:${MLPREFIX}libswscale =3D "textrel"
 INSANE_SKIP:${MLPREFIX}libswresample =3D "textrel"
 INSANE_SKIP:${MLPREFIX}libpostproc =3D "textrel"
--=20
2.34.1


