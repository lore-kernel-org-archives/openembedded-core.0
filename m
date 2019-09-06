Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id C30127F3AD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 11:18:13 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id u16so6196384wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 04:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QjRzCAEyKQNjQqgmpD0p9+Z0hGmJdhTYNJ5uzjWJJtU=;
	b=hmL0+CyPsSQioJqNQDXqr7SypaBxDcWdR2++4zgOF2Bcde8Ezc2k/UW+duXh9Lv6hs
	0nlO2AjxSjinsLaBfKaI3J4j+LoqHL3zruiN/dPOT/VZ84pBhAZEoEaBnSEYqfUT6BiP
	LNxxzIowonXTEXOGDsCUdPrCIgrgu7l5U8FEY8ze0mkEZK/0kgcXopuWQqJsqC8VXnDS
	Cqi62g8IDS1n6eyXvxqH4yqbgFxuw+V63wxA1K9bYxNGDqiGO6f84TgrgeDLCt/eJsZb
	6LBzLW42aGSiSv2yBmS1uK/5mlTrkH9T9bw0lDKIgfqDavlPvunY61Mcp6KESt9uaCjC
	RutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QjRzCAEyKQNjQqgmpD0p9+Z0hGmJdhTYNJ5uzjWJJtU=;
	b=HgbO6MiVr/h0HbDUPEOL8Y98oRfV4qWMIS9hONawKv2JPN0Nv5EbnbXISqfmt9axV+
	6YwNYb2daP4jv8fPSUjjuAN+hOrBJzJ5FwASl+ME9xfIckFwQzpwoL9kzsoZteNRWylg
	By0gwQd5D4mJmd6bbvK9dYbdrN31S9sF+J94vKoliPrLOHWykW9DM/30jOBU8f8WgGIi
	niSckzfA7ZvXCsIYyGoZ2qeQaZIv2CnbytICNZw85PZtlaqPjOj1SxtEUmwtMwSjI/e0
	3aL6SPqvUy7gorftUkuVDZRB0vfGMZtVBXOpiZY11v9vtf5gADyXOkOWW6XjzZMVpdA8
	wm/Q==
X-Gm-Message-State: APjAAAXarQzHo47q6i4R/zHBuP+xDSgDPDTST1xXXfH9pl6WGkRDmBJ+
	hV0vj91v2aWfyXd3F6GQviJN//jH
X-Google-Smtp-Source: APXvYqwOHOcV9rhJ9l6X5Yt/jZPmTZVu0WA3l1iXXXj4lzP3QUu3H91SFVD77fStJpXzCIZy8Sa9uQ==
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr7165839wrr.75.1567768694077; 
	Fri, 06 Sep 2019 04:18:14 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	q15sm4659730wmb.28.2019.09.06.04.18.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 04:18:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2019 13:18:02 +0200
Message-Id: <a78c3992b26c73393f8afd018ce59f5a3c210b7e.1567765705.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1567765705.git.alex.kanavin@gmail.com>
References: <cover.1567765705.git.alex.kanavin@gmail.com>
Subject: [PATCH 2/5] libsdl2: enable opengl option for native/nativesdk, subject to 'opengl' in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 06 Sep 2019 11:18:14 -0000

This allows virgl support in qemu with the SDL frontend

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
index 3a0654b866b..0d8d724374e 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
@@ -40,8 +40,8 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
 # and BSP layers to pick either (desktop) opengl, gles2, or no GL
 PACKAGECONFIG_GL ?= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
 
-PACKAGECONFIG_class-native = "x11"
-PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG_class-native = "x11 ${PACKAGECONFIG_GL}"
+PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} ${PACKAGECONFIG_GL}"
 PACKAGECONFIG ??= " \
     ${PACKAGECONFIG_GL} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11', d)} \
-- 
2.17.1


