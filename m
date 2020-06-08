Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.25227.1591602523376732950
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pXPH3Mmc;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id o15so17125123ejm.12
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UQI3DpmhYbADJByqM0loAyBNssm9ZxDRW9pXn0cOST0=;
        b=pXPH3MmcdyNvZF3yDZi2t1e2aM4fiMIvRu/TMnxylGToDQzCmW14r0EnRueF7gCeUx
         fo30/VpKhAQVNwKxMbhNSNWjkGBCHTtKoukgJpVvd8Gt8WkhisCR1Hc9niDvjxUUYfNv
         Mh+3li6QVB9hXg8bT0kwr4pKgiMjZKQ1joqcPZGfZVs6I8do5doKW+xovEfTKhS3itcZ
         5bHLU4Z0omvu99fQVJLKIem4r3WKZRMtrBz5HMhdZXAKPoIGGNA/tV/J1cA8SBgOJRIg
         lIHu7h56Fy/KofQw+OuSHeOWbhaMkaxCudAPZLurKHyQz3MkBrdwIVwZty5/jhamptaV
         eDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UQI3DpmhYbADJByqM0loAyBNssm9ZxDRW9pXn0cOST0=;
        b=qDat75RNrtIWN6FW+Y3KAQ1G2nbcLusLLuvxkpm1D4Y/2G/RBwGBjjZ+ew7Y9L6SSF
         o/kMVVIh7Db1qPiZEyh9K4nuBi3p7iIjv92rMBjb0JaRS6XjuTf9SyhIwa3v2SUFIMAT
         wS9V0KkHvCbBAb9OM/Fg1PKcUrJmDPFDVaNQ3DzVIr2/L3T1UpH3BYjs5l2N682nkZwg
         FSTWJ0z0UmKFl7ZUjICPn6Y8U/OKpFdIUO7JKOkbQKtxxaAkxzKVQdPK1hZw4lfcvCN4
         IoNeW+6T6k/p8vHnQHq6n1mjlsKoFr1XmYi2hEW5nG8ntvBXv4TFmnfp/PvpH67Xwa8T
         6hdw==
X-Gm-Message-State: AOAM5339KS9psiJHfTeJUztWrxFGDgFnY8LiQDlAA3Sltyn1Lab+KfAr
	O7F+dcSRqNqjKb3yK0pUGrAfIv7onAI=
X-Google-Smtp-Source: ABdhPJxKMICpzcw8lXRV9L+NyuSzcjiBQnH/cuIKj/msQkaR3cdSV71iyKRzrG98KBFK8WqHc32RxA==
X-Received: by 2002:a17:906:1c4a:: with SMTP id l10mr18579370ejg.499.1591602521617;
        Mon, 08 Jun 2020 00:48:41 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:40 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 32/42] iproute2: upgrade 5.6.0 -> 5.7.0
Date: Mon,  8 Jun 2020 09:46:49 +0200
Message-Id: <20200608074659.7051-32-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-devlink.c-add-missing-include.patch  | 23 +++++++++++++++++++
 .../{iproute2_5.6.0.bb => iproute2_5.7.0.bb}  |  6 ++---
 2 files changed, 26 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch
 rename meta/recipes-connectivity/iproute2/{iproute2_5.6.0.bb => iproute2_5.7.0.bb} (61%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch
new file mode 100644
index 0000000000..f9580b7d44
--- /dev/null
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-devlink.c-add-missing-include.patch
@@ -0,0 +1,23 @@
+From 5df629d825df4ccc4283228bc0739da126326072 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Sat, 6 Jun 2020 18:00:13 +0000
+Subject: [PATCH] devlink.c: add missing include
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ devlink/devlink.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/devlink/devlink.c b/devlink/devlink.c
+index 16602ab..c278e6d 100644
+--- a/devlink/devlink.c
++++ b/devlink/devlink.c
+@@ -26,6 +26,7 @@
+ #include <libmnl/libmnl.h>
+ #include <netinet/ether.h>
+ #include <sys/types.h>
++#include <signal.h>
+ 
+ #include "SNAPSHOT.h"
+ #include "list.h"
diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.6.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.7.0.bb
similarity index 61%
rename from meta/recipes-connectivity/iproute2/iproute2_5.6.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_5.7.0.bb
index 9ab9053739..276afeab11 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_5.6.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_5.7.0.bb
@@ -2,10 +2,10 @@ require iproute2.inc
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
-          "
+           file://0001-devlink.c-add-missing-include.patch \
+           "
 
-SRC_URI[md5sum] = "9da0c352707c34b8b1fec3bf42fcfd09"
-SRC_URI[sha256sum] = "1b5b0e25ce6e23da7526ea1da044e814ad85ba761b10dd29c2b027c056b04692"
+SRC_URI[sha256sum] = "725dc7ba94aae54c6f8d4223ca055d9fb4fe89d6994b1c03bfb4411c4dd10f21"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.26.2

