Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 636036C1BD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Feb 2019 18:43:12 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id b11so13210820wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Feb 2019 10:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=f6/hZsU+KUq0hasj86L5SUbzBb14ouDF/XIosg2WFXU=;
	b=HJUbG+5ObfMxl4ixs4N65Ofw97qfepKDkmWHr8lw04dPsLTlHgGri8EFgiiPeXTtBi
	t97/KRrS3g0ava4ylKzEK5Phw90pNDY47p6H40KbTcdYP3qA7w88EeO38BxOdavb9A5K
	1D3HnOmrPHJS4IojSoJHxIBS+iis2dZFiZB7HHVHnv0Pq6SeaMONL+608JHoGzAGbZeB
	YHDaLOLQFvBpsbomI6Gp5K7Z6eyzp6a/aPruYsf2S1FrQIt4dsQm6gUP5HO7dtC2tx5V
	YZAuxRYRVFHUdlkE4BS0Lvk2Zthv/CfaTA35n1CTWL+A5NoqbxjMqWQ+SX5fTKx/dKhQ
	lpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=f6/hZsU+KUq0hasj86L5SUbzBb14ouDF/XIosg2WFXU=;
	b=Y39eXUjAgTmDx/aUfnQMNteRbUPZOT6aovGDcDYp5v9tfSXyyrqEJKzG7sFZ+8PeWO
	2jPeI1lqio0RVFKC2d3MU67k3Fk88wBlEei0wj2vPWBenH0c36ebAVnUDZ03SD3k9j+a
	1TBYFwkA+5q7vRKGH1T+JaVw7hO3yGeabPznKA9opb/N+iPtAf20BcVEpbmPzpT+d6C/
	zcuOV8nz0xm+ERHMClQv0AfPgwuaT/dAWp4BFq7ZttEHFKvJsojwN1sg/rXA//H8CH/g
	9/CJCneBe0Y5mkJ2IFVw1hCKAGPfOazhsl8dhBOFaLQ9ZgEtQ1emdEIC6dXcNBi/drbj
	5yoA==
X-Gm-Message-State: AHQUAuYrfaCvCKhMIj1ljYu2WI873dy9bThgZ+knW1CfHFAm0xdoAAky
	N/yH8MO44yweDhz6C3lWOGsOOp14
X-Google-Smtp-Source: AHgI3IZMm8QBEE+EmvuWzUgGIr5m0QHCuiiS32BfldJT9VwjjlRpxz7wewn+QSnZLjQcJQk3wqVpEQ==
X-Received: by 2002:a1c:4681:: with SMTP id t123mr6304967wma.24.1549824192700; 
	Sun, 10 Feb 2019 10:43:12 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F02D865224BED84176F27E0.dip0.t-ipconnect.de.
	[2003:f0:7f02:d865:224b:ed84:176f:27e0])
	by smtp.gmail.com with ESMTPSA id
	a14sm6707540wrr.13.2019.02.10.10.43.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 10:43:11 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Feb 2019 19:43:04 +0100
Message-Id: <20190210184304.10305-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libsdl2: Add packageconfigs jack & kmsdrm
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
X-List-Received-Date: Sun, 10 Feb 2019 18:43:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb
index a5ec77728a..c741cfb248 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb
@@ -46,6 +46,8 @@ PACKAGECONFIG ??= " \
 PACKAGECONFIG[alsa]       = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
 PACKAGECONFIG[directfb]   = "--enable-video-directfb,--disable-video-directfb,directfb"
 PACKAGECONFIG[gles2]      = "--enable-video-opengles,--disable-video-opengles,virtual/libgles2"
+PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
+PACKAGECONFIG[kmsdrm]     = "--enable-video-kmsdrm,--disable-video-kmsdrm,libdrm virtual/libgbm"
 PACKAGECONFIG[opengl]     = "--enable-video-opengl,--disable-video-opengl,virtual/libgl"
 PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
 PACKAGECONFIG[tslib]      = "--enable-input-tslib,--disable-input-tslib,tslib"
-- 
2.20.1


