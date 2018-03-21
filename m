Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 297B378967
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 08:36:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2L8adva014950
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 01:36:39 -0700 (PDT)
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 21 Mar 2018 01:36:38 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2018 16:36:24 +0800
Message-ID: <1521621384-24620-3-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521621384-24620-1-git-send-email-yi.zhao@windriver.com>
References: <1521621384-24620-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [PATCH 3/3] libcap-ng: update to 0.7.9
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2018 08:36:38 -0000
Content-Type: text/plain

Rebase python.patch.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libcap-ng/libcap-ng/python.patch               | 28 ++++++++++++----------
 .../{libcap-ng_0.7.8.bb => libcap-ng_0.7.9.bb}     |  4 ++--
 2 files changed, 18 insertions(+), 14 deletions(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.7.8.bb => libcap-ng_0.7.9.bb} (89%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng/python.patch b/meta/recipes-support/libcap-ng/libcap-ng/python.patch
index 59591eb..d60a0a3 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng/python.patch
+++ b/meta/recipes-support/libcap-ng/libcap-ng/python.patch
@@ -1,4 +1,4 @@
-From b01bb2694f66cd981e6d61523433dc3eb5ed32f2 Mon Sep 17 00:00:00 2001
+From b4a354ae8d4f7c2ec3ec421c7d8a790cc57e77a9 Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Sat, 18 Jul 2015 23:03:30 +0900
 Subject: [PATCH] configure.ac - Avoid an incorrect check for python.
@@ -8,30 +8,32 @@ Upstream-Status: pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- bindings/python/Makefile.am |  3 ++-
- configure.ac                | 15 ++-------------
- 2 files changed, 4 insertions(+), 14 deletions(-)
+ bindings/python/Makefile.am |  4 +++-
+ configure.ac                | 17 ++---------------
+ 2 files changed, 5 insertions(+), 16 deletions(-)
 
 diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
-index 82b9bb8..f9fe7a8 100644
+index 999b184..c8e49db 100644
 --- a/bindings/python/Makefile.am
 +++ b/bindings/python/Makefile.am
-@@ -23,7 +23,8 @@ SUBDIRS = test
+@@ -23,7 +23,9 @@
+ SUBDIRS = test
  CONFIG_CLEAN_FILES = *.loT *.rej *.orig
  AM_CFLAGS = -fPIC -DPIC
- PYLIBVER ?= python$(PYTHON_VERSION)
 -AM_CPPFLAGS = -I. -I$(top_builddir) -I@PYINCLUDEDIR@
++PYLIBVER ?= python$(PYTHON_VERSION)
 +PYINC ?= /usr/include/$(PYLIBVER)
 +AM_CPPFLAGS = -I. -I$(top_builddir) -I$(PYINC)
- LIBS = $(top_builddir)/src/libcap-ng.la
  SWIG_FLAGS = -python
  SWIG_INCLUDES = ${AM_CPPFLAGS}
+ pyexec_PYTHON = capng.py
 diff --git a/configure.ac b/configure.ac
-index 1d777d5..9d90f64 100644
+index 7f66179..079d026 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -123,19 +123,8 @@ if test x$use_python = xno ; then
+@@ -123,21 +123,8 @@ if test x$use_python = xno ; then
  else
  AC_MSG_RESULT(testing)
  AM_PATH_PYTHON
@@ -39,11 +41,13 @@ index 1d777d5..9d90f64 100644
 -if test -f ${PYINCLUDEDIR}/Python.h ; then
 -	python_found="yes"
 -	AC_SUBST(PYINCLUDEDIR)
+-	pybind_dir="python"
+-	AC_SUBST(pybind_dir)
 -	AC_MSG_NOTICE(Python bindings will be built)
 -else
 -	python_found="no"
 -	if test x$use_python = xyes ; then
--		AC_MSG_ERROR([Python explicitly required and python headers found])
+-		AC_MSG_ERROR([Python explicitly requested and python headers were not found])
 -	else
 -		AC_MSG_WARN("Python headers not found - python bindings will not be made")
 -	fi
@@ -54,5 +58,5 @@ index 1d777d5..9d90f64 100644
  AM_CONDITIONAL(HAVE_PYTHON, test ${python_found} = "yes")
  
 -- 
-1.8.4.2
+2.7.4
 
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.7.8.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.7.9.bb
similarity index 89%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.7.8.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.7.9.bb
index 3583194..aff6259 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng_0.7.8.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng_0.7.9.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
 
 inherit lib_package autotools python3native
 
-SRC_URI[md5sum] = "0dece96644bd798020e170fbf7663802"
-SRC_URI[sha256sum] = "c21af997445cd4107a55d386f955c5ea6f6e96ead693e9151277c0ab5f97d05f"
+SRC_URI[md5sum] = "2398d695508fab9ce33668c53a89b0e9"
+SRC_URI[sha256sum] = "4a1532bcf3731aade40936f6d6a586ed5a66ca4c7455e1338d1f6c3e09221328"
 
 DEPENDS += "swig-native python3"
 
-- 
2.7.4


