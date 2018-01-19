Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8F99A787AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 15:54:40 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id c2so4852951qtn.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 07:54:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=wp+SuweLgW8lWkWko+VtIYTdHQhvxPElFXj1TIsFJNs=;
	b=MCDoKvOCk2MawS//IRw7WBZS5GW26xeRrmwhJBxFzHJTEOlwX/iMhqVgMtAOaAsvnr
	p3Gcws1QFNMj3KeSIKBL+iPu7OZNdtS8MTU9CGAipQ/28xVBc9/9CiUCc5C9739chvop
	XKZuhNRHumC5W2mdAunUkBH5lMkjPKND1gGitraR71tOYya894bkPlnfMewbsgEXD492
	ZwXDXAWwwX3hyo/Yn4g9H4JYKh7nn/WjlJJUSWONp4Ah/uEIXjZrnbLiL8vhkGdYX8Uj
	vdrHkJ7IYNXdoYGc0uX9T90LU5aA1n/Mlj9O9ynp+HxJK+l1o+WIqyTH+UjqHgd8qGvO
	WU6w==
X-Gm-Message-State: AKwxytcXmrVpH9C5rvvyr0juZ8y6wcjkO8EE9WhEclsun/Yj2N0822y4
	eEl+5Tce7Byfme7SvS00Jq4KmQ==
X-Google-Smtp-Source: ACJfBovmF6JVB6JiUR0vIh6N3Tb+nryNhMu4nyNOPaJv0x4lqkf9fNqT5p16BuYxRjDMHics9zP1/Q==
X-Received: by 10.200.51.42 with SMTP id t39mr43626046qta.33.1516377280966;
	Fri, 19 Jan 2018 07:54:40 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	x135sm6700499qkx.93.2018.01.19.07.54.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 19 Jan 2018 07:54:40 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 19 Jan 2018 13:54:33 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jan 2018 13:54:32 -0200
Message-Id: <20180119155432.20848-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mesa: Upgrade 17.3.2 -> 17.3.3 release
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
X-List-Received-Date: Fri, 19 Jan 2018 15:54:40 -0000

The 17.3.3 release, published in January 18th, 2018. It fixes a number
of issues since 17.3.2 release.

The release notes can be seen at:

  https://www.mesa3d.org/relnotes/17.3.3.html

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/mesa/{mesa-gl_17.3.2.bb => mesa-gl_17.3.3.bb} | 0
 meta/recipes-graphics/mesa/{mesa_17.3.2.bb => mesa_17.3.3.bb}       | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_17.3.2.bb => mesa-gl_17.3.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.3.2.bb => mesa_17.3.3.bb} (88%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.3.2.bb b/meta/recipes-graphics/mesa/mesa-gl_17.3.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.3.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_17.3.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.3.2.bb b/meta/recipes-graphics/mesa/mesa_17.3.3.bb
similarity index 88%
rename from meta/recipes-graphics/mesa/mesa_17.3.2.bb
rename to meta/recipes-graphics/mesa/mesa_17.3.3.bb
index c2143ad32d..6e3f29a2c4 100644
--- a/meta/recipes-graphics/mesa/mesa_17.3.2.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.3.3.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-anv_icd.py-improve-reproducible-builds.patch \
            "
 
-SRC_URI[md5sum] = "5c59b779925f504ffd0f13c7dcd29ac6"
-SRC_URI[sha256sum] = "e2844a13f2d6f8f24bee65804a51c42d8dc6ae9c36cff7ee61d0940e796d64c6"
+SRC_URI[md5sum] = "139b5f608b371c0d4395596162f88791"
+SRC_URI[sha256sum] = "41bac5de0ef6adc1f41a1ec0f80c19e361298ce02fa81b5f9ba4fdca33a9379b"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.16.0


