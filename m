Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.663.1622735011430330162
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 08:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bzmZyGTC;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id t3so7658200edc.7
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 08:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IRF4sRjllsteMV0ie2LxJr3836TlP82NTQLswnsh8as=;
        b=bzmZyGTCVR22uzGeG8ybdaiy8BfjhVK9na1V6U4EGP6+HfFdCBtgxiIDr4Kua0ZC8C
         WUvSrDvwHVMdlbZZteXASPy7/jjlObu2cEyhCefo4BCjKMeTnzUgtCJZNzl8JdeqkKdq
         3Wy0P70752cnR+U0M3GXjJAaopeaFHZcdsLpnmGiWMDZVR1RYKAtF7iI0C87lN6X6lWs
         ah8PZXe7qAT0aBSBFSGC640KAfGmId9QRQEeg0tFAgB/7N2vo6K2w+1V2CAOi2JXux7f
         O2oi5fWSbjB9H342cIYjBWdEX+ZP4pW64/BXm5nzpj/msK0NxLuZ8Kbyv+pMpxCPI24N
         pXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IRF4sRjllsteMV0ie2LxJr3836TlP82NTQLswnsh8as=;
        b=aOxt0/9PP4i/TslzMr+F5hUGjL39kQjK99tBtvY6xy6yXLpU2zxhj3WbwDnbBQMo4m
         2E9FFXviylFFNEYejd7FevLfMh/SCSppsk6AeWpdzACggcUTjs7hrG8/sHzDVxH/g8qA
         U1ZSdAjp72jBo7IXWcJzcNspWKUR+ToPjKtX6/P27/90vYS7zffWwEvLNKAn2vgI770D
         Ej5HgW7TaBr4GlrUn8qaxuuRQE1dy8Xt6X5MCikonZj1W0zOEfG4yPTH84YTZJ3Bs4wh
         VUBPhw+7Pym+UpD25pCAPvcts8oYxTnzwmfNpMZqblyd7BzjJy4HxI2R6ihFzq61YOW5
         ziNA==
X-Gm-Message-State: AOAM531LAjDi/4FTWcIhkncpQKXBJ30UI/+SQ5EPSUeQZKfz5/A7sBjk
	hIgiVuSSMiSJspZ6ZNp82MITgZYW5cb+2A==
X-Google-Smtp-Source: ABdhPJyHbQ6N2FpqPHYNwGZcjpsvPtGfV6ckcj5mwnz7dApxjIY34z4KQybavcBXm/dEfv0UghIp+w==
X-Received: by 2002:aa7:d558:: with SMTP id u24mr82298edr.331.1622735010041;
        Thu, 03 Jun 2021 08:43:30 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f11f861d707ea86d7bc33dd.dip0.t-ipconnect.de. [2003:f0:7f11:f861:d707:ea86:d7bc:33dd])
        by smtp.gmail.com with ESMTPSA id d17sm1644338ejp.90.2021.06.03.08.43.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 08:43:29 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] alsa-utils(-scripts): upgrade 1.2.4 -> 1.2.5
Date: Thu,  3 Jun 2021 17:43:13 +0200
Message-Id: <20210603154313.2894136-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603154313.2894136-1-schnitzeltony@gmail.com>
References: <20210603154313.2894136-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

See changelog at [1]

[1] https://github.com/alsa-project/alsa-utils/releases/tag/v1.2.5

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...s_1.2.4.bb => alsa-utils-scripts_1.2.5.bb} |  0
 meta/recipes-multimedia/alsa/alsa-utils.inc   |  5 ++-
 ...lsa-utils_1.2.4.bb => alsa-utils_1.2.5.bb} |  0
 ...limits.h-explicitly-to-fix-build-on-.patch | 37 +++++++++++++++++++
 4 files changed, 40 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.2.4.bb => alsa-utils-scripts_1.2.5.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.4.bb => alsa-utils_1.2.5.bb} (100%)
 create mode 100644 meta/recipes-multimedia/alsa/files/0001-utils.c-Include-limits.h-explicitly-to-fix-build-on-.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.4.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb
diff --git a/meta/recipes-multimedia/alsa/alsa-utils.inc b/meta/recipes-multimedia/alsa/alsa-utils.inc
index f2e8133d2c..a017b02faf 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils.inc
+++ b/meta/recipes-multimedia/alsa/alsa-utils.inc
@@ -23,8 +23,9 @@ PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev
 PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
-SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "98ffc2d599de0577d423a48fa5f20a992ca0b82d812ed1f2e58ade49ac6da426"
+SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2 \
+           file://0001-utils.c-Include-limits.h-explicitly-to-fix-build-on-.patch"
+SRC_URI[sha256sum] = "09970af05838b30001ca93ba27cb85b24c45056c70a80066c3ece6abe5a19997"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.4.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb
diff --git a/meta/recipes-multimedia/alsa/files/0001-utils.c-Include-limits.h-explicitly-to-fix-build-on-.patch b/meta/recipes-multimedia/alsa/files/0001-utils.c-Include-limits.h-explicitly-to-fix-build-on-.patch
new file mode 100644
index 0000000000..445f3ecade
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/files/0001-utils.c-Include-limits.h-explicitly-to-fix-build-on-.patch
@@ -0,0 +1,37 @@
+From b20cb6ef5e3f331181b93e39293602ad2c774af8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Thu, 3 Jun 2021 16:07:10 +0200
+Subject: [PATCH] utils.c: Include limits.h explicitly to fix build on musl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+| ../../alsa-utils-1.2.5/alsactl/utils.c: In function 'snd_card_clean_cfgdir':
+| ../../alsa-utils-1.2.5/alsactl/utils.c:309:19: error: 'PATH_MAX' undeclared (first use in this function)
+|   309 |         char path[PATH_MAX];
+|       |                   ^~~~~~~~
+| ../../alsa-utils-1.2.5/alsactl/utils.c:309:19: note: each undeclared identifier is reported only once for each function it appears in
+
+Upstream-Status: Submitted [https://github.com/alsa-project/alsa-utils/pull/92]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ alsactl/utils.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/alsactl/utils.c b/alsactl/utils.c
+index 881b505..1a4896b 100644
+--- a/alsactl/utils.c
++++ b/alsactl/utils.c
+@@ -30,6 +30,7 @@
+ #include <syslog.h>
+ #include <sys/stat.h>
+ #include <sys/mman.h>
++#include <limits.h>
+ #include "alsactl.h"
+ 
+ int file_map(const char *filename, char **buf, size_t *bufsize)
+-- 
+2.31.1
+
-- 
2.31.1

