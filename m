Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id E729A78301
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 17:37:28 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id s33so36348307qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 10:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=H36qibXZF+bso2pyKDwFV9/O1+sJGUnSRIXTmcTCwxs=;
	b=X54K1eW8OnJqWuUynHMqmzTYWrfTmY6i/43u8JOQ63wDRQGe25URubNTd2X/03KDUb
	JdZ0W7vLgZbGEVwywJuhzEZyXuoclQA40ZICxaQj0/yK5jWjqWLzAzM7l1ESj+rDoNUh
	NyM/wzs6B/mSiHofNt7UZj07JbAW2iyQZULJkmwiSM2Cz4lQqfrzLDks3u5oK/tEj0/p
	oXHY3rlIJ6mi5GC24rwVbTbur4uYNPPf5KOfg+g//5rLp12XCxTBcLgzZ6N3N2WoBFZR
	Eghulj5i0OVx7mN8gDGoW73Ux3t/dKLqWPQD9Gj7/8BSGF1UlieghUNQ1KrFAWrfV8gg
	EnCw==
X-Gm-Message-State: AKS2vOyLUPveC+wxetdKBNk5jrRgdv93YmpTiVdLfarPi2ApKG0bSFBS
	U3ItqpWw7rA9nCPp
X-Received: by 10.200.9.59 with SMTP id t56mr1482864qth.107.1497375449070;
	Tue, 13 Jun 2017 10:37:29 -0700 (PDT)
Received: from localhost.localdomain ([189.35.69.200])
	by smtp.gmail.com with ESMTPSA id 34sm9573649qtp.17.2017.06.13.10.37.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Jun 2017 10:37:27 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 13 Jun 2017 14:37:19 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Jun 2017 14:37:18 -0300
Message-Id: <20170613173718.16101-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.13.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mesa: Upgrade to 17.1.2 release
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
X-List-Received-Date: Tue, 13 Jun 2017 17:37:29 -0000

Bug fixes

Bug 98833 - [REGRESSION, bisected] Wayland revert commit breaks non-Vsync fullscreen frame updates
Bug 100741 - Chromium - Memory leak
Bug 100877 - vulkan/tests/block_pool_no_free regression
Bug 101110 - Build failure in GNOME Continuous

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/mesa/{mesa-gl_17.1.1.bb => mesa-gl_17.1.2.bb} | 0
 meta/recipes-graphics/mesa/{mesa_17.1.1.bb => mesa_17.1.2.bb}       | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_17.1.1.bb => mesa-gl_17.1.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.1.1.bb => mesa_17.1.2.bb} (85%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.1.1.bb b/meta/recipes-graphics/mesa/mesa-gl_17.1.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.1.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.1.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.1.1.bb b/meta/recipes-graphics/mesa/mesa_17.1.2.bb
similarity index 85%
rename from meta/recipes-graphics/mesa/mesa_17.1.1.bb
rename to meta/recipes-graphics/mesa/mesa_17.1.2.bb
index ff84015aee..5f27020470 100644
--- a/meta/recipes-graphics/mesa/mesa_17.1.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.1.2.bb
@@ -8,8 +8,8 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/mesa-${PV}.tar.xz \
            file://0002-hardware-gloat.patch \
 "
 
-SRC_URI[md5sum] = "a4844bc6052578574f9629458bcbb749"
-SRC_URI[sha256sum] = "aed503f94c0c1630a162a3e276f4ee12a86764cee4cb92338ea2dea99a04e7ef"
+SRC_URI[md5sum] = "4d2eaf5955740b044afd95ed167c906c"
+SRC_URI[sha256sum] = "0937804f43746339b1f9540d8f9c8b4a1bb3d3eec0e4020eac283b8799798239"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.13.1


