Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QJuKb-0003KZ-Tu
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 23:19:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 May 2011 14:16:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,347,1301900400"; d="scan'208";a="745285937"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by orsmga001.jf.intel.com with ESMTP; 10 May 2011 14:16:10 -0700
Message-Id: <423e25f7996cd6b5fbe6285b1aa04832fd12150a.1305062027.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1305062026.git.nitin.a.kamble@intel.com>
References: <cover.1305062026.git.nitin.a.kamble@intel.com>
Old-Date: Sat, 30 Apr 2011 13:36:22 -0700
Date: Tue, 10 May 2011 14:16:10 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 01/16] gcc-4.6.0: Apply linaro patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2011 21:19:05 -0000

From: Khem Raj <raj.khem@gmail.com>

We take the improvements done by linaro for gcc 4.6

Signed-off-by: Khem Raj <raj.khem@gmail.com>

gcc-4.6.0: fix PR and update upstream-status for patches

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.0.inc            |    6 +-
 .../gcc/gcc-4.6.0/100-uclibc-conf.patch            |    1 +
 .../gcc/gcc-4.6.0/103-uclibc-conf-noupstream.patch |    1 +
 .../gcc/gcc-4.6.0/200-uclibc-locale.patch          |    1 +
 .../gcc/gcc-4.6.0/203-uclibc-locale-no__x.patch    |    1 +
 .../gcc-4.6.0/204-uclibc-locale-wchar_fix.patch    |    1 +
 .../gcc/gcc-4.6.0/205-uclibc-locale-update.patch   |    1 +
 .../gcc/gcc-4.6.0/301-missing-execinfo_h.patch     |    1 +
 .../gcc/gcc-4.6.0/302-c99-snprintf.patch           |    1 +
 .../gcc/gcc-4.6.0/303-c99-complex-ugly-hack.patch  |    1 +
 .../gcc/gcc-4.6.0/304-index_macro.patch            |    1 +
 .../gcc-4.6.0/305-libmudflap-susv3-legacy.patch    |    2 +
 .../gcc/gcc-4.6.0/306-libstdc++-namespace.patch    |    1 +
 .../gcc/gcc-4.6.0/307-locale_facets.patch          |    1 +
 .../gcc/gcc-4.6.0/602-sdk-libstdc++-includes.patch |    1 +
 .../recipes-devtools/gcc/gcc-4.6.0/64bithack.patch |    1 +
 .../gcc/gcc-4.6.0/740-sh-pr24836.patch             |    1 +
 .../gcc/gcc-4.6.0/800-arm-bigendian.patch          |    1 +
 .../gcc/gcc-4.6.0/904-flatten-switch-stmt-00.patch |    1 +
 .../gcc/gcc-4.6.0/COLLECT_GCC_OPTIONS.patch        |    1 +
 .../GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch       |    1 +
 .../gcc/gcc-4.6.0/arm-bswapsi2.patch               |    1 +
 .../gcc/gcc-4.6.0/arm-nolibfloat.patch             |    1 +
 .../gcc/gcc-4.6.0/arm-softfloat.patch              |    1 +
 .../gcc/gcc-4.6.0/cache-amnesia.patch              |    1 +
 .../gcc-4.6.0/disable_relax_pic_calls_flag.patch   |    1 +
 .../gcc/gcc-4.6.0/fortran-cross-compile-hack.patch |    1 +
 .../gcc/gcc-4.6.0/gcc-4.0.2-e300c2c3.patch         |    1 +
 .../gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch          |    1 +
 .../gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch      |    1 +
 .../0002-Backport-from-mainline.patch              |    2 +
 .../0003-Backport-from-mainline.patch              |    2 +
 .../0004-Backport-from-mainline.patch              |    2 +
 .../0005-Backport-from-mainline.patch              |    2 +
 .../0006-Backport-from-mainline.patch              |    2 +
 .../0007-Backport-from-mainline.patch              |    2 +
 ...26-Paolo-Carlini-paolo.carlini-oracle.com.patch |    2 +
 .../0009-Backport-from-mainline.patch              |    2 +
 ...-27-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |    2 +
 ...-03-28-Richard-Guenther-rguenther-suse.de.patch |    2 +
 .../gcc-4_6-branch-backports/0015-gcc.patch        |    2 +
 .../0016-Backport-from-mainline.patch              |    2 +
 .../0017-libgfortran.patch                         |    2 +
 ...Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch |    2 +
 ...-rx-rx.h-LABEL_ALIGN_AFTER_BARRIER-Define.patch |    2 +
 .../0021-c.opt-Add-std-c-03.patch                  |    2 +
 .../gcc-4_6-branch-backports/0022-PR-c-47570.patch |    2 +
 .../gcc-4_6-branch-backports/0023-PR-c-47504.patch |    2 +
 ...ild_noexcept_spec-Call-cxx_constant_value.patch |    2 +
 .../gcc-4_6-branch-backports/0025-c-family.patch   |    2 +
 ...026-decl2.c-cp_check_const_attributes-New.patch |    2 +
 .../gcc-4_6-branch-backports/0027-Core-1148.patch  |    2 +
 .../gcc-4_6-branch-backports/0028-PR-c-48313.patch |    2 +
 .../gcc-4_6-branch-backports/0029-PR-c-47999.patch |    2 +
 ...non_dependent_expr-Keep-dereferences-outs.patch |    2 +
 ...rence_binding-Allow-direct-binding-to-an-.patch |    2 +
 .../gcc-4_6-branch-backports/0032-Core-1232.patch  |    2 +
 ...-is_valid_constexpr_fn-Specify-input-loca.patch |    2 +
 .../gcc-4_6-branch-backports/0034-PR-c-48296.patch |    2 +
 .../gcc-4_6-branch-backports/0035-PR-c-48166.patch |    2 +
 ...a-alpha.c-alpha_sr_alias_set-Don-t-define.patch |    2 +
 .../gcc-4_6-branch-backports/0038-PR-c-48319.patch |    2 +
 .../0039-PR-preprocessor-48248.patch               |    2 +
 .../0040-PR-debug-48253.patch                      |    2 +
 .../gcc-4_6-branch-backports/0042-PR-c-48265.patch |    2 +
 .../0043-Fix-a-typo-in-FLOAT_SSE_REGS.patch        |    2 +
 .../gcc-4_6-branch-backports/0044-PR-c-48281.patch |    2 +
 .../gcc-4_6-branch-backports/0045-PR-c-48369.patch |    2 +
 .../gcc-4_6-branch-backports/0046-PR-c-48212.patch |    2 +
 ...-03-31-Richard-Guenther-rguenther-suse.de.patch |    2 +
 .../0049-PR-target-48142.patch                     |    2 +
 .../0050-PR-target-16292.patch                     |    2 +
 .../gcc-4_6-branch-backports/0051-PR-c-48280.patch |    2 +
 ...07-from-trunk-to-the-4.6-release-branch-t.patch |    2 +
 .../0054-Backport-from-mainline.patch              |    2 +
 ...fig-spu-t-spu-elf-dp-bit.c-Use-instead-of.patch |    2 +
 ...11-04-02-Jonathan-Wakely-redi-gcc.gnu.org.patch |    2 +
 ...-de.po-el.po-es.po-fi.po-fr.po-id.po-ja.p.patch |    2 +
 ...-da.po-de.po-el.po-es.po-fi.po-fr.po-id.p.patch |    2 +
 ...n.dg-bessel_6.f90-Use-dg-add-options-ieee.patch |    2 +
 ...4-2011-04-04-Janus-Weil-janus-gcc.gnu.org.patch |    2 +
 .../0065-es.po-Update.patch                        |    2 +
 ...ers-for-functions-from-the-frexp-family-w.patch |    2 +
 ...-04-05-Richard-Guenther-rguenther-suse.de.patch |    2 +
 ....c-self_referential_size-Fix-2010-07-13-c.patch |    2 +
 .../0070-de.po-Update.patch                        |    2 +
 ...ov-io.c-Use-GCC-Runtime-Library-Exception.patch |    2 +
 .../0073-Backported-from-mainline.patch            |    2 +
 .../0074-PR-debug-48466.patch                      |    2 +
 ...73-from-trunk-to-the-4.6-release-branch-t.patch |    2 +
 .../0077-Backport-from-mainline.patch              |    2 +
 .../0078-de.po-Update.patch                        |    2 +
 .../0079-PR-debug-48343.patch                      |    2 +
 .../0080-PR-fortran-48117.patch                    |    2 +
 ...-config-i386-sse.md-Update-copyright-year.patch |    2 +
 ...ure-stackalign-non-local-goto-5.c-Fix-for.patch |    2 +
 .../0084-PR-tree-optimization-48377.patch          |    2 +
 .../0085-de.po-Update.patch                        |    2 +
 .../gcc-4_6-branch-backports/0086-PR-c-48450.patch |    2 +
 ....c-finish_decltype_type-Add-complain-parm.patch |    2 +
 .../gcc-4_6-branch-backports/0088-PR-c-48452.patch |    2 +
 .../gcc-4_6-branch-backports/0089-PR-c-48468.patch |    2 +
 .../gcc-4_6-branch-backports/0090-PR-c-48500.patch |    2 +
 ...1-04-08-Steven-G.-Kargl-kargl-gcc.gnu.org.patch |    2 +
 .../0092-PR-testsuite-48506.patch                  |    2 +
 ...ther-than-crashing-in-array_type_nelts-if.patch |    2 +
 .../gcc-4_6-branch-backports/0095-PR-c-48528.patch |    2 +
 ...-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |    2 +
 ...-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |    2 +
 ...-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |    2 +
 .../0101-Backport-from-mainline.patch              |    2 +
 ...2-common.opt-Tbss-Tdata-Ttext-New-options.patch |    2 +
 .../gcc-4_6-branch-backports/0104-PR-c-48523.patch |    2 +
 .../gcc-4_6-branch-backports/0105-PR-c-48534.patch |    2 +
 .../gcc-4_6-branch-backports/0106-PR-c-48517.patch |    2 +
 ...011-04-12-Allan-McRae-allan-archlinux.org.patch |    2 +
 ...-v850.c-expand_prologue-Do-not-use-the-CA.patch |    2 +
 .../0109-PR-rtl-optimization-48549.patch           |    2 +
 ...-2011-04-12-Martin-Jambor-mjambor-suse.cz.patch |    2 +
 .../0112-Fix-PR-target-48090.patch                 |    2 +
 .../0113-Fix-PR-c-48574.patch                      |    2 +
 .../gcc-4_6-branch-backports/0114-PR-c-48570.patch |    2 +
 .../0115-PR-middle-end-48591.patch                 |    2 +
 ...-2011-04-13-Paul-Thomas-pault-gcc.gnu.org.patch |    2 +
 .../gcc-4_6-branch-backports/0117-PR-c-48594.patch |    2 +
 .../0118-sv.po-Update.patch                        |    2 +
 .../0119-Backport-from-mainline.patch              |    2 +
 .../0122-PR-target-48605.patch                     |    2 +
 .../0123-PR-target-48614.patch                     |    2 +
 ...Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch |    2 +
 ...04-15-Takaya-Saito-gintensubaru-gmail.com.patch |    2 +
 ...15-Paolo-Carlini-paolo.carlini-oracle.com.patch |    2 +
 ...ibjava.jni-jni.exp-gcj_jni_get_cxxflags_i.patch |    2 +
 ...Daniel-Krugler-daniel.kruegler-googlemail.patch |    2 +
 ...Daniel-Krugler-daniel.kruegler-googlemail.patch |    2 +
 .../0132-PR-lto-48538.patch                        |    1 +
 ...c-freebsd.h-CPP_CPU64_DEFAULT_SPEC-Replac.patch |    1 +
 ...Daniel-Krugler-daniel.kruegler-googlemail.patch |    1 +
 .../0135-doc-passes.texi-Fill-crossref-nodes.patch |    1 +
 ...ce-Make-lang.in-gnatbind-Replace-ALL_CFLA.patch |    1 +
 .../0138-PR-tree-optimization-48616.patch          |    1 +
 ...-04-18-Richard-Guenther-rguenther-suse.de.patch |    1 +
 ...x-weakref-trickery-breakage-on-alpha-dec-.patch |    1 +
 ...-is_redundant_typedef-Add-inline-to-proto.patch |    1 +
 .../gcc-4_6-branch-backports/0142-PR-c-48632.patch |    1 +
 .../0143-PR-middle-end-48661.patch                 |    1 +
 .../gcc-4_6-branch-backports/0144-PR-c-48537.patch |    1 +
 .../0146-PR-testsuite-48675.patch                  |    1 +
 ...-04-18-Richard-Guenther-rguenther-suse.de.patch |    1 +
 .../0149-PR-target-48678.patch                     |    1 +
 .../gcc-4_6-branch-backports/0151-PR-c-46304.patch |    1 +
 ...tstrap-lto.mk-Remove-obsolete-requirement.patch |    1 +
 ...-04-20-Richard-Guenther-rguenther-suse.de.patch |    1 +
 .../0154-Backport-from-mainline.patch              |    1 +
 .../0155-PR-tree-optimization-48611.patch          |    1 +
 .../gcc-4_6-branch-backports/0156-PR-c-48657.patch |    1 +
 .../0157-PR-target-48288.patch                     |    1 +
 .../gcc-4_6-branch-backports/0159-PR-c-48594.patch |    1 +
 ...-finish_compound_literal-Don-t-put-an-arr.patch |    1 +
 ...lk_gimple_op-GIMPLE_CALL-Fix-couple-of-ov.patch |    1 +
 ...-04-21-Richard-Guenther-rguenther-suse.de.patch |    1 +
 .../0163-de.po-Update.patch                        |    1 +
 .../0164-PR-target-48708.patch                     |    1 +
 .../gcc-4_6-branch-backports/0166-PR-c-48716.patch |    1 +
 .../0167-PR-target-48723.patch                     |    1 +
 .../0168-PR-tree-optimization-48717.patch          |    1 +
 .../gcc-4_6-branch-backports/0170-Revert.patch     |    1 +
 .../gcc-4_6-branch-backports/0171-PR-c-48685.patch |    1 +
 ...616.c-dg-options-Add-fno-common-to-option.patch |    1 +
 ...-23-Jonathan-Wakely-jwakely.gcc-gmail.com.patch |    1 +
 .../0174-PR-preprocessor-48740.patch               |    1 +
 ...24-Paolo-Carlini-paolo.carlini-oracle.com.patch |    1 +
 .../gcc-4_6-branch-backports/0178-PR-c-48707.patch |    1 +
 ...-2011-04-26-Tobias-Burnus-burnus-net-b.de.patch |    1 +
 ...-04-26-Richard-Guenther-rguenther-suse.de.patch |    1 +
 .../0182-PR-tree-optimization-48734.patch          |    1 +
 .../0183-PR-debug-48768.patch                      |    1 +
 .../0184-de.po-Update.patch                        |    1 +
 .../gcc-4_6-branch-backports/0185-PR-c-48726.patch |    1 +
 .../gcc-4_6-branch-backports/0187-PR-c-42687.patch |    1 +
 .../gcc-4_6-branch-backports/0188-PR-c-48742.patch |    1 +
 ...gcc.dg-20020312-2.c-Add-definition-for-RX.patch |    1 +
 .../gcc-4_6-branch-backports/0190-PR-c-48046.patch |    1 +
 .../0192-PR-middle-end-48597.patch                 |    1 +
 ...-2011-04-28-Tobias-Burnus-burnus-net-b.de.patch |    1 +
 ...-2011-04-28-Tobias-Burnus-burnus-net-b.de.patch |    1 +
 .../0195-Fix-PR-c-48656.patch                      |    1 +
 .../0196-Backport-4.7-patchtes-to-4.6.patch        |    1 +
 ...-2011-04-29-Tobias-Burnus-burnus-net-b.de.patch |    1 +
 ...29-Paolo-Carlini-paolo.carlini-oracle.com.patch |    1 +
 .../gcc/gcc-4.6.0/gcc-arm-frename-registers.patch  |    1 +
 .../gcc/gcc-4.6.0/gcc-flags-for-build.patch        |    1 +
 .../gcc/gcc-4.6.0/gcc-poison-dir-extend.patch      |    1 +
 .../gcc/gcc-4.6.0/gcc-poison-parameters.patch      |    1 +
 .../gcc-4.6.0/gcc-poison-system-directories.patch  |    1 +
 .../gcc-uclibc-locale-ctype_touplow_t.patch        |    1 +
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106720.patch  |   53 ++
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106723.patch  |   65 ++
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106729.patch  |   34 +
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106731.patch  |   30 +
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106733.patch  |  655 ++++++++++++++++++++
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106737.patch  |  128 ++++
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106738.patch  |  179 ++++++
 .../gcc/gcc-4.6.0/optional_libstdc.patch           |    1 +
 meta/recipes-devtools/gcc/gcc-4.6.0/pr35942.patch  |    1 +
 .../gcc/gcc-4.6.0/zecke-xgcc-cpp.patch             |    1 +
 .../gcc/gcc-4_6-branch-linaro-backports.inc        |    9 +
 207 files changed, 1462 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106720.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106723.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106729.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106731.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106733.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106737.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106738.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0.inc b/meta/recipes-devtools/gcc/gcc-4.6.0.inc
index 2c30d43..8c6439f 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0.inc
@@ -7,7 +7,10 @@ require gcc-common.inc
 
 require gcc-4_6-branch-backports.inc
 
-PR = "r1"
+# Linaro patches for 4.6 branch
+require gcc-4_6-branch-linaro-backports.inc
+
+PR = "r2"
 
 DEPENDS =+ "mpfr gmp libmpc"
 NATIVEDEPS = "mpfr-native gmp-native gettext-native libmpc-native"
@@ -22,6 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   ${GCC-4_6-BRANCH-BACKPORTS} \
+	   ${GCC-4_6-BRANCH-LINARO-BACKPORTS} \
 	   file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
 	   file://100-uclibc-conf.patch \
            file://gcc-uclibc-locale-ctype_touplow_t.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/100-uclibc-conf.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/100-uclibc-conf.patch
index 313b828..62f4f4d 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/100-uclibc-conf.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/100-uclibc-conf.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 Index: gcc-4.6.0/contrib/regression/objs-gcc.sh
 ===================================================================
 --- gcc-4.6.0.orig/contrib/regression/objs-gcc.sh
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/103-uclibc-conf-noupstream.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/103-uclibc-conf-noupstream.patch
index b28fac2..7388ec0 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/103-uclibc-conf-noupstream.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/103-uclibc-conf-noupstream.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 Corrects sub machine arch corectly
 
 Index: gcc-4.6.0/gcc/config.gcc
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/200-uclibc-locale.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/200-uclibc-locale.patch
index 0f2caff..b41e4c0 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/200-uclibc-locale.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/200-uclibc-locale.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 Index: gcc-4.6.0/libstdc++-v3/acinclude.m4
 ===================================================================
 --- gcc-4.6.0.orig/libstdc++-v3/acinclude.m4
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/203-uclibc-locale-no__x.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/203-uclibc-locale-no__x.patch
index 78743c6..d7fd324 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/203-uclibc-locale-no__x.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/203-uclibc-locale-no__x.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
 ===================================================================
 --- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/c++locale_internal.h
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/204-uclibc-locale-wchar_fix.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/204-uclibc-locale-wchar_fix.patch
index 2d8d70a..a1878ef 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/204-uclibc-locale-wchar_fix.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/204-uclibc-locale-wchar_fix.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/monetary_members.cc
 ===================================================================
 --- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/monetary_members.cc
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/205-uclibc-locale-update.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/205-uclibc-locale-update.patch
index 911ad51..6fba8ed 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/205-uclibc-locale-update.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/205-uclibc-locale-update.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/c_locale.cc
 ===================================================================
 --- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/c_locale.cc
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/301-missing-execinfo_h.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/301-missing-execinfo_h.patch
index 99bd229..03f0d16 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/301-missing-execinfo_h.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/301-missing-execinfo_h.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 Index: gcc-4.6.0/boehm-gc/include/gc.h
 ===================================================================
 --- gcc-4.6.0.orig/boehm-gc/include/gc.h
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/302-c99-snprintf.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/302-c99-snprintf.patch
index 9f841ae..ce4ddc9 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/302-c99-snprintf.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/302-c99-snprintf.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 Index: gcc-4.6.0/libstdc++-v3/include/c_std/cstdio
 ===================================================================
 --- gcc-4.6.0.orig/libstdc++-v3/include/c_std/cstdio
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/303-c99-complex-ugly-hack.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/303-c99-complex-ugly-hack.patch
index 47ae88e..71fc411 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/303-c99-complex-ugly-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/303-c99-complex-ugly-hack.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 Index: gcc-4.6.0/libstdc++-v3/configure
 ===================================================================
 --- gcc-4.6.0.orig/libstdc++-v3/configure
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/304-index_macro.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/304-index_macro.patch
index f6eedb3..9ed454b 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/304-index_macro.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/304-index_macro.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 Index: gcc-4.6.0/libstdc++-v3/include/ext/rope
 ===================================================================
 --- gcc-4.6.0.orig/libstdc++-v3/include/ext/rope
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/305-libmudflap-susv3-legacy.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/305-libmudflap-susv3-legacy.patch
index 4cabb36..1295767 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/305-libmudflap-susv3-legacy.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/305-libmudflap-susv3-legacy.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Upstream-Status: Inappropriate [embedded specific]
+
 Index: gcc-4.6.0/libmudflap/mf-hooks2.c
 ===================================================================
 --- gcc-4.6.0.orig/libmudflap/mf-hooks2.c
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/306-libstdc++-namespace.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/306-libstdc++-namespace.patch
index 1fbf043..b4228ba 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/306-libstdc++-namespace.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/306-libstdc++-namespace.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 Index: gcc-4.6.0/libstdc++-v3/config/locale/uclibc/messages_members.h
 ===================================================================
 --- gcc-4.6.0.orig/libstdc++-v3/config/locale/uclibc/messages_members.h
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/307-locale_facets.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/307-locale_facets.patch
index 774fcfa..84d559b 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/307-locale_facets.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/307-locale_facets.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 This patch fixes a bug into ostream::operator<<(double) due to the wrong size
 passed into the __convert_from_v method. The wrong size is then passed to
 std::snprintf function, that, on uClibc, doens't handle sized 0 buffer.
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/602-sdk-libstdc++-includes.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/602-sdk-libstdc++-includes.patch
index 23fce75..c83ecbb 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/602-sdk-libstdc++-includes.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/602-sdk-libstdc++-includes.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [embedded specific]
 --- gcc-4.1.0/libstdc++-v3/fragment.am	2005-03-21 11:40:14.000000000 -0600
 +++ gcc-4.1.0-patched/libstdc++-v3/fragment.am	2005-04-25 20:14:39.856251785 -0500
 @@ -21,5 +21,5 @@
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/64bithack.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/64bithack.patch
index 11cbbed..fdeaa80 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/64bithack.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/64bithack.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [embedded specific]
 By default gcc places 64 bit libs in a lib64 directory. This makes it use 
 "lib" instead.
 
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/740-sh-pr24836.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/740-sh-pr24836.patch
index 89a3934..296b45c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/740-sh-pr24836.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/740-sh-pr24836.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 http://sourceforge.net/mailarchive/forum.php?thread_id=8959304&forum_id=5348
 http://gcc.gnu.org/bugzilla/show_bug.cgi?id=24836
 
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/800-arm-bigendian.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/800-arm-bigendian.patch
index 50088cf..30d2f9b 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/800-arm-bigendian.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/800-arm-bigendian.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 By Lennert Buytenhek <buytenh@wantstofly.org>
 Adds support for arm*b-linux* big-endian ARM targets
 
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/904-flatten-switch-stmt-00.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/904-flatten-switch-stmt-00.patch
index 2623313..08feec7 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/904-flatten-switch-stmt-00.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/904-flatten-switch-stmt-00.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 Hi,
 
 The attached patch makes sure that we create smaller object code for
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/COLLECT_GCC_OPTIONS.patch
index 8b53b83..73f72a0 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/COLLECT_GCC_OPTIONS.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/COLLECT_GCC_OPTIONS.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 #This patck added --sysroot into COLLECT_GCC_OPTIONS which is used to
 #invoke collect2.
 
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
index ffb2267..a46c0b3 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 # by default c++ include directories are not relative to "--sysroot"
 # which brings one trouble when using the toolchain in an environment
 # where the build directory generating that toolchain doesn't exist,
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/arm-bswapsi2.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/arm-bswapsi2.patch
index 7ac61a6..9b25655 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/arm-bswapsi2.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/arm-bswapsi2.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 Index: gcc-4.5/gcc/config/arm/arm.md
 ===================================================================
 --- gcc-4.5.orig/gcc/config/arm/arm.md	2010-06-17 09:13:07.000000000 -0700
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/arm-nolibfloat.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/arm-nolibfloat.patch
index 2175519..f9b2296 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/arm-nolibfloat.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/arm-nolibfloat.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 # Dimitry Andric <dimitry@andric.com>, 2004-05-01
 #
 # * Removed the extra -lfloat option from LIBGCC_SPEC, since it isn't needed
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/arm-softfloat.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/arm-softfloat.patch
index 908e2d8..e6bffee 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/arm-softfloat.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/arm-softfloat.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 Index: gcc-4.6.0/gcc/config/arm/t-linux
 ===================================================================
 --- gcc-4.6.0.orig/gcc/config/arm/t-linux
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/cache-amnesia.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/cache-amnesia.patch
index 3a98b02..e81da5d 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/cache-amnesia.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/cache-amnesia.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [embedded specific]
 ---
  gcc/configure    |    2 +-
  gcc/configure.ac |    2 +-
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/disable_relax_pic_calls_flag.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/disable_relax_pic_calls_flag.patch
index 4f73cc8..56e13ef 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/disable_relax_pic_calls_flag.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/disable_relax_pic_calls_flag.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 GCC: disable MASK_RELAX_PIC_CALLS bit
 
 The new feature added after 4.3.3
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/fortran-cross-compile-hack.patch
index 348c770..271911e 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/fortran-cross-compile-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/fortran-cross-compile-hack.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [embedded specific]
 * Fortran would have searched for arm-angstrom-gnueabi-gfortran but would have used
   used gfortan. For gcc_4.2.2.bb we want to use the gfortran compiler from our cross
   directory.
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.0.2-e300c2c3.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.0.2-e300c2c3.patch
index d1df8b2..5c5b0a7 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.0.2-e300c2c3.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.0.2-e300c2c3.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 Adds support for Freescale Power architecture e300c2 and e300c3 cores.
 http://www.bitshrine.org/gpp/tc-fsl-x86lnx-e300c3-nptl-4.0.2-2.src.rpm
 
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
index d249c1c..522191a 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [embedded specific]
 ---
  configure    |    2 +-
  configure.ac |    2 +-
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
index 428dd08..643cb75 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 Before committing, I noticed that PR/32161 was marked as a dup of PR/32009, but my previous patch did not fix it.
 
 This alternative patch is better because it lets you just use CFLAGS_FOR_TARGET to set the compilation flags for libgcc. Since bootstrapped target libraries are never compiled with the native compiler, it makes little sense to use different flags for stage1 and later stages. And it also makes little sense to use a different variable than CFLAGS_FOR_TARGET.
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0002-Backport-from-mainline.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0002-Backport-from-mainline.patch
index 27e1a88..f745935 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0002-Backport-from-mainline.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0002-Backport-from-mainline.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From af3385141f9bfe32ab89165bfc98a7ea2ff19278 Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sat, 26 Mar 2011 09:19:36 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0003-Backport-from-mainline.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0003-Backport-from-mainline.patch
index 596042b..e4b9c44 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0003-Backport-from-mainline.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0003-Backport-from-mainline.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 540b311d6b6aa2e50a9feb45255361e498bb5198 Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sat, 26 Mar 2011 09:20:34 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0004-Backport-from-mainline.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0004-Backport-from-mainline.patch
index 95c7c30..d214b39 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0004-Backport-from-mainline.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0004-Backport-from-mainline.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 125ee3cf946de59472c02ffd792aca4f1045669f Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sat, 26 Mar 2011 09:21:34 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0005-Backport-from-mainline.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0005-Backport-from-mainline.patch
index 08d8251..3a692e6 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0005-Backport-from-mainline.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0005-Backport-from-mainline.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 5bc59e25607b755798008d5e0d79ca4cea6711ed Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sat, 26 Mar 2011 09:23:01 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0006-Backport-from-mainline.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0006-Backport-from-mainline.patch
index 1b5e86f..6a4efd4 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0006-Backport-from-mainline.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0006-Backport-from-mainline.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From b6ed53c51ca6090f3f422e6223e8dc3b150f0393 Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sat, 26 Mar 2011 09:24:06 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0007-Backport-from-mainline.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0007-Backport-from-mainline.patch
index a432d63..7c38f95 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0007-Backport-from-mainline.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0007-Backport-from-mainline.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From d4d74232bca4968da87cd8157cc2d6139115946e Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sat, 26 Mar 2011 09:24:53 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0008-2011-03-26-Paolo-Carlini-paolo.carlini-oracle.com.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0008-2011-03-26-Paolo-Carlini-paolo.carlini-oracle.com.patch
index f4b1176..147cbe0 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0008-2011-03-26-Paolo-Carlini-paolo.carlini-oracle.com.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0008-2011-03-26-Paolo-Carlini-paolo.carlini-oracle.com.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 6bb9234e718d4b75a9a1e63d523d08c3392ba55f Mon Sep 17 00:00:00 2001
 From: paolo <paolo@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sat, 26 Mar 2011 10:02:34 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0009-Backport-from-mainline.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0009-Backport-from-mainline.patch
index 225ed1f..7bb96e9 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0009-Backport-from-mainline.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0009-Backport-from-mainline.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 8c9cc2d03061ea065b70695ef4903a0390c01fb8 Mon Sep 17 00:00:00 2001
 From: uros <uros@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sat, 26 Mar 2011 18:41:02 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0012-2011-03-27-Jonathan-Wakely-jwakely.gcc-gmail.com.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0012-2011-03-27-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
index a1340d9..1aa7468 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0012-2011-03-27-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0012-2011-03-27-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From e2965db317ee7efd916963c87b9c34023eefda54 Mon Sep 17 00:00:00 2001
 From: redi <redi@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sun, 27 Mar 2011 20:08:35 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0014-2011-03-28-Richard-Guenther-rguenther-suse.de.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0014-2011-03-28-Richard-Guenther-rguenther-suse.de.patch
index f8c0b42..febc70c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0014-2011-03-28-Richard-Guenther-rguenther-suse.de.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0014-2011-03-28-Richard-Guenther-rguenther-suse.de.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 2631216d2fedc5339a5edcac64db1ab5d9269498 Mon Sep 17 00:00:00 2001
 From: rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Mon, 28 Mar 2011 10:14:34 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0015-gcc.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0015-gcc.patch
index 4f8cb4d..c6369a9 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0015-gcc.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0015-gcc.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 2fe380ffa4f1ca0fba1e4915df127992eb977569 Mon Sep 17 00:00:00 2001
 From: rsandifo <rsandifo@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Mon, 28 Mar 2011 10:22:57 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0016-Backport-from-mainline.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0016-Backport-from-mainline.patch
index 3e2beb9..b710e93 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0016-Backport-from-mainline.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0016-Backport-from-mainline.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From c471cbe03c049ed4a97708936342e4dd28606d22 Mon Sep 17 00:00:00 2001
 From: ro <ro@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Mon, 28 Mar 2011 16:46:27 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0017-libgfortran.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0017-libgfortran.patch
index a2df0f7..4161e64 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0017-libgfortran.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0017-libgfortran.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From d70e14fe2c9c3fc20d9bc1dca7cfcc3d6bb1301e Mon Sep 17 00:00:00 2001
 From: ro <ro@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Mon, 28 Mar 2011 17:09:27 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0019-2011-03-29-Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0019-2011-03-29-Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch
index 748bca5..8854564 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0019-2011-03-29-Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0019-2011-03-29-Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 6f57329da3c7308ccf6b1740ead898d668ec24f9 Mon Sep 17 00:00:00 2001
 From: krebbel <krebbel@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 29 Mar 2011 11:57:40 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0020-config-rx-rx.h-LABEL_ALIGN_AFTER_BARRIER-Define.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0020-config-rx-rx.h-LABEL_ALIGN_AFTER_BARRIER-Define.patch
index ea74a08..dc6e4ff 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0020-config-rx-rx.h-LABEL_ALIGN_AFTER_BARRIER-Define.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0020-config-rx-rx.h-LABEL_ALIGN_AFTER_BARRIER-Define.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 04688242805dcf2a1e9c8948a3d15611d88c1520 Mon Sep 17 00:00:00 2001
 From: nickc <nickc@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 29 Mar 2011 12:27:07 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0021-c.opt-Add-std-c-03.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0021-c.opt-Add-std-c-03.patch
index 8b4c762..01ce2aa 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0021-c.opt-Add-std-c-03.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0021-c.opt-Add-std-c-03.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From e8c1376d80e89383a6eff16349bf2071b571a47f Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 29 Mar 2011 14:23:59 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0022-PR-c-47570.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0022-PR-c-47570.patch
index 09221b3..9288861 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0022-PR-c-47570.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0022-PR-c-47570.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 1d1e50e7f9e7511a01ee95d7cffd8311c9b84d8b Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 29 Mar 2011 14:24:09 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0023-PR-c-47504.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0023-PR-c-47504.patch
index 23aebda..89b0b54 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0023-PR-c-47504.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0023-PR-c-47504.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 4ebec68ee3aee90ba13a4c4bc70afbb4a613468b Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 29 Mar 2011 14:24:19 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0024-except.c-build_noexcept_spec-Call-cxx_constant_value.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0024-except.c-build_noexcept_spec-Call-cxx_constant_value.patch
index 096ec08..332445a 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0024-except.c-build_noexcept_spec-Call-cxx_constant_value.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0024-except.c-build_noexcept_spec-Call-cxx_constant_value.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 3a987d8e4a8c885fe7fc54595ebdd82d5291e1e7 Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 29 Mar 2011 14:24:30 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0025-c-family.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0025-c-family.patch
index b42197e..7074e78 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0025-c-family.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0025-c-family.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 21e7558c6e06c35620e80478f4e6b5ccd1c78aa9 Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 29 Mar 2011 14:24:42 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0026-decl2.c-cp_check_const_attributes-New.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0026-decl2.c-cp_check_const_attributes-New.patch
index 15136bf..6632b6c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0026-decl2.c-cp_check_const_attributes-New.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0026-decl2.c-cp_check_const_attributes-New.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 87e73453e8135e72f592c1d7c84da942e7a1e308 Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 29 Mar 2011 14:24:59 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0027-Core-1148.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0027-Core-1148.patch
index f348e12..8288f38 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0027-Core-1148.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0027-Core-1148.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From c68e41052387396cba4a066d8e9658dc2011baf0 Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 29 Mar 2011 14:25:10 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0028-PR-c-48313.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0028-PR-c-48313.patch
index f37fb03..5d78204 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0028-PR-c-48313.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0028-PR-c-48313.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 8d72f0bd42615d92c0db226238694eedb52914d3 Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 29 Mar 2011 14:25:22 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0029-PR-c-47999.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0029-PR-c-47999.patch
index d890d92..214eec9 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0029-PR-c-47999.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0029-PR-c-47999.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From d1f71a5193dd2b3debd551f3dc0e0d237acf7e81 Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 29 Mar 2011 14:25:37 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0030-pt.c-build_non_dependent_expr-Keep-dereferences-outs.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0030-pt.c-build_non_dependent_expr-Keep-dereferences-outs.patch
index 343e0ce..14221cf 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0030-pt.c-build_non_dependent_expr-Keep-dereferences-outs.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0030-pt.c-build_non_dependent_expr-Keep-dereferences-outs.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 6ec20c02d4514be339f0112d793794abf60451a7 Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 29 Mar 2011 14:25:51 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0031-call.c-reference_binding-Allow-direct-binding-to-an-.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0031-call.c-reference_binding-Allow-direct-binding-to-an-.patch
index b166281..5a831f9 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0031-call.c-reference_binding-Allow-direct-binding-to-an-.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0031-call.c-reference_binding-Allow-direct-binding-to-an-.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From af19d0c50df96adb55baaf54026ad82a9d256868 Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 29 Mar 2011 14:26:00 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0032-Core-1232.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0032-Core-1232.patch
index 484d201..10c40a3 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0032-Core-1232.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0032-Core-1232.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 1370bfdaf3735fc1038436cfc86b7cfe43d3eaf0 Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 29 Mar 2011 14:26:10 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0033-semantics.c-is_valid_constexpr_fn-Specify-input-loca.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0033-semantics.c-is_valid_constexpr_fn-Specify-input-loca.patch
index 8edeac9..1a6c1db 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0033-semantics.c-is_valid_constexpr_fn-Specify-input-loca.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0033-semantics.c-is_valid_constexpr_fn-Specify-input-loca.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 7ca62e4f7e0e27a4282dc14e5b89c389d5c194bb Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 29 Mar 2011 14:26:21 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0034-PR-c-48296.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0034-PR-c-48296.patch
index 084a57c..2f069b6 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0034-PR-c-48296.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0034-PR-c-48296.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From d67703129d516043d4e43bdf79a17889f5abc3f7 Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 29 Mar 2011 14:26:33 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0035-PR-c-48166.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0035-PR-c-48166.patch
index 0c6990d..cb343f5 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0035-PR-c-48166.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0035-PR-c-48166.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 709a81571cc3f418f51f95ed9291b4f2fabc577c Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 29 Mar 2011 16:07:15 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0037-config-alpha-alpha.c-alpha_sr_alias_set-Don-t-define.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0037-config-alpha-alpha.c-alpha_sr_alias_set-Don-t-define.patch
index 7c61784..6c7b926 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0037-config-alpha-alpha.c-alpha_sr_alias_set-Don-t-define.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0037-config-alpha-alpha.c-alpha_sr_alias_set-Don-t-define.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 14fb9260e8c94249305dba567e7e242ac3d30fa7 Mon Sep 17 00:00:00 2001
 From: uros <uros@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 29 Mar 2011 18:24:02 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0038-PR-c-48319.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0038-PR-c-48319.patch
index d76e448..0f9addb 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0038-PR-c-48319.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0038-PR-c-48319.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 4af193055b0dcc204387ba06e11a053c5b55ad15 Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 29 Mar 2011 18:47:47 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0039-PR-preprocessor-48248.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0039-PR-preprocessor-48248.patch
index b06340b..0b16110 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0039-PR-preprocessor-48248.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0039-PR-preprocessor-48248.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 0d6afd28da26c4b09e1eb2b16d7a3c021fae7372 Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 29 Mar 2011 20:30:06 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0040-PR-debug-48253.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0040-PR-debug-48253.patch
index 872011c..9342d19 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0040-PR-debug-48253.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0040-PR-debug-48253.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From e4e229cd56063482aced7df857e82512b846435d Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 29 Mar 2011 22:47:59 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0042-PR-c-48265.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0042-PR-c-48265.patch
index bc7cfa6..690d761 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0042-PR-c-48265.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0042-PR-c-48265.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From ec2d33835ee5855060878da89d4051fa06af9e97 Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 30 Mar 2011 02:16:37 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0043-Fix-a-typo-in-FLOAT_SSE_REGS.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0043-Fix-a-typo-in-FLOAT_SSE_REGS.patch
index 29d7ecf..472fa3c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0043-Fix-a-typo-in-FLOAT_SSE_REGS.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0043-Fix-a-typo-in-FLOAT_SSE_REGS.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 87c5c4ec5bee02725cb4bd4f81bb3c86a0277a81 Mon Sep 17 00:00:00 2001
 From: hjl <hjl@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 30 Mar 2011 10:43:55 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0044-PR-c-48281.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0044-PR-c-48281.patch
index 317400a..10a9cad 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0044-PR-c-48281.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0044-PR-c-48281.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 541566b2d3b46207159abb1f59970bb11078e57e Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 30 Mar 2011 18:05:43 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0045-PR-c-48369.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0045-PR-c-48369.patch
index 2506d95..ae3cfdc 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0045-PR-c-48369.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0045-PR-c-48369.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 61759009408d9f43af89eaeaff769a656416e1af Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 30 Mar 2011 19:50:17 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0046-PR-c-48212.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0046-PR-c-48212.patch
index 7db61ba..89f6f1e 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0046-PR-c-48212.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0046-PR-c-48212.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From f23bf88450af23287387d878036f78042093d61b Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 30 Mar 2011 20:29:43 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0048-2011-03-31-Richard-Guenther-rguenther-suse.de.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0048-2011-03-31-Richard-Guenther-rguenther-suse.de.patch
index 4a3ae06..218efa3 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0048-2011-03-31-Richard-Guenther-rguenther-suse.de.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0048-2011-03-31-Richard-Guenther-rguenther-suse.de.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From b3287343bd8870538aee70687286d78881ee8b81 Mon Sep 17 00:00:00 2001
 From: rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 31 Mar 2011 10:00:44 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0049-PR-target-48142.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0049-PR-target-48142.patch
index 11d3e1e..99499f2 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0049-PR-target-48142.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0049-PR-target-48142.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 18bc61fc490330f5dc59639626fa9bb5269e31d7 Mon Sep 17 00:00:00 2001
 From: ebotcazou <ebotcazou@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 31 Mar 2011 11:14:41 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0050-PR-target-16292.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0050-PR-target-16292.patch
index 638bcb8..85688d8 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0050-PR-target-16292.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0050-PR-target-16292.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From e9265f24f30b22d79d2ea4013dd32a491a12d00c Mon Sep 17 00:00:00 2001
 From: ro <ro@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 31 Mar 2011 15:05:47 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0051-PR-c-48280.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0051-PR-c-48280.patch
index a7d37a8..9019735 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0051-PR-c-48280.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0051-PR-c-48280.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From c965b9c986732377eb96e00f7266e281f345a00b Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 31 Mar 2011 20:33:07 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0053-Merge-r171807-from-trunk-to-the-4.6-release-branch-t.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0053-Merge-r171807-from-trunk-to-the-4.6-release-branch-t.patch
index a2094fe..3ca1a64 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0053-Merge-r171807-from-trunk-to-the-4.6-release-branch-t.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0053-Merge-r171807-from-trunk-to-the-4.6-release-branch-t.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 5e28e486dbc793184ca462b8b528f5eff3d4f2ef Mon Sep 17 00:00:00 2001
 From: jyasskin <jyasskin@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 1 Apr 2011 01:07:46 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0054-Backport-from-mainline.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0054-Backport-from-mainline.patch
index ebad5c9..c360269 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0054-Backport-from-mainline.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0054-Backport-from-mainline.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From f8ae59386457b39085b086d04a8cd96e4450f167 Mon Sep 17 00:00:00 2001
 From: abel <abel@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 1 Apr 2011 11:07:44 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0056-config-spu-t-spu-elf-dp-bit.c-Use-instead-of.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0056-config-spu-t-spu-elf-dp-bit.c-Use-instead-of.patch
index 9238542..bcc3cf0 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0056-config-spu-t-spu-elf-dp-bit.c-Use-instead-of.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0056-config-spu-t-spu-elf-dp-bit.c-Use-instead-of.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 5b6ffdded3fd04395f72852e2a201d011d10a060 Mon Sep 17 00:00:00 2001
 From: uweigand <uweigand@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 1 Apr 2011 17:17:59 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0058-2011-04-02-Jonathan-Wakely-redi-gcc.gnu.org.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0058-2011-04-02-Jonathan-Wakely-redi-gcc.gnu.org.patch
index bcc1ae5..525e629 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0058-2011-04-02-Jonathan-Wakely-redi-gcc.gnu.org.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0058-2011-04-02-Jonathan-Wakely-redi-gcc.gnu.org.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 0d43ff3bbc445b0264f804cd6449069182045678 Mon Sep 17 00:00:00 2001
 From: redi <redi@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sat, 2 Apr 2011 15:34:01 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0060-be.po-da.po-de.po-el.po-es.po-fi.po-fr.po-id.po-ja.p.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0060-be.po-da.po-de.po-el.po-es.po-fi.po-fr.po-id.po-ja.p.patch
index 955528b..f17c5f4 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0060-be.po-da.po-de.po-el.po-es.po-fi.po-fr.po-id.po-ja.p.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0060-be.po-da.po-de.po-el.po-es.po-fi.po-fr.po-id.po-ja.p.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From ec0a81cb355c0fb165edd6eba2038cf77e5aae47 Mon Sep 17 00:00:00 2001
 From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sun, 3 Apr 2011 11:30:58 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0061-be.po-ca.po-da.po-de.po-el.po-es.po-fi.po-fr.po-id.p.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0061-be.po-ca.po-da.po-de.po-el.po-es.po-fi.po-fr.po-id.p.patch
index f70eecc..c89aeb2 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0061-be.po-ca.po-da.po-de.po-el.po-es.po-fi.po-fr.po-id.p.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0061-be.po-ca.po-da.po-de.po-el.po-es.po-fi.po-fr.po-id.p.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 2f00fb35a87bcbae197b96a7259b1d94f3b4dc1f Mon Sep 17 00:00:00 2001
 From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sun, 3 Apr 2011 11:34:03 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0063-gfortran.dg-bessel_6.f90-Use-dg-add-options-ieee.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0063-gfortran.dg-bessel_6.f90-Use-dg-add-options-ieee.patch
index 91ae06c..c8e74e7 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0063-gfortran.dg-bessel_6.f90-Use-dg-add-options-ieee.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0063-gfortran.dg-bessel_6.f90-Use-dg-add-options-ieee.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From e26756e1112552489e123c8ed7ed038beae89c5b Mon Sep 17 00:00:00 2001
 From: ro <ro@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Mon, 4 Apr 2011 15:55:33 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0064-2011-04-04-Janus-Weil-janus-gcc.gnu.org.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0064-2011-04-04-Janus-Weil-janus-gcc.gnu.org.patch
index 5491aa5..6b573e4 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0064-2011-04-04-Janus-Weil-janus-gcc.gnu.org.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0064-2011-04-04-Janus-Weil-janus-gcc.gnu.org.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From ca7759868733b4570e496b889e711523640fc582 Mon Sep 17 00:00:00 2001
 From: janus <janus@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Mon, 4 Apr 2011 18:53:34 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0065-es.po-Update.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0065-es.po-Update.patch
index 24c4b1a..ae0174e 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0065-es.po-Update.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0065-es.po-Update.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 0e497997f5e241721dece71b322621d24abd4a04 Mon Sep 17 00:00:00 2001
 From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Mon, 4 Apr 2011 22:20:34 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0067-The-parameters-for-functions-from-the-frexp-family-w.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0067-The-parameters-for-functions-from-the-frexp-family-w.patch
index 694877c..9057912 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0067-The-parameters-for-functions-from-the-frexp-family-w.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0067-The-parameters-for-functions-from-the-frexp-family-w.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 7a43b3a2e2c0d9cf557ac45577cc42c6d72e0065 Mon Sep 17 00:00:00 2001
 From: baldrick <baldrick@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 5 Apr 2011 08:13:16 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0068-2011-04-05-Richard-Guenther-rguenther-suse.de.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0068-2011-04-05-Richard-Guenther-rguenther-suse.de.patch
index 6761a02..e541d3f 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0068-2011-04-05-Richard-Guenther-rguenther-suse.de.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0068-2011-04-05-Richard-Guenther-rguenther-suse.de.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 56a8ff0c197b4b0f917e3b50ac0dd3ed26f300c3 Mon Sep 17 00:00:00 2001
 From: rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 5 Apr 2011 12:13:27 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0069-stor-layout.c-self_referential_size-Fix-2010-07-13-c.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0069-stor-layout.c-self_referential_size-Fix-2010-07-13-c.patch
index 2a77ef7..240b6a9 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0069-stor-layout.c-self_referential_size-Fix-2010-07-13-c.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0069-stor-layout.c-self_referential_size-Fix-2010-07-13-c.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 6d713959cbb05f7cd030d776bb52113eac8af075 Mon Sep 17 00:00:00 2001
 From: ebotcazou <ebotcazou@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 5 Apr 2011 14:34:51 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0070-de.po-Update.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0070-de.po-Update.patch
index 312091c..62538d8 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0070-de.po-Update.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0070-de.po-Update.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 66ebb4822dae1fd3c97ee62f9126615818150966 Mon Sep 17 00:00:00 2001
 From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 5 Apr 2011 23:08:59 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0072-gcov-io.c-Use-GCC-Runtime-Library-Exception.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0072-gcov-io.c-Use-GCC-Runtime-Library-Exception.patch
index 4da9d28..bdd0923 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0072-gcov-io.c-Use-GCC-Runtime-Library-Exception.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0072-gcov-io.c-Use-GCC-Runtime-Library-Exception.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 578ce9461ebac7a6ec001c0025e0b854385ec39c Mon Sep 17 00:00:00 2001
 From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 6 Apr 2011 16:05:18 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0073-Backported-from-mainline.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0073-Backported-from-mainline.patch
index dff8d34..87313ed 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0073-Backported-from-mainline.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0073-Backported-from-mainline.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From e86c60e8bb9da37bfbef63315f38d5154035392d Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 6 Apr 2011 20:39:20 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0074-PR-debug-48466.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0074-PR-debug-48466.patch
index bd23901..2989981 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0074-PR-debug-48466.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0074-PR-debug-48466.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From da3ed31e2090c6b8236bbc3be69433aca0d445f1 Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 6 Apr 2011 20:40:24 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0076-Merge-r172073-from-trunk-to-the-4.6-release-branch-t.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0076-Merge-r172073-from-trunk-to-the-4.6-release-branch-t.patch
index f3ee592..8697879 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0076-Merge-r172073-from-trunk-to-the-4.6-release-branch-t.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0076-Merge-r172073-from-trunk-to-the-4.6-release-branch-t.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 3329b7447ab817bb0374a689f3b381a5781ed8aa Mon Sep 17 00:00:00 2001
 From: jyasskin <jyasskin@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 7 Apr 2011 04:50:23 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0077-Backport-from-mainline.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0077-Backport-from-mainline.patch
index 5241379..39bbbf7 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0077-Backport-from-mainline.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0077-Backport-from-mainline.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 354f280d6446d87730bacabf798f88a7aedd1af1 Mon Sep 17 00:00:00 2001
 From: abel <abel@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 7 Apr 2011 12:07:24 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0078-de.po-Update.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0078-de.po-Update.patch
index dedce2d..a0e9fd2 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0078-de.po-Update.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0078-de.po-Update.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From cd0f7d2692283fbf5dfce422da2896a07fc3ea3f Mon Sep 17 00:00:00 2001
 From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 7 Apr 2011 16:31:06 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0079-PR-debug-48343.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0079-PR-debug-48343.patch
index 99f3a1d..64a35b9 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0079-PR-debug-48343.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0079-PR-debug-48343.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 1e8081c83aa5101ccca523ce8448282bece491ff Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 7 Apr 2011 18:05:08 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0080-PR-fortran-48117.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0080-PR-fortran-48117.patch
index 67a64e4..ed2cec1 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0080-PR-fortran-48117.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0080-PR-fortran-48117.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 95333dcb51a2099d45b792b945fd9c0a2f8febab Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 7 Apr 2011 18:33:34 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0081-config-i386-sse.md-Update-copyright-year.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0081-config-i386-sse.md-Update-copyright-year.patch
index 97370d4..6c2d54c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0081-config-i386-sse.md-Update-copyright-year.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0081-config-i386-sse.md-Update-copyright-year.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From ac4ab0911ae869e3cd4c00629e3c4d4d0b7e7aa6 Mon Sep 17 00:00:00 2001
 From: uros <uros@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 7 Apr 2011 20:46:50 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0082-gcc.dg-torture-stackalign-non-local-goto-5.c-Fix-for.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0082-gcc.dg-torture-stackalign-non-local-goto-5.c-Fix-for.patch
index b34f959..60e1cb0 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0082-gcc.dg-torture-stackalign-non-local-goto-5.c-Fix-for.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0082-gcc.dg-torture-stackalign-non-local-goto-5.c-Fix-for.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 5430ea55f853566272279cbd5bb20a2dd5bd7a51 Mon Sep 17 00:00:00 2001
 From: mrs <mrs@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 7 Apr 2011 21:33:47 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0084-PR-tree-optimization-48377.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0084-PR-tree-optimization-48377.patch
index e3c000b..3b60a8d 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0084-PR-tree-optimization-48377.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0084-PR-tree-optimization-48377.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From eba70fb9976ef047a8fb8dc6499c42e8fd3551f7 Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 8 Apr 2011 11:45:29 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0085-de.po-Update.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0085-de.po-Update.patch
index 2e33e3d..38e5cfc 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0085-de.po-Update.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0085-de.po-Update.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From dc6361adc966b10875fbfafff9652dcc4043df58 Mon Sep 17 00:00:00 2001
 From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 8 Apr 2011 14:29:58 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0086-PR-c-48450.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0086-PR-c-48450.patch
index 51906cf..085af22 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0086-PR-c-48450.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0086-PR-c-48450.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From a5e7415bfbe41941768106dc5819bf3fff1b8435 Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 8 Apr 2011 15:01:50 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0087-semantics.c-finish_decltype_type-Add-complain-parm.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0087-semantics.c-finish_decltype_type-Add-complain-parm.patch
index 6ff7279..acfc41a 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0087-semantics.c-finish_decltype_type-Add-complain-parm.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0087-semantics.c-finish_decltype_type-Add-complain-parm.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 2f7a2d284d42cfbff01ee024af4cbaeaff766ee5 Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 8 Apr 2011 15:02:00 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0088-PR-c-48452.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0088-PR-c-48452.patch
index c034bc6..94d987f 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0088-PR-c-48452.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0088-PR-c-48452.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 92860ca75ea3cbb7223913d121c60cc56c966794 Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 8 Apr 2011 15:02:08 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0089-PR-c-48468.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0089-PR-c-48468.patch
index ab6c28d..cbc4140 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0089-PR-c-48468.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0089-PR-c-48468.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 4215154488607abf1ee95f1d1f03cb66be4bd4d8 Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 8 Apr 2011 15:02:16 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0090-PR-c-48500.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0090-PR-c-48500.patch
index 74f0afa..2cb6aac 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0090-PR-c-48500.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0090-PR-c-48500.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From c9ec81bbd73666b97ab9049b759b5ab8d0e06681 Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 8 Apr 2011 15:02:28 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0091-2011-04-08-Steven-G.-Kargl-kargl-gcc.gnu.org.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0091-2011-04-08-Steven-G.-Kargl-kargl-gcc.gnu.org.patch
index 0ccff19..04a7272 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0091-2011-04-08-Steven-G.-Kargl-kargl-gcc.gnu.org.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0091-2011-04-08-Steven-G.-Kargl-kargl-gcc.gnu.org.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 6b290e64ee2bbe7974ee43ce49297ee9496f18d6 Mon Sep 17 00:00:00 2001
 From: kargl <kargl@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 8 Apr 2011 21:41:35 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0092-PR-testsuite-48506.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0092-PR-testsuite-48506.patch
index bcb5859..fcdf07f 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0092-PR-testsuite-48506.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0092-PR-testsuite-48506.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From fcc3e3a4ba3138d25c93ba5f996cac1660788bb9 Mon Sep 17 00:00:00 2001
 From: mrs <mrs@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 8 Apr 2011 23:56:45 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0094-Bail-out-rather-than-crashing-in-array_type_nelts-if.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0094-Bail-out-rather-than-crashing-in-array_type_nelts-if.patch
index 11ec352..928bf0d 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0094-Bail-out-rather-than-crashing-in-array_type_nelts-if.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0094-Bail-out-rather-than-crashing-in-array_type_nelts-if.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 8216e1c4c23928723f8e1583bf7e014813bb2c07 Mon Sep 17 00:00:00 2001
 From: baldrick <baldrick@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sat, 9 Apr 2011 16:14:07 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0095-PR-c-48528.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0095-PR-c-48528.patch
index 42fae86..f185fa8 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0095-PR-c-48528.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0095-PR-c-48528.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From f96c29b23a4f631242aae823f9735a33e8e1cf0a Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sat, 9 Apr 2011 19:04:11 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0097-2011-04-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0097-2011-04-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
index 7e04afd..b6f795a 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0097-2011-04-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0097-2011-04-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 7d736b8d0fb4f7892a5646ca3581b9ab01cb2971 Mon Sep 17 00:00:00 2001
 From: redi <redi@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sun, 10 Apr 2011 16:19:41 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0098-2011-04-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0098-2011-04-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
index 5895393..ea300e3 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0098-2011-04-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0098-2011-04-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From f6e12aec843ba3a839f49b60a5ca092f2fadd876 Mon Sep 17 00:00:00 2001
 From: redi <redi@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sun, 10 Apr 2011 16:29:05 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0099-2011-04-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0099-2011-04-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
index 34fad1c..e122254 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0099-2011-04-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0099-2011-04-10-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 2173abe5d6f3f3157317caa470226e13827c3df9 Mon Sep 17 00:00:00 2001
 From: redi <redi@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sun, 10 Apr 2011 16:34:34 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0101-Backport-from-mainline.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0101-Backport-from-mainline.patch
index dd1b600..6366864 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0101-Backport-from-mainline.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0101-Backport-from-mainline.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 0344e764781d1c1b27f07f6f973b9797d8d6285c Mon Sep 17 00:00:00 2001
 From: ro <ro@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Mon, 11 Apr 2011 10:42:23 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0102-common.opt-Tbss-Tdata-Ttext-New-options.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0102-common.opt-Tbss-Tdata-Ttext-New-options.patch
index db38793..5a575d2 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0102-common.opt-Tbss-Tdata-Ttext-New-options.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0102-common.opt-Tbss-Tdata-Ttext-New-options.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From ec818a73c8e43d77fefc29593ef84e69b0cac39e Mon Sep 17 00:00:00 2001
 From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Mon, 11 Apr 2011 15:26:47 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0104-PR-c-48523.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0104-PR-c-48523.patch
index 62bd4f9..3b77cc9 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0104-PR-c-48523.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0104-PR-c-48523.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 514b92d849b08f3fb7a8194a822b0b8609776564 Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 12 Apr 2011 00:20:18 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0105-PR-c-48534.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0105-PR-c-48534.patch
index b960380..08fbd3f 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0105-PR-c-48534.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0105-PR-c-48534.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 373ffb66c10a25abb4c48a027fea4e6cf8c4cc5d Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 12 Apr 2011 00:20:32 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0106-PR-c-48517.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0106-PR-c-48517.patch
index 8fba6af..6521ffb 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0106-PR-c-48517.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0106-PR-c-48517.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From b58a503c5dbde32cbb9bd48ea16ff868d2023cf9 Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 12 Apr 2011 06:53:13 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0107-2011-04-12-Allan-McRae-allan-archlinux.org.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0107-2011-04-12-Allan-McRae-allan-archlinux.org.patch
index a3dd12e..4bf126a 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0107-2011-04-12-Allan-McRae-allan-archlinux.org.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0107-2011-04-12-Allan-McRae-allan-archlinux.org.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 872b1920a12548af70c3866daadc4a67d05416b1 Mon Sep 17 00:00:00 2001
 From: paolo <paolo@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 12 Apr 2011 09:05:41 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0108-config-v850-v850.c-expand_prologue-Do-not-use-the-CA.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0108-config-v850-v850.c-expand_prologue-Do-not-use-the-CA.patch
index 2c7a767..9de1cd9 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0108-config-v850-v850.c-expand_prologue-Do-not-use-the-CA.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0108-config-v850-v850.c-expand_prologue-Do-not-use-the-CA.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From a03834fec84b808ccef5c0abb5c35d069d7ad868 Mon Sep 17 00:00:00 2001
 From: nickc <nickc@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 12 Apr 2011 11:33:07 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0109-PR-rtl-optimization-48549.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0109-PR-rtl-optimization-48549.patch
index 9a30fdb..7abf050 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0109-PR-rtl-optimization-48549.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0109-PR-rtl-optimization-48549.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 5b05a527f1368e4ca9f71a8ec8124a2c64661007 Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 12 Apr 2011 13:44:33 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0110-2011-04-12-Martin-Jambor-mjambor-suse.cz.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0110-2011-04-12-Martin-Jambor-mjambor-suse.cz.patch
index 33afc8d..9e21ed6 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0110-2011-04-12-Martin-Jambor-mjambor-suse.cz.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0110-2011-04-12-Martin-Jambor-mjambor-suse.cz.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From abf56c82ebcb8ba287fc69b8961af55b4541a130 Mon Sep 17 00:00:00 2001
 From: jamborm <jamborm@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 12 Apr 2011 18:31:55 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0112-Fix-PR-target-48090.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0112-Fix-PR-target-48090.patch
index 9db9c54..6f51ca4 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0112-Fix-PR-target-48090.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0112-Fix-PR-target-48090.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 811af0cad0121e89e3a3908dd71ca32187281e19 Mon Sep 17 00:00:00 2001
 From: ramana <ramana@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 13 Apr 2011 07:41:08 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0113-Fix-PR-c-48574.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0113-Fix-PR-c-48574.patch
index 75b3fba..852a96c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0113-Fix-PR-c-48574.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0113-Fix-PR-c-48574.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From a236530cd5ac2466b1ca3b510b6bdb493c7b5342 Mon Sep 17 00:00:00 2001
 From: dodji <dodji@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 13 Apr 2011 15:19:40 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0114-PR-c-48570.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0114-PR-c-48570.patch
index 0003c8b..982290d 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0114-PR-c-48570.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0114-PR-c-48570.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 235c1ad4230b29a189d4300841c4d8c3dd144388 Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 13 Apr 2011 15:47:40 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0115-PR-middle-end-48591.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0115-PR-middle-end-48591.patch
index c9303c4..019ddcd 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0115-PR-middle-end-48591.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0115-PR-middle-end-48591.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From f16c1783b4b2c93a42eb36b4f136ec46bd3ce834 Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 13 Apr 2011 15:52:17 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0116-2011-04-13-Paul-Thomas-pault-gcc.gnu.org.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0116-2011-04-13-Paul-Thomas-pault-gcc.gnu.org.patch
index f2aa9eb..7e6e6ac 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0116-2011-04-13-Paul-Thomas-pault-gcc.gnu.org.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0116-2011-04-13-Paul-Thomas-pault-gcc.gnu.org.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 348c7b9400ed5fe0d8c3c077f8223ca359bed036 Mon Sep 17 00:00:00 2001
 From: pault <pault@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 13 Apr 2011 18:38:17 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0117-PR-c-48594.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0117-PR-c-48594.patch
index 88a2063..e1a0115 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0117-PR-c-48594.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0117-PR-c-48594.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From b711bf8d9e6f7b717bb87fa7a3514692efdecfaf Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 13 Apr 2011 20:51:23 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0118-sv.po-Update.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0118-sv.po-Update.patch
index 090371a..af734b6 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0118-sv.po-Update.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0118-sv.po-Update.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From d744e56ec8412e410b993c2ab4af3c230bbd363b Mon Sep 17 00:00:00 2001
 From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 13 Apr 2011 22:08:21 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0119-Backport-from-mainline.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0119-Backport-from-mainline.patch
index 96e2ec7..443e371 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0119-Backport-from-mainline.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0119-Backport-from-mainline.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From ede3baf6fc1fe4972344051051daff1043f90ce3 Mon Sep 17 00:00:00 2001
 From: danglin <danglin@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 13 Apr 2011 22:36:59 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0122-PR-target-48605.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0122-PR-target-48605.patch
index 68b8fc1..0bcc298 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0122-PR-target-48605.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0122-PR-target-48605.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From cad5b42c7c890058535eb7bc8c3766f03d428f59 Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 15 Apr 2011 10:21:00 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0123-PR-target-48614.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0123-PR-target-48614.patch
index fd17745..db3c302 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0123-PR-target-48614.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0123-PR-target-48614.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 13a531dde8ee181ad9e8aeb6b755ca52f261bef8 Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 15 Apr 2011 10:29:58 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0124-2011-04-15-Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0124-2011-04-15-Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch
index 6a9e1ea..933f666 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0124-2011-04-15-Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0124-2011-04-15-Andreas-Krebbel-Andreas.Krebbel-de.ibm.co.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From d3cce0bbf7e327905965f0fae70b04af08bfb64b Mon Sep 17 00:00:00 2001
 From: krebbel <krebbel@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 15 Apr 2011 12:43:40 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0125-2011-04-15-Takaya-Saito-gintensubaru-gmail.com.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0125-2011-04-15-Takaya-Saito-gintensubaru-gmail.com.patch
index 412386b..6f5f5d5 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0125-2011-04-15-Takaya-Saito-gintensubaru-gmail.com.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0125-2011-04-15-Takaya-Saito-gintensubaru-gmail.com.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 95c034f0075055720f37e340fd008d8d7cb45b4e Mon Sep 17 00:00:00 2001
 From: paolo <paolo@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 15 Apr 2011 14:52:57 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0126-2011-04-15-Paolo-Carlini-paolo.carlini-oracle.com.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0126-2011-04-15-Paolo-Carlini-paolo.carlini-oracle.com.patch
index 36cdf03..6a04e7b 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0126-2011-04-15-Paolo-Carlini-paolo.carlini-oracle.com.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0126-2011-04-15-Paolo-Carlini-paolo.carlini-oracle.com.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 6cd1f8146545d6f82269c9a96a05438a06fcdc1a Mon Sep 17 00:00:00 2001
 From: paolo <paolo@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 15 Apr 2011 16:19:39 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0127-testsuite-libjava.jni-jni.exp-gcj_jni_get_cxxflags_i.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0127-testsuite-libjava.jni-jni.exp-gcj_jni_get_cxxflags_i.patch
index 870a6a2..f60ee4d 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0127-testsuite-libjava.jni-jni.exp-gcj_jni_get_cxxflags_i.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0127-testsuite-libjava.jni-jni.exp-gcj_jni_get_cxxflags_i.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 37bc32c009317c62516117bfb2c9b49772b159af Mon Sep 17 00:00:00 2001
 From: ro <ro@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 15 Apr 2011 17:17:18 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0129-2011-04-15-Daniel-Krugler-daniel.kruegler-googlemail.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0129-2011-04-15-Daniel-Krugler-daniel.kruegler-googlemail.patch
index 8fba412..2384e42 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0129-2011-04-15-Daniel-Krugler-daniel.kruegler-googlemail.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0129-2011-04-15-Daniel-Krugler-daniel.kruegler-googlemail.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From 2ce87b6b9c9143a22381eec77bbf1fd7016e132d Mon Sep 17 00:00:00 2001
 From: paolo <paolo@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sat, 16 Apr 2011 00:55:53 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0130-2011-04-15-Daniel-Krugler-daniel.kruegler-googlemail.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0130-2011-04-15-Daniel-Krugler-daniel.kruegler-googlemail.patch
index 2efd69f..9986b68 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0130-2011-04-15-Daniel-Krugler-daniel.kruegler-googlemail.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0130-2011-04-15-Daniel-Krugler-daniel.kruegler-googlemail.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [Backport]
+
 From fffee2aba06d51178d5c653db0acd6c775a0326b Mon Sep 17 00:00:00 2001
 From: paolo <paolo@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sat, 16 Apr 2011 02:04:56 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0132-PR-lto-48538.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0132-PR-lto-48538.patch
index e71632e..754efbd 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0132-PR-lto-48538.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0132-PR-lto-48538.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From aeb8275b52616d86410149e8500839115f9c0b8b Mon Sep 17 00:00:00 2001
 From: ebotcazou <ebotcazou@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sun, 17 Apr 2011 14:58:03 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0133-config-sparc-freebsd.h-CPP_CPU64_DEFAULT_SPEC-Replac.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0133-config-sparc-freebsd.h-CPP_CPU64_DEFAULT_SPEC-Replac.patch
index f4ed5e8..e16e3aa 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0133-config-sparc-freebsd.h-CPP_CPU64_DEFAULT_SPEC-Replac.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0133-config-sparc-freebsd.h-CPP_CPU64_DEFAULT_SPEC-Replac.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From a8765482b00b7e1774f72c7def19ca711636e1d1 Mon Sep 17 00:00:00 2001
 From: gerald <gerald@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sun, 17 Apr 2011 21:34:29 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0134-2011-04-17-Daniel-Krugler-daniel.kruegler-googlemail.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0134-2011-04-17-Daniel-Krugler-daniel.kruegler-googlemail.patch
index 1691211..177afa2 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0134-2011-04-17-Daniel-Krugler-daniel.kruegler-googlemail.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0134-2011-04-17-Daniel-Krugler-daniel.kruegler-googlemail.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 1934cdd502a4bad6e1c54c4206b9361909f01083 Mon Sep 17 00:00:00 2001
 From: paolo <paolo@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sun, 17 Apr 2011 21:46:20 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0135-doc-passes.texi-Fill-crossref-nodes.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0135-doc-passes.texi-Fill-crossref-nodes.patch
index 2f060a5..cb8ab1a 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0135-doc-passes.texi-Fill-crossref-nodes.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0135-doc-passes.texi-Fill-crossref-nodes.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 54907dbd122d6e4661b9583247e5574b9349c130 Mon Sep 17 00:00:00 2001
 From: gerald <gerald@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sun, 17 Apr 2011 21:59:00 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0136-gcc-interface-Make-lang.in-gnatbind-Replace-ALL_CFLA.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0136-gcc-interface-Make-lang.in-gnatbind-Replace-ALL_CFLA.patch
index 7575f48..c9a38e0 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0136-gcc-interface-Make-lang.in-gnatbind-Replace-ALL_CFLA.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0136-gcc-interface-Make-lang.in-gnatbind-Replace-ALL_CFLA.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 03b47392e5f3af2fe5ef4ad1f5fc9cca47604945 Mon Sep 17 00:00:00 2001
 From: ebotcazou <ebotcazou@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sun, 17 Apr 2011 22:29:13 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0138-PR-tree-optimization-48616.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0138-PR-tree-optimization-48616.patch
index 78bf4fb..c3d271f 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0138-PR-tree-optimization-48616.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0138-PR-tree-optimization-48616.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 45a8b16e2be6b6ff5d37d43e86a6e2fce5cfb79d Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Mon, 18 Apr 2011 07:38:11 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0139-2011-04-18-Richard-Guenther-rguenther-suse.de.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0139-2011-04-18-Richard-Guenther-rguenther-suse.de.patch
index e371b6f..a14ee29 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0139-2011-04-18-Richard-Guenther-rguenther-suse.de.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0139-2011-04-18-Richard-Guenther-rguenther-suse.de.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 68e7b8b6643a4c50a8527610dbf5a7ab36cc8f24 Mon Sep 17 00:00:00 2001
 From: rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Mon, 18 Apr 2011 14:25:57 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0140-PR-47571-Fix-weakref-trickery-breakage-on-alpha-dec-.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0140-PR-47571-Fix-weakref-trickery-breakage-on-alpha-dec-.patch
index 534154b..5860b19 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0140-PR-47571-Fix-weakref-trickery-breakage-on-alpha-dec-.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0140-PR-47571-Fix-weakref-trickery-breakage-on-alpha-dec-.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 137ed44dcdd5890433b8d0348dcd2b7624b7c3d6 Mon Sep 17 00:00:00 2001
 From: jb <jb@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Mon, 18 Apr 2011 15:49:16 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0141-dwarf2out.c-is_redundant_typedef-Add-inline-to-proto.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0141-dwarf2out.c-is_redundant_typedef-Add-inline-to-proto.patch
index 8de047d..7483afe 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0141-dwarf2out.c-is_redundant_typedef-Add-inline-to-proto.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0141-dwarf2out.c-is_redundant_typedef-Add-inline-to-proto.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 9adddf1e8ef277d62e5da8dfd81bc50e2b4898c4 Mon Sep 17 00:00:00 2001
 From: ebotcazou <ebotcazou@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Mon, 18 Apr 2011 17:37:55 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0142-PR-c-48632.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0142-PR-c-48632.patch
index 989a1e6..fa158fd 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0142-PR-c-48632.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0142-PR-c-48632.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 71ec07630d08b813b39a65a932c71c78b8ffd845 Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Mon, 18 Apr 2011 21:56:12 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0143-PR-middle-end-48661.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0143-PR-middle-end-48661.patch
index e032f13..324639e 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0143-PR-middle-end-48661.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0143-PR-middle-end-48661.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 6d925e0321b8a34fb21b00a202c07d3d8a6e389a Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Mon, 18 Apr 2011 21:58:03 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0144-PR-c-48537.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0144-PR-c-48537.patch
index de2e447..8d9440c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0144-PR-c-48537.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0144-PR-c-48537.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 065054b0b29c40548abd13c272431507d035b30a Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Mon, 18 Apr 2011 23:29:30 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0146-PR-testsuite-48675.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0146-PR-testsuite-48675.patch
index c5ac896..d25f59a 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0146-PR-testsuite-48675.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0146-PR-testsuite-48675.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From cd1bb68f56ade6449c6d52a1916c6a58f09f59e6 Mon Sep 17 00:00:00 2001
 From: hp <hp@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 19 Apr 2011 03:58:04 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0147-2011-04-18-Richard-Guenther-rguenther-suse.de.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0147-2011-04-18-Richard-Guenther-rguenther-suse.de.patch
index 1d4ef09..dc577a9 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0147-2011-04-18-Richard-Guenther-rguenther-suse.de.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0147-2011-04-18-Richard-Guenther-rguenther-suse.de.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From dd8cc468e2787972742061b1547dbab48729ccf8 Mon Sep 17 00:00:00 2001
 From: rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 19 Apr 2011 09:14:05 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0149-PR-target-48678.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0149-PR-target-48678.patch
index da3a872..c5036bf 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0149-PR-target-48678.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0149-PR-target-48678.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From ac255441a3e973a974d1ab70d00a9b7269103214 Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 19 Apr 2011 16:49:19 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0151-PR-c-46304.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0151-PR-c-46304.patch
index 3e87c05..789558a 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0151-PR-c-46304.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0151-PR-c-46304.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 021acee3b7a6b26783c92870c1e202730c3f024e Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 20 Apr 2011 06:31:51 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0152-bootstrap-lto.mk-Remove-obsolete-requirement.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0152-bootstrap-lto.mk-Remove-obsolete-requirement.patch
index b9d0a69..a1d8088 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0152-bootstrap-lto.mk-Remove-obsolete-requirement.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0152-bootstrap-lto.mk-Remove-obsolete-requirement.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 64152d5463c74f3ec58a7d27e7f4e03dfd9557ff Mon Sep 17 00:00:00 2001
 From: ebotcazou <ebotcazou@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 20 Apr 2011 09:25:33 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0153-2011-04-20-Richard-Guenther-rguenther-suse.de.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0153-2011-04-20-Richard-Guenther-rguenther-suse.de.patch
index e47d8d1..9ff69b0 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0153-2011-04-20-Richard-Guenther-rguenther-suse.de.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0153-2011-04-20-Richard-Guenther-rguenther-suse.de.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 5ff95d9c48276f6495b8ebefeb2ce4ac1ab6a1fe Mon Sep 17 00:00:00 2001
 From: rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 20 Apr 2011 09:48:00 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0154-Backport-from-mainline.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0154-Backport-from-mainline.patch
index 0a0c5a6..152b081 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0154-Backport-from-mainline.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0154-Backport-from-mainline.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From b769f6c6e91c977fb6b4fcc5b7838eb79dddaeb7 Mon Sep 17 00:00:00 2001
 From: ebotcazou <ebotcazou@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 20 Apr 2011 11:18:50 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0155-PR-tree-optimization-48611.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0155-PR-tree-optimization-48611.patch
index 72651fb..922c0a8 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0155-PR-tree-optimization-48611.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0155-PR-tree-optimization-48611.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 0e3879bf21f04b54b0849f3a86c20359f965e12a Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 20 Apr 2011 18:19:47 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0156-PR-c-48657.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0156-PR-c-48657.patch
index 8f5cbaf..b1720b7 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0156-PR-c-48657.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0156-PR-c-48657.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 03be58e53f230926009974bd7aed6a40a557dc1d Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 20 Apr 2011 19:39:26 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0157-PR-target-48288.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0157-PR-target-48288.patch
index 7d82418..66c349c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0157-PR-target-48288.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0157-PR-target-48288.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 05f12c826eff0c87deeac7347d73cb276ec493cc Mon Sep 17 00:00:00 2001
 From: danglin <danglin@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 20 Apr 2011 23:36:20 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0159-PR-c-48594.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0159-PR-c-48594.patch
index f1ac822..a01b834 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0159-PR-c-48594.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0159-PR-c-48594.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From eda6b7fee4d20c15dc919a726b60ee5777c402c8 Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 21 Apr 2011 03:03:08 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0160-semantics.c-finish_compound_literal-Don-t-put-an-arr.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0160-semantics.c-finish_compound_literal-Don-t-put-an-arr.patch
index bdd4978..44f5d35 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0160-semantics.c-finish_compound_literal-Don-t-put-an-arr.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0160-semantics.c-finish_compound_literal-Don-t-put-an-arr.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 19692feb0bd83e8e6b3a1e1e0b43119d7e12ce96 Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 21 Apr 2011 04:27:30 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0161-gimple.c-walk_gimple_op-GIMPLE_CALL-Fix-couple-of-ov.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0161-gimple.c-walk_gimple_op-GIMPLE_CALL-Fix-couple-of-ov.patch
index 58010b1..64e7978 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0161-gimple.c-walk_gimple_op-GIMPLE_CALL-Fix-couple-of-ov.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0161-gimple.c-walk_gimple_op-GIMPLE_CALL-Fix-couple-of-ov.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 20a8b6ba99d25394d9d4b958a8ecc171fe3d263b Mon Sep 17 00:00:00 2001
 From: ebotcazou <ebotcazou@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 21 Apr 2011 14:18:54 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0162-2011-04-21-Richard-Guenther-rguenther-suse.de.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0162-2011-04-21-Richard-Guenther-rguenther-suse.de.patch
index 482f1dc..fa83ccc 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0162-2011-04-21-Richard-Guenther-rguenther-suse.de.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0162-2011-04-21-Richard-Guenther-rguenther-suse.de.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From d0c1a282504a0fa941a9ae22536c73f64d8c5762 Mon Sep 17 00:00:00 2001
 From: rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 21 Apr 2011 14:40:53 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0163-de.po-Update.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0163-de.po-Update.patch
index feadd1c..15ae013 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0163-de.po-Update.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0163-de.po-Update.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From bdc36219ffa6e8c7e2b48e4aedc32082205a2195 Mon Sep 17 00:00:00 2001
 From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 21 Apr 2011 17:02:45 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0164-PR-target-48708.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0164-PR-target-48708.patch
index 4fca023..a089ebe 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0164-PR-target-48708.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0164-PR-target-48708.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From ad24dcb7c07f1f9d41cb6782ea14c6c1727c4cb0 Mon Sep 17 00:00:00 2001
 From: uros <uros@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 21 Apr 2011 20:23:55 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0166-PR-c-48716.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0166-PR-c-48716.patch
index dacc5c4..c9c474d 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0166-PR-c-48716.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0166-PR-c-48716.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 3a3d51cb4f1ec33265471b03d21b96d30e899858 Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 22 Apr 2011 14:11:44 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0167-PR-target-48723.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0167-PR-target-48723.patch
index 7aab9fb..8359bb1 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0167-PR-target-48723.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0167-PR-target-48723.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 6798037eb1c55f1dd79c04da313bd6bcd4d2aa9e Mon Sep 17 00:00:00 2001
 From: uros <uros@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 22 Apr 2011 18:43:57 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0168-PR-tree-optimization-48717.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0168-PR-tree-optimization-48717.patch
index 59101ff..a3c51de 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0168-PR-tree-optimization-48717.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0168-PR-tree-optimization-48717.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 8825c738568548e5d67dc2f4e7ce9326dcc2cd7c Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 22 Apr 2011 18:53:30 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0170-Revert.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0170-Revert.patch
index 12854d2..9f39bde 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0170-Revert.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0170-Revert.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From b4d9ee2abbc5ac5fcf475e1d495bd3d55500d39b Mon Sep 17 00:00:00 2001
 From: uros <uros@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sat, 23 Apr 2011 07:41:43 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0171-PR-c-48685.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0171-PR-c-48685.patch
index d205ca4..f11f405 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0171-PR-c-48685.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0171-PR-c-48685.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 260252e3308b19f495f084658236114ead218ec5 Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sat, 23 Apr 2011 10:18:54 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0172-gcc.dg-pr48616.c-dg-options-Add-fno-common-to-option.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0172-gcc.dg-pr48616.c-dg-options-Add-fno-common-to-option.patch
index 8446c41..6ba93bf 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0172-gcc.dg-pr48616.c-dg-options-Add-fno-common-to-option.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0172-gcc.dg-pr48616.c-dg-options-Add-fno-common-to-option.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 79d3442448d1bd498a80baca666a94dfabe93364 Mon Sep 17 00:00:00 2001
 From: danglin <danglin@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sat, 23 Apr 2011 17:47:17 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0173-2011-04-23-Jonathan-Wakely-jwakely.gcc-gmail.com.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0173-2011-04-23-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
index 1c507fe..6cd605f 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0173-2011-04-23-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0173-2011-04-23-Jonathan-Wakely-jwakely.gcc-gmail.com.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 0755fde6008ab7a7ae98f3b4c5967191408431f3 Mon Sep 17 00:00:00 2001
 From: redi <redi@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sat, 23 Apr 2011 17:51:31 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0174-PR-preprocessor-48740.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0174-PR-preprocessor-48740.patch
index b41d59d..852b7ec 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0174-PR-preprocessor-48740.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0174-PR-preprocessor-48740.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From c6deb5c58fde1c5115d9e92afb2ead8e7ac4fea0 Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sat, 23 Apr 2011 23:33:39 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0176-2011-04-24-Paolo-Carlini-paolo.carlini-oracle.com.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0176-2011-04-24-Paolo-Carlini-paolo.carlini-oracle.com.patch
index 49076df..35282c1 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0176-2011-04-24-Paolo-Carlini-paolo.carlini-oracle.com.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0176-2011-04-24-Paolo-Carlini-paolo.carlini-oracle.com.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 63c4ffd33d8f3e61e53d30f50146e1bc4cb6e38a Mon Sep 17 00:00:00 2001
 From: paolo <paolo@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Sun, 24 Apr 2011 09:43:29 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0178-PR-c-48707.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0178-PR-c-48707.patch
index 64a53d2..40505e5 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0178-PR-c-48707.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0178-PR-c-48707.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From c2606fe2aa58ae13a13e7ff0b17da61e4565586d Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Mon, 25 Apr 2011 21:53:57 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0180-2011-04-26-Tobias-Burnus-burnus-net-b.de.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0180-2011-04-26-Tobias-Burnus-burnus-net-b.de.patch
index 1ac7b99..ec60583 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0180-2011-04-26-Tobias-Burnus-burnus-net-b.de.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0180-2011-04-26-Tobias-Burnus-burnus-net-b.de.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From ead753a2ac74bd306d240de4760b7f809c581052 Mon Sep 17 00:00:00 2001
 From: burnus <burnus@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 26 Apr 2011 08:41:31 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0181-2011-04-26-Richard-Guenther-rguenther-suse.de.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0181-2011-04-26-Richard-Guenther-rguenther-suse.de.patch
index 78202f0..ee42329 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0181-2011-04-26-Richard-Guenther-rguenther-suse.de.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0181-2011-04-26-Richard-Guenther-rguenther-suse.de.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 2e8f32d39576b002280e29079ad6cfc55c852276 Mon Sep 17 00:00:00 2001
 From: rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 26 Apr 2011 12:59:22 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0182-PR-tree-optimization-48734.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0182-PR-tree-optimization-48734.patch
index f38422d..40f3efa 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0182-PR-tree-optimization-48734.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0182-PR-tree-optimization-48734.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From a3ac868928384ffe6f10c3aa0fd3ac9ab8cc1aae Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 26 Apr 2011 13:44:51 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0183-PR-debug-48768.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0183-PR-debug-48768.patch
index 609f110..2a0fd2f 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0183-PR-debug-48768.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0183-PR-debug-48768.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 8a0e77485c3d9d34c6f65cec908829dcc4cd5fee Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 26 Apr 2011 13:47:13 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0184-de.po-Update.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0184-de.po-Update.patch
index 888dcad..eea1bea 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0184-de.po-Update.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0184-de.po-Update.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 6dd6ecb750b587d76e46e7e622e44407fce87389 Mon Sep 17 00:00:00 2001
 From: jsm28 <jsm28@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 26 Apr 2011 14:57:30 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0185-PR-c-48726.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0185-PR-c-48726.patch
index f9c8347..50987f0 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0185-PR-c-48726.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0185-PR-c-48726.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From c0df85fc6ea1962c53f98bbca38d182eba8e23f7 Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Tue, 26 Apr 2011 23:42:50 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0187-PR-c-42687.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0187-PR-c-42687.patch
index db390d9..9d363e5 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0187-PR-c-42687.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0187-PR-c-42687.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From ccb3ae3a3167213d1c84397653a7cfec0df3a5b7 Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 27 Apr 2011 05:20:06 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0188-PR-c-48742.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0188-PR-c-48742.patch
index 1b6ff4c..718272d 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0188-PR-c-48742.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0188-PR-c-48742.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 1a6d9e7052b3632a85ca6f79b48384fd684c4411 Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 27 Apr 2011 07:05:54 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0189-gcc.dg-20020312-2.c-Add-definition-for-RX.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0189-gcc.dg-20020312-2.c-Add-definition-for-RX.patch
index e64d238..4586999 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0189-gcc.dg-20020312-2.c-Add-definition-for-RX.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0189-gcc.dg-20020312-2.c-Add-definition-for-RX.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From abb5bc5b7190b68909f9dd14386aa2c430bacd9a Mon Sep 17 00:00:00 2001
 From: nickc <nickc@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 27 Apr 2011 14:55:28 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0190-PR-c-48046.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0190-PR-c-48046.patch
index f2ba186..2a8888a 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0190-PR-c-48046.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0190-PR-c-48046.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From c270475fa490deeb18cf6275a86ce15a57e706ff Mon Sep 17 00:00:00 2001
 From: jason <jason@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Wed, 27 Apr 2011 15:57:06 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0192-PR-middle-end-48597.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0192-PR-middle-end-48597.patch
index 21c5595..dcbe5d8 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0192-PR-middle-end-48597.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0192-PR-middle-end-48597.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 7c26af7b723eae6ac629ea01058553ff025400ab Mon Sep 17 00:00:00 2001
 From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 28 Apr 2011 17:01:55 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0193-2011-04-28-Tobias-Burnus-burnus-net-b.de.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0193-2011-04-28-Tobias-Burnus-burnus-net-b.de.patch
index 2e51a99..9b971fd 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0193-2011-04-28-Tobias-Burnus-burnus-net-b.de.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0193-2011-04-28-Tobias-Burnus-burnus-net-b.de.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From cb79606d4958a3f3df1adfcc00b641e3b8089819 Mon Sep 17 00:00:00 2001
 From: burnus <burnus@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 28 Apr 2011 18:43:16 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0194-2011-04-28-Tobias-Burnus-burnus-net-b.de.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0194-2011-04-28-Tobias-Burnus-burnus-net-b.de.patch
index 0a14655..e478899 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0194-2011-04-28-Tobias-Burnus-burnus-net-b.de.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0194-2011-04-28-Tobias-Burnus-burnus-net-b.de.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From a588d1bdc7fb4aa8e1214b6a57d581ddcfa86159 Mon Sep 17 00:00:00 2001
 From: burnus <burnus@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 28 Apr 2011 18:47:28 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0195-Fix-PR-c-48656.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0195-Fix-PR-c-48656.patch
index b1603c8..b37cb61 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0195-Fix-PR-c-48656.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0195-Fix-PR-c-48656.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 5d622f64eff4e9fa78356c24290aed131b5c519c Mon Sep 17 00:00:00 2001
 From: dodji <dodji@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 28 Apr 2011 19:46:34 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0196-Backport-4.7-patchtes-to-4.6.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0196-Backport-4.7-patchtes-to-4.6.patch
index 53f825b..7fd93db 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0196-Backport-4.7-patchtes-to-4.6.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0196-Backport-4.7-patchtes-to-4.6.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 99347f932bdf7d9b0bf8a4f36737ed128813c1a9 Mon Sep 17 00:00:00 2001
 From: meissner <meissner@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Thu, 28 Apr 2011 22:39:59 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0198-2011-04-29-Tobias-Burnus-burnus-net-b.de.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0198-2011-04-29-Tobias-Burnus-burnus-net-b.de.patch
index 96b886a..8053a2c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0198-2011-04-29-Tobias-Burnus-burnus-net-b.de.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0198-2011-04-29-Tobias-Burnus-burnus-net-b.de.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 1c9148fe797f564821355a8976802689519324dd Mon Sep 17 00:00:00 2001
 From: burnus <burnus@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 29 Apr 2011 21:26:07 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0199-2011-04-29-Paolo-Carlini-paolo.carlini-oracle.com.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0199-2011-04-29-Paolo-Carlini-paolo.carlini-oracle.com.patch
index 4cdbd72..f5ce975 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0199-2011-04-29-Paolo-Carlini-paolo.carlini-oracle.com.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4_6-branch-backports/0199-2011-04-29-Paolo-Carlini-paolo.carlini-oracle.com.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [Backport]
 From 838560450136f202dc9170f2ad3eec80b41e0381 Mon Sep 17 00:00:00 2001
 From: paolo <paolo@138bc75d-0d04-0410-961f-82ee72b054a4>
 Date: Fri, 29 Apr 2011 23:19:59 +0000
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-arm-frename-registers.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-arm-frename-registers.patch
index 280b903..40cfd2d 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-arm-frename-registers.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-arm-frename-registers.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 http://gcc.gnu.org/bugzilla/show_bug.cgi?id=35964
 Index: gcc-4.3.0/gcc/regrename.c
 ===================================================================
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-flags-for-build.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-flags-for-build.patch
index f7beb78..96885af 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-flags-for-build.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-flags-for-build.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [embedded specific]
 Index: gcc-4.6.0/Makefile.def
 ===================================================================
 --- gcc-4.6.0.orig/Makefile.def
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-dir-extend.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-dir-extend.patch
index d477105..89316eb 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-dir-extend.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-dir-extend.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [embedded specific]
 Add /sw/include and /opt/include based on the original
 zecke-no-host-includes.patch patch.  The original patch checked for
 /usr/include, /sw/include and /opt/include and then triggered a failure and
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-parameters.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-parameters.patch
index f36fa81..b574f02 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-parameters.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-parameters.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 gcc: add poison parameters detection
 
 Add the logic that, if not configured with "--enable-target-optspace",
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-system-directories.patch
index e1b7131..dc33231 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-system-directories.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
        gcc/
        2008-07-02  Joseph Myers  <joseph@codesourcery.com>
        * c-incpath.c: Include toplev.h.
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-uclibc-locale-ctype_touplow_t.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-uclibc-locale-ctype_touplow_t.patch
index 8b71e31..cf4bc0e 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-uclibc-locale-ctype_touplow_t.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/gcc-uclibc-locale-ctype_touplow_t.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 Index: gcc-4.6.0/libstdc++-v3/config/locale/generic/c_locale.h
 ===================================================================
 --- gcc-4.6.0.orig/libstdc++-v3/config/locale/generic/c_locale.h
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106720.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106720.patch
new file mode 100644
index 0000000..e9b3c87
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106720.patch
@@ -0,0 +1,53 @@
+Upstream-Status: Inappropriate [Linaro patch]
+
+2011-02-21  Andrew Stubbs  <ams@codesourcery.com>
+	    Julian Brown  <julian@codesourcery.com>
+	    Mark Shinwell  <shinwell@codesourcery.com>
+
+	Forward-ported from Linaro GCC 4.5 (bzr99324).
+
+	gcc/
+	* config/arm/arm.h (arm_class_likely_spilled_p): Check against
+	LO_REGS only for Thumb-1.
+	(MODE_BASE_REG_CLASS): Restrict base registers to those which can
+	be used in short instructions when optimising for size on Thumb-2.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-01-29 03:20:57 +0000
++++ new/gcc/config/arm/arm.c	2011-02-21 14:04:51 +0000
+@@ -22304,14 +22304,16 @@
+ 
+ /* Implement TARGET_CLASS_LIKELY_SPILLED_P.
+  
+-   We need to define this for LO_REGS on thumb.  Otherwise we can end up
+-   using r0-r4 for function arguments, r7 for the stack frame and don't
+-   have enough left over to do doubleword arithmetic.  */
+-
++   We need to define this for LO_REGS on Thumb-1.  Otherwise we can end up
++   using r0-r4 for function arguments, r7 for the stack frame and don't have
++   enough left over to do doubleword arithmetic.  For Thumb-2 all the
++   potentially problematic instructions accept high registers so this is not
++   necessary.  Care needs to be taken to avoid adding new Thumb-2 patterns
++   that require many low registers.  */
+ static bool
+ arm_class_likely_spilled_p (reg_class_t rclass)
+ {
+-  if ((TARGET_THUMB && rclass == LO_REGS)
++  if ((TARGET_THUMB1 && rclass == LO_REGS)
+       || rclass  == CC_REG)
+     return true;
+ 
+
+=== modified file 'gcc/config/arm/arm.h'
+--- old/gcc/config/arm/arm.h	2011-01-29 03:20:57 +0000
++++ new/gcc/config/arm/arm.h	2011-02-21 14:04:51 +0000
+@@ -1185,7 +1185,7 @@
+    when addressing quantities in QI or HI mode; if we don't know the
+    mode, then we must be conservative.  */
+ #define MODE_BASE_REG_CLASS(MODE)					\
+-    (TARGET_32BIT ? CORE_REGS :					\
++    (TARGET_ARM || (TARGET_THUMB2 && !optimize_size) ? CORE_REGS :      \
+      (((MODE) == SImode) ? BASE_REGS : LO_REGS))
+ 
+ /* For Thumb we can not support SP+reg addressing, so we return LO_REGS
+
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106723.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106723.patch
new file mode 100644
index 0000000..d481835
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106723.patch
@@ -0,0 +1,65 @@
+Upstream-Status: Inappropriate [Linaro patch]
+
+2011-02-02  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	PR target/47551
+	* config/arm/arm.c (coproc_secondary_reload_class): Handle
+	structure modes.  Don't check neon_vector_mem_operand for
+	vector or structure modes.
+
+	gcc/testsuite/
+	PR target/47551
+	* gcc.target/arm/neon-modes-2.c: New test.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-02-21 14:04:51 +0000
++++ new/gcc/config/arm/arm.c	2011-03-02 11:38:43 +0000
+@@ -9139,11 +9139,14 @@
+       return GENERAL_REGS;
+     }
+ 
++  /* The neon move patterns handle all legitimate vector and struct
++     addresses.  */
+   if (TARGET_NEON
++      && MEM_P (x)
+       && (GET_MODE_CLASS (mode) == MODE_VECTOR_INT
+-          || GET_MODE_CLASS (mode) == MODE_VECTOR_FLOAT)
+-      && neon_vector_mem_operand (x, 0))
+-     return NO_REGS;
++	  || GET_MODE_CLASS (mode) == MODE_VECTOR_FLOAT
++	  || VALID_NEON_STRUCT_MODE (mode)))
++    return NO_REGS;
+ 
+   if (arm_coproc_mem_operand (x, wb) || s_register_operand (x, mode))
+     return NO_REGS;
+
+=== added file 'gcc/testsuite/gcc.target/arm/neon-modes-2.c'
+--- old/gcc/testsuite/gcc.target/arm/neon-modes-2.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon-modes-2.c	2011-02-02 10:02:45 +0000
+@@ -0,0 +1,24 @@
++/* { dg-do compile } */
++/* { dg-require-effective-target arm_neon_ok } */
++/* { dg-options "-O1" } */
++/* { dg-add-options arm_neon } */
++
++#include "arm_neon.h"
++
++#define SETUP(A) x##A = vld3_u32 (ptr + A * 0x20)
++#define MODIFY(A) x##A = vld3_lane_u32 (ptr + A * 0x20 + 0x10, x##A, 1)
++#define STORE(A) vst3_u32 (ptr + A * 0x20, x##A)
++
++#define MANY(A) A (0), A (1), A (2), A (3), A (4), A (5)
++
++void
++bar (uint32_t *ptr, int y)
++{
++  uint32x2x3_t MANY (SETUP);
++  int *x = __builtin_alloca (y);
++  int z[0x1000];
++  foo (x, z);
++  MANY (MODIFY);
++  foo (x, z);
++  MANY (STORE);
++}
+
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106729.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106729.patch
new file mode 100644
index 0000000..c8aa608
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106729.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Inappropriate [Linaro patch]
+
+2011-03-22  Andrew Stubbs  <ams@codesourcery.com>
+
+	Backport from FSF:
+
+	2011-03-21  Daniel Jacobowitz  <dan@codesourcery.com>
+
+	gcc/
+	* config/arm/unwind-arm.c (__gnu_unwind_pr_common): Correct test
+	for barrier handlers.
+
+=== modified file 'gcc/config/arm/unwind-arm.c'
+--- old/gcc/config/arm/unwind-arm.c	2009-10-30 14:55:10 +0000
++++ new/gcc/config/arm/unwind-arm.c	2011-03-22 10:59:10 +0000
+@@ -1196,8 +1196,6 @@
+ 		  ucbp->barrier_cache.bitpattern[4] = (_uw) &data[1];
+ 
+ 		  if (data[0] & uint32_highbit)
+-		    phase2_call_unexpected_after_unwind = 1;
+-		  else
+ 		    {
+ 		      data += rtti_count + 1;
+ 		      /* Setup for entry to the handler.  */
+@@ -1207,6 +1205,8 @@
+ 		      _Unwind_SetGR (context, 0, (_uw) ucbp);
+ 		      return _URC_INSTALL_CONTEXT;
+ 		    }
++		  else
++		    phase2_call_unexpected_after_unwind = 1;
+ 		}
+ 	      if (data[0] & uint32_highbit)
+ 		data++;
+
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106731.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106731.patch
new file mode 100644
index 0000000..67ff466
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106731.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Inappropriate [Linaro patch]
+
+2011-03-23  Andrew Stubbs  <ams@codesourcery.com>
+
+	Backport from FSF:
+
+	2011-03-23  Julian Brown  <julian@codesourcery.com>
+
+	gcc/
+	* expr.c (expand_expr_real_1): Only use BLKmode for volatile
+	accesses which are not naturally aligned.
+
+=== modified file 'gcc/expr.c'
+--- old/gcc/expr.c	2011-03-18 09:04:31 +0000
++++ new/gcc/expr.c	2011-04-05 16:18:11 +0000
+@@ -9147,8 +9147,11 @@
+ 		&& modifier != EXPAND_CONST_ADDRESS
+ 		&& modifier != EXPAND_INITIALIZER)
+ 	    /* If the field is volatile, we always want an aligned
+-	       access.  */
+-	    || (volatilep && flag_strict_volatile_bitfields > 0)
++	       access.  Only do this if the access is not already naturally
++	       aligned, otherwise "normal" (non-bitfield) volatile fields
++	       become non-addressable.  */
++	    || (volatilep && flag_strict_volatile_bitfields > 0
++		&& (bitpos % GET_MODE_ALIGNMENT (mode) != 0))
+ 	    /* If the field isn't aligned enough to fetch as a memref,
+ 	       fetch it as a bit field.  */
+ 	    || (mode1 != BLKmode
+
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106733.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106733.patch
new file mode 100644
index 0000000..a3385aa
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106733.patch
@@ -0,0 +1,655 @@
+Upstream-Status: Inappropriate [Linaro patch]
+
+2011-03-27  Ira Rosen  <ira.rosen@linaro.org>
+
+	gcc/
+	* doc/invoke.texi (max-stores-to-sink): Document.
+	* params.h (MAX_STORES_TO_SINK): Define.
+	* opts.c (finish_options): Set MAX_STORES_TO_SINK to 0
+	if either vectorization or if-conversion is disabled.
+	* tree-data-ref.c (dr_equal_offsets_p1): Moved and renamed from
+	tree-vect-data-refs.c vect_equal_offsets.
+	(dr_equal_offsets_p): New function.
+	(find_data_references_in_bb): Remove static.
+	* tree-data-ref.h (find_data_references_in_bb): Declare.
+	(dr_equal_offsets_p): Likewise.
+	* tree-vect-data-refs.c (vect_equal_offsets): Move to tree-data-ref.c.
+	(vect_drs_dependent_in_basic_block): Update calls to
+	vect_equal_offsets.
+	(vect_check_interleaving): Likewise.
+	* tree-ssa-phiopt.c: Include cfgloop.h and tree-data-ref.h.
+	(cond_if_else_store_replacement): Rename to...
+	(cond_if_else_store_replacement_1): ... this.  Change arguments and
+	documentation.
+	(cond_if_else_store_replacement): New function.
+	* Makefile.in (tree-ssa-phiopt.o): Adjust dependencies.
+	* params.def (PARAM_MAX_STORES_TO_SINK): Define.
+
+	gcc/testsuite/
+	* gcc.dg/vect/vect-cselim-1.c: New test.
+	* gcc.dg/vect/vect-cselim-2.c: New test.
+
+=== modified file 'gcc/Makefile.in'
+--- old/gcc/Makefile.in	2011-03-26 09:20:34 +0000
++++ new/gcc/Makefile.in	2011-04-18 11:31:29 +0000
+@@ -2422,7 +2422,8 @@
+ tree-ssa-phiopt.o : tree-ssa-phiopt.c $(CONFIG_H) $(SYSTEM_H) coretypes.h \
+    $(TM_H) $(GGC_H) $(TREE_H) $(TM_P_H) $(BASIC_BLOCK_H) \
+    $(TREE_FLOW_H) $(TREE_PASS_H) $(TREE_DUMP_H) langhooks.h $(FLAGS_H) \
+-   $(DIAGNOSTIC_H) $(TIMEVAR_H) pointer-set.h domwalk.h
++   $(DIAGNOSTIC_H) $(TIMEVAR_H) pointer-set.h domwalk.h $(CFGLOOP_H) \
++   $(TREE_DATA_REF_H)
+ tree-nrv.o : tree-nrv.c $(CONFIG_H) $(SYSTEM_H) coretypes.h \
+    $(TM_H) $(TREE_H) $(FUNCTION_H) $(BASIC_BLOCK_H) $(FLAGS_H) \
+    $(DIAGNOSTIC_H) $(TREE_FLOW_H) $(TIMEVAR_H) $(TREE_DUMP_H) $(TREE_PASS_H) \
+
+=== modified file 'gcc/doc/invoke.texi'
+--- old/gcc/doc/invoke.texi	2011-03-29 14:24:42 +0000
++++ new/gcc/doc/invoke.texi	2011-04-18 11:31:29 +0000
+@@ -8909,6 +8909,11 @@
+ The maximum number of namespaces to consult for suggestions when C++
+ name lookup fails for an identifier.  The default is 1000.
+ 
++@item max-stores-to-sink
++The maximum number of conditional stores paires that can be sunk.  Set to 0
++if either vectorization (@option{-ftree-vectorize}) or if-conversion
++(@option{-ftree-loop-if-convert}) is disabled.  The default is 2.
++
+ @end table
+ @end table
+ 
+
+=== modified file 'gcc/opts.c'
+--- old/gcc/opts.c	2011-02-17 22:51:57 +0000
++++ new/gcc/opts.c	2011-03-27 09:38:18 +0000
+@@ -823,6 +823,12 @@
+ 	  opts->x_flag_split_stack = 0;
+ 	}
+     }
++
++  /* Set PARAM_MAX_STORES_TO_SINK to 0 if either vectorization or if-conversion
++     is disabled.  */
++  if (!opts->x_flag_tree_vectorize || !opts->x_flag_tree_loop_if_convert)
++    maybe_set_param_value (PARAM_MAX_STORES_TO_SINK, 0,
++                           opts->x_param_values, opts_set->x_param_values);
+ }
+ 
+ #define LEFT_COLUMN	27
+
+=== modified file 'gcc/params.def'
+--- old/gcc/params.def	2011-03-26 09:20:34 +0000
++++ new/gcc/params.def	2011-04-18 11:31:29 +0000
+@@ -883,6 +883,13 @@
+ 	  "name lookup fails",
+ 	  1000, 0, 0)
+ 
++/* Maximum number of conditional store pairs that can be sunk.  */
++DEFPARAM (PARAM_MAX_STORES_TO_SINK,
++          "max-stores-to-sink",
++          "Maximum number of conditional store pairs that can be sunk",
++          2, 0, 0)
++
++
+ /*
+ Local variables:
+ mode:c
+
+=== modified file 'gcc/params.h'
+--- old/gcc/params.h	2011-01-13 13:41:03 +0000
++++ new/gcc/params.h	2011-03-27 09:38:18 +0000
+@@ -206,4 +206,6 @@
+   PARAM_VALUE (PARAM_PREFETCH_MIN_INSN_TO_MEM_RATIO)
+ #define MIN_NONDEBUG_INSN_UID \
+   PARAM_VALUE (PARAM_MIN_NONDEBUG_INSN_UID)
++#define MAX_STORES_TO_SINK \
++  PARAM_VALUE (PARAM_MAX_STORES_TO_SINK)
+ #endif /* ! GCC_PARAMS_H */
+
+=== added file 'gcc/testsuite/gcc.dg/vect/vect-cselim-1.c'
+--- old/gcc/testsuite/gcc.dg/vect/vect-cselim-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect-cselim-1.c	2011-03-27 09:38:18 +0000
+@@ -0,0 +1,86 @@
++/* { dg-require-effective-target vect_int } */
++
++#include <stdarg.h>
++#include "tree-vect.h"
++
++#define N 50
++
++typedef struct {
++  short a;
++  short b;
++} data;
++
++data in1[N], in2[N], out[N];
++short result[N*2] = {7,-7,9,-6,11,-5,13,-4,15,-3,17,-2,19,-1,21,0,23,1,25,2,27,3,29,4,31,5,33,6,35,7,37,8,39,9,41,10,43,11,45,12,47,13,49,14,51,15,53,16,55,17,57,18,59,19,61,20,63,21,65,22,67,23,69,24,71,25,73,26,75,27,77,28,79,29,81,30,83,31,85,32,87,33,89,34,91,35,93,36,95,37,97,38,99,39,101,40,103,41,105,42};
++short out1[N], out2[N];
++
++__attribute__ ((noinline)) void
++foo ()
++{
++  int i;
++  short c, d;
++
++  /* Vectorizable with conditional store sinking.  */
++  for (i = 0; i < N; i++)
++    {
++      c = in1[i].b;
++      d = in2[i].b;
++
++      if (c >= d)
++        {
++          out[i].b = c;
++          out[i].a = d + 5;
++        }
++      else
++        {
++          out[i].b = d - 12;
++          out[i].a = c + d;
++        }
++    }
++
++  /* Not vectorizable.  */
++  for (i = 0; i < N; i++)
++    {
++      c = in1[i].b;
++      d = in2[i].b;
++
++      if (c >= d)
++        {
++          out1[i] = c;
++        }
++      else
++        {
++          out2[i] = c + d;
++        }
++    }
++}
++
++int
++main (void)
++{
++  int i;
++
++  check_vect ();
++
++  for (i = 0; i < N; i++)
++    {
++      in1[i].a = i;
++      in1[i].b = i + 2;
++      in2[i].a = 5;
++      in2[i].b = i + 5;
++      __asm__ volatile ("");
++    }
++
++  foo ();
++
++  for (i = 0; i < N; i++)
++    {
++      if (out[i].a != result[2*i] || out[i].b != result[2*i+1])
++        abort ();
++    }
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 1 "vect"  { xfail { vect_no_align || {! vect_strided } } } } } */
++/* { dg-final { cleanup-tree-dump "vect" } } */
+
+=== added file 'gcc/testsuite/gcc.dg/vect/vect-cselim-2.c'
+--- old/gcc/testsuite/gcc.dg/vect/vect-cselim-2.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect-cselim-2.c	2011-03-27 09:38:18 +0000
+@@ -0,0 +1,65 @@
++/* { dg-require-effective-target vect_int } */
++
++#include <stdarg.h>
++#include "tree-vect.h"
++
++#define N 50
++
++int a[N], b[N], in1[N], in2[N];
++int result[2*N] = {5,-7,7,-6,9,-5,11,-4,13,-3,15,-2,17,-1,19,0,21,1,23,2,25,3,27,4,29,5,31,6,33,7,35,8,37,9,39,10,41,11,43,12,45,13,47,14,49,15,51,16,53,17,55,18,57,19,59,20,61,21,63,22,65,23,67,24,69,25,71,26,73,27,75,28,77,29,79,30,81,31,83,32,85,33,87,34,89,35,91,36,93,37,95,38,97,39,99,40,101,41,103,42};
++
++__attribute__ ((noinline)) void
++foo (int *pa, int *pb)
++{
++  int i;
++  int c, d;
++
++  /* Store sinking should not work here since the pointers may alias.  */
++  for (i = 0; i < N; i++)
++    {
++      c = in1[i];
++      d = in2[i];
++
++      if (c >= d)
++        {
++          *pa = c;
++          *pb = d + 5;
++        }
++      else
++        {
++          *pb = d - 12;
++          *pa = c + d;
++        }
++
++      pa++;
++      pb++;
++    }
++}
++
++int
++main (void)
++{
++  int i;
++
++  check_vect ();
++
++  for (i = 0; i < N; i++)
++    {
++      in1[i] = i;
++      in2[i] = i + 5;
++      __asm__ volatile ("");
++    }
++
++  foo (a, b);
++
++  for (i = 0; i < N; i++)
++    {
++      if (a[i] != result[2*i] || b[i] != result[2*i+1])
++        abort ();
++    }
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 0 "vect"  } } */
++/* { dg-final { cleanup-tree-dump "vect" } } */
+
+=== modified file 'gcc/tree-data-ref.c'
+--- old/gcc/tree-data-ref.c	2011-02-05 01:39:20 +0000
++++ new/gcc/tree-data-ref.c	2011-03-27 09:38:18 +0000
+@@ -991,6 +991,48 @@
+   return dr;
+ }
+ 
++/* Check if OFFSET1 and OFFSET2 (DR_OFFSETs of some data-refs) are identical
++   expressions.  */
++static bool
++dr_equal_offsets_p1 (tree offset1, tree offset2)
++{
++  bool res;
++
++  STRIP_NOPS (offset1);
++  STRIP_NOPS (offset2);
++
++  if (offset1 == offset2)
++    return true;
++
++  if (TREE_CODE (offset1) != TREE_CODE (offset2)
++      || (!BINARY_CLASS_P (offset1) && !UNARY_CLASS_P (offset1)))
++    return false;
++
++  res = dr_equal_offsets_p1 (TREE_OPERAND (offset1, 0),
++                             TREE_OPERAND (offset2, 0));
++
++  if (!res || !BINARY_CLASS_P (offset1))
++    return res;
++
++  res = dr_equal_offsets_p1 (TREE_OPERAND (offset1, 1),
++                             TREE_OPERAND (offset2, 1));
++
++  return res;
++}
++
++/* Check if DRA and DRB have equal offsets.  */
++bool
++dr_equal_offsets_p (struct data_reference *dra,
++                    struct data_reference *drb)
++{
++  tree offset1, offset2;
++
++  offset1 = DR_OFFSET (dra);
++  offset2 = DR_OFFSET (drb);
++
++  return dr_equal_offsets_p1 (offset1, offset2);
++}
++
+ /* Returns true if FNA == FNB.  */
+ 
+ static bool
+@@ -4294,7 +4336,7 @@
+    DATAREFS.  Returns chrec_dont_know when failing to analyze a
+    difficult case, returns NULL_TREE otherwise.  */
+ 
+-static tree
++tree
+ find_data_references_in_bb (struct loop *loop, basic_block bb,
+                             VEC (data_reference_p, heap) **datarefs)
+ {
+
+=== modified file 'gcc/tree-data-ref.h'
+--- old/gcc/tree-data-ref.h	2011-01-25 21:24:23 +0000
++++ new/gcc/tree-data-ref.h	2011-03-27 09:38:18 +0000
+@@ -426,10 +426,14 @@
+ extern void compute_all_dependences (VEC (data_reference_p, heap) *,
+ 				     VEC (ddr_p, heap) **, VEC (loop_p, heap) *,
+ 				     bool);
++extern tree find_data_references_in_bb (struct loop *, basic_block,
++                                        VEC (data_reference_p, heap) **);
+ 
+ extern void create_rdg_vertices (struct graph *, VEC (gimple, heap) *);
+ extern bool dr_may_alias_p (const struct data_reference *,
+ 			    const struct data_reference *);
++extern bool dr_equal_offsets_p (struct data_reference *,
++                                struct data_reference *);
+ 
+ 
+ /* Return true when the base objects of data references A and B are
+
+=== modified file 'gcc/tree-ssa-phiopt.c'
+--- old/gcc/tree-ssa-phiopt.c	2010-11-03 15:18:50 +0000
++++ new/gcc/tree-ssa-phiopt.c	2011-03-27 09:38:18 +0000
+@@ -34,6 +34,8 @@
+ #include "langhooks.h"
+ #include "pointer-set.h"
+ #include "domwalk.h"
++#include "cfgloop.h"
++#include "tree-data-ref.h"
+ 
+ static unsigned int tree_ssa_phiopt (void);
+ static unsigned int tree_ssa_phiopt_worker (bool);
+@@ -1292,35 +1294,18 @@
+   return true;
+ }
+ 
+-/* Do the main work of conditional store replacement.  We already know
+-   that the recognized pattern looks like so:
+-
+-   split:
+-     if (cond) goto THEN_BB; else goto ELSE_BB (edge E1)
+-   THEN_BB:
+-     X = Y;
+-     goto JOIN_BB;
+-   ELSE_BB:
+-     X = Z;
+-     fallthrough (edge E0)
+-   JOIN_BB:
+-     some more
+-
+-   We check that THEN_BB and ELSE_BB contain only one store
+-   that the stores have a "simple" RHS.  */
++/* Do the main work of conditional store replacement.  */
+ 
+ static bool
+-cond_if_else_store_replacement (basic_block then_bb, basic_block else_bb,
+-				basic_block join_bb)
++cond_if_else_store_replacement_1 (basic_block then_bb, basic_block else_bb,
++				  basic_block join_bb, gimple then_assign,
++				  gimple else_assign)
+ {
+-  gimple then_assign = last_and_only_stmt (then_bb);
+-  gimple else_assign = last_and_only_stmt (else_bb);
+   tree lhs_base, lhs, then_rhs, else_rhs;
+   source_location then_locus, else_locus;
+   gimple_stmt_iterator gsi;
+   gimple newphi, new_stmt;
+ 
+-  /* Check if then_bb and else_bb contain only one store each.  */
+   if (then_assign == NULL
+       || !gimple_assign_single_p (then_assign)
+       || else_assign == NULL
+@@ -1385,6 +1370,190 @@
+   return true;
+ }
+ 
++/* Conditional store replacement.  We already know
++   that the recognized pattern looks like so:
++
++   split:
++     if (cond) goto THEN_BB; else goto ELSE_BB (edge E1)
++   THEN_BB:
++     ...
++     X = Y;
++     ...
++     goto JOIN_BB;
++   ELSE_BB:
++     ...
++     X = Z;
++     ...
++     fallthrough (edge E0)
++   JOIN_BB:
++     some more
++
++   We check that it is safe to sink the store to JOIN_BB by verifying that
++   there are no read-after-write or write-after-write dependencies in
++   THEN_BB and ELSE_BB.  */
++
++static bool
++cond_if_else_store_replacement (basic_block then_bb, basic_block else_bb,
++                                basic_block join_bb)
++{
++  gimple then_assign = last_and_only_stmt (then_bb);
++  gimple else_assign = last_and_only_stmt (else_bb);
++  VEC (data_reference_p, heap) *then_datarefs, *else_datarefs;
++  VEC (ddr_p, heap) *then_ddrs, *else_ddrs;
++  gimple then_store, else_store;
++  bool found, ok = false, res;
++  struct data_dependence_relation *ddr;
++  data_reference_p then_dr, else_dr;
++  int i, j;
++  tree then_lhs, else_lhs;
++  VEC (gimple, heap) *then_stores, *else_stores;
++  basic_block blocks[3];
++
++  if (MAX_STORES_TO_SINK == 0)
++    return false;
++
++  /* Handle the case with single statement in THEN_BB and ELSE_BB.  */
++  if (then_assign && else_assign)
++    return cond_if_else_store_replacement_1 (then_bb, else_bb, join_bb,
++                                             then_assign, else_assign);
++
++  /* Find data references.  */
++  then_datarefs = VEC_alloc (data_reference_p, heap, 1);
++  else_datarefs = VEC_alloc (data_reference_p, heap, 1);
++  if ((find_data_references_in_bb (NULL, then_bb, &then_datarefs)
++        == chrec_dont_know)
++      || !VEC_length (data_reference_p, then_datarefs)
++      || (find_data_references_in_bb (NULL, else_bb, &else_datarefs)
++        == chrec_dont_know)
++      || !VEC_length (data_reference_p, else_datarefs))
++    {
++      free_data_refs (then_datarefs);
++      free_data_refs (else_datarefs);
++      return false;
++    }
++
++  /* Find pairs of stores with equal LHS.  */
++  then_stores = VEC_alloc (gimple, heap, 1);
++  else_stores = VEC_alloc (gimple, heap, 1);
++  FOR_EACH_VEC_ELT (data_reference_p, then_datarefs, i, then_dr)
++    {
++      if (DR_IS_READ (then_dr))
++        continue;
++
++      then_store = DR_STMT (then_dr);
++      then_lhs = gimple_assign_lhs (then_store);
++      found = false;
++
++      FOR_EACH_VEC_ELT (data_reference_p, else_datarefs, j, else_dr)
++        {
++          if (DR_IS_READ (else_dr))
++            continue;
++
++          else_store = DR_STMT (else_dr);
++          else_lhs = gimple_assign_lhs (else_store);
++
++          if (operand_equal_p (then_lhs, else_lhs, 0))
++            {
++              found = true;
++              break;
++            }
++        }
++
++      if (!found)
++        continue;
++
++      VEC_safe_push (gimple, heap, then_stores, then_store);
++      VEC_safe_push (gimple, heap, else_stores, else_store);
++    }
++
++  /* No pairs of stores found.  */
++  if (!VEC_length (gimple, then_stores)
++      || VEC_length (gimple, then_stores) > (unsigned) MAX_STORES_TO_SINK)
++    {
++      free_data_refs (then_datarefs);
++      free_data_refs (else_datarefs);
++      VEC_free (gimple, heap, then_stores);
++      VEC_free (gimple, heap, else_stores);
++      return false;
++    }
++
++  /* Compute and check data dependencies in both basic blocks.  */
++  then_ddrs = VEC_alloc (ddr_p, heap, 1);
++  else_ddrs = VEC_alloc (ddr_p, heap, 1);
++  compute_all_dependences (then_datarefs, &then_ddrs, NULL, false);
++  compute_all_dependences (else_datarefs, &else_ddrs, NULL, false);
++  blocks[0] = then_bb;
++  blocks[1] = else_bb;
++  blocks[2] = join_bb;
++  renumber_gimple_stmt_uids_in_blocks (blocks, 3);
++
++  /* Check that there are no read-after-write or write-after-write dependencies
++     in THEN_BB.  */
++  FOR_EACH_VEC_ELT (ddr_p, then_ddrs, i, ddr)
++    {
++      struct data_reference *dra = DDR_A (ddr);
++      struct data_reference *drb = DDR_B (ddr);
++
++      if (DDR_ARE_DEPENDENT (ddr) != chrec_known
++          && ((DR_IS_READ (dra) && DR_IS_WRITE (drb)
++               && gimple_uid (DR_STMT (dra)) > gimple_uid (DR_STMT (drb)))
++              || (DR_IS_READ (drb) && DR_IS_WRITE (dra)
++                  && gimple_uid (DR_STMT (drb)) > gimple_uid (DR_STMT (dra)))
++              || (DR_IS_WRITE (dra) && DR_IS_WRITE (drb))))
++        {
++          free_dependence_relations (then_ddrs);
++          free_dependence_relations (else_ddrs);
++          free_data_refs (then_datarefs);
++          free_data_refs (else_datarefs);
++          VEC_free (gimple, heap, then_stores);
++          VEC_free (gimple, heap, else_stores);
++          return false;
++        }
++    }
++
++  /* Check that there are no read-after-write or write-after-write dependencies
++     in ELSE_BB.  */
++  FOR_EACH_VEC_ELT (ddr_p, else_ddrs, i, ddr)
++    {
++      struct data_reference *dra = DDR_A (ddr);
++      struct data_reference *drb = DDR_B (ddr);
++
++      if (DDR_ARE_DEPENDENT (ddr) != chrec_known
++          && ((DR_IS_READ (dra) && DR_IS_WRITE (drb)
++               && gimple_uid (DR_STMT (dra)) > gimple_uid (DR_STMT (drb)))
++              || (DR_IS_READ (drb) && DR_IS_WRITE (dra)
++                  && gimple_uid (DR_STMT (drb)) > gimple_uid (DR_STMT (dra)))
++              || (DR_IS_WRITE (dra) && DR_IS_WRITE (drb))))
++        {
++          free_dependence_relations (then_ddrs);
++          free_dependence_relations (else_ddrs);
++          free_data_refs (then_datarefs);
++          free_data_refs (else_datarefs);
++          VEC_free (gimple, heap, then_stores);
++          VEC_free (gimple, heap, else_stores);
++          return false;
++        }
++    }
++
++  /* Sink stores with same LHS.  */
++  FOR_EACH_VEC_ELT (gimple, then_stores, i, then_store)
++    {
++      else_store = VEC_index (gimple, else_stores, i);
++      res = cond_if_else_store_replacement_1 (then_bb, else_bb, join_bb,
++                                              then_store, else_store);
++      ok = ok || res;
++    }
++
++  free_dependence_relations (then_ddrs);
++  free_dependence_relations (else_ddrs);
++  free_data_refs (then_datarefs);
++  free_data_refs (else_datarefs);
++  VEC_free (gimple, heap, then_stores);
++  VEC_free (gimple, heap, else_stores);
++
++  return ok;
++}
++
+ /* Always do these optimizations if we have SSA
+    trees to work on.  */
+ static bool
+
+=== modified file 'gcc/tree-vect-data-refs.c'
+--- old/gcc/tree-vect-data-refs.c	2011-02-25 11:18:14 +0000
++++ new/gcc/tree-vect-data-refs.c	2011-03-27 09:38:18 +0000
+@@ -289,39 +289,6 @@
+     }
+ }
+ 
+-
+-/* Function vect_equal_offsets.
+-
+-   Check if OFFSET1 and OFFSET2 are identical expressions.  */
+-
+-static bool
+-vect_equal_offsets (tree offset1, tree offset2)
+-{
+-  bool res;
+-
+-  STRIP_NOPS (offset1);
+-  STRIP_NOPS (offset2);
+-
+-  if (offset1 == offset2)
+-    return true;
+-
+-  if (TREE_CODE (offset1) != TREE_CODE (offset2)
+-      || (!BINARY_CLASS_P (offset1) && !UNARY_CLASS_P (offset1)))
+-    return false;
+-
+-  res = vect_equal_offsets (TREE_OPERAND (offset1, 0),
+-			    TREE_OPERAND (offset2, 0));
+-
+-  if (!res || !BINARY_CLASS_P (offset1))
+-    return res;
+-
+-  res = vect_equal_offsets (TREE_OPERAND (offset1, 1),
+-			    TREE_OPERAND (offset2, 1));
+-
+-  return res;
+-}
+-
+-
+ /* Check dependence between DRA and DRB for basic block vectorization.
+    If the accesses share same bases and offsets, we can compare their initial
+    constant offsets to decide whether they differ or not.  In case of a read-
+@@ -352,7 +319,7 @@
+            || TREE_CODE (DR_BASE_ADDRESS (drb)) != ADDR_EXPR
+            || TREE_OPERAND (DR_BASE_ADDRESS (dra), 0)
+            != TREE_OPERAND (DR_BASE_ADDRESS (drb),0)))
+-      || !vect_equal_offsets (DR_OFFSET (dra), DR_OFFSET (drb)))
++      || !dr_equal_offsets_p (dra, drb))
+     return true;
+ 
+   /* Check the types.  */
+@@ -402,7 +369,7 @@
+ 	   || TREE_CODE (DR_BASE_ADDRESS (drb)) != ADDR_EXPR
+ 	   || TREE_OPERAND (DR_BASE_ADDRESS (dra), 0)
+ 	   != TREE_OPERAND (DR_BASE_ADDRESS (drb),0)))
+-      || !vect_equal_offsets (DR_OFFSET (dra), DR_OFFSET (drb))
++      || !dr_equal_offsets_p (dra, drb)
+       || !tree_int_cst_compare (DR_INIT (dra), DR_INIT (drb))
+       || DR_IS_READ (dra) != DR_IS_READ (drb))
+     return false;
+
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106737.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106737.patch
new file mode 100644
index 0000000..6cc9f02
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106737.patch
@@ -0,0 +1,128 @@
+Upstream-Status: Inappropriate [Linaro patch]
+
+2011-04-21  Andrew Stubbs  <ams@codesourcery.com>
+
+	Backport from FSF:
+
+	2008-12-03  Daniel Jacobowitz  <dan@codesourcery.com>
+
+	gcc/testsuite/
+	* gcc.dg/vect/vect-shift-3.c, gcc.dg/vect/vect-shift-4.c: New.
+	* lib/target-supports.exp (check_effective_target_vect_shift_char): New
+	function.
+
+=== added file 'gcc/testsuite/gcc.dg/vect/vect-shift-3.c'
+--- old/gcc/testsuite/gcc.dg/vect/vect-shift-3.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect-shift-3.c	2011-04-21 13:51:06 +0000
+@@ -0,0 +1,37 @@
++/* { dg-require-effective-target vect_shift } */
++/* { dg-require-effective-target vect_int } */
++
++#include "tree-vect.h"
++
++#define N 32
++
++unsigned short dst[N] __attribute__((aligned(N)));
++unsigned short src[N] __attribute__((aligned(N)));
++
++__attribute__ ((noinline))
++void array_shift(void)
++{
++  int i;
++  for (i = 0; i < N; i++)
++    dst[i] = src[i] >> 3;
++}
++
++int main()
++{
++  volatile int i;
++  check_vect ();
++
++  for (i = 0; i < N; i++)
++    src[i] = i << 3;
++
++  array_shift ();
++
++  for (i = 0; i < N; i++)
++    if (dst[i] != i)
++      abort ();
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 1 "vect" } } */
++/* { dg-final { cleanup-tree-dump "vect" } } */
+
+=== added file 'gcc/testsuite/gcc.dg/vect/vect-shift-4.c'
+--- old/gcc/testsuite/gcc.dg/vect/vect-shift-4.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect-shift-4.c	2011-04-21 13:51:06 +0000
+@@ -0,0 +1,37 @@
++/* { dg-require-effective-target vect_shift_char } */
++/* { dg-require-effective-target vect_int } */
++
++#include "tree-vect.h"
++
++#define N 32
++
++unsigned char dst[N] __attribute__((aligned(N)));
++unsigned char src[N] __attribute__((aligned(N)));
++
++__attribute__ ((noinline))
++void array_shift(void)
++{
++  int i;
++  for (i = 0; i < N; i++)
++    dst[i] = src[i] >> 3;
++}
++
++int main()
++{
++  volatile int i;
++  check_vect ();
++
++  for (i = 0; i < N; i++)
++    src[i] = i << 3;
++
++  array_shift ();
++
++  for (i = 0; i < N; i++)
++    if (dst[i] != i)
++      abort ();
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 1 "vect" } } */
++/* { dg-final { cleanup-tree-dump "vect" } } */
+
+=== modified file 'gcc/testsuite/lib/target-supports.exp'
+--- old/gcc/testsuite/lib/target-supports.exp	2011-02-19 15:31:15 +0000
++++ new/gcc/testsuite/lib/target-supports.exp	2011-04-21 13:51:06 +0000
+@@ -2308,6 +2308,26 @@
+ }
+ 
+ 
++# Return 1 if the target supports hardware vector shift operation for char.
++
++proc check_effective_target_vect_shift_char { } {
++    global et_vect_shift_char_saved
++
++    if [info exists et_vect_shift_char_saved] {
++	verbose "check_effective_target_vect_shift_char: using cached result" 2
++    } else {
++	set et_vect_shift_char_saved 0
++	if { ([istarget powerpc*-*-*]
++             && ![istarget powerpc-*-linux*paired*])
++	     || [check_effective_target_arm32] } {
++	   set et_vect_shift_char_saved 1
++	}
++    }
++
++    verbose "check_effective_target_vect_shift_char: returning $et_vect_shift_char_saved" 2
++    return $et_vect_shift_char_saved
++}
++
+ # Return 1 if the target supports hardware vectors of long, 0 otherwise.
+ #
+ # This can change for different subtargets so do not cache the result.
+
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106738.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106738.patch
new file mode 100644
index 0000000..d03e6b2
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106738.patch
@@ -0,0 +1,179 @@
+Upstream-Status: Inappropriate [Linaro patch]
+
+2011-04-27  Ira Rosen  <ira.rosen@linaro.org>
+
+	Backport from FSF:
+
+	2011-04-03  Richard Guenther  <rguenther@suse.de>
+		    Ira Rosen  <ira.rosen@linaro.org>
+
+	gcc/
+	* tree-if-conv.c (memrefs_read_or_written_unconditionally): Strip all
+	non-variable offsets and compare the remaining bases of the two
+	accesses instead of looking for exact same data-ref.
+
+	gcc/testsuite/
+	* gcc.dg/vect/if-cvt-stores-vect-ifcvt-18.c: New test.
+	* gcc.dg/vect/vect.exp: Run if-cvt-stores-vect* tests with
+	-ftree-loop-if-convert-stores.
+
+=== added file 'gcc/testsuite/gcc.dg/vect/if-cvt-stores-vect-ifcvt-18.c'
+--- old/gcc/testsuite/gcc.dg/vect/if-cvt-stores-vect-ifcvt-18.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/if-cvt-stores-vect-ifcvt-18.c	2011-04-24 07:45:49 +0000
+@@ -0,0 +1,69 @@
++/* { dg-require-effective-target vect_int } */
++
++#include <stdarg.h>
++#include "tree-vect.h"
++
++#define N 50
++
++typedef struct {
++  short a;
++  short b;
++} data;
++
++data in1[N], in2[N], out[N];
++short result[N*2] = {10,-7,11,-6,12,-5,13,-4,14,-3,15,-2,16,-1,17,0,18,1,19,2,20,3,21,4,22,5,23,6,24,7,25,8,26,9,27,10,28,11,29,12,30,13,31,14,32,15,33,16,34,17,35,18,36,19,37,20,38,21,39,22,40,23,41,24,42,25,43,26,44,27,45,28,46,29,47,30,48,31,49,32,50,33,51,34,52,35,53,36,54,37,55,38,56,39,57,40,58,41,59,42};
++short out1[N], out2[N];
++
++__attribute__ ((noinline)) void
++foo ()
++{
++  int i;
++  short c, d;
++
++  for (i = 0; i < N; i++)
++    {
++      c = in1[i].b;
++      d = in2[i].b;
++
++      if (c >= d)
++        {
++          out[i].b = in1[i].a;
++          out[i].a = d + 5;
++        }
++      else
++        {
++          out[i].b = d - 12;
++          out[i].a = in2[i].a + d;
++        }
++    }
++}
++
++int
++main (void)
++{
++  int i;
++
++  check_vect ();
++
++  for (i = 0; i < N; i++)
++    {
++      in1[i].a = i;
++      in1[i].b = i + 2;
++      in2[i].a = 5;
++      in2[i].b = i + 5;
++      __asm__ volatile ("");
++    }
++
++  foo ();
++
++  for (i = 0; i < N; i++)
++    {
++      if (out[i].a != result[2*i] || out[i].b != result[2*i+1])
++        abort ();
++    }
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 1 "vect"  { xfail { vect_no_align || {! vect_strided } } } } } */
++/* { dg-final { cleanup-tree-dump "vect" } } */
+
+=== modified file 'gcc/testsuite/gcc.dg/vect/vect.exp'
+--- old/gcc/testsuite/gcc.dg/vect/vect.exp	2010-11-22 21:49:19 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect.exp	2011-04-24 07:45:49 +0000
+@@ -210,6 +210,12 @@
+ dg-runtest [lsort [glob -nocomplain $srcdir/$subdir/ggc-*.\[cS\]]]  \
+         "" $DEFAULT_VECTCFLAGS
+ 
++# -ftree-loop-if-convert-stores
++set DEFAULT_VECTCFLAGS $SAVED_DEFAULT_VECTCFLAGS
++lappend DEFAULT_VECTCFLAGS "-ftree-loop-if-convert-stores"
++dg-runtest [lsort [glob -nocomplain $srcdir/$subdir/if-cvt-stores-vect-*.\[cS\]]]  \
++        "" $DEFAULT_VECTCFLAGS
++
+ # With -O3.
+ # Don't allow IPA cloning, because it throws our counts out of whack.
+ set DEFAULT_VECTCFLAGS $SAVED_DEFAULT_VECTCFLAGS
+
+=== modified file 'gcc/tree-if-conv.c'
+--- old/gcc/tree-if-conv.c	2011-02-23 16:49:52 +0000
++++ new/gcc/tree-if-conv.c	2011-04-24 07:45:49 +0000
+@@ -464,8 +464,8 @@
+ /* Returns true when the memory references of STMT are read or written
+    unconditionally.  In other words, this function returns true when
+    for every data reference A in STMT there exist other accesses to
+-   the same data reference with predicates that add up (OR-up) to the
+-   true predicate: this ensures that the data reference A is touched
++   a data reference with the same base with predicates that add up (OR-up) to
++   the true predicate: this ensures that the data reference A is touched
+    (read or written) on every iteration of the if-converted loop.  */
+ 
+ static bool
+@@ -489,21 +489,38 @@
+ 	  continue;
+ 
+ 	for (j = 0; VEC_iterate (data_reference_p, drs, j, b); j++)
+-	  if (DR_STMT (b) != stmt
+-	      && same_data_refs (a, b))
+-	    {
+-	      tree cb = bb_predicate (gimple_bb (DR_STMT (b)));
+-
+-	      if (DR_RW_UNCONDITIONALLY (b) == 1
+-		  || is_true_predicate (cb)
+-		  || is_true_predicate (ca = fold_or_predicates (EXPR_LOCATION (cb),
+-								 ca, cb)))
+-		{
+-		  DR_RW_UNCONDITIONALLY (a) = 1;
+-		  DR_RW_UNCONDITIONALLY (b) = 1;
+-		  found = true;
+-		  break;
+-		}
++          {
++            tree ref_base_a = DR_REF (a);
++            tree ref_base_b = DR_REF (b);
++
++            if (DR_STMT (b) == stmt)
++              continue;
++
++            while (TREE_CODE (ref_base_a) == COMPONENT_REF
++                   || TREE_CODE (ref_base_a) == IMAGPART_EXPR
++                   || TREE_CODE (ref_base_a) == REALPART_EXPR)
++              ref_base_a = TREE_OPERAND (ref_base_a, 0);
++
++            while (TREE_CODE (ref_base_b) == COMPONENT_REF
++                   || TREE_CODE (ref_base_b) == IMAGPART_EXPR
++                   || TREE_CODE (ref_base_b) == REALPART_EXPR)
++              ref_base_b = TREE_OPERAND (ref_base_b, 0);
++
++  	    if (!operand_equal_p (ref_base_a, ref_base_b, 0))
++	      {
++	        tree cb = bb_predicate (gimple_bb (DR_STMT (b)));
++
++	        if (DR_RW_UNCONDITIONALLY (b) == 1
++		    || is_true_predicate (cb)
++		    || is_true_predicate (ca
++                        = fold_or_predicates (EXPR_LOCATION (cb), ca, cb)))
++		  {
++		    DR_RW_UNCONDITIONALLY (a) = 1;
++  		    DR_RW_UNCONDITIONALLY (b) = 1;
++		    found = true;
++		    break;
++		  }
++               }
+ 	    }
+ 
+ 	if (!found)
+
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/optional_libstdc.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/optional_libstdc.patch
index f132fbf..d4c7631 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/optional_libstdc.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/optional_libstdc.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 gcc-runtime builds libstdc++ separately from gcc-cross-*. Its configure tests using g++ 
 will not run correctly since by default the linker will try to link against libstdc++
 which shouldn't exist yet. We need an option to disable -lstdc++
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/pr35942.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/pr35942.patch
index da610f5..5666367 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/pr35942.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/pr35942.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 Fix PR 35942: remove -lstdc++ from libtool postdeps for CXX.
 
 libstdc++-v3/ChangeLog:
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/zecke-xgcc-cpp.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/zecke-xgcc-cpp.patch
index b3f02dc..7f49bb3 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0/zecke-xgcc-cpp.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/zecke-xgcc-cpp.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Inappropriate [embedded specific]
 upstream: n/a
 comment: Use the preprocessor we have just compiled instead the one of
 the system. There might be incompabilities between us and them.
diff --git a/meta/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc b/meta/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
new file mode 100644
index 0000000..3160e35
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
@@ -0,0 +1,9 @@
+GCC-4_6-BRANCH-LINARO-BACKPORTS = " \
+file://linaro/gcc-4.6-linaro-r106720.patch \
+file://linaro/gcc-4.6-linaro-r106723.patch \
+file://linaro/gcc-4.6-linaro-r106729.patch \
+file://linaro/gcc-4.6-linaro-r106731.patch \
+file://linaro/gcc-4.6-linaro-r106733.patch \
+file://linaro/gcc-4.6-linaro-r106737.patch \
+file://linaro/gcc-4.6-linaro-r106738.patch \
+"
-- 
1.7.3.4



