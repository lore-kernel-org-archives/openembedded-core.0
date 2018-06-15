Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f52.google.com (mail-pl0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 26AFF77103
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 15:08:14 +0000 (UTC)
Received: by mail-pl0-f52.google.com with SMTP id c23-v6so5497947plz.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 08:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aOpS2Yeq+ovs9De2HlTLQZtAjzVZK2Op3RzObyBiCko=;
	b=YsF8mXDrPNKnr9JdTcsdjjKIVbf6WhWu7cCg6mujyRZWyEI2pMCSJN0AvhnvCrTJkO
	ll6W372Xcve6tVpZbcCAGW0cZFCZUCSxdm6Jtf7V3KFkuTdyEC75r2hWJ/1kbGs+PpzO
	gF2j/UhwZFncsT2yoRjp6NG7EXSjisY/ASsqM/okUzyRihfYAXWNfQ3xg30BdTK6JqHB
	R5q+HYCQLh4lH2je8qgwwhALbRmcjwSjjruD2r7X2+ifxW19JF8NvyRf76N3rY2V//Xy
	c3SM/56RCo7LkVqSE7fFfD1RCaVx/qxtulzRSt7nhSHb+pZI+latfwtzglBTIgqX6QDa
	4tRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aOpS2Yeq+ovs9De2HlTLQZtAjzVZK2Op3RzObyBiCko=;
	b=aIHbrP6MLmUbQJylwwjhEQybASuU23Rmc6JchmX1XdPH0Xk4JGSpijvLl2cO+CpVmV
	IoKNBOpXfp3AW/9q+dY7WRmD4A1gcV6SFfxdg+zwfTKnufZJGMQnGBIekECuIRiCqdld
	gEPFWXzx6ma6KC5e+qg414mbIYkKL2etcUdKGkWlsSLow1eIFb140KVTHPICxVZA1cpc
	J4/GIbEiQglq9+AFwyJedD8rTFQsRbKD6gk190TGaTDujdREjjeqB433gdpcvwKVaaPt
	kc+A2zmX5zfjKm+0A2htLEgC0QJcVkWXBYugq4+p6Q58KeVm4xO0WwaH7qadCQF5UOe9
	chTg==
X-Gm-Message-State: APt69E3GFblH0zEb8vuwgxLVPhGYnLXlilWQ4i4uKLBJtg7m+WtCoULP
	EJbvEPzVS2P/el8I2K30Z/IcaA==
X-Google-Smtp-Source: ADUXVKKil23BBYg3X1Tpp/Z6W0aN5Z7GGRVVPyCSgSuuVU/tvEsjsTQT6Bq4RbAqFsfp39nQdQyRJw==
X-Received: by 2002:a17:902:9a4c:: with SMTP id
	x12-v6mr2468132plv.213.1529075294831; 
	Fri, 15 Jun 2018 08:08:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	p1-v6sm13069521pfp.137.2018.06.15.08.08.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jun 2018 08:08:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2018 08:08:14 -0700
Message-Id: <e01f930a544e33f6ed0504e7cfac12e5da619fc3.1529075133.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1529075133.git.raj.khem@gmail.com>
References: <cover.1529075133.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] mesa: Enable gallium-llvm on x86 and x86_64
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
X-List-Received-Date: Fri, 15 Jun 2018 15:08:14 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/cairo/cairo.inc | 3 ++-
 meta/recipes-graphics/mesa/mesa.inc   | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 20e0d2c92a..7347f223ff 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -22,7 +22,8 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
 DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
-           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}"
+           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)}"
 
 PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
 PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index fa99f7d50c..d1723e3506 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -45,6 +45,9 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
 		   "
 
+PACKAGECONFIG_append_x86 = " gallium-llvm gallium r600"
+PACKAGECONFIG_append_x86-64 = " gallium-llvm gallium r600"
+
 # "gbm" requires "dri", "opengl"
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
 
-- 
2.17.1


