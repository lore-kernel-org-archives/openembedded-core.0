Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906F9C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:08:50 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.3458.1637741329894297014
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=itPVwu3x;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso4562293wmr.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZrHwxyoUpYgklL/CBsMxePOQ1MO2buYwyyPMkvfg6N4=;
        b=itPVwu3xEjUznm+hn3g7U58PntOPD+xGsa4LQQd4fzjzDK5fOdWbfHJGJnmS1JhHiq
         epINcBs0rPY/hCEKgb1xhslx8Z0giGp75Jpf/e5dGstlxw/jPajRzjjyl595MFpeYrHi
         feL64BI9wpm+OLeoAMGK69BCKxcYEddySxdo3aqcY1OvKpw5WHqLxVrqKWOjFlxJsLF3
         mbcaHNWLHfF93gNNmz7S3TK+K8XDMhUxIagSVjpabuyQdlVKgFMJO30h+tpOTvHEX2n1
         dmpdunoCozY3Djxo2qYGOj2XhTykAotx2V9iWQSdZcq4pvSofOwmzfRX8VsPJpGJDBmx
         q8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZrHwxyoUpYgklL/CBsMxePOQ1MO2buYwyyPMkvfg6N4=;
        b=OQHMFtrs7/NnJYHP7u/RhvxZoTdjqYza//pNfeRHKACUGlH06sAC+by0BVpyQhjiBo
         fN/ne5lkPa/WHA917G28kdRYxqkkkPE/Spl5CD/MY0tSLKgIKV1OxkpomlnksKQSmLYa
         Q7YhueebcVS0vRXWSarXPD8bgLg96jRnNj9KRisvYbt+Bp/OykOGISyFJS+bU89wWzuK
         6W12WNnkBUZi1bm9YQwL1pevDgy+AQru4JFg5jNJoCCrAiYlk6Yx+uhwDEbkwX0meA6D
         xjpgJJaurWWfKytxfzTM/vggZPmTypwi9ewevfCAuv5nTHs20qbvPHpNmFLK5d4rxFIL
         naSw==
X-Gm-Message-State: AOAM530NjFbtlcQzihRknhAvmM2hzBrHDIgqaGfJAGo2dF1nZeO+03hD
	HQ7mrl1kXD8Mu2RnQVZb/9Siq80JxOb7Sg==
X-Google-Smtp-Source: 
 ABdhPJwb7CU08j7znXK+wXG6qw/YJuN0RlWRmwiT1byYgPHHChKiWpbq/BX4WAc8QQhbw+1/6UJG1Q==
X-Received: by 2002:a05:600c:4f14:: with SMTP id
 l20mr11913440wmq.164.1637741328510;
        Wed, 24 Nov 2021 00:08:48 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k37sm4220205wms.21.2021.11.24.00.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:08:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/21] python3-setuptools: update 58.5.3 -> 59.2.0
Date: Wed, 24 Nov 2021 09:08:28 +0100
Message-Id: <20211124080828.530981-21-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211124080828.530981-1-alex@linutronix.de>
References: <20211124080828.530981-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:08:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158677

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...tionally-do-not-fetch-code-by-easy_install.patch |  4 ++--
 ...-sysconfig-append-STAGING_LIBDIR-python-sy.patch | 13 +++++++------
 ...tools_58.5.3.bb => python3-setuptools_59.2.0.bb} |  2 +-
 3 files changed, 10 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_58.5.3.bb => python3-setuptools_59.2.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index c5d6c64eda..4958e8e63d 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From dd77d2f4486079380235ed0466d2eab110f7bdc5 Mon Sep 17 00:00:00 2001
+From 1f578f993aae157f42923624042fafe4b01add10 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -15,7 +15,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 1aed0e8..f491c0a 100644
+index fc848d0..c04a5de 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
 @@ -642,6 +642,11 @@ class easy_install(Command):
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch
index 565cf8ae8d..3150187951 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch
@@ -1,4 +1,4 @@
-From 44349672cbff8945693c8d2821c82e9f04bfc8b5 Mon Sep 17 00:00:00 2001
+From 1ff575308248b183639c8cb14afee7c8572bd2b8 Mon Sep 17 00:00:00 2001
 From: Tim Orling <timothy.t.orling@intel.com>
 Date: Wed, 20 Oct 2021 17:38:10 +0000
 Subject: [PATCH] _distutils/sysconfig: append
@@ -15,18 +15,19 @@ from Alex Kanavin <alex.kanavin@gmail.com>
 Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
+
 ---
  setuptools/_distutils/sysconfig.py | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sysconfig.py
-index 8832b3e..bbc7c08 100644
+index d36d94f..616eb91 100644
 --- a/setuptools/_distutils/sysconfig.py
 +++ b/setuptools/_distutils/sysconfig.py
-@@ -461,6 +461,8 @@ def _init_posix():
-         platform=sys.platform,
-         multiarch=getattr(sys.implementation, '_multiarch', ''),
-     ))
+@@ -484,6 +484,8 @@ def _init_posix():
+             multiarch=getattr(sys.implementation, '_multiarch', ''),
+         ),
+     )
 +    if 'STAGING_LIBDIR' in os.environ:
 +        sys.path.append(os.environ['STAGING_LIBDIR']+'/python-sysconfigdata')
      try:
diff --git a/meta/recipes-devtools/python/python3-setuptools_58.5.3.bb b/meta/recipes-devtools/python/python3-setuptools_59.2.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_58.5.3.bb
rename to meta/recipes-devtools/python/python3-setuptools_59.2.0.bb
index ddc3fca354..704f58abd3 100644
--- a/meta/recipes-devtools/python/python3-setuptools_58.5.3.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_59.2.0.bb
@@ -13,7 +13,7 @@ SRC_URI += "\
     file://0001-_distutils-sysconfig-append-STAGING_LIBDIR-python-sy.patch \
 "
 
-SRC_URI[sha256sum] = "dae6b934a965c8a59d6d230d3867ec408bb95e73bd538ff77e71fedf1eaca729"
+SRC_URI[sha256sum] = "157d21de9d055ab9e8ea3186d91e7f4f865e11f42deafa952d90842671fc2576"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.20.1


