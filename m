Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.7507.1625811501254822597
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jul 2021 23:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TnisxKhp;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id a14so4477575pls.4
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jul 2021 23:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LRmfIFPU6S1yLEHiYbVBcZkId8DBWM9P42uIKRxrsPU=;
        b=TnisxKhpqfjoR8jFocGvBRmLh2VmWuEvJej7qSDkay+sVgAOBNwybV56vmLwVQ+gW+
         JVgWbeD0swyyuViuf7AbgauKQz7fxsY30Y5AobTwGRmzf0WN53FEWpF4pOyuY2A4zCI5
         2cY9odJhNCCJLYg7OwUwc5iJEBg/qkIJM3eZLZfbdoyjLV9/zhRhmPr6oc5Ya8EQTS5p
         vJkFhciJoHZYSCwB3vSHLmaJfp9FU3RYfWvYHZP0lvB6yikRZDgk62oZlKnMgWJ5QgKI
         RHP9VH3Lnx30tUTsvUQAbYaJBbm2d4ILReo8cAxcG7YIhP+s1UnQBBalfYL5XYQnqsd0
         gQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LRmfIFPU6S1yLEHiYbVBcZkId8DBWM9P42uIKRxrsPU=;
        b=TPEN/rEwGvyEAdU7+c1JlYv78Kz0bS1j/jyLc5vVACJnJYZJbDYrQQgDk2YKVtOlPo
         XJK/xYAoKoUdMzcKu0XFwcc+ori/nCtrIWS43W59ipQqom8Zqq9SCnEqe/pwgaoXEdSZ
         o1FNZ81bKlDd7wWs7cygXTCoOUvX7bcJiP2/2NC3OyVlIZKcuv5dFf+OuPdcQ9E9CVeb
         7L18iFFnQPg03FTcH8Od6L2TLmQGT5oexvvWE6JhWocgsPfHWkgbvJnj/cP5KnjdUdAd
         kfbGTdVkyGzv4cP1Ktw/NvsyyEflKHy/sDXV2Dw7mpg3iUpFYLiy1FUz/XqVv+Tead40
         mMiA==
X-Gm-Message-State: AOAM532P58kyTG/pPoJK0pNaidNN0lSuA9jCSTakiJizv7TCRzvx6een
	UdJBkcyAovCNvDyRlaa5SV+g3KpoNwFuiQ==
X-Google-Smtp-Source: ABdhPJwAWL0AelkVJX+a1lFPaDr5KP9lT7Yxg/lMagb7fYv3rSd5V7HK7eMIcozzydRqwgpXKtnsMw==
X-Received: by 2002:a17:90b:4c12:: with SMTP id na18mr6565480pjb.157.1625811500544;
        Thu, 08 Jul 2021 23:18:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1c2d])
        by smtp.gmail.com with ESMTPSA id gi20sm11648005pjb.20.2021.07.08.23.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 23:18:20 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] gnome-desktop-testing: Fix non-literal format string warning
Date: Thu,  8 Jul 2021 23:18:17 -0700
Message-Id: <20210709061817.3055963-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709061817.3055963-1-raj.khem@gmail.com>
References: <20210709061817.3055963-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes build with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...teral-format-string-issue-with-clang.patch | 31 +++++++++++++++++++
 .../gnome-desktop-testing_2021.1.bb           |  4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing/0001-fix-non-literal-format-string-issue-with-clang.patch

diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing/0001-fix-non-literal-format-string-issue-with-clang.patch b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing/0001-fix-non-literal-format-string-issue-with-clang.patch
new file mode 100644
index 0000000000..39efa4a463
--- /dev/null
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing/0001-fix-non-literal-format-string-issue-with-clang.patch
@@ -0,0 +1,31 @@
+From df625a36be8e0c7afa68b3dd23907dc7d658c59a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 8 Jul 2021 23:13:30 -0700
+Subject: [PATCH] fix non-literal format string issue with clang
+
+clang errors out when using -Werror=format-nonliteral
+since the definition of g_strdup_vprintf() from glib-2.0
+is using va_list and clang seems to still warn where as
+gcc doesn't do that for va_list arguments
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gnome-desktop-testing/-/merge_requests/9]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/gnome-desktop-testing-runner.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gnome-desktop-testing-runner.c b/src/gnome-desktop-testing-runner.c
+index d75b71c..da49e14 100644
+--- a/src/gnome-desktop-testing-runner.c
++++ b/src/gnome-desktop-testing-runner.c
+@@ -74,7 +74,7 @@ static const char * const test_log_message_ids[] = {
+ static gboolean opt_quiet = FALSE;
+ static gboolean opt_tap = FALSE;
+
+-static void
++static void G_GNUC_PRINTF (3, 0)
+ test_log (TestLog what,
+           const char *test_name,
+           const char *format,
+--
+2.32.0
diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
index b82eb8af2e..10200f539f 100644
--- a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
@@ -9,7 +9,9 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://src/gnome-desktop-testing-runner.c;beginline=1;endline=20;md5=7ef3ad9da2ffcf7707dc11151fe007f4"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/gnome-desktop-testing.git;protocol=http"
+SRC_URI = "git://gitlab.gnome.org/GNOME/gnome-desktop-testing.git;protocol=http \
+           file://0001-fix-non-literal-format-string-issue-with-clang.patch \
+          "
 SRCREV = "e346cd4ed2e2102c9b195b614f3c642d23f5f6e7"
 
 DEPENDS = "glib-2.0"
-- 
2.32.0

