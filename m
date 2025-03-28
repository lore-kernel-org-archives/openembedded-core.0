Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48EA3C3600B
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 01:38:13 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.1732.1743125883823736428
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 18:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IrYi3/aq;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743125884; x=1774661884;
  h=from:to:cc:subject:date:message-id;
  bh=xZ3MdivhS/pBT1Mb5fhGVm0NalpLYAx0DgRdmKfR0EI=;
  b=IrYi3/aql11DQt97nOGvbwGBsXbBMrzKNUAyDxQZeqFV75dUXOpMML7A
   S52blnaIxwmWKC9r6ucfkEQfXjdiVaDjS8ARFH2H5UwS+MMf8zVyiL2ae
   VBmV02Pfi0BSjwE6sdBi015SADsUBXroGlREzdZV/4ab9VFBYtcX6yEws
   RdDk4kajcbBWvogUkM2Os/NLo0wEHBacWHe5FSar1AvuEDfFtgd8KZztc
   XI1mwK2UQOSyKuhzROIONh0VK1Rg2APoorNKLS0p/sXOkLEIbukwEusW6
   KOsVEffIMexndVfKR1FF/+jX0kYW+vKHpQJhf8fsMxqRaAzsZZrRiPbzU
   A==;
X-CSE-ConnectionGUID: Dy71MFRNR0yQaecaa1EIfA==
X-CSE-MsgGUID: ZqwWKVtnS5y4Ph9A2P08VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="173595234"
X-IronPort-AV: E=Sophos;i="6.14,281,1736780400"; 
   d="scan'208";a="173595234"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 10:38:01 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 120E0D4C33
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 10:37:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C92E9D8C9E
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 10:37:58 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5C7391A0071;
	Fri, 28 Mar 2025 09:37:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] [PATCH] libdnf: upgrade 0.73.4 -> 0.74.0
Date: Fri, 28 Mar 2025 09:37:52 +0800
Message-Id: <1743125872-26509-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 01:38:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213804

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-a-segfault-in-iterator-of-a-ConfigParser-section.patch
removed since it's included in 0.74.0

enable_test_data_dir_set.patch
refreshed for 0.74.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n-iterator-of-a-ConfigParser-section.patch | 84 -------------------
 .../libdnf/enable_test_data_dir_set.patch     | 13 +--
 .../{libdnf_0.73.4.bb => libdnf_0.74.0.bb}    |  3 +-
 3 files changed, 9 insertions(+), 91 deletions(-)
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
index 5620b51d4c..6fc05d9ff8 100644
--- a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
@@ -1,4 +1,4 @@
-From 05fff53c13fc5969e17f1e887b0b59bf0a088a6e Mon Sep 17 00:00:00 2001
+From 870f50ba4761317f2db018ac130a42087230dded Mon Sep 17 00:00:00 2001
 From: Joe Slater <joe.slater@windriver.com>
 Date: Wed, 22 Jul 2020 13:31:11 -0700
 Subject: [PATCH] libdnf: allow reproducible binary builds
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


