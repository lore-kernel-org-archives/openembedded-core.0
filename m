Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web09.3941.1622101737475237239
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 00:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y/3VeEbE;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id j12so3066539pgh.7
        for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 00:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QfbNzSITNW2htIoyeklSoPGfnjDxH0/Gv7g04+7J0LM=;
        b=Y/3VeEbEzBsJMNor3ocVS2sQ+paXa+Q5RQlBcWR/GwswnD1neI69yh8hZE7MXQ3Bjg
         fXDbvkr4Vr/vPo4eigXF2RXMEpUX6iarA8FNoLGwoC7BX3HDBMPWdCr9LEghZxk1hwD2
         eTQlWm3A2vAY9zXcp437lKzj11Y9obV8ltNs5im2fej+qgSudw49hh6Gs8JsAm01IhUs
         Ust5mvG2BOxJti83U5ln9KMjwfVb8rulU0R0jiBdNNnPbxc6llZ4VepW+4z4OfhfXJ/U
         8zruURuU+9F2rsHVdkRN+jKJZYfgsBKvekEK46uUtGY2D9yLg3McqIc5jsNkguH3ZcuD
         ilHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QfbNzSITNW2htIoyeklSoPGfnjDxH0/Gv7g04+7J0LM=;
        b=W5IUV6e3ob4G2AKM39kMDIkGKGE/5oDlgmgRc+eJxF85CCqNi6tJxm/QsQh9VN8vuV
         hwJZXTLYtXgbJofsf5BFQMgOnYUcXPawFk9n/9q2wWfFKVS6Sg83GfZBFhCAYjAxZfu7
         P3ld4fKJ7GFavhL6zlsQYvBc+dvpkHBdCcbOAk51ViNOSf6E+/ztfN0EljksFEN4bqyR
         d6VfrssN8tsIylTdtDmecxuQWV/pWkZ8SnD6Z4/A9tslFG3EB9YLFHX/81mxwyyytIGI
         YYMb/+wxvcATj42NqzLaApXR3dujNcRs+0fuVmid5GCFPbBq+9GjAf/XgS8KGdDEG+rO
         pWLg==
X-Gm-Message-State: AOAM533Vsp5kxbVVh+GMR979yiRSOF5KT/2QHZdPyB5PTjwRGqeQeaKR
	F1m43LHNBNaScLuDxew7lOgUWxuwg5yzZA==
X-Google-Smtp-Source: ABdhPJxC7oylpnJfu7j0RId298hSLvYQHmUBru5vnEqbheu/bGdYhRArd22Scy+zZp2XqLOCBfi22g==
X-Received: by 2002:a63:1b09:: with SMTP id b9mr2519373pgb.354.1622101736638;
        Thu, 27 May 2021 00:48:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e64f])
        by smtp.gmail.com with ESMTPSA id mt24sm1195740pjb.18.2021.05.27.00.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 00:48:56 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] apt: Add missing <array> header
Date: Thu, 27 May 2021 00:48:52 -0700
Message-Id: <20210527074852.1532953-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This issue is seen with clang/libc++

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-aptwebserver.cc-Include-array.patch  | 32 +++++++++++++++++++
 meta/recipes-devtools/apt/apt_2.2.3.bb        |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch

diff --git a/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch b/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch
new file mode 100644
index 0000000000..cfee50c7a0
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch
@@ -0,0 +1,32 @@
+From f999aeb5ceb77b81c36e6a55300a521aaa2da882 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 26 May 2021 22:12:46 -0700
+Subject: [PATCH] aptwebserver.cc: Include <array>
+
+This helps getting std::array definition
+
+Fixes
+test/interactive-helper/aptwebserver.cc:36:55: error: constexpr variable cannot have non-literal type 'const std::array<std::array<const char *, 2>, 6>'
+   constexpr std::array<std::array<char const *,2>,6> htmlencode = {{
+
+Upstream-Status: Submitted [https://github.com/Debian/apt/pull/133]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/interactive-helper/aptwebserver.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/test/interactive-helper/aptwebserver.cc b/test/interactive-helper/aptwebserver.cc
+index 58ba54f84..0e030c7e9 100644
+--- a/test/interactive-helper/aptwebserver.cc
++++ b/test/interactive-helper/aptwebserver.cc
+@@ -22,6 +22,7 @@
+ #include <unistd.h>
+ 
+ #include <algorithm>
++#include <array>
+ #include <fstream>
+ #include <iostream>
+ #include <list>
+-- 
+2.31.1
+
diff --git a/meta/recipes-devtools/apt/apt_2.2.3.bb b/meta/recipes-devtools/apt/apt_2.2.3.bb
index ff9270c4b3..fe00fb03ca 100644
--- a/meta/recipes-devtools/apt/apt_2.2.3.bb
+++ b/meta/recipes-devtools/apt/apt_2.2.3.bb
@@ -13,6 +13,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-srvrec-Keep-support-for-older-resolver.patch \
            file://0001-cmake-Do-not-build-po-files.patch \
            file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch \
+           file://0001-aptwebserver.cc-Include-array.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.31.1

