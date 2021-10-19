Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA27C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 12:43:37 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.9117.1634647416398882360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 05:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iZ1+YxWG;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id g2so11786711wme.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 05:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D+jVmHkubZ6nImSxmWbWqX/a7j2cWqhcI8vgKv3/BfU=;
        b=iZ1+YxWGe6oMZgzu4lMu9F6P1ugV/vcjVcty6AmLXnqJ0Vj7rLxcOWvWeuiadc4ZVb
         q7eY0LnLV41wjbAORO8/s9nRSRFInb1Qt4WN7xppE4bQfLz18SHrrOp8njFxSOl4gBZC
         ycdqO8RLFVl7LOV8yTrmAOwzq/L+ybiyJ972IP2JFqbIhl7o8R6EDQFax+x66xbCa384
         WyawKYeQIXkF6SAPbWYLez333ZWqsDcCVvsFtsQ8i1L7cS9JakEBnkzroLrEqdwxV5ZU
         WVA0+WjhfxoEIe5w/+JS/Q7Da3Uj1QoCoct5nYVgFfS4XoEZH9fS25/0xxaZ5eY2Ls71
         jJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D+jVmHkubZ6nImSxmWbWqX/a7j2cWqhcI8vgKv3/BfU=;
        b=dBgnz1NKCn4IeUMeCmd04/YCRYmeL5/rISnPtJ/k83wunobYOHHZjcbF8svTVKEvwx
         JnkKoOBwvfwnNSWVxNhAtr8xX1WFCcUcOZXOZDSjY+ayb1dj2vnfJmUIkRoiCZ7uL5Hq
         QN4haCe4ZlmrT27FP6RGKCQjewVskqVvLii3MFqd/zhfwb1a2eTxKybqldQlgru+8Mrg
         ABY+1mEYPZpqE7TqrPx0JzAUgN814679Z/wsMwp7ncJHsSZ8XjxuATZAm7TSBuwBo1Ct
         T7uX4Q214lkTCYHy9dWtKmA4USGQdsSub2TvGqu9+RB1sSTw/SgB7vm/hY6J8eoQAyk5
         H6hw==
X-Gm-Message-State: AOAM532NGacopUHISXGLPflvrtaNygLca6ktEoZQMgl19OJRgyKVTNxW
	8jn/kmpCnGI11PyjKk3ClCWeQ564+2E=
X-Google-Smtp-Source: 
 ABdhPJzfZgre4LLkB1bkbqWqemetdAI3baN4yxd1Ab/9RNTfvPczQUctgYiwvpGhW7rNZdFN+uPr0g==
X-Received: by 2002:a05:600c:154f:: with SMTP id
 f15mr6055208wmg.195.1634647414919;
        Tue, 19 Oct 2021 05:43:34 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 k22sm15182295wrd.59.2021.10.19.05.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 05:43:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] boost: allow searching for python310
Date: Tue, 19 Oct 2021 14:43:32 +0200
Message-Id: <20211019124332.14158-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 12:43:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157114

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ....cmake-allow-searching-for-python310.patch | 50 +++++++++++++++++++
 meta/recipes-support/boost/boost_1.77.0.bb    |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0001-BoostConfig.cmake-allow-searching-for-python310.patch

diff --git a/meta/recipes-support/boost/boost/0001-BoostConfig.cmake-allow-searching-for-python310.patch b/meta/recipes-support/boost/boost/0001-BoostConfig.cmake-allow-searching-for-python310.patch
new file mode 100644
index 0000000000..0a9ee2cc95
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-BoostConfig.cmake-allow-searching-for-python310.patch
@@ -0,0 +1,50 @@
+From e193f080c7d209516ac9b712fa0c50bb08026fa2 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 19 Oct 2021 12:24:31 +0000
+Subject: [PATCH] BoostConfig.cmake: allow searching for python310
+
+* accept double digits in Python3_VERSION_MINOR
+
+* if someone is using e.g.:
+  find_package(Python3 REQUIRED)
+  find_package(Boost REQUIRED python${Python3_VERSION_MAJOR}${Python3_VERSION_MINOR})
+
+  with python-3.10 then it currently fails with:
+
+  -- Found PythonLibs: /usr/lib/libpython3.10.so (found version "3.10.0")
+  -- Found Python3: -native/usr/bin/python3-native/python3 (found version "3.10.0") found components: Interpreter
+  CMake Error at /usr/lib/cmake/Boost-1.77.0/BoostConfig.cmake:141 (find_package):
+    Could not find a package configuration file provided by "boost_python310"
+    (requested version 1.77.0) with any of the following names:
+
+      boost_python310Config.cmake
+      boost_python310-config.cmake
+
+    Add the installation prefix of "boost_python310" to CMAKE_PREFIX_PATH or
+    set "boost_python310_DIR" to a directory containing one of the above files.
+    If "boost_python310" provides a separate development package or SDK, be
+    sure it has been installed.
+  Call Stack (most recent call first):
+    /usr/lib/cmake/Boost-1.77.0/BoostConfig.cmake:258 (boost_find_component)
+    /usr/share/cmake-3.21/Modules/FindBoost.cmake:594 (find_package)
+    CMakeLists.txt:18 (find_package)
+
+Upstream-Status: Submitted [https://github.com/boostorg/boost_install/pull/53]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ tools/boost_install/BoostConfig.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/boost_install/BoostConfig.cmake b/tools/boost_install/BoostConfig.cmake
+index fd17821..5dffa58 100644
+--- a/tools/boost_install/BoostConfig.cmake
++++ b/tools/boost_install/BoostConfig.cmake
+@@ -113,7 +113,7 @@ macro(boost_find_component comp required quiet)
+     set(_BOOST_REQUIRED REQUIRED)
+   endif()
+ 
+-  if("${comp}" MATCHES "^(python|numpy|mpi_python)([1-9])([0-9])$")
++  if("${comp}" MATCHES "^(python|numpy|mpi_python)([1-9])([0-9][0-9]?)$")
+ 
+     # handle pythonXY and numpyXY versioned components for compatibility
+ 
diff --git a/meta/recipes-support/boost/boost_1.77.0.bb b/meta/recipes-support/boost/boost_1.77.0.bb
index df8e08ad76..ba60281950 100644
--- a/meta/recipes-support/boost/boost_1.77.0.bb
+++ b/meta/recipes-support/boost/boost_1.77.0.bb
@@ -6,4 +6,5 @@ SRC_URI += "file://boost-CVE-2012-2677.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
            file://0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch \
+           file://0001-BoostConfig.cmake-allow-searching-for-python310.patch \
            "
-- 
2.32.0


