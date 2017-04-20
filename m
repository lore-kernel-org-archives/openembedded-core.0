Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 27FDE71C70
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 18:21:10 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id d203so19180931iof.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 11:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DOM7pij54rn6LSzv1j/U76Vhl73QHmks9Rf5aWt/sJg=;
	b=jkPTq/QCS4EozW8N++PO7WlMigZgj50f/0/MJ6V7QHhL76T9bnRxJQ/AbUGWmFyI4V
	KgpH9K6+3/R9TiJ0x8y0IeVW8A1S308PO3ThxMAs2vQSWrDJuFl77YwV6N+/l5weZePe
	wXhld6JhEC/aB6IZ45QUaXW94GhkotY+iKz+t35QcTAfX7hLmegWlxaKxTCSKKsgZVE0
	TikzEFmaCWocLIxr/j/DugGWhyEEjOeDiOLiw4S0mEEJzjfz3WjGgT5LiPlTRr/uloSy
	wBJYTIvzPKuflvnS1ENsZwhsin+7Yke2tn9MJZbrzXAHPQNxmmzqG2rX9kWI4Oa2FT7H
	ktdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DOM7pij54rn6LSzv1j/U76Vhl73QHmks9Rf5aWt/sJg=;
	b=dF5frVcduxCBwNnGwnIGl838b/ZsEiVuCtQ/95NEu4PWj5iS4t95Rga6HNcpnekZLl
	SDQKOhRtHsTzJX3TCKwKpJnz5qXHIniKSzVB+1cx6/ynRnQvBVJ/0iMXJVTOPSyiuLyt
	YPUIjiwwNVodoGJQRoB2bRqulQSIuPqJwvNAZgqOuA2Xtwiyzze7bUH3Tkid96AY5Kb1
	omVbBLfCU2SssfBeyR2Ov71qPJvWgJ2YUP19+mINEFqcSYjIdQAEyvPEEybGB4kCffe9
	pn+28U/4dyLwC4gIcD0sXZdHcHYfE07FU9STBfSBk3TvkUxabT/ouxqDrYdOBN6EiGkl
	4HIw==
X-Gm-Message-State: AN3rC/5XLc+QyHDuXL8G39eieuehPdSL1v/NNzvmWIgL3vyzRSOW4yS0
	E+Pl1ZudeMmCCEmw
X-Received: by 10.98.66.82 with SMTP id p79mr9017613pfa.146.1492712471090;
	Thu, 20 Apr 2017 11:21:11 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e131sm11795417pfg.10.2017.04.20.11.21.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Apr 2017 11:21:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Apr 2017 11:20:24 -0700
Message-Id: <20170420182028.31964-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
MIME-Version: 1.0
Subject: [PATCH 1/5] boost: Upgrade to 1.64.0
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
X-List-Received-Date: Thu, 20 Apr 2017 18:21:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

drop upstreamed patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...bjam-native_1.63.0.bb => bjam-native_1.64.0.bb} |   0
 .../boost/{boost-1.63.0.inc => boost-1.64.0.inc}   |   7 +-
 ...soft-float-on-ARM-we-should-not-expect-th.patch |  29 ---
 ...by-default-when-BOOST_NO_CXX11_HDR_ATOMIC.patch |  59 -----
 meta/recipes-support/boost/boost/py3.patch         | 269 ---------------------
 .../boost/{boost_1.63.0.bb => boost_1.64.0.bb}     |   3 -
 6 files changed, 2 insertions(+), 365 deletions(-)
 rename meta/recipes-support/boost/{bjam-native_1.63.0.bb => bjam-native_1.64.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.63.0.inc => boost-1.64.0.inc} (83%)
 delete mode 100644 meta/recipes-support/boost/boost/0001-When-using-soft-float-on-ARM-we-should-not-expect-th.patch
 delete mode 100644 meta/recipes-support/boost/boost/0004-Use-atomic-by-default-when-BOOST_NO_CXX11_HDR_ATOMIC.patch
 delete mode 100644 meta/recipes-support/boost/boost/py3.patch
 rename meta/recipes-support/boost/{boost_1.63.0.bb => boost_1.64.0.bb} (72%)

diff --git a/meta/recipes-support/boost/bjam-native_1.63.0.bb b/meta/recipes-support/boost/bjam-native_1.64.0.bb
similarity index 100%
rename from meta/recipes-support/boost/bjam-native_1.63.0.bb
rename to meta/recipes-support/boost/bjam-native_1.64.0.bb
diff --git a/meta/recipes-support/boost/boost-1.63.0.inc b/meta/recipes-support/boost/boost-1.64.0.inc
similarity index 83%
rename from meta/recipes-support/boost/boost-1.63.0.inc
rename to meta/recipes-support/boost/boost-1.64.0.inc
index 1c1563050c3..2fa63dca6c7 100644
--- a/meta/recipes-support/boost/boost-1.63.0.inc
+++ b/meta/recipes-support/boost/boost-1.64.0.inc
@@ -12,12 +12,9 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/boost/boost/${PV}/${BOOST_P}.tar.bz2"
-
-SRC_URI[md5sum] = "1c837ecd990bb022d07e7aab32b09847"
-SRC_URI[sha256sum] = "beae2529f759f6b3bf3f4969a19c2e9d6f0c503edcb2de4a61d1428519fcb3b0"
+SRC_URI[md5sum] = "93eecce2abed9d2442c9676914709349"
+SRC_URI[sha256sum] = "7bcc5caace97baa948931d712ea5f37038dbb1c5d89b43ad4def4ed7cb683332"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/boost/files/"
 
-PR = "r1"
-
 S = "${WORKDIR}/${BOOST_P}"
diff --git a/meta/recipes-support/boost/boost/0001-When-using-soft-float-on-ARM-we-should-not-expect-th.patch b/meta/recipes-support/boost/boost/0001-When-using-soft-float-on-ARM-we-should-not-expect-th.patch
deleted file mode 100644
index bafd5ce001e..00000000000
--- a/meta/recipes-support/boost/boost/0001-When-using-soft-float-on-ARM-we-should-not-expect-th.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9ab0914207e6d0e6b75ce12147c54b96478feb64 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 21 Feb 2017 12:50:35 +0200
-Subject: [PATCH] When using soft-float, on ARM we should not expect the FE_*
- symbols
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- boost/test/execution_monitor.hpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/boost/test/execution_monitor.hpp b/boost/test/execution_monitor.hpp
-index f53348a..86252d7 100644
---- a/boost/test/execution_monitor.hpp
-+++ b/boost/test/execution_monitor.hpp
-@@ -498,7 +498,7 @@ enum masks {
- 
-     BOOST_FPE_ALL       = MCW_EM,
- 
--#elif defined(BOOST_NO_FENV_H) || defined(BOOST_CLANG) /* *** */
-+#elif defined(BOOST_NO_FENV_H) || defined(BOOST_CLANG) || defined(__ARM_PCS) /* *** */
-     BOOST_FPE_ALL       = BOOST_FPE_OFF,
- 
- #else /* *** */
--- 
-2.11.0
-
diff --git a/meta/recipes-support/boost/boost/0004-Use-atomic-by-default-when-BOOST_NO_CXX11_HDR_ATOMIC.patch b/meta/recipes-support/boost/boost/0004-Use-atomic-by-default-when-BOOST_NO_CXX11_HDR_ATOMIC.patch
deleted file mode 100644
index ab7826ba266..00000000000
--- a/meta/recipes-support/boost/boost/0004-Use-atomic-by-default-when-BOOST_NO_CXX11_HDR_ATOMIC.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From c234cc557f60729e071d6da59747c1a9289555c5 Mon Sep 17 00:00:00 2001
-From: Peter Dimov <pdimov@pdimov.com>
-Date: Sun, 28 Aug 2016 21:28:21 +0300
-Subject: [PATCH 4/4] Use <atomic> by default when BOOST_NO_CXX11_HDR_ATOMIC is
- not defined
-
----
-Upstream-Status: Backport [https://github.com/boostorg/smart_ptr/commit/20fedcff2ca3143503ec4e876d47745ab0ec7b0c]
-Signed-off-by: André Draszik <git@andred.net>
- boost/smart_ptr/detail/atomic_count.hpp    | 3 +++
- boost/smart_ptr/detail/sp_counted_base.hpp | 3 +++
- boost/smart_ptr/detail/spinlock.hpp        | 3 +++
- 3 files changed, 9 insertions(+)
-
-diff --git a/boost/smart_ptr/detail/atomic_count.hpp b/boost/smart_ptr/detail/atomic_count.hpp
-index 8aefd44..6e4f71a 100644
---- a/boost/smart_ptr/detail/atomic_count.hpp
-+++ b/boost/smart_ptr/detail/atomic_count.hpp
-@@ -73,6 +73,9 @@
- #elif defined( BOOST_DISABLE_THREADS ) && !defined( BOOST_SP_ENABLE_THREADS ) && !defined( BOOST_DISABLE_WIN32 )
- # include <boost/smart_ptr/detail/atomic_count_nt.hpp>
- 
-+#elif !defined( BOOST_NO_CXX11_HDR_ATOMIC )
-+# include <boost/smart_ptr/detail/atomic_count_std_atomic.hpp>
-+
- #elif defined( __GNUC__ ) && ( defined( __i386__ ) || defined( __x86_64__ ) ) && !defined( __PATHSCALE__ )
- # include <boost/smart_ptr/detail/atomic_count_gcc_x86.hpp>
- 
-diff --git a/boost/smart_ptr/detail/sp_counted_base.hpp b/boost/smart_ptr/detail/sp_counted_base.hpp
-index 0995ca8..83ede23 100644
---- a/boost/smart_ptr/detail/sp_counted_base.hpp
-+++ b/boost/smart_ptr/detail/sp_counted_base.hpp
-@@ -44,6 +44,9 @@
- #elif defined( BOOST_SP_HAS_CLANG_C11_ATOMICS )
- # include <boost/smart_ptr/detail/sp_counted_base_clang.hpp>
- 
-+#elif !defined( BOOST_NO_CXX11_HDR_ATOMIC )
-+# include <boost/smart_ptr/detail/sp_counted_base_std_atomic.hpp>
-+
- #elif defined( __SNC__ )
- # include <boost/smart_ptr/detail/sp_counted_base_snc_ps3.hpp>
- 
-diff --git a/boost/smart_ptr/detail/spinlock.hpp b/boost/smart_ptr/detail/spinlock.hpp
-index 19f93d7..0b618df 100644
---- a/boost/smart_ptr/detail/spinlock.hpp
-+++ b/boost/smart_ptr/detail/spinlock.hpp
-@@ -43,6 +43,9 @@
- #elif defined( BOOST_SP_USE_PTHREADS )
- #  include <boost/smart_ptr/detail/spinlock_pt.hpp>
- 
-+#elif !defined( BOOST_NO_CXX11_HDR_ATOMIC )
-+#  include <boost/smart_ptr/detail/spinlock_std_atomic.hpp>
-+
- #elif defined(__GNUC__) && defined( __arm__ ) && !defined( __thumb__ )
- #  include <boost/smart_ptr/detail/spinlock_gcc_arm.hpp>
- 
--- 
-2.9.3
-
diff --git a/meta/recipes-support/boost/boost/py3.patch b/meta/recipes-support/boost/boost/py3.patch
deleted file mode 100644
index 2b1ff1865e9..00000000000
--- a/meta/recipes-support/boost/boost/py3.patch
+++ /dev/null
@@ -1,269 +0,0 @@
-Backport fixes from upstream (as of boost super-module commit 0d52b9) to improve
-the building of the Boost Python module with Python 3.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/build/Jamfile b/build/Jamfile
-index 313fdab..f14dc11 100644
---- a/libs/python/build/Jamfile
-+++ b/libs/python/build/Jamfile
-@@ -6,6 +6,7 @@ import os ;
- import indirect ;
- import modules ;
- import feature ;
-+import property ;
- 
- import python ;
- 
-@@ -30,21 +31,8 @@ else
-         ;
- }
- 
--rule find-py3-version
--{
--    local versions = [ feature.values python ] ;
--    local py3ver ;
--    for local v in $(versions)
--    {
--        if $(v) >= 3.0
--        {
--            py3ver = $(v) ;
--        }
--    }
--    return $(py3ver) ;
--}
--
--py3-version = [ find-py3-version ] ;
-+py2-version = [ py-version 2 ] ;
-+py3-version = [ py-version 3 ] ;
- 
- project boost/python
-   : source-location ../src
-@@ -52,11 +40,17 @@ project boost/python
- 
- rule cond ( test ? : yes * : no * ) { if $(test) { return $(yes) ; } else { return $(no) ; } }
- rule unless ( test ? : yes * : no * ) { if ! $(test) { return $(yes) ; } else { return $(no) ; } }
-+local rule eq ( a : b ) { if $(a) = $(b) { return 1 ; } }
- 
--rule lib_boost_python ( is-py3 ? )
--{
-+lib_boost_python(2) = boost_python ;
-+lib_boost_python(3) = boost_python3 ;
- 
--    lib [ cond $(is-py3) : boost_python3 : boost_python ]
-+lib_boost_python($(py2-version)) = $(lib_boost_python(2)) ;
-+lib_boost_python($(py3-version)) = $(lib_boost_python(3)) ;
-+
-+rule lib_boost_python ( version )
-+{
-+    lib $(lib_boost_python($(version)))
-         : # sources
-         numeric.cpp
-         list.cpp
-@@ -112,11 +106,13 @@ rule lib_boost_python ( is-py3 ? )
-             <dependency>config-warning
- 
-             <python-debugging>on:<define>BOOST_DEBUG_PYTHON
--            [ cond $(is-py3) : <python>$(py3-version) ]
-+            <python>$(version)
- 
-             -<tag>@$(BOOST_JAMROOT_MODULE)%$(BOOST_JAMROOT_MODULE).tag
-             <tag>@$(BOOST_JAMROOT_MODULE)%$(BOOST_JAMROOT_MODULE).python-tag
- 
-+            <conditional>@python.require-py
-+
-         :   # default build
-             <link>shared
-         :   # usage requirements
-@@ -125,51 +121,68 @@ rule lib_boost_python ( is-py3 ? )
-         ;
- }
- 
--rule lib_boost_numpy ( is-py3 ? )
-+lib_boost_numpy(2) = boost_numpy ;
-+lib_boost_numpy(3) = boost_numpy3 ;
-+
-+lib_boost_numpy($(py2-version)) = $(lib_boost_python(2)) ;
-+lib_boost_numpy($(py3-version)) = $(lib_boost_python(3)) ;
-+
-+rule lib_boost_numpy ( version )
- {
-     numpy-include = [ python.numpy-include ] ;
--    lib [ cond $(is-py3) : boost_numpy3 : boost_numpy ]
-+    lib $(lib_boost_numpy($(version)))
-         : # sources
-         numpy/dtype.cpp
-         numpy/matrix.cpp
-         numpy/ndarray.cpp
--	numpy/numpy.cpp
--	numpy/scalars.cpp
--	numpy/ufunc.cpp
-+        numpy/numpy.cpp
-+        numpy/scalars.cpp
-+        numpy/ufunc.cpp
-         :   # requirements
-+            <link>static:<define>BOOST_NUMPY_STATIC_LIB 
-+            <define>BOOST_NUMPY_SOURCE
-             [ cond [ python.numpy ] : <library>/python//python_for_extensions ]
-             [ unless [ python.numpy ] : <build>no ]
--	    <include>$(numpy-include)
--	    <library>boost_python
-+            <include>$(numpy-include)
-+            <library>$(lib_boost_python($(version)))
-             <python-debugging>on:<define>BOOST_DEBUG_PYTHON
--            [ cond $(is-py3) : <python>$(py3-version) ]
-+            <python>$(version)
- 
-             -<tag>@$(BOOST_JAMROOT_MODULE)%$(BOOST_JAMROOT_MODULE).tag
-             <tag>@$(BOOST_JAMROOT_MODULE)%$(BOOST_JAMROOT_MODULE).python-tag
- 
-+            <conditional>@python.require-py
-+
-         :   # default build
-             <link>shared
-         :   # usage requirements
-+			<link>static:<define>BOOST_NUMPY_STATIC_LIB
-             <python-debugging>on:<define>BOOST_DEBUG_PYTHON
-         ;
- }
- 
--libraries = boost_python ;
--libraries3 = boost_python3 ;
--if [ python.numpy ]
--{
--    libraries += boost_numpy ;
--    libraries3 += boost_numpy3 ;
--}
--
--lib_boost_python ;
--lib_boost_numpy ;
-+libraries = ;
- 
--if $(py3-version)
-+for local N in 2 3
- {
--    lib_boost_python yes ;
--    lib_boost_numpy yes ;
--    libraries += $(libraries3) ;
-+    if $(py$(N)-version)
-+    {
-+        lib_boost_python $(py$(N)-version) ;
-+        libraries += $(lib_boost_python($(py$(N)-version))) ;
-+    }
-+    else
-+    {
-+        alias $(lib_boost_python($(N))) ;
-+    }
-+    if $(py$(N)-version) && [ python.numpy ]
-+    {
-+        lib_boost_numpy $(py$(N)-version) ;
-+        libraries += $(lib_boost_numpy($(py$(N)-version))) ;
-+    }
-+    else
-+    {
-+        alias $(lib_boost_numpy($(N))) ;
-+    }
- }
- 
- boost-install $(libraries) ;
-diff --git a/src/tools/python.jam b/src/tools/python.jam
-index cc13385..bf300b8 100644
---- a/tools/build/src/tools/python.jam
-+++ b/tools/build/src/tools/python.jam
-@@ -34,6 +34,7 @@ import path ;
- import feature ;
- import set ;
- import builtin ;
-+import property-set ;
- 
- 
- # Make this module a project.
-@@ -60,6 +61,10 @@ lib rt ;
- # installed in the development system's default paths.
- feature.feature pythonpath : : free optional path ;
- 
-+# The best configured version of Python 2 and 3.
-+py2-version = ;
-+py3-version = ;
-+
- # Initializes the Python toolset. Note that all parameters are optional.
- #
- # - version -- the version of Python to use. Should be in Major.Minor format,
-@@ -861,6 +866,11 @@ local rule configure ( version ? : cmd-or-prefix ? : includes * : libraries ? :
-         if ! $(version) in [ feature.values python ]
-         {
-             feature.extend python : $(version) ;
-+            py$(major-minor[1])-version ?= $(version) ;
-+            if $(py$(major-minor[1])-version) < $(version)
-+            {
-+                py$(major-minor[1])-version = $(version) ;
-+            }
-         }
-         target-requirements += <python>$(version:E=default) ;
-     }
-@@ -916,6 +926,9 @@ local rule configure ( version ? : cmd-or-prefix ? : includes * : libraries ? :
-         }
-     }
- 
-+    # In case we added duplicate requirements from what the user specified.
-+    target-requirements = [ sequence.unique $(target-requirements) ] ;
-+
-     # Global, but conditional, requirements to give access to the interpreter
-     # for general utilities, like other toolsets, that run Python scripts.
-     toolset.add-requirements
-@@ -934,19 +947,6 @@ local rule configure ( version ? : cmd-or-prefix ? : includes * : libraries ? :
-         toolset.add-requirements <target-os>$(target-os):<python>$(version:E=default) ;
-     }
- 
--    # We also set a default requirement that assigns the first python configured
--    # for a particular target OS as the default. This makes it so that we can
--    # select a python interpreter with only knowledge of the target OS. And hence
--    # can configure different Pythons based on the target OS only.
--    local toolset-requirements = [ toolset.requirements ] ;
--    local toolset-target-os-requirements
--        = [ property.evaluate-conditionals-in-context
--            [ $(toolset-requirements).raw ] : <target-os>$(target-os) ] ;
--    if ! <python> in $(toolset-target-os-requirements:G)
--    {
--        toolset.add-requirements <target-os>$(target-os):<python>$(version:E=default) ;
--    }
--
-     # Register the right suffix for extensions.
-     register-extension-suffix $(extension-suffix) : $(target-requirements) ;
- 
-@@ -1038,6 +1038,22 @@ local rule configure ( version ? : cmd-or-prefix ? : includes * : libraries ? :
-             : $(usage-requirements)
-             ;
-     }
-+    
-+}
-+
-+# Conditional rule specification that will prevent building of a target
-+# if there is no matching python configuration available with the given
-+# required properties.
-+rule require-py ( properties * )
-+{
-+    local py-ext-target = [ $(.project).find python_for_extensions ] ;
-+    local property-set = [ property-set.create $(properties) ] ;
-+    property-set = [ $(property-set).expand ] ;
-+    local py-ext-alternative = [ $(py-ext-target).select-alternatives $(property-set) ] ;
-+    if ! $(py-ext-alternative)
-+    {
-+        return <build>no ;
-+    }
- }
- 
- 
-@@ -1298,5 +1314,11 @@ rule numpy-test ( name : sources * : requirements * )
-         : $(name) ] ;
- }
- 
-+rule py-version ( n )
-+{
-+    return $(py$(n)-version) ;
-+}
-+
- IMPORT $(__name__) : bpl-test : : bpl-test ;
- IMPORT $(__name__) : numpy-test : : numpy-test ;
-+IMPORT $(__name__) : py-version : : py-version ;
diff --git a/meta/recipes-support/boost/boost_1.63.0.bb b/meta/recipes-support/boost/boost_1.64.0.bb
similarity index 72%
rename from meta/recipes-support/boost/boost_1.63.0.bb
rename to meta/recipes-support/boost/boost_1.64.0.bb
index 1107686bca2..119eb0af452 100644
--- a/meta/recipes-support/boost/boost_1.63.0.bb
+++ b/meta/recipes-support/boost/boost_1.64.0.bb
@@ -3,13 +3,10 @@ require boost.inc
 
 SRC_URI += "\
     file://arm-intrinsics.patch \
-    file://0001-When-using-soft-float-on-ARM-we-should-not-expect-th.patch \
     file://boost-CVE-2012-2677.patch \
     file://0001-boost-asio-detail-socket_types.hpp-fix-poll.h-includ.patch \
-    file://0004-Use-atomic-by-default-when-BOOST_NO_CXX11_HDR_ATOMIC.patch \
     file://boost-math-disable-pch-for-gcc.patch \
     file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
     file://0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
     file://0002-Don-t-set-up-m32-m64-we-do-that-ourselves.patch \
-    file://py3.patch \
 "
-- 
2.12.2


