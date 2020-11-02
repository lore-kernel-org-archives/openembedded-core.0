Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web08.1147.1604335767420670535
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kQiIo1wk;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id o18so15055646edq.4
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H3TeArNlhhhr4RYfX/b2WYkhBk+medX2JFlSXaDsMVA=;
        b=kQiIo1wkrs0OzsLbzLTYXwQen3F608nEcH5+nR2QGwVexfwK5pF5SLa3N+R5wIruxy
         Jbdm42BdmeLzCq3xqsNEkmrpE39rmO9uRldabASzq/KJecNCzbwUG6wnsQ/vgcbxNcsr
         3BDCdUaKUQTXDyWvA2zDwyxBF3dMjUDnmlkpdWue2Teg7n719XjFUWUvjMUVaw6rpfVw
         KPX12srhZF7TX83uEKgqQjsTnziIPMlLsgLM8Trj4ngaPic6/hY0lMSbh+GLK7mamOSa
         65UtMjWmln+m2WrwewmOVl8kV4a2gSi1la0bt0Z6meLJckYcnoPDU7sqWYWaLJ9Wd74K
         Kq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H3TeArNlhhhr4RYfX/b2WYkhBk+medX2JFlSXaDsMVA=;
        b=JP/4M/eFIO5iOSQM2mwqKmVwk3MRmQ51JK3LU1qGJXpYKcOigUnAtoNl1wckq1zJ9G
         ojxYN9eyPdmEM6BOw+nHgIv1/LLHrXjDHe7qlPmpkl2xCHYwcmAyn8b5VJNVWz+sLzW1
         DyFw3QKGnH4pxSVSG6JWspe5CU3wh4oiwA4jt88H0tTDZDAcFTA43rd4xV/InshUoFYX
         7v+Z+S9PtoR2Z0Myb4vIrUwQvvh0FOxLqCEOYfnBHsfHMttQ9fqfbHXZB9ObeX7IyyLy
         66dQUGwpvugcM+z3qaC5kfy13RCSeXgJVbnjYc6aFp3OUkG5W2BtB2Pd04Pftv/SA0ah
         A77A==
X-Gm-Message-State: AOAM533jRvlzN63PFVvKUp+C09Na2SdP7XnWvDpj26u8FzgUIWpXNfSt
	IQid+8EOrxWCnYMDUJLUsL1BiU7gdp9pbg==
X-Google-Smtp-Source: ABdhPJwS/I+xJCG+DSx++pyIBBUUsuneny7Ejaw1LrwoSS+QXTzMnJG7JDhOHWTF8F3dVyLN/1+KBQ==
X-Received: by 2002:aa7:d0c3:: with SMTP id u3mr17509036edo.76.1604335765772;
        Mon, 02 Nov 2020 08:49:25 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:25 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/80] piglit: upgrade to latest revision
Date: Mon,  2 Nov 2020 17:47:56 +0100
Message-Id: <20201102164907.27572-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Un-break musl builds with 0001-Add-a-missing-include-for-htobe32-definition.patch.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ssing-include-for-htobe32-definition.patch | 27 +++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    |  3 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch b/meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch
new file mode 100644
index 0000000000..caa48e088d
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch
@@ -0,0 +1,27 @@
+From d623e9797b7ee9b3739a8a4afe1a01f7e03754aa Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Sun, 1 Nov 2020 20:08:49 +0000
+Subject: [PATCH] Add a missing include for htobe32 definition
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c b/tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c
+index 5f45e0c23..c755ee29a 100644
+--- a/tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c
++++ b/tests/spec/nv_copy_depth_to_color/nv_copy_depth_to_color.c
+@@ -34,6 +34,8 @@
+ 
+ #include "piglit-util-gl.h"
+ 
++#include <endian.h>
++
+ #define IMAGE_WIDTH 60
+ #define IMAGE_HEIGHT 60
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index d35117a4f9..a9d1d39dfe 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
+           file://0001-Add-a-missing-include-for-htobe32-definition.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "2a6a8f954dcd3f748055f28e019d2eca64635332"
+SRCREV = "59e695c16fdcdd4ea4f16365f0e397a93cef7b80"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.29.0

