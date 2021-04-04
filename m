Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.47185.1617568756030242915
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Apr 2021 13:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OdUqV9ij;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id t24so1002500pjw.4
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Apr 2021 13:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/yMZY5xMZdf4vdZdQR8yYFsJquWrY1YhVPcpWGmjmhI=;
        b=OdUqV9ijkvw3TAk4hz9kf25/WlxfpDzyagkLys93lsh/NLadKf0Nu3V1jjoNz65qlC
         TWkqfVvVPAlHRpgg8wrijx0ZaAVF0Z+xlVJ7s4yks7oH++mbkWHUxy7Dwbn7BwRMhjIP
         hUbUDrx0Qz23OBmU+RTB78xyVewOJGS9XHJ7qKCs63d8oYLN5DIMwgD8s3eLG93k0TbA
         UMx9dHvkHr0N7SWfkE7PXE/WrhC7b9Kro4LnnEHmkF1NpFTLDKX5UBKE61RTIJU5Grev
         dKvZ91A2G4vN0v8eQBvZV6DBOy2F37OA0gFbTsO8v07tQ0vI7N3qM5P8MAiqiHdenndB
         nXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/yMZY5xMZdf4vdZdQR8yYFsJquWrY1YhVPcpWGmjmhI=;
        b=ptqnkfalNpbRu8eu66JqFGMwxrFViAcnGMsR47AAVLo049tuTe7iOkli6lYT/y/T9Z
         zy2shbJPQdeGWJZ4Lf4O3Wmv877fysJVCt/uIILAhRN8ZJvRRAHMFdpus7Vtg1QWYnin
         G9m0fi2ET+G9y5eebXPyujZEluqI0i5BeiUdYM2FC+b7X6yXpmhBwr9r+ksEaVBDKxwU
         2FnJMrjyAXvirsXvHYljqdtYVKtn3tz68HQLfLGml6KeZ6wEnmfSI9hJnMWmbmJ2DR9W
         Z0ghK6aJUWwMt53NYhDH7YvqVOduR1HHArlCqte7SxXDYa0eClkzRPPRL7zSTKmhxxSO
         7GIg==
X-Gm-Message-State: AOAM531qd9hsYS0JN8FmYABPWgOPMx58DExsl3kJsFA415j/i93G8fTS
	wI5z9091GvtUotDAfXWUvLmkmcWxJgoYxg==
X-Google-Smtp-Source: ABdhPJw33uaidyrwu2DdsCLauZn3+T8zgIP6GdGA2Vw3yGt+MxvNwFXqk6czuCk0O9hqzW6fb46jdQ==
X-Received: by 2002:a17:90b:e08:: with SMTP id ge8mr22857840pjb.130.1617568755360;
        Sun, 04 Apr 2021 13:39:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id o3sm13526750pjm.30.2021.04.04.13.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 13:39:15 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] webkitgtk: Drop include_array.patch
Date: Sun,  4 Apr 2021 13:39:12 -0700
Message-Id: <20210404203912.131774-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It has been fixed with another upstream fix
https://bugs.webkit.org/show_bug.cgi?id=198180

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkit/webkitgtk/include_array.patch          | 15 ---------------
 meta/recipes-sato/webkit/webkitgtk_2.30.6.bb      |  1 -
 2 files changed, 16 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/include_array.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/include_array.patch b/meta/recipes-sato/webkit/webkitgtk/include_array.patch
deleted file mode 100644
index 7268b04bf4..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/include_array.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Added missing include for std::array
-
-Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=197085]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- webkitgtk-2.24.0/Source/JavaScriptCore/assembler/PerfLog.cpp.org	2019-04-18 18:03:50.226231691 -0700
-+++ webkitgtk-2.24.0/Source/JavaScriptCore/assembler/PerfLog.cpp	2019-04-18 18:07:28.569153989 -0700
-@@ -31,6 +31,7 @@
- #include <elf.h>
- #include <fcntl.h>
- #include <mutex>
-+#include <array>
- #include <sys/mman.h>
- #include <sys/stat.h>
- #include <sys/syscall.h>
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.6.bb
index f5d55a2c6f..2912bc83a6 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.6.bb
@@ -16,7 +16,6 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
            file://0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch \
            file://0001-Fix-build-with-musl.patch \
-           file://include_array.patch \
            file://include_xutil.patch \
            file://reduce-memory-overheads.patch \
            file://0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch \
-- 
2.31.1

