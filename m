Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C4E546FFE2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 23:49:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 06 Jul 2016 16:49:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,322,1464678000"; d="scan'208";a="990392923"
Received: from lynhueyo-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.219])
	by orsmga001.jf.intel.com with ESMTP; 06 Jul 2016 16:49:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 11:48:35 +1200
Message-Id: <094b6e045fc95f2698ac32d19b4f639f9539b6d3.1467848566.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1467848566.git.paul.eggleton@linux.intel.com>
References: <cover.1467848566.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1467848566.git.paul.eggleton@linux.intel.com>
References: <cover.1467848566.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 2/2] gcc-runtime: add SUMMARY values
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
X-List-Received-Date: Wed, 06 Jul 2016 23:49:31 -0000

It's useful to know what the various libraries are that get produced by
gcc-runtime, as well as to have a specific SUMMARY for the recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 99f50f8..526be55 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -1,5 +1,7 @@
 require gcc-configure-common.inc
 
+SUMMARY = "Runtime libraries from GCC"
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
+SUMMARY_libstdc++ = "GNU standard C++ library"
 FILES_libstdc++-dev = "\
     ${includedir}/c++/ \
     ${libdir}/libstdc++.so \
     ${libdir}/libstdc++*.la \
     ${libdir}/libsupc++.la \
 "
+SUMMARY_libstdc++-dev = "GNU standard C++ library - development files"
 FILES_libstdc++-staticdev = "\
     ${libdir}/libstdc++*.a \
     ${libdir}/libsupc++.a \
 "
+SUMMARY_libstdc++-staticdev = "GNU standard C++ library - static development files"
 
 FILES_libstdc++-precompile-dev = "${includedir}/c++/${TARGET_SYS}/bits/*.gch"
+SUMMARY_libstdc++-precompile-dev = "GNU standard C++ library - precompiled header files"
 
 FILES_libssp = "${libdir}/libssp.so.*"
+SUMMARY_libssp = "GNU stack smashing protection library"
 FILES_libssp-dev = "\
     ${libdir}/libssp*.so \
     ${libdir}/libssp*_nonshared.a \
     ${libdir}/libssp*.la \
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp \
 "
+SUMMARY_libssp-dev = "GNU stack smashing protection library - development files"
 FILES_libssp-staticdev = "${libdir}/libssp*.a"
+SUMMARY_libssp-staticdev = "GNU stack smashing protection library - static development files"
 
 FILES_libquadmath = "${libdir}/libquadmath*.so.*"
+SUMMARY_libquadmath = "GNU quad-precision math library"
 FILES_libquadmath-dev = "\
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/quadmath* \
     ${libdir}/libquadmath*.so \
     ${libdir}/libquadmath.la \
 "
+SUMMARY_libquadmath-dev = "GNU quad-precision math library - development files"
 FILES_libquadmath-staticdev = "${libdir}/libquadmath.a"
+SUMMARY_libquadmath-staticdev = "GNU quad-precision math library - static development files"
 
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
+SUMMARY_libgomp = "GNU OpenMP parallel programming library"
 FILES_libgomp-dev = "\
     ${libdir}/libgomp*${SOLIBSDEV} \
     ${libdir}/libgomp*.la \
     ${libdir}/libgomp.spec \
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
 "
+SUMMARY_libgomp-dev = "GNU OpenMP parallel programming library - development files"
 FILES_libgomp-staticdev = "${libdir}/libgomp*.a"
+SUMMARY_libgomp-staticdev = "GNU OpenMP parallel programming library - static development files"
 
 FILES_libatomic = "${libdir}/libatomic.so.*"
+SUMMARY_libatomic = "GNU C++11 atomics support library"
 FILES_libatomic-dev = "\
     ${libdir}/libatomic.so \
     ${libdir}/libatomic.la \
 "
+SUMMARY_libatomic-dev = "GNU C++11 atomics support library - development files"
 FILES_libatomic-staticdev = "${libdir}/libatomic.a"
+SUMMARY_libatomic-staticdev = "GNU C++11 atomics support library - static development files"
 
 FILES_libitm = "${libdir}/libitm.so.*"
+SUMMARY_libitm = "GNU transactional memory support library"
 FILES_libitm-dev = "\
     ${libdir}/libitm.so \
     ${libdir}/libitm.la \
     ${libdir}/libitm.spec \
 "
+SUMMARY_libitm-dev = "GNU transactional memory support library - development files"
 FILES_libitm-staticdev = "${libdir}/libitm.a"
+SUMMARY_libitm-staticdev = "GNU transactional memory support library - static development files"
 
 do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
 do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
-- 
2.5.5


