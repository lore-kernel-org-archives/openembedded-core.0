Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web08.33752.1612781980881379249
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 02:59:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VT0XNEJq;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id jj19so23907609ejc.4
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 02:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SZUyP1fVtx6lpItbIRVDFg6v7enle1T5knC4QJKPg8E=;
        b=VT0XNEJqZ0bS8bJg7UhK6n6Zm6PLYfr554wycFxeMWaJsrJRJPSpkG128BI3nTiKni
         KnupVBkPwtFZ19OJ/GYxuBwixxTiwxk3u8/VNJ8w492w4YYOun1U0yw8FBp8wOE2F8RL
         02mq/TKyLMFwQQxHdaIBpT84Eh/TzVaE3q1EBU5icp3isdwOF5jJxAjTq1GOULvZ+I/e
         9qqlyOinF65CGDG+y7OyW6jclZyIiqN9OYQPDulNdDA2k0wGOEk5QpPFLEYhdsjJyu42
         PJgk3LcQg6a3wX1Rkl+X64ZaMEupZZYwtMylQR+IMN9MPi+zR3sVzToYA4tw9REA6k21
         uY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SZUyP1fVtx6lpItbIRVDFg6v7enle1T5knC4QJKPg8E=;
        b=X9pdm5H7mernLZEST20fRLlfVyKpXgXWlWl2JWNLKcqANrGUhMlB0Et0MsTZwRl/Wv
         hmPCCCjWtpbLs9gBr6NfLXhee3OfF6FT7Ui6IILJ0aZ0oUIYDTQ/n4lOEnWdq7JkxlPy
         65Ujzn2CZwnE6+QweZBwmDRju2PRKj+ZOXWzXfvrz8MZORB72KHnvDGzYf6iAyFOLqw7
         1ryp3YN0OMNjXZl4QC/ntdI0gpY553VK01UKvXkWBrMMtPED8U3j8cyG87ZQ9F703UMf
         nFcDIx3EyXdWt9o6+OFgNfpPX50xFbOKqG/Wt7F36uYQmDwKs29O2yvtMKxa1lQoM9NH
         xY9A==
X-Gm-Message-State: AOAM5328meSK/YTUl4LbYKli11VwwoHKlNPdT4DGFJI0Sd8cMpb8YEr3
	Ztb4bcFVnYZaykkK+IWSW095YI/KFkTBfA==
X-Google-Smtp-Source: ABdhPJxNn33U62lzIKzhXs3pi9C/So1tyfeo6TwhghaEDwMUh364qOyaJI2KM2zE/xNnKU4V378aug==
X-Received: by 2002:a17:906:52c1:: with SMTP id w1mr16588245ejn.214.1612781979426;
        Mon, 08 Feb 2021 02:59:39 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id t19sm8382226ejc.62.2021.02.08.02.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 02:59:38 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/12] gptfdisk: update 1.0.5 -> 1.0.6
Date: Mon,  8 Feb 2021 11:59:22 +0100
Message-Id: <20210208105932.347925-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208105932.347925-1-alex.kanavin@gmail.com>
References: <20210208105932.347925-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-gptcurses-correctly-include-curses.h.patch        | 7 ++++---
 .../fdisk/{gptfdisk_1.0.5.bb => gptfdisk_1.0.6.bb}         | 3 +--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/fdisk/{gptfdisk_1.0.5.bb => gptfdisk_1.0.6.bb} (89%)

diff --git a/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correctly-include-curses.h.patch b/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correctly-include-curses.h.patch
index 67689e838a..266afbfa11 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correctly-include-curses.h.patch
+++ b/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correctly-include-curses.h.patch
@@ -1,23 +1,24 @@
-From 607b0bed5e8a5f5c3754cd6ffcf499d8134c37f9 Mon Sep 17 00:00:00 2001
+From 6bc6e867c5b3a774c0d7819ee5a3d2885e97caa9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 30 Mar 2020 17:11:19 +0200
 Subject: [PATCH] gptcurses: correctly include curses.h
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  gptcurses.cc | 4 ----
  1 file changed, 4 deletions(-)
 
 diff --git a/gptcurses.cc b/gptcurses.cc
-index 1b18cf2..4ebfde1 100644
+index 71aa734..4ebfde1 100644
 --- a/gptcurses.cc
 +++ b/gptcurses.cc
 @@ -23,11 +23,7 @@
  #include <iostream>
  #include <string>
  #include <sstream>
--#ifdef __APPLE__
+-#if defined (__APPLE__) || (__FreeBSD__)
  #include <ncurses.h>
 -#else
 -#include <ncursesw/ncurses.h>
diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.5.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.6.bb
similarity index 89%
rename from meta/recipes-devtools/fdisk/gptfdisk_1.0.5.bb
rename to meta/recipes-devtools/fdisk/gptfdisk_1.0.6.bb
index c7850f03ca..3f331e2dc5 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.5.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.6.bb
@@ -9,8 +9,7 @@ DEPENDS = "util-linux"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-gptcurses-correctly-include-curses.h.patch \
            "
-SRC_URI[md5sum] = "58dac67c85e46ca87b587231549aefe6"
-SRC_URI[sha256sum] = "0e7d3987cd0488ecaf4b48761bc97f40b1dc089e5ff53c4b37abe30bc67dcb2f"
+SRC_URI[sha256sum] = "ddc551d643a53f0bd4440345d3ae32c49b04a797e9c01036ea460b6bb4168ca8"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/gptfdisk/files/gptfdisk/"
 UPSTREAM_CHECK_REGEX = "/gptfdisk/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.29.2

