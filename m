Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id DB9E071AF3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 05:56:05 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id p66so91061477pga.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 21:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=qfYRKbUBaTaoyKtBeiAoGB4OokdKn+hPTRKHRkbADw8=;
	b=UB0fBmyarJjKF8TaRaVQmJyBM2WP7dW0ldH3OFTh63WCeQAcoiXVRNbTib6gMV316M
	gm9eHafgE4LXHqagBZHaZetgEwz+eotPYgT9/uj6d5xDUxkVry6Cg2UpBXASsilX+SVl
	iLCIcEoxDhGfdDzBTsqfI3OzMAxOEZkcS7c01Jo9rmgxYvgFx039PDcIGvMZmZ0ldIt8
	F3Oy+wXe/uXF3UNSX6rGFe2yeo1rgtHNQJZMF1iFm2ZdniaEJC9dSH/m+IsGEGzj9Gtj
	VmqoI84VNKxlec0p8Jkb/RoEC4guvCX656eg4H87cqw1tGgzS41iiomQrYNVxFixyrTp
	6XMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qfYRKbUBaTaoyKtBeiAoGB4OokdKn+hPTRKHRkbADw8=;
	b=SOCPQWls3p4hvX4i4ckVbMd6WoJIp1r92UT1h4uCnaUtzs5uBE1p2EHWLwqXurQV+B
	r8Ap0ZQn4YHgAGLcMj1ISvqPDNeIM3MCfCmJASecXiB4t/rCUZUFwYEQsIhzyXnTDGSl
	DXLo3hjpE6gVGssYDSzYp8aWnQNLift9uMFRnONXSGxX1MsqivlCR/QV6LR5TXILzkgU
	dXTreOpeQ/41P1xsvpVMXsNLtyDALwx0APbq59TLGB/kR2JJuJ8xUP22sASga2s0FqZG
	iJLX86y96NyoGPfgJsuikZVQTzhq26lV/7T3YY+7efTt8thtXlQHTwY86scaroEcOIR6
	yiEQ==
X-Gm-Message-State: AKaTC032vG/0w0l6N9YXfKcDJoM2DlbY2h3SycKx2HjtC4DiKT0m01BEF3TWxDSHuv4vOw==
X-Received: by 10.84.136.1 with SMTP id 1mr81078144plk.152.1480571767022;
	Wed, 30 Nov 2016 21:56:07 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	y29sm106970113pfd.63.2016.11.30.21.56.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Nov 2016 21:56:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 21:56:01 -0800
Message-Id: <20161201055601.31026-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] ffmpeg: Add packageconfig for vdpau accelaration
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
X-List-Received-Date: Thu, 01 Dec 2016 05:56:06 -0000

Fixes dangling dependency QA issue

WARNING: ffmpeg-3.2.1-r0 do_package_qa: QA Issue: libavutil rdepends on libvdpau, but it isn't a build dependency, missing libvdpau in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.1.bb
index 86279f2..5fca950 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.2.1.bb
@@ -57,6 +57,7 @@ PACKAGECONFIG[schroedinger] = "--enable-libschroedinger,--disable-libschroedinge
 PACKAGECONFIG[speex] = "--enable-libspeex,--disable-libspeex,speex"
 PACKAGECONFIG[theora] = "--enable-libtheora,--disable-libtheora,libtheora"
 PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
+PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
 PACKAGECONFIG[vpx] = "--enable-libvpx,--disable-libvpx,libvpx"
 PACKAGECONFIG[x11] = "--enable-x11grab,--disable-x11grab,virtual/libx11 libxfixes libxext xproto virtual/libsdl"
 PACKAGECONFIG[x264] = "--enable-libx264,--disable-libx264,x264"
-- 
2.10.2


