Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 83A4D7E66A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 17:22:00 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id p15so19294263qtl.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 10:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=o82wlI9La84qOLCemXp59W6hmk/vTRAdBkR3NUS4nIs=;
	b=lpTCn1/8X4M3mEy6H4xqsKZotX24hDqQHGAlkBmzUXUO8skQGYl3AsRskdA9h+IVti
	PbxPIXb24/Povf6pfiZlKBR7aRF4yAuJdTCmd3CDPijoHolIlsnIsN36RcpCZe9Ks3Ru
	7fnTbQ2GsM4gMxt/PjISkweqvOPRbSlsBkSAiOuA5/WqItMMH93CKgHOmovCVDkANZQL
	k1O/7uRKZuOtaJY9pE5uVrajZBt1/q5jflXQgX3+d9lWAFF+ilGWEjwcT5y0+Vlt1BBz
	PIvOOwNNCs9nmi15etpGfJ4v7+eAzaUaZEwDi/fcPlAxNI7/2vSCYpa68OBep/Zm8j5l
	gXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=o82wlI9La84qOLCemXp59W6hmk/vTRAdBkR3NUS4nIs=;
	b=j4OISUuQtnsxd9xXcchM4orITMqK+4rPAPVNNfA2rgK5MZWhn8fePVuovAE293LJxX
	jMvg8qxUBVLNk9ZOlnagInG1nHUu+O2XpO0mhhJEjtCOuoNz4+FojPM6rj2RdmttiDDa
	pcxlOj4HnR1ezFcAD0qpI6wbRCOsObUu1WOb61dg7/dGSYocRzy5a6rCPFkn3tB+v6d+
	dLE7iMfIIjhnfDxXB+7LGx0trWCtvATnYTtM+bNoUprHVZ0wZcNXH+a5WzVVM1smuuo6
	DQIgCRkqmHxy6K7zAoPnyqcsjhD35N+BrSU+Lo5oOLaTRsJ/P2C5kNsuHvXc4N01s5A4
	aYDA==
X-Gm-Message-State: APjAAAUqBmurm5ZvLiG6JgWMH1gpvZCmVT1mT3M9D27VRCaZezHWuLdW
	pVxTSddwziI062glDX8zAg+RfWz4nXAKNQ==
X-Google-Smtp-Source: APXvYqyKGN9Xz4690ZcuV1cAVbYApnAd/tk/VixIjSsja8a1PHzcKk5fZLsZbNg3QRWUB1/JnFSasA==
X-Received: by 2002:ac8:18f0:: with SMTP id
	o45mr134659015qtk.273.1561483321288; 
	Tue, 25 Jun 2019 10:22:01 -0700 (PDT)
Received: from centrium.lab.ossystems ([181.220.86.53])
	by smtp.gmail.com with ESMTPSA id n3sm7394683qkk.54.2019.06.25.10.21.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 10:22:00 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jun 2019 14:21:47 -0300
Message-Id: <20190625172147.12432-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] mesa: Update 19.1.0 -> 19.1.1
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
X-List-Received-Date: Tue, 25 Jun 2019 17:22:00 -0000
Content-Transfer-Encoding: 8bit

Mesa 19.1.1 is a bug fix release which fixes bugs found since the
19.1.0 release.

For a complete changelog see:
https://www.mesa3d.org/relnotes/19.1.1.html

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../mesa/{mesa-gl_19.1.0.bb => mesa-gl_19.1.1.bb}             | 0
 meta/recipes-graphics/mesa/{mesa_19.1.0.bb => mesa_19.1.1.bb} | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_19.1.0.bb => mesa-gl_19.1.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.1.0.bb => mesa_19.1.1.bb} (84%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.1.0.bb b/meta/recipes-graphics/mesa/mesa-gl_19.1.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.1.0.bb
rename to meta/recipes-graphics/mesa/mesa-gl_19.1.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa_19.1.0.bb b/meta/recipes-graphics/mesa/mesa_19.1.1.bb
similarity index 84%
rename from meta/recipes-graphics/mesa/mesa_19.1.0.bb
rename to meta/recipes-graphics/mesa/mesa_19.1.1.bb
index 05c315349c..1a34a6577b 100644
--- a/meta/recipes-graphics/mesa/mesa_19.1.0.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.1.1.bb
@@ -6,8 +6,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
            "
 
-SRC_URI[md5sum] = "090cd351cf938fc1729dee983520216a"
-SRC_URI[sha256sum] = "2a6c3af3a803389183168e449c536304cf03e0f82c4c9333077933543b9d02f3"
+SRC_URI[md5sum] = "07cd8cd79de28ec1a374ee3a06e47789"
+SRC_URI[sha256sum] = "72114b16b4a84373b2acda060fe2bb1d45ea2598efab3ef2d44bdeda74f15581"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.20.1


