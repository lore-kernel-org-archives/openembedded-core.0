Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QJuKY-0003KT-3W
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 23:19:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 May 2011 14:16:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,347,1301900400"; d="scan'208";a="640907854"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by orsmga002.jf.intel.com with ESMTP; 10 May 2011 14:16:10 -0700
Message-Id: <cover.1305062026.git.nitin.a.kamble@intel.com>
Old-Date: Tue, 10 May 2011 14:13:46 -0700
Date: Tue, 10 May 2011 14:16:10 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 00/16] fixes related to gcc 4.6.0 & patch upstream-status fields
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
X-List-Received-Date: Tue, 10 May 2011 21:19:01 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: nitin/misc
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Thanks,
    Nitin A Kamble <nitin.a.kamble@intel.com>
---


Khem Raj (1):
  gcc-4.6.0: Apply linaro patches

Nitin A Kamble (15):
  mdadm: compilation fix for gcc 4.6.0
  pax: fix for compiling with gcc 4.6.0
  systemtap: fix for compilation with gcc 4.6.0
  kexec-tools: fix compiler errors with gcc 4.6.0
  libzypp: fix compilatoin with gcc 4.6.0
  libpcre: fix the Upstream-Status format
  tar: fix Upstream-Status format
  sat-solver: fix Upstream-Status format
  cpio: fix upstream-status format
  subversion: fix upstream-status format
  python-imaging: fix upstream-status format
  patch-2.5.9: fix upstream-status format
  patch-2.6.1: fix upstream-status format
  binutils: fix upstream status format
  gcc-4.5.1: fix upstream-status format

 .../binutils/binutils-2.21/110-arm-eabi-conf.patch |    2 +-
 .../binutils-2.21/binutils-2.19.1-ld-sysroot.patch |    2 +-
 .../binutils/binutils-2.21/binutils-poison.patch   |    2 +-
 .../binutils-uclibc-100-uclibc-conf.patch          |    2 +-
 .../gcc/gcc-4.5.1/100-uclibc-conf.patch            |    2 +-
 .../gcc/gcc-4.5.1/103-uclibc-conf-noupstream.patch |    2 +-
 .../gcc/gcc-4.5.1/200-uclibc-locale.patch          |    2 +-
 .../gcc/gcc-4.5.1/203-uclibc-locale-no__x.patch    |    2 +-
 .../gcc-4.5.1/204-uclibc-locale-wchar_fix.patch    |    2 +-
 .../gcc/gcc-4.5.1/205-uclibc-locale-update.patch   |    2 +-
 .../gcc/gcc-4.5.1/301-missing-execinfo_h.patch     |    2 +-
 .../gcc/gcc-4.5.1/302-c99-snprintf.patch           |    2 +-
 .../gcc/gcc-4.5.1/303-c99-complex-ugly-hack.patch  |    2 +-
 .../gcc/gcc-4.5.1/304-index_macro.patch            |    2 +-
 .../gcc-4.5.1/305-libmudflap-susv3-legacy.patch    |    2 +-
 .../gcc/gcc-4.5.1/306-libstdc++-namespace.patch    |    2 +-
 .../gcc/gcc-4.5.1/307-locale_facets.patch          |    2 +-
 .../gcc/gcc-4.5.1/602-sdk-libstdc++-includes.patch |    2 +-
 .../recipes-devtools/gcc/gcc-4.5.1/64bithack.patch |    2 +-
 .../gcc/gcc-4.5.1/740-sh-pr24836.patch             |    2 +-
 .../gcc/gcc-4.5.1/800-arm-bigendian.patch          |    2 +-
 .../gcc/gcc-4.5.1/904-flatten-switch-stmt-00.patch |    2 +-
 .../gcc/gcc-4.5.1/arm-bswapsi2.patch               |    2 +-
 .../gcc/gcc-4.5.1/arm-nolibfloat.patch             |    2 +-
 .../gcc/gcc-4.5.1/arm-softfloat.patch              |    2 +-
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
 .../patch/patch-2.6.1/global-reject-file.diff      |    2 +-
 meta/recipes-devtools/patch/patch/debian.patch     |    2 +-
 .../patch/patch/global-reject-file.diff            |    2 +-
 meta/recipes-devtools/patch/patch/install.patch    |    2 +-
 .../patch/patch/unified-reject-files.diff          |    2 +-
 .../python/python-imaging/path.patch               |    2 +-
 .../subversion/disable-revision-install.patch      |    2 +-
 .../subversion/subversion/libtool2.patch           |    2 +-
 .../subversion/subversion/neon-detection.patch     |    2 +-
 .../cpio/cpio-2.8/avoid_heap_overflow.patch        |    2 +-
 .../libzypp/fix_for_compile_wth_gcc-4.6.0.patch    |   22 +
 meta/recipes-extended/libzypp/libzypp_git.bb       |    3 +-
 .../mdadm/fix_for_compilation_with_gcc-4.6.0.patch |  174 ++++++
 meta/recipes-extended/mdadm/mdadm_3.2.1.bb         |    5 +-
 .../pax/pax/fix_for_compile_with_gcc-4.6.0.patch   |   25 +
 meta/recipes-extended/pax/pax_3.4.bb               |    5 +-
 .../sat-solver/fix_gcc-4.6.0_compile_issue.patch   |    2 +-
 .../tar/tar-1.17/avoid_heap_overflow.patch         |    2 +-
 .../fix_for_compiling_with_gcc-4.6.0.patch         |   40 ++
 meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb     |    3 +-
 .../fix_for_compilation_with_gcc-4.6.0.patch       |  119 ++++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    3 +-
 .../libpcre/files/fix-pcre-name-collision.patch    |    2 +-
 .../recipes-support/libpcre/files/pcre-cross.patch |    2 +-
 256 files changed, 1893 insertions(+), 47 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106720.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106723.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106729.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106731.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106733.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106737.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106738.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
 create mode 100644 meta/recipes-extended/libzypp/libzypp/fix_for_compile_wth_gcc-4.6.0.patch
 create mode 100644 meta/recipes-extended/mdadm/mdadm/fix_for_compilation_with_gcc-4.6.0.patch
 create mode 100644 meta/recipes-extended/pax/pax/fix_for_compile_with_gcc-4.6.0.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/fix_for_compiling_with_gcc-4.6.0.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/fix_for_compilation_with_gcc-4.6.0.patch

-- 
1.7.3.4



