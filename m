Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id CE2AF72C16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 16:39:32 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id k11so2823511wes.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 08:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=2FW5hwcfteMIH6dFPTPaj3uYKqFCC1/KcWpzBd4Ol6Q=;
	b=1IgbmZ/FgrHQtSI0h/uD2qclYhwp6ah5BRGMXpxYzZmalAIjEVf/XGaMcs0hGlY6VC
	KBfK3dY5FNm0oOKbQyCKXLn+ZYnZdjfTcCRUbm9AUCM/DuV5brSuZPsNcUG4/M/nP5G6
	b2JH+4J7vJ/WLcjUH1HfGrG67oHegVEEG9ob59+1l70i4orHM6FgomJqD5sEfwtxeYT4
	X4x1t8oQyYRwasKAlpJi0LugAoLIv0LrDzk9CxZOgqZkIEUDHP4/7dlZJaqv8DxD4UJE
	ZZ2IiXFN9Df5BiDj5qbidhkHBYUvndhrgvm+LY1NSiPMGeg1psqgwcuCVg6IR6IqzCgw
	W6tQ==
X-Received: by 10.180.21.206 with SMTP id x14mr69259481wie.64.1421944773342;
	Thu, 22 Jan 2015 08:39:33 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	tc2sm2856722wic.21.2015.01.22.08.39.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jan 2015 08:39:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Jan 2015 17:39:31 +0100
Message-Id: <858d207da0f112f9c5855fbc0565527558348a33.1421943849.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1421943849.git.Martin.Jansa@gmail.com>
References: <cover.1421943849.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1421943849.git.Martin.Jansa@gmail.com>
References: <cover.1421943849.git.Martin.Jansa@gmail.com>
Subject: [PATCHv4 1/4] gst-ffmpeg: add dependency on libpostproc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Jan 2015 16:39:34 -0000

* building with libav-9 fails with:
  | checking for POSTPROC... configure: error: Package requirements (libpostproc libavcodec libavutil) were not met:
  |
  | No package 'libpostproc' found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 30e5deb..7304fff 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 LICENSE_FLAGS = "commercial"
 HOMEPAGE = "http://www.gstreamer.net/"
-DEPENDS = "gstreamer gst-plugins-base zlib bzip2 yasm-native"
+DEPENDS = "gstreamer gst-plugins-base zlib bzip2 yasm-native libpostproc"
 
 inherit autotools pkgconfig
 
-- 
2.2.1


