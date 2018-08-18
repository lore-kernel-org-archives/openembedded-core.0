Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id C6D4B79209
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2018 19:25:45 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id y4-v6so4962756pgp.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2018 12:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3nYzkTML3LkpTfybUutNp2wAEPbS1wOSwsfnGtdBfv4=;
	b=pmZcOu1QpsswGIM7Zwo60kViY+MoO51g7hTj7VBYctQYhPG+WE7Ze3aqCVSiiFQyUr
	LvmonB3GSiBtZsxwiZwqBNQuWBCGn+qAaRiC/ST8i8QylavWNp25pj4GsCs730BUcsmZ
	UHeEVHtOACmFBSBuJ7QNKcCfSLDOXDCdNsNPQaBwswk5bpJswonfuZyDxOsi3WlwafnP
	ZNhwAELxkkBdI2f7ol6YO9gLUb9cAfGvuKvpVocoFIjc5yZRsxy1IcC1zEsc/cCZUTW0
	MXzsHaTdHq05A2P8ux8lOaSjCAvC8kKtAKGp/FFTfAJVVhW/UfkHJqYr4taLGLnKpy6g
	t5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3nYzkTML3LkpTfybUutNp2wAEPbS1wOSwsfnGtdBfv4=;
	b=grljHKk26jT/isPiJzxTG4LJlDyp4jHLreOmZGVDEnWcJq3PdIK1hmfbpPwOLv/6aC
	Jiyk6q9y95nQBGrcSDWoISWfaU1r4w70LUFPs42z1rd1FSiMdQxnMNY1pVt1rpONN+rp
	HSshyyrS1L0zKz5rrlWkNa+dmw9FD+3xigR1bpLzDgXx/wbpUMWrhDWSYfryZ+PW3sbq
	6Qi4v0Rl7lMa0b+Pnve2HUyNjCas+S7TjWaLiTsDmKbLs/DyKq6EkwBhnzAVJq9Gu7J9
	QPkDSj1KRZPYObtIR9dnIji8B78I4PXN+R2dvPe61Ac6Le2pOPhXJGXdKYfnYvT9Afpk
	us8Q==
X-Gm-Message-State: AOUpUlG+Qk2q/BjMeoXab9bjf1151sH4f81lCFR14AMIuX5FjuBi/YpG
	gI9E1zA1Sr1SQvSt7HV1/VIJBN0m
X-Google-Smtp-Source: AA+uWPwrmuAkCZTss+Q2Jl4y5a01hsIJJo7WLJPnx/MjY/Vd8+YC3PFgtWPhOJW1TliiE4n4E73bjA==
X-Received: by 2002:a63:4a61:: with SMTP id
	j33-v6mr37585907pgl.436.1534620346495; 
	Sat, 18 Aug 2018 12:25:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	k64-v6sm6723068pgd.47.2018.08.18.12.25.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Aug 2018 12:25:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Aug 2018 12:25:33 -0700
Message-Id: <fd71511579cd19139560a803c40d4537072e537d.1534620189.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1534620189.git.raj.khem@gmail.com>
References: <cover.1534620189.git.raj.khem@gmail.com>
Subject: [PATCH 1/6] mesa: Enable gallium-llvm on x86 and x86_64
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
X-List-Received-Date: Sat, 18 Aug 2018 19:25:45 -0000

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
index 6aedeee9dc..2671d4de4d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -47,6 +47,9 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
 		   "
 
+PACKAGECONFIG_append_x86 = " gallium-llvm gallium r600"
+PACKAGECONFIG_append_x86-64 = " gallium-llvm gallium r600"
+
 # "gbm" requires "dri", "opengl"
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
 
-- 
2.18.0


