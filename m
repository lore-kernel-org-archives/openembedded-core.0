Return-Path: <armccurdy@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 01E707F29A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 19:24:37 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id 205so523886pfw.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 12:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MZhbdPb5/kKIVqe+oMGq0V2VhQzARe6Al5oQvfm3FcY=;
	b=ZltyrDX6FHdFwsv8aoeo+GE1ZdDjaPOUealMw56UqXkewy11XYBrein1gMiBTjoY69
	GxSOeJ6DRsoRgoIe24eBSdsOqbhmhKCge1AawGVcq3kLtUIkybMOmpE8gxzqaLRT8VPw
	K/D9AaMUcfjOxhDRSHWZyhG9afhPrucgnwcTq+0FBUmHVns50BVjT2nYPmdmPDg9VaLP
	lLSOZnqeRC2bli5Q/k0YZroCK/LHHeV9G3YExvxfuXaZvIxxEEfuP5Kf/gqi33qXLfzE
	/5WWo/2o8fJWd3PxTHiE2szA9tWv57gaO7ce2TH/ix4xNzGKWHCX2BwQUfjxpRmJXsCA
	/9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MZhbdPb5/kKIVqe+oMGq0V2VhQzARe6Al5oQvfm3FcY=;
	b=hHXRQ39+gXJHr4wda0xE5eHpKRBqZ5gnwM2VpKThAgbqDK/5lbGcXJWNA+k0IrJaEt
	BRNpD/m0rs4ep3YjoeyYZ1nK1VlMJjWf/VRIW+BEaHvaa33ya9OyC2UluXo9KLWmHTEN
	f63Qjdy0kfLPOYB0foiqglCmAT8AR8UKh5iCz3HNpWXrFrzc5zxeOX1zqeIv1CVDpVRx
	eRRJMZbhES2LYt2R2ZPJqOyH34Iori9pifx75i6AFdBVFUXIaAxaXm6hb/N7auI3N8j/
	acFcaTVFvefRzgUKHjasLsUn2eSqh71mv7+N9xpc90Sz0/aVxZem9W4mV0mpBzOSTpfH
	Nzrw==
X-Gm-Message-State: APjAAAUpV8KNVzGngSZnyp8BAeKSmkPhnt7/6QCHRFyiqj+wa1Gpjzq4
	MDWd05+Xz7zYajDGO4vpGealMXBh
X-Google-Smtp-Source: APXvYqy+5QWlYFDNSiAupihtkL+Z4uRd+cCZzT/1nlnLzi/HK1p/6bCzUNE6F2oiRtc7oRCT2/xUVg==
X-Received: by 2002:a65:6901:: with SMTP id s1mr708732pgq.338.1568661878749;
	Mon, 16 Sep 2019 12:24:38 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id d7sm5490494pfr.7.2019.09.16.12.24.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Sep 2019 12:24:38 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2019 12:24:24 -0700
Message-Id: <20190916192429.27294-3-armccurdy@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916192429.27294-1-armccurdy@gmail.com>
References: <20190916192429.27294-1-armccurdy@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] ffmpeg: add PACKAGECONFIG controls for alsa and zlib (enable by default)
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
X-List-Received-Date: Mon, 16 Sep 2019 19:24:38 -0000
Content-Transfer-Encoding: 8bit

Also move the libogg dependency to the theora PACKAGECONFIG, since
according to the configure script, theora is the specific component
which requires it.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb
index 2d69d8bd72..307e37e3fe 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.bb
@@ -38,12 +38,12 @@ ARM_INSTRUCTION_SET_armv6 = "arm"
 # libpostproc was previously packaged from a separate recipe
 PROVIDES = "libav libpostproc"
 
-DEPENDS = "alsa-lib zlib libogg nasm-native"
+DEPENDS = "nasm-native"
 
 inherit autotools pkgconfig
 
 PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample swscale postproc avresample \
-                   bzlib gpl lzma theora x264 \
+                   alsa bzlib gpl lzma theora x264 zlib \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xv xcb', '', d)}"
 
 # libraries to build in addition to avutil
@@ -57,6 +57,7 @@ PACKAGECONFIG[postproc] = "--enable-postproc,--disable-postproc"
 PACKAGECONFIG[avresample] = "--enable-avresample,--disable-avresample"
 
 # features to support
+PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[bzlib] = "--enable-bzlib,--disable-bzlib,bzip2"
 PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl"
 PACKAGECONFIG[gsm] = "--enable-libgsm,--disable-libgsm,libgsm"
@@ -68,13 +69,14 @@ PACKAGECONFIG[mp3lame] = "--enable-libmp3lame,--disable-libmp3lame,lame"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 PACKAGECONFIG[sdl2] = "--enable-sdl2,--disable-sdl2,virtual/libsdl2"
 PACKAGECONFIG[speex] = "--enable-libspeex,--disable-libspeex,speex"
-PACKAGECONFIG[theora] = "--enable-libtheora,--disable-libtheora,libtheora"
+PACKAGECONFIG[theora] = "--enable-libtheora,--disable-libtheora,libtheora libogg"
 PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
 PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
 PACKAGECONFIG[vpx] = "--enable-libvpx,--disable-libvpx,libvpx"
 PACKAGECONFIG[x264] = "--enable-libx264,--disable-libx264,x264"
 PACKAGECONFIG[xcb] = "--enable-libxcb,--disable-libxcb,libxcb"
 PACKAGECONFIG[xv] = "--enable-outdev=xv,--disable-outdev=xv,libxv"
+PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
 
 # Check codecs that require --enable-nonfree
 USE_NONFREE = "${@bb.utils.contains_any('PACKAGECONFIG', [ 'openssl' ], 'yes', '', d)}"
-- 
2.23.0


