Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.9573.1629636678233543328
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n6VvVp5s;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id e5so5227850wrp.8
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u5qayh5pMulYJ3KmfuTSJa5Sv0tbxoHY3Qna3/Ddlro=;
        b=n6VvVp5soCW8vPvj+3FYdY9WQgsBPzdit1lU+rmg1dksAuk7lPvCCOgsE7cj2cbkLx
         b7UoBM2nCkVR73BGq1mOsJJ5X6/gmcmMgcGYAfSuH22ciKuyXaklOtdsADyQ1SVsBW/T
         iPMjhMYbkjAeDZ1rq1vatqrsdAfN2Tr6BMum94CGB8I49Llvyakbc2wxYUQfR1IE1Pq/
         NpHJbPoALDA0LOg7vkT9BvlKqHzM8p5dqZMObVzGPIKhGIMWOBb5rX6LSQ5Ilm9JrFof
         l8pZiWhFeLXxmTE6aucJKECHaJApyKkxn9yxDayi9I926lzXTbpiRduv0ls6+rgwextW
         6Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u5qayh5pMulYJ3KmfuTSJa5Sv0tbxoHY3Qna3/Ddlro=;
        b=Lfx504Auvj4tN9GpO/brax/bJlmKqsHtOmjdrYcAFbfOpHnNdSsFA1lCG0wiWMpdTA
         yQ8+Z1tSfMLvZ/uNgZ7BbhFHc58dH4q3NCA8p5mbSVCGGj6v6Dwql7mEUt6RkcEvl4j5
         eqvfERG+MXB+59/3E57Ms4P54P0gj81AZNRXjaU+SqSXWylJjFCLBf7jhR41oJQYwXhQ
         olPRnS3aTle0PO6nL2MpVYLOof8GXk1Y5PyusJzw9atcG+up6GImBv3hL5cHZEZ1DhDL
         hsBp42kYRZ3+ttHOhUGo3TgenrCnMzDpvz5zF/Pg7EpxdY7WaoZeIDeEHBWqdI4clGEV
         FQEw==
X-Gm-Message-State: AOAM533GiOtKOBLBPoclxf5+ddo0R+GJIzeSSiJXjbhc1z3azJoZqaXB
	5Zupgig10Q4xEVrDylJMeriozx5RSq5wtw==
X-Google-Smtp-Source: ABdhPJybJdMKc0zB3sx/dm7guZ5gCYXTALIhdnHDVYzseAGsVOKOR6j7t577VTsx+nuBqzeBybsvKg==
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr2754516wrj.72.1629636676908;
        Sun, 22 Aug 2021 05:51:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:16 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/55] btrfs-tools: update 5.13 -> 5.13.1
Date: Sun, 22 Aug 2021 14:50:17 +0200
Message-Id: <20210822125103.310416-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop patch as issue fixed upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...x-error-for-undeclared-macro-on-musl.patch | 28 -------------------
 ...fs-tools_5.13.bb => btrfs-tools_5.13.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-fix-error-for-undeclared-macro-on-musl.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.13.bb => btrfs-tools_5.13.1.bb} (95%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-fix-error-for-undeclared-macro-on-musl.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-fix-error-for-undeclared-macro-on-musl.patch
deleted file mode 100644
index 251f5d2b0e..0000000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-fix-error-for-undeclared-macro-on-musl.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From a9802902d37b83c2c992cfe34179312f7209a962 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Mon, 19 Jul 2021 10:12:12 +0900
-Subject: [PATCH] fix error for undeclared macro on musl 
-
-Fixes the following compilation errors with musl that does not have
-NAME_MAX declared:
-'NAME_MAX' undeclared (first use in this function)
-
-Upstream-Status: Pending
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- cmds/filesystem-usage.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/cmds/filesystem-usage.c b/cmds/filesystem-usage.c
-index 50d8995e..856e9d7b 100644
---- a/cmds/filesystem-usage.c
-+++ b/cmds/filesystem-usage.c
-@@ -24,6 +24,7 @@
- #include <stdarg.h>
- #include <getopt.h>
- #include <fcntl.h>
-+#include <limits.h>
- 
- #include "common/utils.h"
- #include "kerncompat.h"
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.13.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.13.1.bb
similarity index 95%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.13.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.13.1.bb
index 5f8621faf1..5288978943 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.13.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.13.1.bb
@@ -19,9 +19,8 @@ DEPENDS:append:class-target = " udev"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            file://0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch \
-           file://0001-fix-error-for-undeclared-macro-on-musl.patch \
            "
-SRCREV = "de4914dbfd7e419d1c534b3d2ec8728e702114bf"
+SRCREV = "e4ac7d4f67b330a3b27a4a50f73e94b1e072ae56"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.31.1

