Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78408C35FFC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 06:22:12 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.5355.1742278929996649128
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 23:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oV1ThHjX;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742278931; x=1773814931;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jz5Vn8J5YxIruSQZB6N+7ZIFGq9pdhikizE+cwXxelQ=;
  b=oV1ThHjXyI1GfVerfrF/ax/VkiUbL8U9EeTvGHsHBfxnz/3BkjQV6y7x
   R+TZNM5nBjAX/QnCLm/0TbsGelZa6+veYlbVrHBk/4RJZvRmB3LXP3xc7
   nBcxEKLX3GWWBwS51V2DGoshoiWRKSw1TPhw+otzIjb6YuLNmGEW11Pcg
   YueoNQWZj6kPEp9QaAtGy3l0EX0oBNJtRi2FdgaOIpvQf7Jprh5EO33fD
   8Nn/kcTb4ZORaRoyql4llcVn5vD18DRwypyAYm1jlzVUcit8F9QnHVSUC
   hu6nE/VfR6YzBocdX2m6+jUdGiZPlU6U13le/Ite+E2zt1KwYeyDYtE8n
   Q==;
X-CSE-ConnectionGUID: ZIpnpY6YTQGLXfx3+gGvwA==
X-CSE-MsgGUID: VE0TfIYDQD2K0VdhIMB5Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="196155138"
X-IronPort-AV: E=Sophos;i="6.14,256,1736780400"; 
   d="scan'208";a="196155138"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 15:22:08 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 325A8DBB8C
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:22:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id ECDC1BDCA4
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:22:04 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 88F091A0078;
	Tue, 18 Mar 2025 14:22:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/12] libdnf: upgrade 0.73.4 -> 0.74.0
Date: Tue, 18 Mar 2025 14:21:45 +0800
Message-Id: <1742278912-2989-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
References: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 06:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213171

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-section.patch
removed since it's included in 0.74.0

enable_test_data_dir_set.patch
refreshed for 0.74.0

Changelog:
=============
- Fix a segfault in iterator of a ConfigParser section
- Update ko.po
- Split $releasever to $releasever_major and $releasever_minor in the C API
- Merge bootc branch to master
- ConfigParser: make splitReleasever public
- C API: Detect releasever_major, releasever_minor from provides
- C API: support shell-style variable substitution
- module: Warn if module config file is inaccessible
- Enable automatic PR reviews
- build: Increase CMake minimal version to 3.5.0
- spec: Increase cmake minimal version to 3.5.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n-iterator-of-a-ConfigParser-section.patch | 84 -------------------
 .../libdnf/enable_test_data_dir_set.patch     | 11 ++-
 .../{libdnf_0.73.4.bb => libdnf_0.74.0.bb}    |  3 +-
 3 files changed, 8 insertions(+), 90 deletions(-)
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-section.patch
 rename meta/recipes-devtools/libdnf/{libdnf_0.73.4.bb => libdnf_0.74.0.bb} (93%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-section.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-section.patch
deleted file mode 100644
index 1c62d02455..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-section.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From f3302a865b230e021e9defbcea978ed1290a9b2f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Miro=20Hron=C4=8Dok?= <miro@hroncok.cz>
-Date: Fri, 6 Dec 2024 18:01:16 +0100
-Subject: [PATCH] Fix a segfault in iterator of a ConfigParser section
-
-An iterator should return self on __iter__.
-
-So that this works:
-
-    >>> it1 = iter(sectObj)
-    >>> it2 = iter(it1)
-    >>> it1 is it2
-    True
-
-Previously, this iterator did not return self on __iter__, it was like this:
-
-    class PreserveOrderMapStringStringIterator(object):
-        ...
-        def __iter__(self):
-            return _common_types.PreserveOrderMapStringStringIterator___iter__(self)
-
-And that returned a new Python object.
-
-This fixes https://bugzilla.redhat.com/2330562 by avoiding a second iterator object.
-
-My SWIG skills are close to zero,
-perhaps this is not the best way to return self, but it seems to work.
-
-Upstream-Status: Backport
-(https://github.com/rpm-software-management/libdnf/commit/f3302a865b)
-
-Backport so that it works properly with Python 3.13.1.
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
-
----
- bindings/swig/common_types.i | 11 +++++++----
- bindings/swig/conf.i         |  4 ----
- 2 files changed, 7 insertions(+), 8 deletions(-)
-
-diff --git a/bindings/swig/common_types.i b/bindings/swig/common_types.i
-index c9ae798a..a1f90d9e 100644
---- a/bindings/swig/common_types.i
-+++ b/bindings/swig/common_types.i
-@@ -63,10 +63,6 @@ template<class T>
- class Iterator {
- public:
-     Iterator(typename T::iterator _cur, typename T::iterator _end) : cur(_cur), end(_end) {}
--    Iterator* __iter__()
--    {
--      return this;
--    }
- 
-     typename T::iterator cur;
-     typename T::iterator end;
-@@ -165,3 +161,10 @@ EXTEND_TEMPLATE_PreserveOrderMapIterator(std::string, std::string)
- EXTEND_TEMPLATE_PreserveOrderMapIterator(std::string, libdnf::PreserveOrderMap<std::string, std::string>)
- 
- %exception;  // beware this resets all exception handlers if you import this file after defining any
-+
-+%pythoncode %{
-+def PreserveOrderMapStringStringIterator___iter__(self):
-+    return self
-+PreserveOrderMapStringStringIterator.__iter__ = PreserveOrderMapStringStringIterator___iter__
-+del PreserveOrderMapStringStringIterator___iter__
-+%}
-diff --git a/bindings/swig/conf.i b/bindings/swig/conf.i
-index b6a0ce88..2f77003f 100644
---- a/bindings/swig/conf.i
-+++ b/bindings/swig/conf.i
-@@ -71,10 +71,6 @@ template<class T>
- class Iterator {
- public:
-     Iterator(typename T::iterator _cur, typename T::iterator _end) : cur(_cur), end(_end) {}
--    Iterator* __iter__()
--    {
--        return this;
--    }
- 
-     typename T::iterator cur;
-     typename T::iterator end;
--- 
-2.39.5
-
diff --git a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
index 5620b51d4c..cdd9a0a57c 100644
--- a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
@@ -14,14 +14,14 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
  1 file changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 60c66e94..1459dfbf 100644
+index b1daacb..f461e54 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -132,7 +132,12 @@ add_definitions(-DGETTEXT_DOMAIN=\\"libdnf\\")
- add_definitions(-DG_LOG_DOMAIN=\\"libdnf\\")
+@@ -131,7 +131,12 @@ add_definitions(-DGETTEXT_DOMAIN="libdnf")
+ add_definitions(-DG_LOG_DOMAIN="libdnf")
  
  # tests
--add_definitions(-DTESTDATADIR=\\"${CMAKE_SOURCE_DIR}/data/tests\\")
+-add_definitions(-DTESTDATADIR="${CMAKE_SOURCE_DIR}/data/tests")
 +if(NOT WITH_TESTS)
 +  set(TEST_DATA_DIR "/notests")
 +elseif(NOT DEFINED TEST_DATA_DIR)
@@ -31,3 +31,6 @@ index 60c66e94..1459dfbf 100644
  
  # librhsm
  if(ENABLE_RHSM_SUPPORT)
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb b/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
similarity index 93%
rename from meta/recipes-devtools/libdnf/libdnf_0.73.4.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
index 5b9e734e82..5a2d4d9364 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.74.0.bb
@@ -11,10 +11,9 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://enable_test_data_dir_set.patch \
            file://0001-drop-FindPythonInstDir.cmake.patch \
            file://armarch.patch \
-           file://0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-section.patch \
            "
 
-SRCREV = "79ed383cd5a822e6d8d9d549835383f5c5106204"
+SRCREV = "91a0bf9aada36a722855051526f012e0b5ab1af9"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


