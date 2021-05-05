Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web09.9790.1620227959832932692
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ryCKyOO2;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id h10so2469329edt.13
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=poaJtqffYv6pEZiFFVIqCgHInQEZWSuCxp5NS64l30U=;
        b=ryCKyOO2PW9a906qo0E6lQhWZEL6iTNxcLGw0p/Oxp+MigxO9lm5t+egu0gNOPdI0i
         5mFW+iQJtyj3Fou1eakZf4zXDgN1KtgdI6h5EHa5f0xqD5OK/xy/+e7imfvXL6BxT2iv
         s/NhueJf8rC1cIEBUs0EVRf+50cXWNIbll06zTKnMgrUhNjZ4GH47Aq55YOqbMXqN5ly
         QX5exVqC8UIQj8NEToyNzn/PGcr4kpcIQxYhXtCsgK2/jK60XusqUlpjziyJfBKAvLee
         qiwZbwSanorLVHjljTiFhcxQbHtil4Z0Y61N3q0zlXYWcGhnRKDBkaCFHQ0iNj4qiQY8
         Jeow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=poaJtqffYv6pEZiFFVIqCgHInQEZWSuCxp5NS64l30U=;
        b=BNQ+4JjGtcGJErFxEPDV8XOrPK+ykVQ+p6qrc2J9TsjrgKD/479XvY2j44z8saPHJT
         So1eF/9SvoLyAYihaMFi4bvhWfjspadn+yeUdw8X1OY4Q36qxe1TFPB6ptzepu/U6DwI
         Z+syLdvCgaVpCm0d4sGSYiGin0Pt9dE+su/v6D++oCtG1mgBbLoK16FNYpRhAE7mRZCo
         Auf1KEmtEh1J1Nyy1oiWpAOyh234HHpm8xtDizxPjfo2OcWiYphW+jSNzrzwtMZH8qbs
         +cLNUIWMat///k8ESIAwXjC9hEFWlc9p5+4NJSEOEHSvEim0sENs2cVFBnIFxFTsHypF
         NQZQ==
X-Gm-Message-State: AOAM530pFOUWfjjkn6PXANaPmYWwYR8C6cknaulVZy/Q9evAzO5UbJN7
	gzMujWtCstH3dRgKCMFIPdprQAH6Ca6bog==
X-Google-Smtp-Source: ABdhPJx79OQ4JQDDTXPF6vHzcO2OHu/opz0OBh1dKx+U9dVr8WnsgH+Ldtm/+XluTYmwIvlspFF72Q==
X-Received: by 2002:aa7:d950:: with SMTP id l16mr32909050eds.374.1620227958481;
        Wed, 05 May 2021 08:19:18 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:18 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 28/61] createrepo-c: upgrade 0.17.0 -> 0.17.2
Date: Wed,  5 May 2021 17:18:17 +0200
Message-Id: <20210505151850.660512-28-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...01-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 6 +++---
 .../{createrepo-c_0.17.0.bb => createrepo-c_0.17.2.bb}      | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.17.0.bb => createrepo-c_0.17.2.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index d675af4f8b..4b844574ea 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From 218a4760945be7a404df6515ffbc769c92791f9b Mon Sep 17 00:00:00 2001
+From 6f8f6d151b831b60f6e7892aa9294a6361353c72 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:31:02 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
@@ -11,11 +11,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/python/CMakeLists.txt b/src/python/CMakeLists.txt
-index 855127f..dff1d97 100644
+index ecc262d..a86514c 100644
 --- a/src/python/CMakeLists.txt
 +++ b/src/python/CMakeLists.txt
 @@ -14,7 +14,7 @@ if (NOT SKBUILD)
-     FIND_PACKAGE(PythonInterp 3 EXACT REQUIRED)
+     FIND_PACKAGE(PythonLibs 3 REQUIRED)
  endif (NOT SKBUILD)
  
 -EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(True))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb
index e0433806b2..76bdd69836 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.2.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "909a0636665ed96f97babc3b887f9badc88875c3"
+SRCREV = "8eff6ed99f5fd0ba844cb8513963435caab5fd3c"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1

