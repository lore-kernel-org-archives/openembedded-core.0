Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5FD54788EB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 18:57:59 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id f2so19085908qtj.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jan 2018 10:58:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=Mk6pxeWImShbQC7XAM5/TPv0xOIiHoA1y+vd+D1iax0=;
	b=ChgmNfKBOxaLTkDhNEtnBGbIRCtyMEToXaRZN+RxhB7QeeBgYL7a9MH0myguMW+qRM
	nrOoHnibhoKYDWN9NTsm3TRKVpTYzJNq97N1lqQtX0bLSvdn7qzc4jfvxkzKvzR2EfTK
	aj2gWVEKoOe3C7Q6mbeSXXjfw2vhNKomb1MUc5fbbvAFcjeCKktIAZQfFHn9PcLRkcoT
	CvZNNLHYWI9MFXh/wrUe0aYw+2Gu7REvPZvAZ637MZVrPzRdjeoqsSmKRAVMqqKlJSea
	wZhYGXEv4wjAB0uxewOv/zvWqpcwL0oSNUX0zxsaWcQlkC/FIiorMyoUZBQZ54lxqkuq
	KtVg==
X-Gm-Message-State: AKwxytczNOMBKAf21st4MQDqXlnolgCe8tlWYoGXMEgmLJyLVXlQ1rAy
	muKNoy/YXiVmuUweTXXLKoXzuA==
X-Google-Smtp-Source: ACJfBostU/81vU2qeGxc5xRopOHEpnQCVRs7hYzd/3L8IrzN4Gwk+sejBmOiuJ29QiNdGLuzMW7W5w==
X-Received: by 10.200.26.37 with SMTP id v34mr22818878qtj.207.1515524280752;
	Tue, 09 Jan 2018 10:58:00 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	h55sm9682567qta.75.2018.01.09.10.57.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 09 Jan 2018 10:58:00 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 09 Jan 2018 16:57:53 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  9 Jan 2018 16:57:52 -0200
Message-Id: <20180109185753.31524-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mesa: Upgrade to 17.3.2 release
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
X-List-Received-Date: Tue, 09 Jan 2018 18:58:00 -0000

The 17.3.2 release, published in January 9th, 2018. It fixes a number
of issues since 17.3.1 release.

The release notes can be seen at:

 - 17.3.2: https://www.mesa3d.org/relnotes/17.3.2.html

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/mesa/{mesa-gl_17.3.1.bb => mesa-gl_17.3.2.bb} | 0
 meta/recipes-graphics/mesa/{mesa_17.3.1.bb => mesa_17.3.2.bb}       | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_17.3.1.bb => mesa-gl_17.3.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.3.1.bb => mesa_17.3.2.bb} (87%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.3.1.bb b/meta/recipes-graphics/mesa/mesa-gl_17.3.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.3.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.3.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.3.1.bb b/meta/recipes-graphics/mesa/mesa_17.3.2.bb
similarity index 87%
rename from meta/recipes-graphics/mesa/mesa_17.3.1.bb
rename to meta/recipes-graphics/mesa/mesa_17.3.2.bb
index f1daa4a198..9e9b23322a 100644
--- a/meta/recipes-graphics/mesa/mesa_17.3.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.3.2.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch \
            "
 
-SRC_URI[md5sum] = "b4b021279ea21e1eb8a1369afa6f19a0"
-SRC_URI[sha256sum] = "9ae607e0998a586fb2c866cfc8e45e6f52d1c56cb1b41288253ea83eada824c1"
+SRC_URI[md5sum] = "5c59b779925f504ffd0f13c7dcd29ac6"
+SRC_URI[sha256sum] = "e2844a13f2d6f8f24bee65804a51c42d8dc6ae9c36cff7ee61d0940e796d64c6"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.15.1


