Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4E8E97F41C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:44 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id w16so7376644pfn.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4xFuagm9NZLbLgRnVMpfbAZixViikNBj1bz4h3MSzGE=;
	b=YNgnfkILHJAZdF16ed50fT36rw6/36TqEgPfbVn0chPWvHcnOznsUIMne3fMk4s/ux
	rEGqp4smsMJkfpkG3EPuMcfPH/R1X/sMzeBIEXPBm07r46iV2prb7VP7D5Xeid1T7nEw
	pLJNMLZZdNc01/oNG9AW1B0xqXI/ilhOZ4iqewJmodRmsMehk0sK0k0JcdonKtNb/kpx
	D7jYT3x6LgkvranRyACeIuDzWNrPODTT8j4UUnhL287knKQ2Po22diMKvkxsfp6YA74x
	4Qq83Xmf01T9OVlHzmCBCZ7d24DWTPNqzdVaakKA15js2CCAaNU+qG+PNjfIDWrgdGHR
	CSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4xFuagm9NZLbLgRnVMpfbAZixViikNBj1bz4h3MSzGE=;
	b=cH9leLjI8IoFRhibp3zWarBilJnDy51EF3cctRCPulVvu+hWqSYRY60fqYo1DnNN8c
	czYTiS7mc7n2ZPNZe8EDGTvIsYlKVG4KiPgrhgVP2nTrVd6n8ECYoVyypYTvAASrKrfo
	PU+z1zlesXq6FWqCUKxipwhLfWGsIKuxOfNLVNna44KAbe8E9VB0qiaiOQfzLXnfVDPT
	v+wMXwh0wi5kfOvnldZJpFesdKnyJjfGEOxwpVWEtexssi0w8rl0lM9IFEf2xc25YCVC
	GSik55kTE71raqIem25yp3rUsQ510vhlUohdSGOISnsiGHoV1RAVB1AHWBxnJiAJocC1
	zZgg==
X-Gm-Message-State: APjAAAXhcNBn7D9AiEuovWpDBOQ1QzZy8rwhULvdySvytbdYfV3KCBYw
	OZAi7xWa6n3Az/5TF/PsskpQAmc2
X-Google-Smtp-Source: APXvYqxf1ZtYYDhsGj5B3NaURHdUzPSIxdVQ8eCBSQ41s16EbBkoSoA4xIC10u6lIfZyu74zgs/iSA==
X-Received: by 2002:a65:518a:: with SMTP id h10mr20947615pgq.117.1567348604924;
	Sun, 01 Sep 2019 07:36:44 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:35:59 -0700
Message-Id: <77c8456f3e2f778161f4b51d4e276646d81d1c8c.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 21/43] mesa: Update 19.0.1 -> 19.0.8
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:44 -0000

From: Fabio Berton <fabio.berton@ossystems.com.br>

This commit adds the following changes:

Updates from 19.0.8:

  - Mesa 19.0.8 is an emergency bug fix release which fixes a critical
    bug found in the 19.0.7 release.

  Full log:
  https://www.mesa3d.org/relnotes/19.0.8.html

Updates from 19.0.7:

  - Mesa 19.0.7 is a bug fix release which fixes bugs found since the
    19.0.6 release.

  Full log:
  https://www.mesa3d.org/relnotes/19.0.7.html

Updates from 19.0.6:

  - Mesa 19.0.6 is a bug fix release which fixes bugs found since the
    19.0.5 release.

  Full log:
  https://www.mesa3d.org/relnotes/19.0.6.html

Updates from 19.0.5:

  - Mesa 19.0.5 is a bug fix release which fixes bugs found since the
    19.0.4 release.

  Full log:
  https://www.mesa3d.org/relnotes/19.0.5.html

Updates from 19.0.4:

  - Mesa 19.0.4 is a bug fix release which fixes bugs found since the
    19.0.3 release.

  Full log:
  https://www.mesa3d.org/relnotes/19.0.4.html

Updates from 19.0.3:

  - Mesa 19.0.3 is a bug fix release which fixes bugs found since the
    19.0.2 release.

  Full log:
  https://www.mesa3d.org/relnotes/19.0.3.html

Updates from 19.0.2:

  - Mesa 19.0.2 is a bug fix release which fixes bugs found since the
    19.0.1 release.

  Full log:
  https://www.mesa3d.org/relnotes/19.0.2.html

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/mesa/{mesa-gl_19.0.1.bb => mesa-gl_19.0.8.bb} | 0
 meta/recipes-graphics/mesa/{mesa_19.0.1.bb => mesa_19.0.8.bb}       | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_19.0.1.bb => mesa-gl_19.0.8.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_19.0.1.bb => mesa_19.0.8.bb} (85%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.0.1.bb b/meta/recipes-graphics/mesa/mesa-gl_19.0.8.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_19.0.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_19.0.8.bb
diff --git a/meta/recipes-graphics/mesa/mesa_19.0.1.bb b/meta/recipes-graphics/mesa/mesa_19.0.8.bb
similarity index 85%
rename from meta/recipes-graphics/mesa/mesa_19.0.1.bb
rename to meta/recipes-graphics/mesa/mesa_19.0.8.bb
index d90be8a..8cb80b5 100644
--- a/meta/recipes-graphics/mesa/mesa_19.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.0.8.bb
@@ -7,8 +7,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
 "
 
-SRC_URI[md5sum] = "19636bb3da35c21f43040d31e575d5ce"
-SRC_URI[sha256sum] = "6884163c0ea9e4c98378ab8fecd72fe7b5f437713a14471beda378df247999d4"
+SRC_URI[md5sum] = "9634964d87f1ce8d0230493e43f34c50"
+SRC_URI[sha256sum] = "d017eb53a810c32dabeedf6ca2238ae1e897ce9090e470e9ce1d6c9e3f1b0862"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.7.4


