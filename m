Return-Path: <scott.branden@broadcom.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4786E60F7B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Feb 2020 19:33:39 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z3so4916956wru.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Feb 2020 11:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vG63j6Vq5uhgQ+P1OWOyrNmiwsIf7y4YOfBuylP/LY4=;
	b=ARhbclKqgDT0vLe1JHIv6wolMQdXcgs+DOwKthUG+zqfwNXIIXYov3YjuIeVlAqhTP
	OKTtDraOesEizPhbU6jrutuisiAF+nZFDr0Djdxm7g9gTASPn6FE2idFSzfc8lFRU6h2
	NXlRo/76Q2eZZ/FCWCEab4tpRO0S24/ZEXCRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vG63j6Vq5uhgQ+P1OWOyrNmiwsIf7y4YOfBuylP/LY4=;
	b=A/5eUyIBUuejrRx7Rla/5HfTcLn5JxZPz8QUQv8+aIEYAaKj7lch9Q2jyqjP1yo9My
	Hox9BJoC1qvei3Xw1+CEDhH8o53WwJvsF2ftKUup8yuH7IgTaayufsFS8ZFa6gwLTMWQ
	V5EcheydJtxoadrIysIvrjqsK2MLKp/RDb9GyUK141Rpr82G2UB4Gjl7gFM0RwKe7acC
	ClSZFKuh/V6H4BU+HKQeg6u7fNG2C+zXphxWslfG95rVzOiLDAJ84KRYZYGTYiX/I+Id
	76TKxQPwfEYKeEFEG3JhqCCdaqlYCbwU5ykhEXrxG/EKcgyftxiBmLXVi3HbPI2MbY0v
	Ic6Q==
X-Gm-Message-State: APjAAAWUpIPNOXrWPqzUtHvcS4N43hjwglHtjepzso/K28apwmQmabtR
	ftzIjWzDxJ7Whr+SmO6zjRVopfEAHTh4Iko2cNwT8N7QZJKbXOaIVOCXSnhrq5zwQk3eAePKkRn
	qe+2afkdOuRTPPfgoUA35Zu2l4yGUjyQROwfoJKFfEXqeTRcwPLmZSg22l1joSM/7PHEqrgvF83
	PTptKUE0ru6VrD5NYZdtX3uGlSpXQ=
X-Google-Smtp-Source: APXvYqwLlBzhBJd8QJZGnWafHjgX1gMbK6OQYpMSgi8LJPMRx5A/NVr7cAFPpysrjNW8BMAr3jFyLg==
X-Received: by 2002:adf:f586:: with SMTP id f6mr11768874wro.46.1581276819467; 
	Sun, 09 Feb 2020 11:33:39 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	u14sm13123021wrm.51.2020.02.09.11.33.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 11:33:38 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Feb 2020 11:33:19 -0800
Message-Id: <20200209193319.4378-2-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200209193319.4378-1-scott.branden@broadcom.com>
References: <20200209193319.4378-1-scott.branden@broadcom.com>
Subject: [PATCH v3 2/2] ffmpeg: add PACKAGECONFIG support for x265
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
X-List-Received-Date: Sun, 09 Feb 2020 19:33:39 -0000

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


