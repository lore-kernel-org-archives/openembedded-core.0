Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 92F6660807
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:12 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id t10so3402087plr.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4xFuagm9NZLbLgRnVMpfbAZixViikNBj1bz4h3MSzGE=;
	b=n6f0vhn6v+a1PE/XhezEBTgOgBocdmj3i9Jy35y2p7MX6Lo3o2BYLNlYqIfGBQr+uS
	QRuclKmk6kE+/mXa+shP+f7nQ48L/f5Vf+d1aT09LU9LsOCkLJQgW26hXNEQH9zp7hQg
	xe0SQGYUTCC/K5uleq1r5goNaFPY3WSEcK7GJYmPQy322hDgZi1se1fwFPBrBWNCKtVF
	V2JoqVAynV7KOxhFltkgdh+tm0GmP6d6sJP5IlDnu45J7h7gh0ym/fW0JlE+GGvCwAJl
	nlPSIUYqXrnNrOr6sbKU06sDk6ED9IIGhIAOckH9fCUnNXsHjuvSPRzj6d/s4ioKfWYV
	M3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4xFuagm9NZLbLgRnVMpfbAZixViikNBj1bz4h3MSzGE=;
	b=L0KH3Fw60us3jA8Hans0xLead1Yu6zwflETU/a30Ce/6/XAhCpYcvI0tOfUyUF797g
	5TZfvID1L9EthaNUQCR4+SVk3zYF6qZp3Iw6WzaCPEjB1i0HKq5TrAIk68RqGQOzWMSd
	aQoFZXBHOW02dsen3JlySQsb/KZNE8PFhLSzBP2sD2Ui0cgrXyw8NbqLkfcepUpUub0k
	qVpLS1q5r7J7MXaTSPAcTaNU3bwPWIwYMde2Ri6OnY00CiJKjTiijtRoId9ryuyt0FVJ
	FAk3J67C81p02KoI5z1kRJsDJdiUbaPASaWwiwVN9pkf2gihhivQ0ajlwWObx+Ftg5RK
	YrdA==
X-Gm-Message-State: APjAAAUga6K+YNYHrrKjhnYNkISlfQobIpXAQseLSJ5Xbgt+Fx0bPAKD
	TJtv21u9AHd+XecIbZL3FhnzmvokN3Y=
X-Google-Smtp-Source: APXvYqyVphF3BOVjma6cPI1/d65JOCJrZzB0QkrEHmu8kegvDaYhKRV4Es5WpSqKcLU8mqdJjXKBsQ==
X-Received: by 2002:a17:902:720b:: with SMTP id
	ba11mr17043660plb.98.1569818893715; 
	Sun, 29 Sep 2019 21:48:13 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:15 -0700
Message-Id: <6387d3ad8cad2d608b88fac17edb8008032c8462.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 20/54] mesa: Update 19.0.1 -> 19.0.8
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:12 -0000

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


