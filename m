Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5F23E6013D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 20:56:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 06 Jul 2016 13:56:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,321,1464678000"; d="scan'208";a="730561638"
Received: from chiulunr-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.175.210])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Jul 2016 13:55:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 08:55:28 +1200
Message-Id: <9e9da3e1b8034b9c233471e6053c920aa6476bad.1467838464.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1467838464.git.paul.eggleton@linux.intel.com>
References: <cover.1467838464.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1467838464.git.paul.eggleton@linux.intel.com>
References: <cover.1467838464.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] gcc-runtime: add SUMMARY values
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
X-List-Received-Date: Wed, 06 Jul 2016 20:56:06 -0000

It's useful to know what the various libraries are that get produced by
gcc-runtime, as well as to have a specific SUMMARY for the recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 99f50f8..8e42a57 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -1,5 +1,7 @@
 require gcc-configure-common.inc
 
+SUMMARY = "Runtime libraries for GCC compilers"
+
 # Over-ride the LICENSE set by gcc-${PV}.inc to remove "& GPLv3"
 # All gcc-runtime packages are now covered by the runtime exception.
 LICENSE = "GPL-3.0-with-GCC-exception"
@@ -135,73 +137,98 @@ FILES_${PN}-dbg += "\
 "
 
 FILES_libg2c = "${target_libdir}/libg2c.so.*"
+SUMMARY_libg2c = "Companion runtime library for g77"
 FILES_libg2c-dev = "\
     ${libdir}/libg2c.so \
     ${libdir}/libg2c.a \
     ${libdir}/libfrtbegin.a \
 "
+SUMMARY_libg2c-dev = "Companion runtime library for g77 - development files"
 
 FILES_libstdc++ = "${libdir}/libstdc++.so.*"
+SUMMARY_libstdc++ = "C++ standard library for g++"
 FILES_libstdc++-dev = "\
     ${includedir}/c++/ \
     ${libdir}/libstdc++.so \
     ${libdir}/libstdc++*.la \
     ${libdir}/libsupc++.la \
 "
+SUMMARY_libstdc++-dev = "C++ standard library for g++ - development files"
 FILES_libstdc++-staticdev = "\
     ${libdir}/libstdc++*.a \
     ${libdir}/libsupc++.a \
 "
+SUMMARY_libstdc++-staticdev = "C++ standard library for g++ - static development files"
 
 FILES_libstdc++-precompile-dev = "${includedir}/c++/${TARGET_SYS}/bits/*.gch"
+SUMMARY_libstdc++-precompile-dev = "C++ standard library from gcc - precompiled header files"
 
 FILES_libssp = "${libdir}/libssp.so.*"
+SUMMARY_libssp = "Stack smashing protection library for gcc"
 FILES_libssp-dev = "\
     ${libdir}/libssp*.so \
     ${libdir}/libssp*_nonshared.a \
     ${libdir}/libssp*.la \
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp \
 "
+SUMMARY_libssp-dev = "Stack smashing protection library for gcc - development files"
 FILES_libssp-staticdev = "${libdir}/libssp*.a"
+SUMMARY_libssp-staticdev = "Stack smashing protection library for gcc - static development files"
 
 FILES_libquadmath = "${libdir}/libquadmath*.so.*"
+SUMMARY_libquadmath = "Quad-precision math library for gcc"
 FILES_libquadmath-dev = "\
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \
     ${libdir}/libquadmath*.so \
     ${libdir}/libquadmath.la \
 "
+SUMMARY_libquadmath-dev = "Quad-precision math library for gcc - development files"
 FILES_libquadmath-staticdev = "${libdir}/libquadmath.a"
+SUMMARY_libquadmath-staticdev = "Quad-precision math library for gcc - static development files"
 
+# NOTE: mudflap has been removed as of gcc 4.9 and has been superseded by the address sanitiser
 FILES_libmudflap = "${libdir}/libmudflap*.so.*"
+SUMMARY_libmudflap = "Pointer debugging library for gcc"
 FILES_libmudflap-dev = "\
     ${libdir}/libmudflap*.so \
     ${libdir}/libmudflap.la \
 "
+SUMMARY_libmudflap-dev = "Pointer debugging library for gcc - development files"
 FILES_libmudflap-staticdev = "${libdir}/libmudflap.a"
+SUMMARY_libmudflap-staticdev = "Pointer debugging library for gcc - static development files"
 
 FILES_libgomp = "${libdir}/libgomp*${SOLIBS}"
+SUMMARY_libgomp = "GNU OpenMP parallel programming library for gcc"
 FILES_libgomp-dev = "\
     ${libdir}/libgomp*${SOLIBSDEV} \
     ${libdir}/libgomp*.la \
     ${libdir}/libgomp.spec \
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
 "
+SUMMARY_libgomp-dev = "GNU OpenMP parallel programming library for gcc - development files"
 FILES_libgomp-staticdev = "${libdir}/libgomp*.a"
+SUMMARY_libgomp-staticdev = "GNU OpenMP parallel programming library for gcc - static development files"
 
 FILES_libatomic = "${libdir}/libatomic.so.*"
+SUMMARY_libatomic = "C++11 atomics support library for g++"
 FILES_libatomic-dev = "\
     ${libdir}/libatomic.so \
     ${libdir}/libatomic.la \
 "
+SUMMARY_libatomic-dev = "C++11 atomics support library for g++ - development files"
 FILES_libatomic-staticdev = "${libdir}/libatomic.a"
+SUMMARY_libatomic-staticdev = "C++11 atomics support library for g++ - static development files"
 
 FILES_libitm = "${libdir}/libitm.so.*"
+SUMMARY_libitm = "Transactional memory support library for gcc"
 FILES_libitm-dev = "\
     ${libdir}/libitm.so \
     ${libdir}/libitm.la \
     ${libdir}/libitm.spec \
 "
+SUMMARY_libitm-dev = "Transactional memory support library for gcc - development files"
 FILES_libitm-staticdev = "${libdir}/libitm.a"
+SUMMARY_libitm-staticdev = "Transactional memory support library for gcc - static development files"
 
 do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
-- 
2.5.5


