Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5AD737827F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jul 2017 19:12:38 +0000 (UTC)
Received: by mail-ua0-f182.google.com with SMTP id z22so91781149uah.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jul 2017 12:12:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=s40LOA8kZCnBB7WvEnTRAK1uTNrHapOVar6+U2Obr3M=;
	b=R8gwEtL91Ef5ZFXSqVyppL88q+FHVmeAUyj7smSuI+DsJxVAyS62M1xNpQuakhtEQ5
	3CSJtxLaxj/qXv7NCYJtnpXNFKTYqtU3/lgaZge4PPBS5w+QgoQKLPUq7lS/d/uUQukD
	Bqsi4yKflKegLi0OtXyHr6BM3es+hGlJfUKJstgGGjo1dXZnvVRBfwGL2vBA+Z3FQScT
	RiHFBduB0arp9oBKvWtbuxtVYMuVjnEsAFim0Pz59udfZyHEjOd8fOnfVvhadkrjX/Lm
	4/z1QFC7upH8eZmrb+i7QHA4b6aw2P6F/WF8mm9E10qpPUR5Y4nMAWgK2qU3AjqsoytO
	Xa8Q==
X-Gm-Message-State: AKS2vOwFreO7AbbGCE8zZ+TmoGDHwZPHrvMdXlC+7PpQ6AhBOIOl3O+R
	S5vBM4T9g1nu7acL
X-Received: by 10.176.9.73 with SMTP id c9mr14336644uah.145.1498936359418;
	Sat, 01 Jul 2017 12:12:39 -0700 (PDT)
Received: from localhost.localdomain ([179.105.243.125])
	by smtp.gmail.com with ESMTPSA id
	h137sm3169369vkd.16.2017.07.01.12.12.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 01 Jul 2017 12:12:38 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Sat, 01 Jul 2017 16:12:31 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat,  1 Jul 2017 16:12:30 -0300
Message-Id: <20170701191230.20067-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.13.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mesa: Upgrade to 17.1.4 release
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
X-List-Received-Date: Sat, 01 Jul 2017 19:12:40 -0000

This includes following upstream bug fixes:

Bug 77240 - khrplatform.h not installed if EGL is disabled
Bug 95530 - Stellaris - colored overlay of sectors doesn't render on i965
Bug 96958 - [SKL] Improper rendering in Europa Universalis IV
Bug 99467 - [radv] DOOM 2016 + wine. Green screen everywhere (but can be started)
Bug 101071 - compiling glsl fails with undefined reference to `pthread_create'
Bug 101252 - eglGetDisplay() is not thread safe
Bug 101294 - radeonsi minecraft forge splash freeze since 17.1
Bug 101451 - [G33] ES2-CTS.functional.clipping.polygon regression

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/mesa/{mesa-gl_17.1.3.bb => mesa-gl_17.1.4.bb} | 0
 meta/recipes-graphics/mesa/{mesa_17.1.3.bb => mesa_17.1.4.bb}       | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_17.1.3.bb => mesa-gl_17.1.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.1.3.bb => mesa_17.1.4.bb} (84%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.1.3.bb b/meta/recipes-graphics/mesa/mesa-gl_17.1.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.1.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.1.4.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.1.3.bb b/meta/recipes-graphics/mesa/mesa_17.1.4.bb
similarity index 84%
rename from meta/recipes-graphics/mesa/mesa_17.1.3.bb
rename to meta/recipes-graphics/mesa/mesa_17.1.4.bb
index d9860213f2..2a1ecd3124 100644
--- a/meta/recipes-graphics/mesa/mesa_17.1.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.1.4.bb
@@ -7,8 +7,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-hardware-gloat.patch \
 "
 
-SRC_URI[md5sum] = "1946a93d543bc219427e2bebe2ac4752"
-SRC_URI[sha256sum] = "5f1ee9a8aea2880f887884df2dea0c16dd1b13eb42fd2e52265db0dc1b380e8c"
+SRC_URI[md5sum] = "be2ef7c9edec23b07f74f6512a6a6fa5"
+SRC_URI[sha256sum] = "06f3b0e6a28f0d20b7f3391cf67fe89ae98ecd0a686cd545da76557b6cec9cad"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.13.2


