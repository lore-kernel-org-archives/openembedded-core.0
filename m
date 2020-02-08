Return-Path: <scott.branden@broadcom.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 79EC360B8F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 00:01:22 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p9so4229935wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 16:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vG63j6Vq5uhgQ+P1OWOyrNmiwsIf7y4YOfBuylP/LY4=;
	b=RKvF/wQIFefnutqCKKfIm0X+YwxEycc36CXPCESfQJy59QllQyiVTfrd+oMcm7Yq3k
	PDO+jnUVngByUBszNEWtpPFIUDB3Qq6MyraCGoDZI4MX4Cax01E2mr/79zHcqrGfneRu
	IxFMhkWy6QawMAvNH5CgFlYYjrhNb2xBqTvkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vG63j6Vq5uhgQ+P1OWOyrNmiwsIf7y4YOfBuylP/LY4=;
	b=qtiXWtJSyYors+zn3B3MMAiBNMRYssP+ocpPfcyXdqadI4kIsIxingBiGZGs/GHR/L
	db7vG9ZPh6OOPZHvPUKzZ4OJJ56QEO+aG9EAcvfYl/lClfBVB14EWSH1jWmjSOIC2EoT
	fyyrBVv2uZFZc04TRvG4wm5+XOS6/wEBlxocgz+jG6FMzDvKGNolp1LBF5zYRZE4Euim
	swnDoyaQsOcMOAwfcyOiHnIwc5X3yWuSX2nd0FL8xrC7eH7hCSDUa5w9y8X18nIT7Dkx
	N2j1TQSQ2VPbE5EWp4ggg+9Cn5tdkOG9NvaZxuHryl+ZOqOF+SjIpvvNVhDHuD3fyhCq
	2vsg==
X-Gm-Message-State: APjAAAVA/1kQaa/uvw6aPfEzKfcH5d8mV24c5EeK+vhb+5xAm6QMOMq0
	EpE7tvXRI0bpkkfBwKkAn35OU5T6+g6FE+13UauXdDwFDMAl1+I1KSEaXRhddYuYcNEZnKKnpJd
	KvTkNWivv8H6//XiFtYujHi9QYUbjROxvr21NQPkmhIaWwUyUlp9rCLud9eMH+RAZnyqaghapzs
	tjGbQl8uTYHoc7URej0xOoktkn
X-Google-Smtp-Source: APXvYqyCTw18CXyHKiCyJInEwMFHWMAxL9l4H2ZopiSsjq9OkmzUTuf7UzOJcOh1qBdUgQqEo4u73A==
X-Received: by 2002:a1c:5f41:: with SMTP id t62mr790060wmb.42.1581120082781;
	Fri, 07 Feb 2020 16:01:22 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id i2sm5307230wmb.28.2020.02.07.16.01.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 16:01:22 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 16:01:10 -0800
Message-Id: <20200208000110.29065-2-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200208000110.29065-1-scott.branden@broadcom.com>
References: <20200208000110.29065-1-scott.branden@broadcom.com>
Subject: [PATCH v2 2/2] ffmpeg: add PACKAGECONFIG support for x265
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
X-List-Received-Date: Sat, 08 Feb 2020 00:01:22 -0000

Add PACKAGECONFIG support for x265 in ffmpeg.

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
index a3cf0c1a37..0c27663cf6 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
@@ -43,7 +43,7 @@ DEPENDS = "nasm-native"
 inherit autotools pkgconfig
 
 PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample swscale postproc avresample \
-                   alsa bzlib gpl lzma theora x264 zlib \
+                   alsa bzlib gpl lzma theora x264 x265 zlib \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xv xcb', '', d)}"
 
 # libraries to build in addition to avutil
@@ -74,6 +74,7 @@ PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
 PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
 PACKAGECONFIG[vpx] = "--enable-libvpx,--disable-libvpx,libvpx"
 PACKAGECONFIG[x264] = "--enable-libx264,--disable-libx264,x264"
+PACKAGECONFIG[x265] = "--enable-libx265,--disable-libx265,x265"
 PACKAGECONFIG[xcb] = "--enable-libxcb,--disable-libxcb,libxcb"
 PACKAGECONFIG[xv] = "--enable-outdev=xv,--disable-outdev=xv,libxv"
 PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
-- 
2.17.1


