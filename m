Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7F1FA6C828
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 09:39:29 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id d19so8148521qkg.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 01:39:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=DAkYd9EwgxACPGj9sQHwmuzEke+ZSjVkogG6BKCXApc=;
	b=ck7yoRKWOIYQ4Rh41MlLOSziOLctmKehpHqGsgDWdudVTjNd6ZDdV8KasnYzhUvXI0
	VdHKTCGJJFPaigbNuPA/7BcljK4aKeByBuJBYjIOMkuupfATThqdJiZYyi8HGh2SdoWJ
	Z/mxQrMifDtM8MzzyxRnCftOWsZBdM4LMjE6W9LnzTP/dxWYetsfJhuGlPtugZfZn4Ow
	OZPU49FK+7bwLlylin4vEUlEIk/lGurmh8QTAlxw76mJgqxA1BQu9xX+pgKJ/KcU2UOo
	ABw0/1Jj5FQIG8WtRsPusKskC0+ifMhVyJDrPGzvlZ+S8OM1QnIaDDW29W9yjM8M0SMD
	r9Sg==
X-Gm-Message-State: AA+aEWYf4gHYCtKqL6eVDL8wfxHgHRsZLu4Df6HcogQfRubKI233Oum+
	673R/vcB93aML6WrzMKEX8f+f0AX
X-Google-Smtp-Source: AFSGD/VfkpBhSNN30OqWBKSL4YmhQcrz8syqdh0Jz76ZBsgL6obZZqcPTYfQCGIGFnzuM2zrXdfk7Q==
X-Received: by 2002:a37:b646:: with SMTP id g67mr12857280qkf.326.1542965970217;
	Fri, 23 Nov 2018 01:39:30 -0800 (PST)
Received: from localhost.localdomain ([181.220.65.91])
	by smtp.gmail.com with ESMTPSA id
	t40sm33073796qth.46.2018.11.23.01.39.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 23 Nov 2018 01:39:29 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 23 Nov 2018 07:39:25 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Nov 2018 07:39:24 -0200
Message-Id: <20181123093924.22689-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] libdrm: Upgrade 2.4.94 -> 2.4.96
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
X-List-Received-Date: Fri, 23 Nov 2018 09:39:29 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../drm/{libdrm_2.4.94.bb => libdrm_2.4.96.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.94.bb => libdrm_2.4.96.bb} (95%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.94.bb b/meta/recipes-graphics/drm/libdrm_2.4.96.bb
similarity index 95%
rename from meta/recipes-graphics/drm/libdrm_2.4.94.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.96.bb
index d6542921f5..1c9e0e9f95 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.94.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.96.bb
@@ -12,8 +12,8 @@ DEPENDS = "libpthread-stubs"
 
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://musl-ioctl.patch"
-SRC_URI[md5sum] = "e9803233838007047f39eb385c70d9e0"
-SRC_URI[sha256sum] = "b73c59b0a3760502c428ba81de49cd4807657d26be5e697eba3a87dd021d16be"
+SRC_URI[md5sum] = "f296d87272b1befeada3bb135751ab3d"
+SRC_URI[sha256sum] = "0d561acf7bb4cc59dc82415100e6c1a44860e8c380e00f9592923e3cd08db393"
 
 inherit meson pkgconfig manpages
 
-- 
2.19.1


