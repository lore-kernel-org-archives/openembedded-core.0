Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web11.17508.1590940433036953787
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rf/jAL5L;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id x1so6857080ejd.8
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CQTySVrZ2aFzXAI/4Z1o7MF2YDbb2lWopSdM9CN86Oo=;
        b=rf/jAL5LQOK0D3zh50yEj2u4EOqzHnb7RDE1Zb94DcZmimnYiWxTXpxunOTaKCbkih
         OSvckDQNzbPcsmBRCJuV1gJ/OwaUTfubmiQRlIKR3NGcQ6dd0aq9TBgVGxkKqXhyKAGi
         GZ857V6ZwC1vcXYjNXnb+7XbhW2ccYI9Ur+ftfDyFKH/pB66jDsyhpUUtWNJi1L0guYl
         VLv3LL7Kk1ArnvgbfKa5ZN6cZSKN4Jtz1fo+OlKmGNO6pZajyiLZHwjaq3gJYLzPL6l0
         XFKlPj7dYYIRfoAjwufVYD5oJvsZnUhvVs7UlKdbp5M00cTY83x7NgbYVr8rHvjMem5a
         kHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CQTySVrZ2aFzXAI/4Z1o7MF2YDbb2lWopSdM9CN86Oo=;
        b=tCdUNyotg9+MI+DrJ+EFx7lY59V7g6lHDuvHEJDF9hT68q56M3SmhyRGSC15vxuqcR
         K7EyHYFNxuFiSDdqX2Kktja/5OVlh8ER0M53IM/2Suz+sJudfZyx+3m0bS8KoGi2/ARs
         YIleYiRH1UhHwgEfA20tjPK2irvH0C0trQxvO78nqbpaKy8eFAybi8fhoiwihVuPz/Bx
         cbzeFrS/10mGAr8nVWMhpMQbgZT5GL/NBq9JYU4bXQ7WeJ0TxzHlz0ESvwApWmid7/dx
         Ir/+bLRt6nWs/3T3+zUaGTZjMA5b34VsIwYfNQkSq+vaeXuHGooknWVo3bz1Ru3H6W6M
         /t3A==
X-Gm-Message-State: AOAM531g2PkCLfSSkgXYqBoVraQig9kRE6JkYSao0h3G2URLxu7uA8QH
	pvCNt0xVoXrKWMsIZTvc7RBeI/qL
X-Google-Smtp-Source: ABdhPJw87wFq9MSBc7RN0dkj09NFMKcCLXat7D2k6KC4z6GLFncxTBUCRq1KwwXzOkcH2jEfsy5FRg==
X-Received: by 2002:a17:906:2e4c:: with SMTP id r12mr16655519eji.546.1590940431324;
        Sun, 31 May 2020 08:53:51 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:50 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 28/70] gtk+3: upgrade 3.24.14 -> 3.24.20
Date: Sun, 31 May 2020 17:52:12 +0200
Message-Id: <20200531155254.10283-28-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc             |  1 +
 .../gtk+/gtk+3/sort-resources.patch           | 19 -------------------
 .../{gtk+3_3.24.14.bb => gtk+3_3.24.20.bb}    |  7 +++----
 3 files changed, 4 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/sort-resources.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.14.bb => gtk+3_3.24.20.bb} (79%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 6154154004..e1ecf504a0 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -106,6 +106,7 @@ FILES_${PN}_append = " ${bindir}/gtk-update-icon-cache-3.0 \
 FILES_${PN}-dev += " \
                     ${datadir}/gtk-3.0/gtkbuilder.rng \
                     ${datadir}/gtk-3.0/include \
+                    ${datadir}/gtk-3.0/valgrind \
                     ${datadir}/gettext/its \
                     ${libdir}/gtk-3.0/include \
                     ${libdir}/gtk-3.0/${LIBV}/loaders/*.la \
diff --git a/meta/recipes-gnome/gtk+/gtk+3/sort-resources.patch b/meta/recipes-gnome/gtk+/gtk+3/sort-resources.patch
deleted file mode 100644
index 7f87372c52..0000000000
--- a/meta/recipes-gnome/gtk+/gtk+3/sort-resources.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-If the resources file isn't sorted in some way then libgdk.so will differ
-depending on the inode order of the resource files.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/gdk/Makefile.am b/gdk/Makefile.am
-index e25b57ba50..26f2d57c6e 100644
---- a/gdk/Makefile.am
-+++ b/gdk/Makefile.am
-@@ -465,7 +465,7 @@ stamp-gc-h: $(top_builddir)/config.status
- # Resources
- #
- 
--glsl_sources := $(wildcard $(srcdir)/resources/glsl/*.glsl)
-+glsl_sources := $(sort $(wildcard $(srcdir)/resources/glsl/*.glsl))
- 
- gdk.gresource.xml: Makefile.am
- 	$(AM_V_GEN) echo "<?xml version='1.0' encoding='UTF-8'?>" > $@; \
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.14.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.20.bb
similarity index 79%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.14.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.20.bb
index ab1f87c22e..e5744a4b05 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.14.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.20.bb
@@ -7,10 +7,9 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
-           file://sort-resources.patch \
-          "
-SRC_URI[md5sum] = "62e39212fa0a84016a3392a9d291faf8"
-SRC_URI[sha256sum] = "1c4d69f93ab884fd80c6b95115bfbc12d51ecd029178b6dad3672fdc5ff91e88"
+           "
+SRC_URI[md5sum] = "b302acc0a4b42e2980ef18628f9ce951"
+SRC_URI[sha256sum] = "2dac69f716e8d04ba7a95091589e2baaec95dcace932cb15839163db479b1df3"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.26.2

