Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 409F078222
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 19:50:51 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id 19so7975888vkd.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 12:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=eom6PFVuI6j5knajHTmTd+/X92NHDiBZMcnK2gaJVSA=;
	b=jTYmCR/aD+gw2N1NeztK1HOAKq/+AcketclDrlvwBYyAPs/AJ+awIen36LFRy1jXN/
	siYl7hrQD+4umjjiNfgxXkGdqCZMW6FSPI3bfESPXjMH7QX3ciEf+jbR+DugEuem8Af5
	7r0ZjVFoksKmtZOK9ofOqDjOArO4qAWI7MWkooMcwL0YvTmDx0QYEXpGPeZhsU78lRKL
	BUNheMHibxSii/gEzKRy17oKl72pqJNNV0+gF8VB5CSaZW4rjeJPa/bHMJwlXfb/+oNk
	b7UZQmJj56B3SGWfVJ8FhKmS3nW0Uk6nGbO1igFclZOCnZhIjxpmDd+ddCnh3DcGxNYd
	2xBA==
X-Gm-Message-State: AKS2vOwkTp8m9O/9ylaGBwjB99DdMp0wMKBZmMeuicfwAqXqqpr5tapR
	wieCoeW7d4sNJioa
X-Received: by 10.31.130.144 with SMTP id e138mr14906659vkd.91.1497901852641; 
	Mon, 19 Jun 2017 12:50:52 -0700 (PDT)
Received: from localhost.localdomain ([189.35.69.200])
	by smtp.gmail.com with ESMTPSA id
	j10sm3933349vke.32.2017.06.19.12.50.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Jun 2017 12:50:51 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 19 Jun 2017 16:50:45 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Jun 2017 16:50:44 -0300
Message-Id: <20170619195044.19102-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.13.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] mesa: Upgrade to 17.1.2 release
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
X-List-Received-Date: Mon, 19 Jun 2017 19:50:52 -0000

Bug fixes

Bug 98833 - [REGRESSION, bisected] Wayland revert commit breaks non-Vsync fullscreen frame updates
Bug 100741 - Chromium - Memory leak
Bug 100877 - vulkan/tests/block_pool_no_free regression
Bug 101110 - Build failure in GNOME Continuous

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- rebase on top of master

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
index 55c6f71ab4..20e24397cb 100644
--- a/meta/recipes-graphics/mesa/mesa_17.1.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.1.2.bb
@@ -8,8 +8,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
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


