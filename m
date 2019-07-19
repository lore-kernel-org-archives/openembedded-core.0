Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id BFE3A7D9D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 20:20:03 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u25so19730773wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 13:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=pcJ0/kSEg6mqLSSx0YArmBVtx59b2zSv3s3bSyXAHIE=;
	b=E03jctecm4Dej78xhoiq4tiFrDZ0ih/1WAHx+R0BPY9MLiH4PvwoFahxYUKS8v58OV
	qdd2XLjlTRGhYKkoWs1nlRwiEgYpBbwZuRdocCFkLeUJafbifO/WbWSrisUsm+AZhBTB
	CqmGCz0FOFjW18l/sL34MjPOe1aIapz2agq0lnrJG3IvwZBODuhWhDnT69CztTxLYN/u
	qOoLF6kzOnZqhYgNis9N+ynx+LhMYpwxg8JUGjfhqB03YcpLOadUrfjIK1+2uWGKmuSm
	FOSFQJeXKKjtLmT3yn5LFdQKjoX1SPeFZZe5C2AHLhYZ00xArQwhKBM+WC5BpfOl1sYX
	yAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pcJ0/kSEg6mqLSSx0YArmBVtx59b2zSv3s3bSyXAHIE=;
	b=qquDCJz3xhoEm9DBiAVkrPzRpDQQH1srUv+nSFFfW3OPkxz4ySKlHpGEEeK1AneZwL
	fJ1EnjZFLouQ2WE8sSWPh0bS7ePjTNM7zdofFlpghYYEYwhpDNJ5mwN4Fsb/10Y8kstG
	5Pr/CX0ZDWp5TGZdk/MdUNj9fTM65yP3k9+ZLBKAPVBI0Q2B5hP+WpQsgnmj2w8sMCiO
	h+COYvHovzAPDwmZ+ThsU3ufqa+dIJePo1JnfgzEflUfiyBxI4ISPWAfEK16PMH623Lw
	wSy0+IFwBX4Rcale0JLbOQgihaquf8oGdDY+0aAK7dulI4c/LWZOxgNTG/V2D/cZ+KM3
	pDsQ==
X-Gm-Message-State: APjAAAUBbQdiyVmbwQsYmum7HFQFULGN1WZ3gkUGn8HZ4vU4sis91HHR
	hRKjYmIMCp9iZdo6813wKN7NXxLJdlg=
X-Google-Smtp-Source: APXvYqxPcMYCg+n4tl12rFuvPk8/IL2gbJ1kffdWBX124PJGEGDmlinG5D++OXlmFI01Ph8nnt+vGw==
X-Received: by 2002:a7b:c632:: with SMTP id p18mr50857661wmk.114.1563567604271;
	Fri, 19 Jul 2019 13:20:04 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t13sm38854282wrr.0.2019.07.19.13.20.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 19 Jul 2019 13:20:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jul 2019 21:19:58 +0100
Message-Id: <20190719201958.19700-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719201958.19700-1-ross.burton@intel.com>
References: <20190719201958.19700-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ffmpeg: upgrade to 4.1.4
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
X-List-Received-Date: Fri, 19 Jul 2019 20:20:04 -0000
Content-Transfer-Encoding: 8bit

Add a PACKAGECONFIG for the use of XCB and enable by default if X11 is in
DISTRO_FEATURES.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../ffmpeg/{ffmpeg_4.1.3.bb => ffmpeg_4.1.4.bb}       | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.1.3.bb => ffmpeg_4.1.4.bb} (96%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.4.bb
similarity index 96%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.3.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.4.bb
index 6d230c33169..884973d237c 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.4.bb
@@ -26,8 +26,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            "
-SRC_URI[md5sum] = "dcc20dd2682ea01c678b7b8324339d43"
-SRC_URI[sha256sum] = "0c3020452880581a8face91595b239198078645e7d7184273b8bcc7758beb63d"
+SRC_URI[md5sum] = "5307931aeb7aaee5e1509d9996040661"
+SRC_URI[sha256sum] = "f1f049a82fcfbf156564e73a3935d7e750891fab2abf302e735104fd4050a7e1"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET_armv4 = "arm"
@@ -44,7 +44,7 @@ inherit autotools pkgconfig
 
 PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample swscale postproc avresample \
                    bzlib gpl lzma theora x264 \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xv', '', d)}"
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xv xcb', '', d)}"
 
 # libraries to build in addition to avutil
 PACKAGECONFIG[avdevice] = "--enable-avdevice,--disable-avdevice"
@@ -73,6 +73,7 @@ PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
 PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
 PACKAGECONFIG[vpx] = "--enable-libvpx,--disable-libvpx,libvpx"
 PACKAGECONFIG[x264] = "--enable-libx264,--disable-libx264,x264"
+PACKAGECONFIG[xcb] = "--enable-libxcb,--disable-libxcb,libxcb"
 PACKAGECONFIG[xv] = "--enable-outdev=xv,--disable-outdev=xv,libxv"
 
 # Check codecs that require --enable-nonfree
@@ -89,10 +90,6 @@ EXTRA_OECONF = " \
     --enable-pic \
     --enable-shared \
     --enable-pthreads \
-    --disable-libxcb \
-    --disable-libxcb-shm \
-    --disable-libxcb-xfixes \
-    --disable-libxcb-shape \
     ${@bb.utils.contains('USE_NONFREE', 'yes', '--enable-nonfree', '', d)} \
     \
     --cross-prefix=${TARGET_PREFIX} \
-- 
2.20.1


