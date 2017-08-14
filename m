Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id DBE48783BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 03:24:27 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id u185so8411653pgb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Aug 2017 20:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5b7h+ovekDwUFxB/Zwu5BFSTSKvWZoclLmGBzB8nLko=;
	b=dSC3Rr17nNWCgp2LOr6MF5DhXp/7m0ruOWDC48UyV1TDyR2wKaIF9TJxbsCUFHMoqF
	l4n3RXcT9aCdCXBnwjCDuB4xEhHn5J0eztF6XbM9oVkvthqkVPaSFcwuuzav/ECF0Cou
	bLNuLmZX6vH3hK6Z9rtsUYrFjVDsLM/shBqaMuPRXIwFexWUIh0GBh6XETG7xKp21RKL
	HSeZnUgbiBD87jGWz+O8d5ANqXh8b2pA9er9h0kSgZydMrhBj0Rjij1MRrQnmjd5JYic
	NgKccT+hZWfNcV1fSz1SagrPterM8Z7mdejngMj4y3hqerVDczJ6G33URgE6Ie/eg49C
	dQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5b7h+ovekDwUFxB/Zwu5BFSTSKvWZoclLmGBzB8nLko=;
	b=KEHsbpWlw41F97WRa9x8VRJ+9n7gtm65DI9CfHyJP2Lz5RzmF2/lxUaxpT2XNyxOjC
	QLaBu86WpIWUVAGrwQ357SN1SuDGuPDP+2TstlFtRO2ZuNQokvAmVPmp5YMQt+X2dURd
	YyfXR4FS1noFMXDTNiuOX+B8cNDrsushyVE2RpjfDyFmdCPSkcNvZxp7mQjBVB3BtQAt
	vv5J3uKgLQclEpIsB8G+LqvMaAGJlqQQBk3DuVACxrjvDR2Unh32EEKmhVkiXSNCFB4E
	pnkGfKERNlCXdbaMxqtYLRv4gwk0p0tbkVWHS1iQ7LgK6DdXtirv32XtajR2Hcqvl9XV
	IXfQ==
X-Gm-Message-State: AHYfb5huayfbv6nCwc3aelYil54x61jjKwaaHhz1vNSowFnl7mbmeRH2
	NK0kVXmx4ruc0skm
X-Received: by 10.84.134.36 with SMTP id 33mr27153425plg.412.1502681069445;
	Sun, 13 Aug 2017 20:24:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::8319])
	by smtp.gmail.com with ESMTPSA id
	y87sm11930051pfa.41.2017.08.13.20.24.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 13 Aug 2017 20:24:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Aug 2017 20:24:18 -0700
Message-Id: <20170814032418.3936-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170814032418.3936-1-raj.khem@gmail.com>
References: <20170814032418.3936-1-raj.khem@gmail.com>
Subject: [PATCH V2 3/3] cairo: Add pkgconfig for opengl support
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
X-List-Received-Date: Mon, 14 Aug 2017 03:24:28 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/cairo/cairo.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index f07b42d573..7347f223ff 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -31,6 +31,7 @@ PACKAGECONFIG[directfb] = "--enable-directfb=yes,,directfb"
 PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--disable-valgrind,valgrind"
 PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
 PACKAGECONFIG[glesv2] = "--enable-glesv2,--disable-glesv2,virtual/libgles2"
+PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
 
 #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points 
 require cairo-fpu.inc
-- 
2.14.1


