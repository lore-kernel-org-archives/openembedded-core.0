Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6CCB271C3D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 18:07:00 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id p67so198281qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 11:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=Mffe7qQ/o3QLo/bmf0kExNHS1IeHh7R1GWPZ3mB/ohc=;
	b=XOPyA6J2wdAqARkv7cire+nqimlBbZZdF0z2xgDhYWkON1YQePsPWWBKKqGozDNSfO
	jjRvszLN5RUbCiiYHPi35De/eJ8mOCqglBoNPouUJSUqgKwIeqvLCUGL1TxXMdeHD3cQ
	o9Y1FTvRaq50BC93nuc84x7BaaUJQbL/C8IvWaWv78kpv0u3CbGYVBg+JDxapxhffJp6
	aOvS6jx2rMcl9xEF0v4uWUNyr8nb+kyjf8f/zt7a0DkUuFbA0XJgQH4rTIV6MrgbctDk
	KGPBncJG9KIuSXHKdAFrCdAEAJ1ABxuZGQXmwBV7QVGdTGQo12lMZmpH6NHDlXyo3ycd
	MzGg==
X-Gm-Message-State: AHYfb5iq9HJmYSRFvRJOFU28j6cDZF3y50T7+GmTbERPTkwYdu2CIkK9
	zBAot6IUNNKAqQiV
X-Received: by 10.233.235.216 with SMTP id b207mr9808006qkg.77.1503598021270; 
	Thu, 24 Aug 2017 11:07:01 -0700 (PDT)
Received: from localhost.localdomain ([181.220.72.143])
	by smtp.gmail.com with ESMTPSA id
	i124sm2771305qkf.43.2017.08.24.11.06.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Aug 2017 11:07:00 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 24 Aug 2017 15:06:52 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Aug 2017 15:06:51 -0300
Message-Id: <20170824180651.7284-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mesa: Upgrade to 17.1.7 release
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
X-List-Received-Date: Thu, 24 Aug 2017 18:07:00 -0000

This is a bugfix release and has following upstream bugs as noteworth:

Bug 101334 - AMD SI cards: Some vulkan apps freeze the system
Bug 101766 - Assertion `!"invalid type"' failed when constant expression involves literal of different type
Bug 102024 - FORMAT_FEATURE_SAMPLED_IMAGE_BIT not supported for D16_UNORM and D32_SFLOAT
Bug 102148 - Crash when running qopenglwidget example on mesa llvmpipe win32
Bug 102241 - gallium/wgl: SwapBuffers freezing regularly with swap interval enabled

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/mesa/{mesa-gl_17.1.6.bb => mesa-gl_17.1.7.bb} | 0
 meta/recipes-graphics/mesa/{mesa_17.1.6.bb => mesa_17.1.7.bb}       | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_17.1.6.bb => mesa-gl_17.1.7.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.1.6.bb => mesa_17.1.7.bb} (88%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.1.6.bb b/meta/recipes-graphics/mesa/mesa-gl_17.1.7.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.1.6.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.1.7.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.1.6.bb b/meta/recipes-graphics/mesa/mesa_17.1.7.bb
similarity index 88%
rename from meta/recipes-graphics/mesa/mesa_17.1.6.bb
rename to meta/recipes-graphics/mesa/mesa_17.1.7.bb
index 64a15e3fb7..494cdc6d83 100644
--- a/meta/recipes-graphics/mesa/mesa_17.1.6.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.1.7.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch \
            file://0001-winsys-svga-drm-Include-sys-types.h.patch \
            "
-SRC_URI[md5sum] = "54758bf842f9ea53c8b57cce4311b87e"
-SRC_URI[sha256sum] = "0686deadde1f126b20aa67e47e8c50502043eee4ecdf60d5009ffda3cebfee50"
+SRC_URI[md5sum] = "e40bb428a263bd28cbf6478dae45b207"
+SRC_URI[sha256sum] = "69f472a874b1122404fa0bd13e2d6bf87eb3b9ad9c21d2f39872a96d83d9e5f5"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.14.1


