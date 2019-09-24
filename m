Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id CDAD37ED8E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:49:53 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id s17so272660plp.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4xFuagm9NZLbLgRnVMpfbAZixViikNBj1bz4h3MSzGE=;
	b=DgPFUUFCSpUrNy9M8ofbkzZW8SdvERSOGg09FEIXIiTNtrW3YhxBH6k+sUBuPbhgog
	FNM+XRzpxKkLsAdj5TG4hjY1PLfytK/pcLShvs9dUn58ys8Z/qafsBhGd4YBZxKwN1Nr
	J1+4bB8Clz8RtG3bJlO0Jk2yyacyPV/8YCmrADxMkSs3BIBzlelB2Kp02yQzA+/62tJA
	q/WdYDPnjHlJzEFn9M89f0L5v+QvFHjRbMGPzims5AKOD5H88yVsCbBsFZMr5/fzO14H
	vuwzm2E2TnfHyIxCSZAhCEUYXwsQ9SDTb4ggRjvAdP9AC+VD9DA3/HRvIwE6u5uUxFtt
	61eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4xFuagm9NZLbLgRnVMpfbAZixViikNBj1bz4h3MSzGE=;
	b=DXIrQHhMpcxk9myhCKT0AAoH+Fj5h/0VFybvaFbPT3I69y5AhtjuDEiSinaCFfOLJu
	dQK/IAtsZYK/BwCHFQ9FObtzzcXgFUUSKFEZaptiSgIhYceshLe0J86IhLT+o7tBgQG/
	TtRGWqy/IcCTT7ZqpaO1r16nR3QAFvKnngD03Yg1+qxXlZpb9mZJD2Ve2G3HKcymvkLa
	lDdnThOugIF7/WyhQkEeMVxoKXZY/Vx4M0VKga3n7xcgQCVL4jLXxjrsKlC857iHa+42
	X+bHqxnuTfjFc+z+5hfcTDZMBV0GwAjipH5sigtjcBo+GmQJqpqPbjsIkF2PwBGRxHYg
	Bv1g==
X-Gm-Message-State: APjAAAXQonrd9G6P03ZumG/52Pd03KIalWXb2Wk2oJ9fM5DE7H5udQ0V
	H5k58DqSZeyevhO1qdM3UfUlPxgWIKk=
X-Google-Smtp-Source: APXvYqwmgVZFS3aK0ZIqavY2hLkDymUYF6F705TOhrEWv6U06APhhH+RyYXkMinKeExF+i5YFqjkkQ==
X-Received: by 2002:a17:902:d882:: with SMTP id
	b2mr464028plz.131.1569293394726; 
	Mon, 23 Sep 2019 19:49:54 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.49.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:49:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:49:01 -0700
Message-Id: <77c8456f3e2f778161f4b51d4e276646d81d1c8c.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 21/50] mesa: Update 19.0.1 -> 19.0.8
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
X-List-Received-Date: Tue, 24 Sep 2019 02:49:54 -0000

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


