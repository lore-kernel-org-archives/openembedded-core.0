Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.181947.1598214070006917807
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FmfFT86u;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id l2so3258696eji.3
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vJgHGq31zWLGr2EMLds2m/EdpJJh4vCXgPGlbXiCws0=;
        b=FmfFT86u7NrBy377GOcBqKGO+eKaMpHyn05NlEJYZa2rIlFG/G37cAcNPr8U7j0EqC
         dxOCIVN6zlkx4YdaftvxX4XM8BfCxxab1ocJs9r8LhzLnwakKM10FVer8jL3sd7TOgq8
         Ts2PXP0gh67OhK+4GGm3e0N7Vn4pWIeHeOepmAcdvSWWb4zdYHRPERSCVaauhWMNU9nI
         99M18nf2nqNdT8aDiU7DQymbDwGdoFEFaPxn+saPV6mb6BvCSZcGFwe3svGprdtRjVt8
         CquGyZ3Jjqv5/lESfgko2rmHEYCJc1ajmB8hO5rXLukWVGP/Qf26esrK3qqQYzw2q31a
         UNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vJgHGq31zWLGr2EMLds2m/EdpJJh4vCXgPGlbXiCws0=;
        b=U4Q5WYY6YwKd6BQS6SpcsYvzH25gY9TMeilbAK3tUwoBWHAS76MFqSs6sFyhX1e/os
         SQmBEf1xGL2e8u58kUzkWEHC5XtkGZ4naATwHbq5eFT/GEVyLi3bMZ3Ox+EHL4pXJjr3
         2aKWGbw1O+2TXg5kOvYEAWQVablkzX4vI9piXETAcECqHMtFbm6P3ayCqkk4qGP3bH8V
         6XJtJ7EHFKpxXRR7tXSbU1z137cZnzrJcroKHuC27k5mgCmK3mg1kt7bmIK/AbwyFTA2
         9gNDGcoqNo7IFY77E9GyTiLZhOHLjno3tYpQ3PydDw8VbjNbhhRx65TD0v14gr6XwHnM
         Kopw==
X-Gm-Message-State: AOAM531XCY5zSqhL/24WI9r7s0MY1EckWf0okDepH/mB8ENvPO0Rk7L7
	vnmHXjSFA6CTM7X10kMgSu91HXWUXO8=
X-Google-Smtp-Source: ABdhPJyCb1YfrHbJwfR48uPCN/ntTqAocjnpb/+bc91ONZBT+XV3jkiUcECLgXsakd5/+uwJXvkHDA==
X-Received: by 2002:a17:906:5902:: with SMTP id h2mr2760194ejq.423.1598214068201;
        Sun, 23 Aug 2020 13:21:08 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:07 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/37] python3-setuptools: upgrade 49.3.1 -> 49.6.0
Date: Sun, 23 Aug 2020 22:19:58 +0200
Message-Id: <20200823202031.24686-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-conditionally-do-not-fetch-code-by-easy_install.patch | 8 +++-----
 ...-setuptools_49.3.1.bb => python3-setuptools_49.6.0.bb} | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_49.3.1.bb => python3-setuptools_49.6.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 86c9363d65..ee0a9dbb13 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 768e1f2f14c9f1b3f9bd0e017c3f6183b45616e8 Mon Sep 17 00:00:00 2001
+From 6a5086619ee1c4bcebc7df622face11de6679255 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -9,12 +9,13 @@ internet by easy_install.
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  setuptools/command/easy_install.py | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index bcbd4f58..6455afda 100644
+index bcbd4f5..6455afd 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
 @@ -653,6 +653,11 @@ class easy_install(Command):
@@ -29,6 +30,3 @@ index bcbd4f58..6455afda 100644
          with self._tmpdir() as tmpdir:
              if not isinstance(spec, Requirement):
                  if URL_SCHEME(spec):
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3-setuptools_49.3.1.bb b/meta/recipes-devtools/python/python3-setuptools_49.6.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_49.3.1.bb
rename to meta/recipes-devtools/python/python3-setuptools_49.6.0.bb
index 1c500e4688..360128b116 100644
--- a/meta/recipes-devtools/python/python3-setuptools_49.3.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_49.6.0.bb
@@ -12,7 +12,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "1c7b51fba5d83160d540d18b2bf08fd546357488adf9ddbca08cc1e997bd5c18"
+SRC_URI[sha256sum] = "46bd862894ed22c2edff033c758c2dc026324788d758e96788e8f7c11f4e9707"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.28.0

