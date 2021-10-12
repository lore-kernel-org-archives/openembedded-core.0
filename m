Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B44C433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 02:09:16 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web09.8011.1634004555905533082
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 19:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kd5nqj5X;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id q5so4387306pgr.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 19:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FvqE2LlwCYY+jukYl0YazZHtkjRvbPmQ/exp5RX/Mmc=;
        b=kd5nqj5XfUqBlR9IxfJqNtt5kMI0/Gx4hce+Qn1eXq6CbRu1mFrkyxuLfn0nHHeFav
         QfuqZ+LrVsy8FxZMmL2AgYgGqtf7r57I/RHZ298gFITpbf2QJpiV0o7fNIEZRSkiEPjD
         xtKcjQKFReZnOYjUsfJmcGPgl4jpl4U9wPoYLHC2/ydoi/+0w10qZFrhFgq7gPygmOnn
         SQX6ZZt0Nl9XoenYLuv7BkA02JR5vXlIsmq/nRRHUze0sOANM+c9Ew2diuZ8EY+y6fN6
         qQYVPr9bKFXnYkctq+QiOAjjlKu/LkSlSLm/ywGqkVfsSEfxgJxd199Gz2ZbNftgE2Ht
         HM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FvqE2LlwCYY+jukYl0YazZHtkjRvbPmQ/exp5RX/Mmc=;
        b=jlG89Ca3/CEfQLskGOi+//8MYi/OAc1hMDOezAG0ER5XLZ8SRe/KdtzK1ekBGvLmYK
         QUyaDF4PobwtkYzcp0+OfNfpk/V5gKQt7jwTTILGQ5J2DtggMjfgkjWwTUALSMm5btdD
         SGKQBAp4trwjVs5gPKCPnuuuCdiotV05WLc8C8dRohA7O3nWMVkxeQmoqb/EKTG1GQWv
         22qliv5kQp/FiE0vD3JzaGaLNDDHjQMdYip2a/9wvCe5IlrR+GzqqUxkYflejDaNF7CP
         jflMTwNejj6HonSRgmeVCT/o/E/Rp5algUGqtN52fC7XUYMbdPYuLFzgyhMswbGEn2Ir
         wG5Q==
X-Gm-Message-State: AOAM533y7dpWkX8WdzSObVt+K9nNUmME7SsYVoKYDAxOlRmnOzsEoazf
	F1eORG44xtyCIAimUt+FlpskZfxJXAkBXA==
X-Google-Smtp-Source: 
 ABdhPJzjmW86TU81f2kVLWQ+9NkaNbOiHgLOlZwQPZ8JLJxi7koQ7N+5kj9v/L+yFrche0ngWG6BNw==
X-Received: by 2002:a62:5297:0:b0:3f4:263a:b078 with SMTP id
 g145-20020a625297000000b003f4263ab078mr29128642pfb.20.1634004555163;
        Mon, 11 Oct 2021 19:09:15 -0700 (PDT)
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::17e1])
        by smtp.gmail.com with ESMTPSA id
 l207sm8949601pfd.199.2021.10.11.19.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 19:09:14 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 7/7] python3-pytest: upgrade 6.2.4 -> 6.2.5
Date: Tue, 12 Oct 2021 02:08:54 +0000
Message-Id: <20211012020854.2073998-7-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012020854.2073998-1-timothy.t.orling@intel.com>
References: <20211012020854.2073998-1-timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 02:09:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156858

Drop pluggy-1.0 patch; fixed upstream

pytest 6.2.5 (2021-08-29)
  Trivial/Internal Changes
    #8494: Python 3.10 is now supported.
    #9040: Enable compatibility with pluggy 1.0 or later.

References:
  https://github.com/pytest-dev/pytest/pull/8494
  https://github.com/pytest-dev/pytest/pull/9040

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../0001-Allow-pluggy-1.0.patch               | 65 -------------------
 ...ytest_6.2.4.bb => python3-pytest_6.2.5.bb} |  3 +-
 2 files changed, 1 insertion(+), 67 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pytest/0001-Allow-pluggy-1.0.patch
 rename meta/recipes-devtools/python/{python3-pytest_6.2.4.bb => python3-pytest_6.2.5.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-pytest/0001-Allow-pluggy-1.0.patch b/meta/recipes-devtools/python/python3-pytest/0001-Allow-pluggy-1.0.patch
deleted file mode 100644
index 175ef987adb..00000000000
--- a/meta/recipes-devtools/python/python3-pytest/0001-Allow-pluggy-1.0.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 637d4400d2bab0457688f950ea18cc4a04147c11 Mon Sep 17 00:00:00 2001
-From: Bruno Oliveira <nicoddemus@gmail.com>
-Date: Thu, 26 Aug 2021 09:26:51 -0300
-Subject: [PATCH] Allow pluggy >=1.0
-
-Now that pluggy 1.0 has been released, we can allow pluggy 1.0 with new pytest versions.
-
-Upstream-Status: Backport [commit: fbba504]
-
-Modify to use toml and not tomli. We will create a
-python3-tomli recipe when we do an python3-pytest
-upgrade.
-
-Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
----
- setup.cfg | 36 ++++++++++++++++++------------------
- 1 file changed, 18 insertions(+), 18 deletions(-)
-
-diff --git a/setup.cfg b/setup.cfg
-index f919a9491..a8aeab813 100644
---- a/setup.cfg
-+++ b/setup.cfg
-@@ -32,24 +32,24 @@ project_urls =
- 	Tracker=https://github.com/pytest-dev/pytest/issues
- 
- [options]
--packages = 
--	_pytest
--	_pytest._code
--	_pytest._io
--	_pytest.assertion
--	_pytest.config
--	_pytest.mark
--	pytest
--install_requires = 
--	attrs>=19.2.0
--	iniconfig
--	packaging
--	pluggy>=0.12,<1.0.0a1
--	py>=1.8.2
--	toml
--	atomicwrites>=1.0;sys_platform=="win32"
--	colorama;sys_platform=="win32"
--	importlib-metadata>=0.12;python_version<"3.8"
-+packages =
-+    _pytest
-+    _pytest._code
-+    _pytest._io
-+    _pytest.assertion
-+    _pytest.config
-+    _pytest.mark
-+    pytest
-+install_requires =
-+    attrs>=19.2.0
-+    iniconfig
-+    packaging
-+    pluggy>=0.12,<2.0
-+    py>=1.8.2
-+    toml
-+    atomicwrites>=1.0;sys_platform=="win32"
-+    colorama;sys_platform=="win32"
-+    importlib-metadata>=0.12;python_version<"3.8"
- python_requires = >=3.6
- package_dir = 
- 	=src
diff --git a/meta/recipes-devtools/python/python3-pytest_6.2.4.bb b/meta/recipes-devtools/python/python3-pytest_6.2.5.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-pytest_6.2.4.bb
rename to meta/recipes-devtools/python/python3-pytest_6.2.5.bb
index 2e90acaf366..0d8fdf63733 100644
--- a/meta/recipes-devtools/python/python3-pytest_6.2.4.bb
+++ b/meta/recipes-devtools/python/python3-pytest_6.2.5.bb
@@ -5,8 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
 
-SRC_URI += "file://0001-Allow-pluggy-1.0.patch"
-SRC_URI[sha256sum] = "50bcad0a0b9c5a72c8e4e7c9855a3ad496ca6a881a3641b4260605450772c54b"
+SRC_URI[sha256sum] = "131b36680866a76e6781d13f101efb86cf674ebb9762eb70d3082b6f29889e89"
 
 DEPENDS = "python3-setuptools-scm-native"
 
-- 
2.30.2


