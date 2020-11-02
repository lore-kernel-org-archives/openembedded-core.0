Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.1232.1604335819297780513
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RyPDX9DY;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id dk16so19222035ejb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KfyqO71oJUPVVIOweNbtEQLKqbgTxKLECLdT5aSp7rs=;
        b=RyPDX9DYX1euPeDJtf546Hw5UCxu718jMO969UbmwAz0xo5/QSKb5JUMnNl5IAfWIq
         Dy1DYFbiKahU7SlqdPsqapD6wmB1Xc8nRAyeVbdtyWaopSNlBlG8+1EvMcBDynpKVhdy
         fIJN/hlV2I6HAPiqvqpBX+1GSlWi+FUvUIlCbKBVgBWErXqbh/dMDI0VaiOfLbJbSfu4
         47RoFDN6HlUBsprrICTRMq41si3JP1z07+SEfZR0ZP5WuTcJmUoqRmtoPX6MFnqLbhj4
         cg1pssr+RWhN+XeXfZG6E6WnHrNeWUNprOoBxsERB2LbcMUQyaZKDY3A6e90fJFq6L7m
         vJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KfyqO71oJUPVVIOweNbtEQLKqbgTxKLECLdT5aSp7rs=;
        b=OXgVAOQkDpe2DFLUp3C00Ue3SRFUnxA3ng+IYrmpgQ1h3Xs6A+0TIQbUwA6EAy774b
         9SVvTHxrZmuKrkGzKlUYoO3tISAp6lnrlRPI02ThsIlQFRA2OUmIPOE1o6rkt/19hy7E
         VqNpCKEkc7EBxCYrogRv4u/yH0SQo6bLr5Be7spmoPEDCIcTFGPHgNJB1d+uzCdZv1dI
         BC+uCRuomzzFh51ZDiZsom+fo0uTG/CvPouySpxcEkgWZg4qpQ9QyGToMieRALziraHz
         Gv2dZmvM2YTSWJtWjmN6Mi1IyacGNiTV0cliwQUyZia3Fm46Y/wfKiOcI9l1utczjiC/
         XLHw==
X-Gm-Message-State: AOAM53358u3Empzn4b2knsAo/pu3ch0+1SvuVQBbNlsn5eUxYO8pGxm+
	zqxUCj4UcoHVKhZe7xrAgRB6njLRT3r8og==
X-Google-Smtp-Source: ABdhPJyNOh1lXq3SPfVWMJIQGLE5jpGt5niKA2wL0ge3H2XBw/e7lgxrl5o2gXV+TqBLZdmsdj1AIQ==
X-Received: by 2002:a17:906:4803:: with SMTP id w3mr15618337ejq.406.1604335817558;
        Mon, 02 Nov 2020 08:50:17 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:17 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 67/80] alsa: upgrade 1.2.3 -> 1.2.4
Date: Mon,  2 Nov 2020 17:48:54 +0100
Message-Id: <20201102164907.27572-67-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport a patch to fix musl builds.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...8e5503980295dd8e5e54a6285d2d7e32eb1e.patch | 31 +++++++++++++++++++
 ...{alsa-lib_1.2.3.2.bb => alsa-lib_1.2.4.bb} |  5 +--
 ...f_1.2.3.bb => alsa-topology-conf_1.2.4.bb} |  2 +-
 ...m-conf_1.2.3.bb => alsa-ucm-conf_1.2.4.bb} |  2 +-
 ...s_1.2.3.bb => alsa-utils-scripts_1.2.4.bb} |  0
 meta/recipes-multimedia/alsa/alsa-utils.inc   |  2 +-
 ...lsa-utils_1.2.3.bb => alsa-utils_1.2.4.bb} |  0
 7 files changed, 37 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/ad8c8e5503980295dd8e5e54a6285d2d7e32eb1e.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.3.2.bb => alsa-lib_1.2.4.bb} (88%)
 rename meta/recipes-multimedia/alsa/{alsa-topology-conf_1.2.3.bb => alsa-topology-conf_1.2.4.bb} (84%)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.3.bb => alsa-ucm-conf_1.2.4.bb} (85%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.2.3.bb => alsa-utils-scripts_1.2.4.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.3.bb => alsa-utils_1.2.4.bb} (100%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/ad8c8e5503980295dd8e5e54a6285d2d7e32eb1e.patch b/meta/recipes-multimedia/alsa/alsa-lib/ad8c8e5503980295dd8e5e54a6285d2d7e32eb1e.patch
new file mode 100644
index 0000000000..98e2988dda
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/ad8c8e5503980295dd8e5e54a6285d2d7e32eb1e.patch
@@ -0,0 +1,31 @@
+From ad8c8e5503980295dd8e5e54a6285d2d7e32eb1e Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Thu, 22 Oct 2020 20:57:32 +0200
+Subject: [PATCH] dlmisc: the snd_plugin_dir_set / snd_plugin_dir must be
+ declared even for \!DL_ORIGIN_AVAILABLE
+
+Fixes: 8580c081c2 ("dlsym: add support for ALSA_PLUGIN_DIR environment variable")
+BugLink: https://github.com/alsa-project/alsa-lib/issues/91
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/dlmisc.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/dlmisc.c b/src/dlmisc.c
+index c9517c55..f20eb593 100644
+--- a/src/dlmisc.c
++++ b/src/dlmisc.c
+@@ -42,11 +42,9 @@
+ #ifndef PIC
+ struct snd_dlsym_link *snd_dlsym_start = NULL;
+ #endif
+-#ifdef DL_ORIGIN_AVAILABLE
+ static int snd_plugin_dir_set = 0;
+ static char *snd_plugin_dir = NULL;
+ #endif
+-#endif
+ 
+ #if defined(DL_ORIGIN_AVAILABLE) && defined(HAVE_LIBPTHREAD)
+ static pthread_mutex_t snd_dlpath_mutex = PTHREAD_MUTEX_INITIALIZER;
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.3.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb
similarity index 88%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.3.2.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb
index 1ed1a7b9a3..f38e8b94ff 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.3.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb
@@ -7,8 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     file://src/socket.c;md5=285675b45e83f571c6a957fe4ab79c93;beginline=9;endline=24 \
                     "
 
-SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "e81fc5b7afcaee8c9fd7f64a1e3043e88d62e9ad2c4cff55f578df6b0a9abe15"
+SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
+           file://ad8c8e5503980295dd8e5e54a6285d2d7e32eb1e.patch"
+SRC_URI[sha256sum] = "f7554be1a56cdff468b58fc1c29b95b64864c590038dd309c7a978c7116908f7"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.3.bb b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb
similarity index 84%
rename from meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.3.bb
rename to meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb
index 3575c460e4..aac4b48948 100644
--- a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "833f99b2cbda34e0cfef867ef1d2e6a74fe276bb7fc525a573be32077f629dff"
+SRC_URI[sha256sum] = "55e0e6e42eca4cc7656c257af2440cdc65b83689dca49fc60ca0194db079ed07"
 
 inherit allarch
 
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.3.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb
similarity index 85%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.3.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb
index 7be0df8856..da41c3db75 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "1bc24da04bb27a75e323c9f0fb03e44705b6bb8a8baf255b94b41d457d590d00"
+SRC_URI[sha256sum] = "2c3b535c77dcb9aaf62a61f4f8324f1ab184162f105f7ec9ed1e37c742fcd340"
 
 inherit allarch
 
diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.3.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.3.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb
diff --git a/meta/recipes-multimedia/alsa/alsa-utils.inc b/meta/recipes-multimedia/alsa/alsa-utils.inc
index b523a5a832..87eb55afbe 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils.inc
+++ b/meta/recipes-multimedia/alsa/alsa-utils.inc
@@ -21,7 +21,7 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "ff19ae48c22938de7a491bdb39db74a2eee2546013f39bf1a86185e426f921aa"
+SRC_URI[sha256sum] = "98ffc2d599de0577d423a48fa5f20a992ca0b82d812ed1f2e58ade49ac6da426"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.3.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.3.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb
-- 
2.29.0

