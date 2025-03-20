Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCC1C35FFC
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 03:02:36 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.151.1742439751381972293
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 20:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TN4iVdmf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742439752; x=1773975752;
  h=from:to:cc:subject:date:message-id;
  bh=Aaelos/W4rILE+rjQpOKzTH4yT/EhDDsHDjV548WFjA=;
  b=TN4iVdmfVMXn4vYrVIcYnqRgNdovP77JUq+rRVQiCFBEPe+m3Y/Bw0sq
   7QhZ3HMpQZ1gV9Cfq1ldjweHHaqjkD5pYnjYkIvIW68xHcBg/qrTtE1ff
   vC/sds6NJ3wlIUokAR/OdYKNTLiQyhMDkpGKUjSLewHZwcKJEKlwt8klj
   a/Bc9gLKW0ayyc8RJq0dKEMNtgquuqRP4s+ZEtk5G2JEvgfZcnhgsmpFs
   8hAjP0pDXUtycmt52R/nN4u+XdQjRzeB0lrZ0NZpGVP16WchX13iS/Vr7
   ql5hWnD+nqKyctGDAIzD16JfTiW9uIJwuJtSuRrBx8W676pGc6UUn5tZO
   Q==;
X-CSE-ConnectionGUID: Iu5GxfnESWCAXhK5IVKcPg==
X-CSE-MsgGUID: e3anfLDJQw+yddiNOe/bgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="193645495"
X-IronPort-AV: E=Sophos;i="6.14,260,1736780400"; 
   d="scan'208";a="193645495"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 12:02:30 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id ECDA1D4C31
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 12:02:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A7153D4C11
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 12:02:26 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E9F8F1A009A;
	Thu, 20 Mar 2025 11:02:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH V2] dnf: upgrade 4.22.0 -> 4.23.0
Date: Thu, 20 Mar 2025 11:02:20 +0800
Message-Id: <1742439740-18703-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 03:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213370

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
0005-Do-not-prepend-installroot-to-logdir.patch
0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
refreshed for 4.23.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-Do-not-hardcode-etc-and-systemd-unit-directories.patch | 7 +++++--
 .../dnf/0005-Do-not-prepend-installroot-to-logdir.patch    | 7 +++++--
 ...9-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 7 +++++--
 meta/recipes-devtools/dnf/{dnf_4.22.0.bb => dnf_4.23.0.bb} | 2 +-
 4 files changed, 16 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.22.0.bb => dnf_4.23.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
index 37359a5765..24b26f4cb8 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4aee99fb..9e2e9e9e 100644
+index a76b6ac..a2ba58c 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -3,8 +3,8 @@ CMAKE_MINIMUM_REQUIRED (VERSION 2.4)
+@@ -4,8 +4,8 @@ PROJECT (dnf NONE)
  
  INCLUDE (${CMAKE_SOURCE_DIR}/VERSION.cmake)
  
@@ -24,3 +24,6 @@ index 4aee99fb..9e2e9e9e 100644
  
  IF (NOT PYTHON_DESIRED)
      FIND_PACKAGE (PythonInterp REQUIRED)
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
index a1c58d6563..159dc32c75 100644
--- a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
+++ b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
-index d3844df3..ac080f79 100644
+index 62b9434..14d4757 100644
 --- a/dnf/cli/cli.py
 +++ b/dnf/cli/cli.py
-@@ -954,7 +954,7 @@ class Cli(object):
+@@ -1002,7 +1002,7 @@ class Cli(object):
              logger.warning(_("Unable to detect release version (use '--releasever' to specify "
                               "release version)"))
  
@@ -26,3 +26,6 @@ index d3844df3..ac080f79 100644
              conf.prepend_installroot(opt)
  
          self.base._logging._setup_from_dnf_conf(conf)
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 64ea7874d3..09af96048c 100644
--- a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9e2e9e9e..2056089d 100644
+index a2ba58c..98aa9df 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -19,7 +19,7 @@ ELSE ()
+@@ -20,7 +20,7 @@ ELSE ()
      MESSAGE (FATAL_ERROR "Invalid PYTHON_DESIRED value: " ${PYTHON_DESIRED})
  ENDIF()
  
@@ -22,3 +22,6 @@ index 9e2e9e9e..2056089d 100644
  MESSAGE(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
  
  ADD_SUBDIRECTORY (dnf)
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/dnf/dnf_4.22.0.bb b/meta/recipes-devtools/dnf/dnf_4.23.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.22.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.23.0.bb
index e5ac3c9824..fe3deb4344 100644
--- a/meta/recipes-devtools/dnf/dnf_4.22.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.23.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = " file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "da9a7066be8e1628d9453428d33685225cd9c90d"
+SRCREV = "8fa4bb94a99eadaed91ad2ee51f27a4baafcebed"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


