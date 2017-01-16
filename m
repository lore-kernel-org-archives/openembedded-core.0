Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9638671AC8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:16:30 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id t6so1384022pgt.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=ATMQJ1sCoQLAGo9masW/Us9oPrGJsvmvmTxUVp/p8Hg=;
	b=bQisHkwYu0aZ34eCyK+H/vIPB3BQUeueSNnsurkKMam7dIK4reQVvTgIJTjVQ7qRI4
	mYxbOY3o/oEMvddJg42CGmw7b6m9etljoVxymM0R8lpPxvhzTZ0UDrHh7Czn5YWPPdwK
	FbHJP6AldviKYtBOw7UJtg99rWxcCHjfq8oeJo8wL3FrN3F9cCPf9gK6vDb3mDotO1lf
	0wMeYT6WYDWD7uUMV8vPvtCy5FV/M7VCXnJHOMFOmVyKlm3w+Jol0oF+SiGzYN1G/zDz
	ALFG72PkhCNCyMBpHmPSrX8CVj4eIf6WZKhjUZAEfy4BazAVLzfpU/ovcRDowlRL2d34
	b31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=ATMQJ1sCoQLAGo9masW/Us9oPrGJsvmvmTxUVp/p8Hg=;
	b=FRrKWytcqxVOakNK9O/6swX4UB86NbH9hmsmznybrMFefgSeNPiLYerHwnJMgH0Fa9
	VJwqL0Lr7a5zuiHj/tha7mR3639P4tuKCZj/6eDT7Tlq5J/TBx9HlwMi/nRcQ+DG9ANj
	PX6Hg+6yWX3EZ8KisgHOkAVGvAS2oMgxMRJScFodhr4FW144t0ybheX/FKF0vSvv6yfe
	ZKxBCF9k5yt6X9PazBFZY4bzax4PWB5eDda3+p1MrgZHBlIFzrDECvZEtQeq3Q3FihiH
	KD0okg6j3sMUrm5n45WpAkj2MCD2+4EpOQaaekrQM0upPVTdyuY7xbNMgTKz7+k8jQZQ
	J8+Q==
X-Gm-Message-State: AIkVDXLWKbbApeErvBBsFiUdYe1pwzihpTlM5NF0AxGhw5cjFOdKwAuR84Yeke66eJ4KZw==
X-Received: by 10.84.233.206 with SMTP id m14mr51529379pln.104.1484576190547; 
	Mon, 16 Jan 2017 06:16:30 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	c2sm48244274pfl.61.2017.01.16.06.16.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:16:30 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-11-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 11/30] libsdl_1.2.15.bb: Add 'directx' PACKAGECONFIG
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
X-List-Received-Date: Mon, 16 Jan 2017 14:16:30 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add the 'directx' PACKAGECONFIG to configure whether to build with
DirectX support. By default this is enabled (when targeting
mingw32/windows) however this requires the DirectX libraries in order to
include and link against.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index e770b5f051..21dfb9fdb9 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -56,6 +56,7 @@ PACKAGECONFIG[tslib] = "--enable-input-tslib, --disable-input-tslib, tslib"
 PACKAGECONFIG[directfb] = "--enable-video-directfb, --disable-video-directfb, directfb"
 PACKAGECONFIG[opengl] = "--enable-video-opengl, --disable-video-opengl, virtual/libgl libglu"
 PACKAGECONFIG[x11] = "--enable-video-x11 --disable-x11-shared, --disable-video-x11, virtual/libx11 libxext libxrandr libxrender"
+PACKAGECONFIG[directx] = "--enable-directx,--disable-directx"
 
 EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
 
-- 
2.11.0


