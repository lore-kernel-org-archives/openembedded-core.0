Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.9587.1629636693025488852
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tMlqnXFW;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so8938279wml.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NC94iInJfDvDqcmGuarynvDeYUsO9XagXtf17THvli4=;
        b=tMlqnXFWE7OcTVDYKYv3f5cC4BAaiyB+8kP9cYqq3wkANgNTdNd9qtvVdoaJm3Akm9
         AIqFuAPs04kVFKkWmRen9WvnzoXx3HbrPE31BvDwWlFVcgLuIEwHQJ13mHHhcMUCH4jP
         zdBJoAlh5k5bkBwddMLIprWt5qxk/9Mz8CXWADOc7dUfMyB/M2NS4Fc4AepkcVVY2CoS
         wpkBf0gGqaiq3XRv2e9+MWZOKNrMjLwyST2pG+pyHEdTuFo3bhhwEUaaCJ3NR3v1R2lv
         AI3kExHrIx3lyozkmYS0jsuBfmO+u2w59o7Pz1uq0p41GGv/KIwns3rYOMIGKWaP6Yxe
         7LdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NC94iInJfDvDqcmGuarynvDeYUsO9XagXtf17THvli4=;
        b=i52RLk9ln4UeE2jZ/TckfLiQMwxcs3ePM3n3YAxqZdKkxVY7SqXPIjYHzQuQEgVvIc
         E5/aAZd+wZawSCT3hlfPpB/zQSbZwOGaNvMX0T6dbDv58njrJpgn1lP9M1sC23VWf+9X
         2rmE90BOcHRQRLEGR96WL3bW+ZtV/3jt+XSZXqu2c1FtRyvPkeT5bD9R5iTM8AwqUOJG
         NVJ0ab5xwoJEb0I2M4kTRv/0NlvZBzUmhdh2DcHyQM6BT/ZCiTTgocii8UGov2dwT5LW
         nXjClMudLYHKsD5Tmti1a5OEqoscmfcfz5M3LP+vR8z3ohG/WOBgtUKGi02ppzG8j3um
         5+fQ==
X-Gm-Message-State: AOAM531/eGalHKWcgWiXuQ5mieh9x3DAMCfnf7mzjeDdiK2dw9kNlCBn
	HLruYyG5ylLWdf0/3pxeWF+7+dFhun2VVA==
X-Google-Smtp-Source: ABdhPJxZiy4MDzn+cTRU7KuWnTsCz7VRYit6OkyYd1cR2Q94N0lQ6pCNogxcX6YJJwkOtNO809uNzw==
X-Received: by 2002:a1c:443:: with SMTP id 64mr5989068wme.180.1629636691692;
        Sun, 22 Aug 2021 05:51:31 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:31 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 30/55] python3-setuptools: upgrade 57.1.0 -> 57.4.0
Date: Sun, 22 Aug 2021 14:50:38 +0200
Message-Id: <20210822125103.310416-30-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_57.1.0.bb => python3-setuptools_57.4.0.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_57.1.0.bb => python3-setuptools_57.4.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 1082fe79be..2b1f899eaf 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From f6afc18e08a6c428ce8becd114c535a6840f1b9f Mon Sep 17 00:00:00 2001
+From 4e2c87105884af6dfc3bc9f8c65b199ecc3b5186 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_57.1.0.bb b/meta/recipes-devtools/python/python3-setuptools_57.4.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_57.1.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_57.4.0.bb
index 63c0fe97ff..ae45936c39 100644
--- a/meta/recipes-devtools/python/python3-setuptools_57.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_57.4.0.bb
@@ -10,7 +10,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "cfca9c97e7eebbc8abe18d5e5e962a08dcad55bb63afddd82d681de4d22a597b"
+SRC_URI[sha256sum] = "6bac238ffdf24e8806c61440e755192470352850f3419a52f26ffe0a1a64f465"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.31.1

