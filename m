Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B3E8B71BFC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 15:09:13 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2016 08:09:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,514,1473145200"; d="scan'208";a="21266914"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2016 08:09:14 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2016 18:06:40 +0300
Message-Id: <e0a3ec53fe77afff6db5877c56fd90697e7b9aa4.1476888929.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/19] boost: update to 1.62.0
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
X-List-Received-Date: Wed, 19 Oct 2016 15:09:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove backported 0003-smart_ptr-mips-assembly-doesn-t-compile-in-mips16e-m.patch

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...bjam-native_1.61.0.bb => bjam-native_1.62.0.bb} |  0
 .../boost/{boost-1.61.0.inc => boost-1.62.0.inc}   |  4 +-
 ...ips-assembly-doesn-t-compile-in-mips16e-m.patch | 60 ----------------------
 .../boost/{boost_1.61.0.bb => boost_1.62.0.bb}     |  1 -
 4 files changed, 2 insertions(+), 63 deletions(-)
 rename meta/recipes-support/boost/{bjam-native_1.61.0.bb => bjam-native_1.62.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.61.0.inc => boost-1.62.0.inc} (83%)
 delete mode 100644 meta/recipes-support/boost/boost/0003-smart_ptr-mips-assembly-doesn-t-compile-in-mips16e-m.patch
 rename meta/recipes-support/boost/{boost_1.61.0.bb => boost_1.62.0.bb} (85%)

diff --git a/meta/recipes-support/boost/bjam-native_1.61.0.bb b/meta/recipes-support/boost/bjam-native_1.62.0.bb
similarity index 100%
rename from meta/recipes-support/boost/bjam-native_1.61.0.bb
rename to meta/recipes-support/boost/bjam-native_1.62.0.bb
diff --git a/meta/recipes-support/boost/boost-1.61.0.inc b/meta/recipes-support/boost/boost-1.62.0.inc
similarity index 83%
rename from meta/recipes-support/boost/boost-1.61.0.inc
rename to meta/recipes-support/boost/boost-1.62.0.inc
index cd9d8a4..a097ea1 100644
--- a/meta/recipes-support/boost/boost-1.61.0.inc
+++ b/meta/recipes-support/boost/boost-1.62.0.inc
@@ -13,7 +13,7 @@ BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2"
 
-SRC_URI[md5sum] = "6095876341956f65f9d35939ccea1a9f"
-SRC_URI[sha256sum] = "a547bd06c2fd9a71ba1d169d9cf0339da7ebf4753849a8f7d6fdb8feee99b640"
+SRC_URI[md5sum] = "7ef085456c48c49a7fe8237f07e5f674"
+SRC_URI[sha256sum] = "bce80293052e2d6230f1bec9b7524b33412e4fb26e9723460a0f362ac15b7acb"
 
 S = "${WORKDIR}/${BOOST_P}"
diff --git a/meta/recipes-support/boost/boost/0003-smart_ptr-mips-assembly-doesn-t-compile-in-mips16e-m.patch b/meta/recipes-support/boost/boost/0003-smart_ptr-mips-assembly-doesn-t-compile-in-mips16e-m.patch
deleted file mode 100644
index 2b48d0d..0000000
--- a/meta/recipes-support/boost/boost/0003-smart_ptr-mips-assembly-doesn-t-compile-in-mips16e-m.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 4f19d72ca94418431e068cfd4ffb96ed9b289f6c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
-Date: Wed, 24 Aug 2016 17:34:59 +0100
-Subject: [PATCH 3/4] smart_ptr: mips assembly doesn't compile in mips16e mode
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-gcc.compile.c++ <builddir>/boost/bin.v2/libs/date_time/build/gcc-4.3.1/release/threading-multi/gregorian/greg_month.o
-
-    "mipsel-poky-linux-musl-g++" "-mel" "-mabi=32" "-msoft-float" "-march=mips32r2" "-mips16" "-minterlink-compressed" "-mtune=24kec" "-mdsp" "-Wl,-O1" "-Wl,--as-needed" "-fstack-protector-strong" "-Wl,-z,relro,-z,now" "--sysroot=<sysroot>"  -ftemplate-depth-128 -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=<srcdir>=/usr/src/debug/boost/1.61.0-r0 -fdebug-prefix-map=<sysroot_host>= -fdebug-prefix-map=<sysroot>= -fstack-protector-strong -pie -fpie -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -fvisibility-inlines-hidden -O3 -finline-functions -Wno-inline -Wall -pthread -fPIC  -DBOOST_ALL_DYN_LINK=1 -DBOOST_ALL_NO_LIB=1 -DDATE_TIME_INLINE -DNDEBUG  -I"." -c -o "<builddir>/boost/bin.v2/libs/date_time/build/gcc-4.3.1/release/threading-multi/gregorian/greg_month.o" "libs/date_time/src/gregorian/greg_month.cpp"
-
-{standard input}: Assembler messages:
-{standard input}:17603: Warning: the `dsp' extension requires MIPS32 revision 2 or greater
-{standard input}:17604: Error: unrecognized opcode `ll $3,4($16)'
-{standard input}:17606: Error: unrecognized opcode `sc $2,4($16)'
-{standard input}:17734: Error: unrecognized opcode `ll $3,8($16)'
-{standard input}:17736: Error: unrecognized opcode `sc $2,8($16)'
-{standard input}:18084: Error: unrecognized opcode `ll $3,4($4)'
-{standard input}:18086: Error: unrecognized opcode `sc $2,4($4)'
-{standard input}:18318: Error: unrecognized opcode `ll $3,8($4)'
-{standard input}:18320: Error: unrecognized opcode `sc $2,8($4)'
-{standard input}:19921: Error: unrecognized opcode `ll $3,4($2)'
-{standard input}:19923: Error: unrecognized opcode `sc $3,4($2)'
-{standard input}:20199: Error: unrecognized opcode `ll $4,4($16)'
-{standard input}:20201: Error: unrecognized opcode `sc $2,4($16)'
-{standard input}:23392: Error: unrecognized opcode `ll $4,8($16)'
-{standard input}:23394: Error: unrecognized opcode `sc $2,8($16)'
-...failed updating 1 target...
-
-boost/smart_ptr/detail/sp_counted_base_gcc_mips.hpp
-contains hand-written MIPS assembly, which is not compatible
-with the MIPS16e instruction set.
-
-By not using this file in MIPS16e mode, we fallback to using
-g++ 4.1+ __sync intrinsics (__sync_fetch_and_add() and
-__sync_val_compare_and_swap()) which are working fine.
-
-Signed-off-by: André Draszik <adraszik@tycoint.com>
----
-Upstream-Status: Backport https://svn.boost.org/trac/boost/ticket/12418
- boost/smart_ptr/detail/sp_counted_base.hpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/boost/smart_ptr/detail/sp_counted_base.hpp b/boost/smart_ptr/detail/sp_counted_base.hpp
-index 0addf07..0995ca8 100644
---- a/boost/smart_ptr/detail/sp_counted_base.hpp
-+++ b/boost/smart_ptr/detail/sp_counted_base.hpp
-@@ -65,7 +65,7 @@
- #elif defined( __GNUC__ ) && ( defined( __powerpc__ ) || defined( __ppc__ ) || defined( __ppc ) ) && !defined(__PATHSCALE__) && !defined( _AIX )
- # include <boost/smart_ptr/detail/sp_counted_base_gcc_ppc.hpp>
- 
--#elif defined( __GNUC__ ) && ( defined( __mips__ ) || defined( _mips ) ) && !defined(__PATHSCALE__)
-+#elif defined( __GNUC__ ) && ( defined( __mips__ ) || defined( _mips ) ) && !defined(__PATHSCALE__) && !defined( __mips16 )
- # include <boost/smart_ptr/detail/sp_counted_base_gcc_mips.hpp>
- 
- #elif defined( BOOST_SP_HAS_SYNC )
--- 
-2.9.3
-
diff --git a/meta/recipes-support/boost/boost_1.61.0.bb b/meta/recipes-support/boost/boost_1.62.0.bb
similarity index 85%
rename from meta/recipes-support/boost/boost_1.61.0.bb
rename to meta/recipes-support/boost/boost_1.62.0.bb
index 40e3870..120d129 100644
--- a/meta/recipes-support/boost/boost_1.61.0.bb
+++ b/meta/recipes-support/boost/boost_1.62.0.bb
@@ -7,7 +7,6 @@ SRC_URI += "\
     file://boost-CVE-2012-2677.patch \
     file://0001-boost-asio-detail-socket_types.hpp-fix-poll.h-includ.patch \
     file://0002-boost-test-execution_monitor.hpp-fix-mips-soft-float.patch \
-    file://0003-smart_ptr-mips-assembly-doesn-t-compile-in-mips16e-m.patch \
     file://0004-Use-atomic-by-default-when-BOOST_NO_CXX11_HDR_ATOMIC.patch \
     file://boost-math-disable-pch-for-gcc.patch \
 "
-- 
2.9.3


