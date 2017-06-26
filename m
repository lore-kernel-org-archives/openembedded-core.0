Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E19D277BBE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 14:54:58 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5QEsue4000935
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 26 Jun 2017 15:54:57 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dPVPk-00026w-2I; Mon, 26 Jun 2017 15:54:56 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jun 2017 15:54:54 +0100
Message-Id: <1498488894-8076-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 26 Jun 2017 15:54:57 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] meta: Add/fix missing Upstream-Status to patches
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
X-List-Received-Date: Mon, 26 Jun 2017 14:55:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This adds or fixes the Upstream-Status for all remaining patches missing it
in OE-Core.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../openssl/openssl/debian/version-script.patch                   | 3 +++
 .../recipes-connectivity/openssl/openssl/debian1.0.2/soname.patch | 2 ++
 .../openssl/openssl/debian1.0.2/version-script.patch              | 2 ++
 .../glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch | 1 +
 .../glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch  | 1 +
 .../defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch    | 1 +
 .../ovmf/ovmf/0002-ovmf-update-path-to-native-BaseTools.patch     | 1 +
 ...0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch | 1 +
 meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch    | 1 +
 .../systemd/systemd/0017-remove-duplicate-include-uchar.h.patch   | 1 +
 .../systemd/systemd/0018-check-for-uchar.h-in-configure.patch     | 1 +
 ...port-233-don-t-use-the-unified-hierarchy-for-the-systemd.patch | 2 ++
 meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch             | 2 ++
 .../gcc/gcc-7.1/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 1 +
 meta/recipes-devtools/libtool/libtool/nohardcodepaths.patch       | 2 ++
 .../recipes-devtools/perl/perl/debian/cpan-missing-site-dirs.diff | 1 +
 meta/recipes-devtools/perl/perl/debian/cpan_definstalldirs.diff   | 1 +
 meta/recipes-devtools/perl/perl/debian/db_file_ver.diff           | 1 +
 meta/recipes-devtools/perl/perl/debian/deprecate-with-apt.diff    | 1 +
 meta/recipes-devtools/perl/perl/debian/doc_info.diff              | 1 +
 meta/recipes-devtools/perl/perl/debian/enc2xs_inc.diff            | 1 +
 meta/recipes-devtools/perl/perl/debian/errno_ver.diff             | 2 +-
 .../perl/perl/debian/extutils_set_libperl_path.diff               | 1 +
 meta/recipes-devtools/perl/perl/debian/fakeroot.diff              | 1 +
 meta/recipes-devtools/perl/perl/debian/find_html2text.diff        | 1 +
 .../perl/perl/debian/fixes/document_makemaker_ccflags.diff        | 1 +
 .../perl/perl/debian/fixes/memoize_storable_nstore.diff           | 1 +
 meta/recipes-devtools/perl/perl/debian/fixes/net_smtp_docs.diff   | 1 +
 meta/recipes-devtools/perl/perl/debian/fixes/perl-Cnn.diff        | 1 +
 .../perl/perl/debian/fixes/pod_man_reproducible_date.diff         | 1 +
 .../perl/perl/debian/fixes/podman-empty-date.diff                 | 1 +
 meta/recipes-devtools/perl/perl/debian/fixes/podman-pipe.diff     | 1 +
 meta/recipes-devtools/perl/perl/debian/fixes/podman-utc-docs.diff | 1 +
 meta/recipes-devtools/perl/perl/debian/fixes/podman-utc.diff      | 1 +
 meta/recipes-devtools/perl/perl/debian/fixes/respect_umask.diff   | 1 +
 meta/recipes-devtools/perl/perl/debian/instmodsh_doc.diff         | 1 +
 meta/recipes-devtools/perl/perl/debian/ld_run_path.diff           | 1 +
 meta/recipes-devtools/perl/perl/debian/libnet_config_path.diff    | 1 +
 meta/recipes-devtools/perl/perl/debian/libperl_embed_doc.diff     | 1 +
 meta/recipes-devtools/perl/perl/debian/locale-robustness.diff     | 1 +
 meta/recipes-devtools/perl/perl/debian/makemaker-pasthru.diff     | 1 +
 meta/recipes-devtools/perl/perl/debian/makemaker_customized.diff  | 1 +
 meta/recipes-devtools/perl/perl/debian/mod_paths.diff             | 1 +
 meta/recipes-devtools/perl/perl/debian/no_packlist_perllocal.diff | 1 +
 meta/recipes-devtools/perl/perl/debian/patchlevel.diff            | 1 +
 .../perl/perl/debian/perl5db-x-terminal-emulator.patch            | 1 +
 meta/recipes-devtools/perl/perl/debian/perlivp.diff               | 1 +
 meta/recipes-devtools/perl/perl/debian/pod2man-customized.diff    | 1 +
 meta/recipes-devtools/perl/perl/debian/prefix_changes.diff        | 1 +
 meta/recipes-devtools/perl/perl/debian/prune_libs.diff            | 2 +-
 meta/recipes-devtools/perl/perl/debian/regen-skip.diff            | 1 +
 meta/recipes-devtools/perl/perl/debian/skip-kfreebsd-crash.diff   | 1 +
 .../perl/perl/debian/skip-upstream-git-tests.diff                 | 1 +
 .../perl/perl/debian/squelch-locale-warnings.diff                 | 1 +
 meta/recipes-devtools/perl/perl/debian/writable_site_dirs.diff    | 1 +
 .../ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch    | 2 ++
 meta/recipes-devtools/python/python/multilib.patch                | 2 +-
 .../python/python/use_sysroot_ncurses_instead_of_host.patch       | 1 +
 meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch           | 2 ++
 meta/recipes-devtools/ruby/ruby/extmk.patch                       | 1 +
 meta/recipes-extended/acpica/files/no-werror.patch                | 2 +-
 .../ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch  | 1 +
 .../libnsl/libnsl2/0001-include-sys-cdefs.h-explicitly.patch      | 2 +-
 .../libnsl/libnsl2/0002-Define-glibc-specific-macros.patch        | 2 +-
 meta/recipes-extended/lsb/lsbinitscripts/functions.patch          | 1 +
 ...002-Add-knob-to-control-whether-numa-support-should-be-c.patch | 1 +
 .../ltp/ltp/0003-Add-knob-to-control-tirpc-support.patch          | 1 +
 .../ltp/0004-build-Add-option-to-select-libc-implementation.patch | 1 +
 ...005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch | 1 +
 .../0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch | 1 +
 .../ltp/ltp/0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch      | 2 ++
 .../ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch          | 2 ++
 .../ltp/ltp/0018-guard-mallocopt-with-__GLIBC__.patch             | 1 +
 .../0020-getdents-define-getdents-getdents64-only-for-glibc.patch | 2 ++
 .../0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch   | 2 ++
 .../0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch    | 2 ++
 .../ltp/0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch | 2 ++
 .../ltp/ltp/0025-mc_gethost-include-sys-types.h.patch             | 2 ++
 .../ltp/ltp/0026-crash01-Define-_GNU_SOURCE.patch                 | 2 ++
 .../ltp/0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch    | 2 ++
 ...028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch | 2 ++
 ...030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch | 2 ++
 meta/recipes-extended/stress/files/texinfo.patch                  | 1 +
 meta/recipes-extended/xinetd/xinetd/xinetd-CVE-2013-4342.patch    | 1 +
 .../0001-CMake-define-GBM_BO_MAP-only-when-symbol-is-found.patch  | 1 +
 ...002-util-egl-Honour-Surfaceless-MESA-in-get_default_disp.patch | 1 +
 ...003-egl_mesa_platform_surfaceless-Don-t-use-eglGetPlatfo.patch | 1 +
 ...004-egl_mesa_platform_surfaceless-Use-EXT-functions-for-.patch | 1 +
 ...001-Prevents-omapfb-from-from-crashing-when-pixelclock-o.patch | 2 ++
 .../latencytop/latencytop-0.5/latencytop-makefile.patch           | 8 ++++++--
 ...001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch | 2 ++
 ...001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch | 2 ++
 .../recipes-support/attr/acl/test-fix-directory-permissions.patch | 2 ++
 meta/recipes-support/nss/nss/Fix-compilation-for-X32.patch        | 2 ++
 meta/recipes-support/rng-tools/rng-tools/underquote.patch         | 2 ++
 95 files changed, 126 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/debian/version-script.patch b/meta/recipes-connectivity/openssl/openssl/debian/version-script.patch
index a249180..557434f 100644
--- a/meta/recipes-connectivity/openssl/openssl/debian/version-script.patch
+++ b/meta/recipes-connectivity/openssl/openssl/debian/version-script.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate
+
 Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/Configure
 ===================================================================
 --- openssl-1.0.2~beta1.obsolete.0.0498436515490575.orig/Configure	2014-02-24 21:02:30.000000000 +0100
diff --git a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/soname.patch b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/soname.patch
index f9cdfec..09dd9ea 100644
--- a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/soname.patch
+++ b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/soname.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate
+
 Index: openssl-1.0.2d/crypto/opensslv.h
 ===================================================================
 --- openssl-1.0.2d.orig/crypto/opensslv.h
diff --git a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
index 29f11a2..e404ee3 100644
--- a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
+++ b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate
+
 Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/Configure
 ===================================================================
 --- openssl-1.0.2~beta1.obsolete.0.0498436515490575.orig/Configure	2014-02-24 21:02:30.000000000 +0100
diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
index b981f7b..0926a11 100644
--- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
+++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
@@ -10,6 +10,7 @@ It also makes the synchronization more efficient.
 Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
 ---
  sysdeps/i386/atomic-machine.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
index 6c2506c..e44be89 100644
--- a/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
+++ b/meta/recipes-core/glibc/glibc/0017-Remove-bash-dependency-for-nscd-init-script.patch
@@ -8,6 +8,7 @@ The nscd init script uses #! /bin/bash but only really uses one bashism
 
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Inappropriate
 ---
  nscd/nscd.init | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
diff --git a/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch b/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
index 8c4d953..a24b8cd 100644
--- a/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
+++ b/meta/recipes-core/ifupdown/files/defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch
@@ -12,6 +12,7 @@ arch specific methods, and the end result will be strangeness
 like the loopback device not being configured/enabled.
 
 Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
+Upstream-Status: Pending
 ---
  defn2c.pl   | 6 +++---
  defn2man.pl | 6 +++---
diff --git a/meta/recipes-core/ovmf/ovmf/0002-ovmf-update-path-to-native-BaseTools.patch b/meta/recipes-core/ovmf/ovmf/0002-ovmf-update-path-to-native-BaseTools.patch
index 94029a5..94ae5d4 100644
--- a/meta/recipes-core/ovmf/ovmf/0002-ovmf-update-path-to-native-BaseTools.patch
+++ b/meta/recipes-core/ovmf/ovmf/0002-ovmf-update-path-to-native-BaseTools.patch
@@ -10,6 +10,7 @@ tools. The BBAKE_EDK_TOOLS_PATH string is used as a pattern to be replaced
 with the appropriate location before building.
 
 Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
+Upstream-Status: Pending
 ---
  OvmfPkg/build.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch b/meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
index 1f8332e..65b5c16 100644
--- a/meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
+++ b/meta/recipes-core/ovmf/ovmf/0003-BaseTools-makefile-adjust-to-build-in-under-bitbake.patch
@@ -7,6 +7,7 @@ Prepend the build flags with those of bitbake. This is to build
 using the bitbake native sysroot include and library directories.
 
 Signed-off-by: Ricardo Neri <ricardo.neri@linux.intel.com>
+Upstream-Status: Pending
 ---
  BaseTools/Source/C/Makefiles/header.makefile | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
diff --git a/meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch b/meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch
index 25a09c5..959b1c6 100644
--- a/meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch
+++ b/meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch
@@ -4,6 +4,7 @@ Description: pass -fno-stack-protector to all GCC toolchains
  when building for i386 and amd64.  Add this essential argument to the
  generic rules for gcc 4.4 and later.
 Last-Updated: 2016-04-12
+Upstream-Status: Pending
 Index: git/BaseTools/Conf/tools_def.template
 ===================================================================
 --- git.orig/BaseTools/Conf/tools_def.template
diff --git a/meta/recipes-core/systemd/systemd/0017-remove-duplicate-include-uchar.h.patch b/meta/recipes-core/systemd/systemd/0017-remove-duplicate-include-uchar.h.patch
index 77dbd6e..d200635 100644
--- a/meta/recipes-core/systemd/systemd/0017-remove-duplicate-include-uchar.h.patch
+++ b/meta/recipes-core/systemd/systemd/0017-remove-duplicate-include-uchar.h.patch
@@ -6,6 +6,7 @@ Subject: [PATCH 17/19] remove duplicate include uchar.h
 missing.h already includes it
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
 ---
  src/basic/escape.h | 1 -
  src/basic/utf8.h   | 1 -
diff --git a/meta/recipes-core/systemd/systemd/0018-check-for-uchar.h-in-configure.patch b/meta/recipes-core/systemd/systemd/0018-check-for-uchar.h-in-configure.patch
index 5824033..548ffe0 100644
--- a/meta/recipes-core/systemd/systemd/0018-check-for-uchar.h-in-configure.patch
+++ b/meta/recipes-core/systemd/systemd/0018-check-for-uchar.h-in-configure.patch
@@ -6,6 +6,7 @@ Subject: [PATCH 18/19] check for uchar.h in configure
 Use ifdef to include uchar.h
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
 ---
  configure.ac        | 1 +
  src/basic/missing.h | 2 ++
diff --git a/meta/recipes-core/systemd/systemd/0020-back-port-233-don-t-use-the-unified-hierarchy-for-the-systemd.patch b/meta/recipes-core/systemd/systemd/0020-back-port-233-don-t-use-the-unified-hierarchy-for-the-systemd.patch
index ef2d868..e96d4d7 100644
--- a/meta/recipes-core/systemd/systemd/0020-back-port-233-don-t-use-the-unified-hierarchy-for-the-systemd.patch
+++ b/meta/recipes-core/systemd/systemd/0020-back-port-233-don-t-use-the-unified-hierarchy-for-the-systemd.patch
@@ -25,6 +25,8 @@ Too many things don't get along with the unified hierarchy yet:
 So revert the default to the legacy hierarchy for now. Developers of the above
 software can opt into the unified hierarchy with
 "systemd.legacy_systemd_cgroup_controller=0".
+
+Upstream-Status: Backport
 ---
  src/basic/cgroup-util.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
index ef1ce58..cc32dbf 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate
+
 diff --git a/tests/Makefile.in b/tests/Makefile.in
 index 60cf655..ce220f1 100644
 --- a/tests/Makefile.in
diff --git a/meta/recipes-devtools/gcc/gcc-7.1/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-7.1/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
index 522928b..e39af9b 100644
--- a/meta/recipes-devtools/gcc/gcc-7.1/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
+++ b/meta/recipes-devtools/gcc/gcc-7.1/0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
@@ -11,6 +11,7 @@ default behaviour is to assume ldbl128 it does not
 change the defaults
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
 ---
  libgcc/Makefile.in           |  1 +
  libgcc/config/rs6000/t-linux |  5 ++++-
diff --git a/meta/recipes-devtools/libtool/libtool/nohardcodepaths.patch b/meta/recipes-devtools/libtool/libtool/nohardcodepaths.patch
index b2239fb..fcbce72 100644
--- a/meta/recipes-devtools/libtool/libtool/nohardcodepaths.patch
+++ b/meta/recipes-devtools/libtool/libtool/nohardcodepaths.patch
@@ -4,6 +4,8 @@ hardcoding paths.
 
 RP 2015/2/3
 
+Upstream-Status: Inappropriate
+
 Index: libtool-2.4.5/libtoolize.in
 ===================================================================
 --- libtool-2.4.5.orig/libtoolize.in
diff --git a/meta/recipes-devtools/perl/perl/debian/cpan-missing-site-dirs.diff b/meta/recipes-devtools/perl/perl/debian/cpan-missing-site-dirs.diff
index a63b968..c597701 100644
--- a/meta/recipes-devtools/perl/perl/debian/cpan-missing-site-dirs.diff
+++ b/meta/recipes-devtools/perl/perl/debian/cpan-missing-site-dirs.diff
@@ -13,6 +13,7 @@ explicitly tell CPAN not to touch those with INSTALLDIRS=site.
 
 Bug-Debian: http://bugs.debian.org/688842
 Patch-Name: debian/cpan-missing-site-dirs.diff
+Upstream-Status: Pending
 ---
  cpan/CPAN/lib/CPAN/FirstTime.pm | 31 +++++++++++++++++++++++++++----
  1 file changed, 27 insertions(+), 4 deletions(-)
diff --git a/meta/recipes-devtools/perl/perl/debian/cpan_definstalldirs.diff b/meta/recipes-devtools/perl/perl/debian/cpan_definstalldirs.diff
index 6b52950..572f149 100644
--- a/meta/recipes-devtools/perl/perl/debian/cpan_definstalldirs.diff
+++ b/meta/recipes-devtools/perl/perl/debian/cpan_definstalldirs.diff
@@ -9,6 +9,7 @@ explicitly in Makefile.PL or Build.PL.  This makes sense for the normal @INC
 ordering, but not ours.
 
 Patch-Name: debian/cpan_definstalldirs.diff
+Upstream-Status: Pending
 ---
  cpan/CPAN/lib/CPAN/FirstTime.pm | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
diff --git a/meta/recipes-devtools/perl/perl/debian/db_file_ver.diff b/meta/recipes-devtools/perl/perl/debian/db_file_ver.diff
index 280bf11..0861650 100644
--- a/meta/recipes-devtools/perl/perl/debian/db_file_ver.diff
+++ b/meta/recipes-devtools/perl/perl/debian/db_file_ver.diff
@@ -8,6 +8,7 @@ Bug-Debian: http://bugs.debian.org/340047
 Package dependencies ensure the correct library is linked at run-time.
 
 Patch-Name: debian/db_file_ver.diff
+Upstream-Status: Pending
 ---
  cpan/DB_File/version.c | 2 ++
  1 file changed, 2 insertions(+)
diff --git a/meta/recipes-devtools/perl/perl/debian/deprecate-with-apt.diff b/meta/recipes-devtools/perl/perl/debian/deprecate-with-apt.diff
index 601ee4c..c2ac4a3 100644
--- a/meta/recipes-devtools/perl/perl/debian/deprecate-with-apt.diff
+++ b/meta/recipes-devtools/perl/perl/debian/deprecate-with-apt.diff
@@ -15,6 +15,7 @@ warnings will still be useful, so modify them slightly to point to the
 separate packages instead.
 
 Patch-Name: debian/deprecate-with-apt.diff
+Upstream-Status: Pending
 ---
  lib/deprecate.pm | 15 ++++++++++++++-
  1 file changed, 14 insertions(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/perl/perl/debian/doc_info.diff b/meta/recipes-devtools/perl/perl/debian/doc_info.diff
index fbea2ee..4662ecd 100644
--- a/meta/recipes-devtools/perl/perl/debian/doc_info.diff
+++ b/meta/recipes-devtools/perl/perl/debian/doc_info.diff
@@ -6,6 +6,7 @@ Subject: Replace generic man(1) instructions with Debian-specific information.
 Indicate that the user needs to install the perl-doc package.
 
 Patch-Name: debian/doc_info.diff
+Upstream-Status: Pending
 ---
  pod/perl.pod | 12 ++++++++++--
  1 file changed, 10 insertions(+), 2 deletions(-)
diff --git a/meta/recipes-devtools/perl/perl/debian/enc2xs_inc.diff b/meta/recipes-devtools/perl/perl/debian/enc2xs_inc.diff
index e074b20..b3bd58c 100644
--- a/meta/recipes-devtools/perl/perl/debian/enc2xs_inc.diff
+++ b/meta/recipes-devtools/perl/perl/debian/enc2xs_inc.diff
@@ -11,6 +11,7 @@ Bug-Debian: http://bugs.debian.org/290336
   issues with follow => 1 (see #603686 and [rt.cpan.org #64585])
 
 Patch-Name: debian/enc2xs_inc.diff
+Upstream-Status: Pending
 ---
  cpan/Encode/bin/enc2xs | 8 ++++----
  t/porting/customized.t | 3 +++
diff --git a/meta/recipes-devtools/perl/perl/debian/errno_ver.diff b/meta/recipes-devtools/perl/perl/debian/errno_ver.diff
index 3d09229..a965fbe 100644
--- a/meta/recipes-devtools/perl/perl/debian/errno_ver.diff
+++ b/meta/recipes-devtools/perl/perl/debian/errno_ver.diff
@@ -11,7 +11,7 @@ processes embedding perl when upgrading to a newer version,
 compatible, but built on a different machine.
 
 Patch-Name: debian/errno_ver.diff
-
+Upstream-Status: Pending
 ---
  ext/Errno/Errno_pm.PL | 5 -----
  1 file changed, 5 deletions(-)
diff --git a/meta/recipes-devtools/perl/perl/debian/extutils_set_libperl_path.diff b/meta/recipes-devtools/perl/perl/debian/extutils_set_libperl_path.diff
index adb4bd9..e023038 100644
--- a/meta/recipes-devtools/perl/perl/debian/extutils_set_libperl_path.diff
+++ b/meta/recipes-devtools/perl/perl/debian/extutils_set_libperl_path.diff
@@ -7,6 +7,7 @@ The Debian packaging moves libperl.a a couple of levels up from the
 CORE directory to match other static libraries.
 
 Patch-Name: debian/extutils_set_libperl_path.diff
+Upstream-Status: Pending
 ---
  cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 2 +-
  pp.c                                            | 2 +-
diff --git a/meta/recipes-devtools/perl/perl/debian/fakeroot.diff b/meta/recipes-devtools/perl/perl/debian/fakeroot.diff
index ec461cf..bdf34d1 100644
--- a/meta/recipes-devtools/perl/perl/debian/fakeroot.diff
+++ b/meta/recipes-devtools/perl/perl/debian/fakeroot.diff
@@ -11,6 +11,7 @@ since fakeroot (which now sets LD_LIBRARY_PATH) is not used for the "build"
 rule where the Makefile is created, but is for the clean/binary* targets.
 
 Patch-Name: debian/fakeroot.diff
+Upstream-Status: Pending
 ---
  Makefile.SH | 7 ++-----
  1 file changed, 2 insertions(+), 5 deletions(-)
diff --git a/meta/recipes-devtools/perl/perl/debian/find_html2text.diff b/meta/recipes-devtools/perl/perl/debian/find_html2text.diff
index d319e75..0827091 100644
--- a/meta/recipes-devtools/perl/perl/debian/find_html2text.diff
+++ b/meta/recipes-devtools/perl/perl/debian/find_html2text.diff
@@ -16,6 +16,7 @@ Please see the attached patch for a quick fix of this issue.
 [Maintainer's note: html2text in Debian is not the same implementation
 as the html2text.pl which is expected, but should provide similar
 functionality].
+Upstream-Status: Pending
 ---
  cpan/CPAN/lib/CPAN/Distribution.pm | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/document_makemaker_ccflags.diff b/meta/recipes-devtools/perl/perl/debian/fixes/document_makemaker_ccflags.diff
index 61a9271..f3d92583 100644
--- a/meta/recipes-devtools/perl/perl/debian/fixes/document_makemaker_ccflags.diff
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/document_makemaker_ccflags.diff
@@ -10,6 +10,7 @@ Compiling XS extensions without $Config{ccflags} can break the
 binary interface on some platforms.
 
 Patch-Name: fixes/document_makemaker_ccflags.diff
+Upstream-Status: Pending
 ---
  cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm | 4 ++++
  1 file changed, 4 insertions(+)
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/memoize_storable_nstore.diff b/meta/recipes-devtools/perl/perl/debian/fixes/memoize_storable_nstore.diff
index 525f962..d9b36f6 100644
--- a/meta/recipes-devtools/perl/perl/debian/fixes/memoize_storable_nstore.diff
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/memoize_storable_nstore.diff
@@ -47,6 +47,7 @@ Bug-Debian: http://bugs.debian.org/587650
 Bug: https://rt.cpan.org/Public/Bug/Display.html?id=77790
 Forwarded: https://rt.cpan.org/Public/Bug/Display.html?id=77790
 Patch-Name: fixes/memoize_storable_nstore.diff
+Upstream-Status: Pending
 ---
  cpan/Memoize/Memoize/Storable.pm |  2 +-
  cpan/Memoize/t/tie_storable.t    | 24 ++++++++++++++++++++----
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/net_smtp_docs.diff b/meta/recipes-devtools/perl/perl/debian/fixes/net_smtp_docs.diff
index 3c31972..afcf7fb 100644
--- a/meta/recipes-devtools/perl/perl/debian/fixes/net_smtp_docs.diff
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/net_smtp_docs.diff
@@ -7,6 +7,7 @@ Bug-Debian: http://bugs.debian.org/100195
 Bug: http://rt.cpan.org/Public/Bug/Display.html?id=36038
 
 Patch-Name: fixes/net_smtp_docs.diff
+Upstream-Status: Pending
 ---
  cpan/libnet/lib/Net/SMTP.pm | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/perl-Cnn.diff b/meta/recipes-devtools/perl/perl/debian/fixes/perl-Cnn.diff
index b5564fd..9bdf41b 100644
--- a/meta/recipes-devtools/perl/perl/debian/fixes/perl-Cnn.diff
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/perl-Cnn.diff
@@ -12,6 +12,7 @@ Bug: https://rt.perl.org/Ticket/Display.html?id=125381
 Bug-Debian: https://bugs.debian.org/788636
 Origin: upstream, http://perl5.git.perl.org/perl.git/commit/89d84ff965
 Patch-Name: fixes/perl-Cnn.diff
+Upstream-Status: Pending
 ---
  t/run/switchC.t |  7 ++++++-
  util.c          | 17 ++++++++---------
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/pod_man_reproducible_date.diff b/meta/recipes-devtools/perl/perl/debian/fixes/pod_man_reproducible_date.diff
index 7c9ca86..d23573f 100644
--- a/meta/recipes-devtools/perl/perl/debian/fixes/pod_man_reproducible_date.diff
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/pod_man_reproducible_date.diff
@@ -13,6 +13,7 @@ consistent.  Thanks, Niko Tyni.
 Bug-Debian: http://bugs.debian.org/759405
 Origin: upstream
 Patch-Name: fixes/pod_man_reproducible_date.diff
+Upstream-Status: Pending
 ---
  cpan/podlators/lib/Pod/Man.pm  | 69 +++++++++++++++++++++++++++++++-----------
  cpan/podlators/t/devise-date.t | 29 +++++++++++++-----
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/podman-empty-date.diff b/meta/recipes-devtools/perl/perl/debian/fixes/podman-empty-date.diff
index 7ebbf9c..9de29b8 100644
--- a/meta/recipes-devtools/perl/perl/debian/fixes/podman-empty-date.diff
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/podman-empty-date.diff
@@ -10,6 +10,7 @@ One may want to set this to an empty string.  Handle that correctly.
 Origin: upstream, http://git.eyrie.org/?p=perl/podlators.git;a=commitdiff;h=e0e9fcb53e8fc954b2b1955385eea18c27f869af
 Bug-Debian: https://bugs.debian.org/780259
 Patch-Name: fixes/podman-empty-date.diff
+Upstream-Status: Pending
 ---
  cpan/podlators/lib/Pod/Man.pm  | 2 +-
  cpan/podlators/t/devise-date.t | 6 +++++-
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/podman-pipe.diff b/meta/recipes-devtools/perl/perl/debian/fixes/podman-pipe.diff
index 1a60361..d8858d8 100644
--- a/meta/recipes-devtools/perl/perl/debian/fixes/podman-pipe.diff
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/podman-pipe.diff
@@ -14,6 +14,7 @@ standard input.  (Debian Bug#777405)
 Origin: upstream, http://git.eyrie.org/?p=perl/podlators.git;a=commitdiff;h=d98872e46c93861b7aba14949e1258712087dc55
 Bug-Debian: https://bugs.debian.org/777405
 Patch-Name: fixes/podman-pipe.diff
+Upstream-Status: Pending
 ---
  cpan/podlators/lib/Pod/Man.pm     | 15 +++++++++++++++
  cpan/podlators/scripts/pod2man.PL |  4 ++++
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc-docs.diff b/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc-docs.diff
index 0cdfeff..b6ae409 100644
--- a/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc-docs.diff
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc-docs.diff
@@ -12,6 +12,7 @@ entry.
 Origin: upstream, http://git.eyrie.org/?p=perl/podlators.git;a=commitdiff;h=52db93bf80e4a06f8497e4ebade0506b6ee0e70d
 Bug-Debian: https://bugs.debian.org/780259
 Patch-Name: fixes/podman-utc-docs.diff
+Upstream-Status: Pending
 ---
  cpan/podlators/lib/Pod/Man.pm     |  6 +++++-
  cpan/podlators/scripts/pod2man.PL | 11 ++++++-----
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc.diff b/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc.diff
index fbd7b9d..3fb7c20 100644
--- a/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc.diff
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc.diff
@@ -14,6 +14,7 @@ The attached patch fixes this by using GMT (~UTC) dates instead.
 Origin: upstream, http://git.eyrie.org/?p=perl/podlators.git;a=commitdiff;h=913fbb2bd2ce071e20128629302ae2852554cad4
 Bug-Debian: https://bugs.debian.org/780259
 Patch-Name: fixes/podman-utc.diff
+Upstream-Status: Pending
 ---
  cpan/podlators/lib/Pod/Man.pm | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/respect_umask.diff b/meta/recipes-devtools/perl/perl/debian/fixes/respect_umask.diff
index d1b498b..c8663f5 100644
--- a/meta/recipes-devtools/perl/perl/debian/fixes/respect_umask.diff
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/respect_umask.diff
@@ -7,6 +7,7 @@ This is needed to satisfy Debian policy regarding group-writable
 site directories.
 
 Patch-Name: fixes/respect_umask.diff
+Upstream-Status: Pending
 ---
  cpan/ExtUtils-Install/lib/ExtUtils/Install.pm   | 18 +++++++++---------
  cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 18 +++++++++---------
diff --git a/meta/recipes-devtools/perl/perl/debian/instmodsh_doc.diff b/meta/recipes-devtools/perl/perl/debian/instmodsh_doc.diff
index a62c746..7e1fd69 100644
--- a/meta/recipes-devtools/perl/perl/debian/instmodsh_doc.diff
+++ b/meta/recipes-devtools/perl/perl/debian/instmodsh_doc.diff
@@ -4,6 +4,7 @@ Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Debian policy doesn't install .packlist files for core or vendor.
 
 Patch-Name: debian/instmodsh_doc.diff
+Upstream-Status: Pending
 ---
  cpan/ExtUtils-MakeMaker/bin/instmodsh | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/perl/perl/debian/ld_run_path.diff b/meta/recipes-devtools/perl/perl/debian/ld_run_path.diff
index d80f86c..ff0b287 100644
--- a/meta/recipes-devtools/perl/perl/debian/ld_run_path.diff
+++ b/meta/recipes-devtools/perl/perl/debian/ld_run_path.diff
@@ -4,6 +4,7 @@ Date: Fri, 18 Mar 2005 22:22:25 +1100
 Subject: Remove standard libs from LD_RUN_PATH as per Debian policy.
 
 Patch-Name: debian/ld_run_path.diff
+Upstream-Status: Pending
 ---
  cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm | 3 +++
  1 file changed, 3 insertions(+)
diff --git a/meta/recipes-devtools/perl/perl/debian/libnet_config_path.diff b/meta/recipes-devtools/perl/perl/debian/libnet_config_path.diff
index 54ef964..d534742 100644
--- a/meta/recipes-devtools/perl/perl/debian/libnet_config_path.diff
+++ b/meta/recipes-devtools/perl/perl/debian/libnet_config_path.diff
@@ -5,6 +5,7 @@ Subject: Set location of libnet.cfg to /etc/perl/Net as /usr may not be
  writable.
 
 Patch-Name: debian/libnet_config_path.diff
+Upstream-Status: Pending
 ---
  cpan/libnet/lib/Net/Config.pm | 7 +++----
  1 file changed, 3 insertions(+), 4 deletions(-)
diff --git a/meta/recipes-devtools/perl/perl/debian/libperl_embed_doc.diff b/meta/recipes-devtools/perl/perl/debian/libperl_embed_doc.diff
index 76b8054..0cdc0d3 100644
--- a/meta/recipes-devtools/perl/perl/debian/libperl_embed_doc.diff
+++ b/meta/recipes-devtools/perl/perl/debian/libperl_embed_doc.diff
@@ -6,6 +6,7 @@ Subject: Note that libperl-dev package is required for embedded linking
 Bug-Debian: http://bugs.debian.org/186778
 
 Patch-Name: debian/libperl_embed_doc.diff
+Upstream-Status: Pending
 ---
  lib/ExtUtils/Embed.pm | 3 +++
  1 file changed, 3 insertions(+)
diff --git a/meta/recipes-devtools/perl/perl/debian/locale-robustness.diff b/meta/recipes-devtools/perl/perl/debian/locale-robustness.diff
index fd471ed..7cf1242 100644
--- a/meta/recipes-devtools/perl/perl/debian/locale-robustness.diff
+++ b/meta/recipes-devtools/perl/perl/debian/locale-robustness.diff
@@ -14,6 +14,7 @@ the test more robust by first clearing all the locale relevant variables.
 Bug: https://rt.perl.org/Ticket/Display.html?id=124310
 Bug-Debian: https://bugs.debian.org/782068
 Patch-Name: debian/locale-robustness.diff
+Upstream-Status: Pending
 ---
  t/run/locale.t | 7 +++----
  1 file changed, 3 insertions(+), 4 deletions(-)
diff --git a/meta/recipes-devtools/perl/perl/debian/makemaker-pasthru.diff b/meta/recipes-devtools/perl/perl/debian/makemaker-pasthru.diff
index fa0f9da..5f07180 100644
--- a/meta/recipes-devtools/perl/perl/debian/makemaker-pasthru.diff
+++ b/meta/recipes-devtools/perl/perl/debian/makemaker-pasthru.diff
@@ -11,6 +11,7 @@ the PASTHRU list fixes this.
 
 Bug-Debian: https://bugs.debian.org/758471
 Patch-Name: debian/makemaker-pasthru.diff
+Upstream-Status: Pending
 ---
  cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/perl/perl/debian/makemaker_customized.diff b/meta/recipes-devtools/perl/perl/debian/makemaker_customized.diff
index b1b4cb9..d870b60 100644
--- a/meta/recipes-devtools/perl/perl/debian/makemaker_customized.diff
+++ b/meta/recipes-devtools/perl/perl/debian/makemaker_customized.diff
@@ -4,6 +4,7 @@ Date: Sat, 23 May 2015 21:15:06 +0200
 Subject: Update t/porting/customized.dat for files patched in Debian
 
 Patch-Name: debian/makemaker_customized.diff
+Upstream-Status: Pending
 ---
  t/porting/customized.dat | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
diff --git a/meta/recipes-devtools/perl/perl/debian/mod_paths.diff b/meta/recipes-devtools/perl/perl/debian/mod_paths.diff
index ae15907..7e22484 100644
--- a/meta/recipes-devtools/perl/perl/debian/mod_paths.diff
+++ b/meta/recipes-devtools/perl/perl/debian/mod_paths.diff
@@ -17,6 +17,7 @@ The rationale being that an admin (via site), or module packager
 version than is included in core.
 
 Patch-Name: debian/mod_paths.diff
+Upstream-Status: Pending
 ---
  perl.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 58 insertions(+)
diff --git a/meta/recipes-devtools/perl/perl/debian/no_packlist_perllocal.diff b/meta/recipes-devtools/perl/perl/debian/no_packlist_perllocal.diff
index b911fd2..7484bec4 100644
--- a/meta/recipes-devtools/perl/perl/debian/no_packlist_perllocal.diff
+++ b/meta/recipes-devtools/perl/perl/debian/no_packlist_perllocal.diff
@@ -4,6 +4,7 @@ Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Don't install .packlist or perllocal.pod for perl or vendor
 
 Patch-Name: debian/no_packlist_perllocal.diff
+Upstream-Status: Pending
 ---
  cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 35 +++----------------------
  1 file changed, 3 insertions(+), 32 deletions(-)
diff --git a/meta/recipes-devtools/perl/perl/debian/patchlevel.diff b/meta/recipes-devtools/perl/perl/debian/patchlevel.diff
index 8656b02..2d05ae5 100644
--- a/meta/recipes-devtools/perl/perl/debian/patchlevel.diff
+++ b/meta/recipes-devtools/perl/perl/debian/patchlevel.diff
@@ -10,6 +10,7 @@ The list of packaged patches is in patchlevel-debian.h, which is generated
 from the debian/patches/ directory when building the package.
 
 Patch-Name: debian/patchlevel.diff
+Upstream-Status: Pending
 ---
  patchlevel.h | 3 +++
  1 file changed, 3 insertions(+)
diff --git a/meta/recipes-devtools/perl/perl/debian/perl5db-x-terminal-emulator.patch b/meta/recipes-devtools/perl/perl/debian/perl5db-x-terminal-emulator.patch
index 533952c..6f1625b 100644
--- a/meta/recipes-devtools/perl/perl/debian/perl5db-x-terminal-emulator.patch
+++ b/meta/recipes-devtools/perl/perl/debian/perl5db-x-terminal-emulator.patch
@@ -10,6 +10,7 @@ Bug-Debian: http://bugs.debian.org/668490
 Forwarded: not-needed
 
 Patch-Name: debian/perl5db-x-terminal-emulator.patch
+Upstream-Status: Pending
 ---
  lib/perl5db.pl | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/perl/perl/debian/perlivp.diff b/meta/recipes-devtools/perl/perl/debian/perlivp.diff
index 2c1eab9..5c7413b 100644
--- a/meta/recipes-devtools/perl/perl/debian/perlivp.diff
+++ b/meta/recipes-devtools/perl/perl/debian/perlivp.diff
@@ -21,6 +21,7 @@ On Sat, Jan 10, 2009 at 12:37:18AM +1100, Brendan O'Dea wrote:
 Signed-off-by: Niko Tyni <ntyni@debian.org>
 
 Patch-Name: debian/perlivp.diff
+Upstream-Status: Pending
 ---
  utils/perlivp.PL | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta/recipes-devtools/perl/perl/debian/pod2man-customized.diff b/meta/recipes-devtools/perl/perl/debian/pod2man-customized.diff
index 6270b87..4707562 100644
--- a/meta/recipes-devtools/perl/perl/debian/pod2man-customized.diff
+++ b/meta/recipes-devtools/perl/perl/debian/pod2man-customized.diff
@@ -4,6 +4,7 @@ Date: Sat, 18 Apr 2015 17:39:32 +0300
 Subject: Update porting/customized.dat for pod2man modifications
 
 Patch-Name: debian/pod2man-customized.diff
+Upstream-Status: Pending
 ---
  t/porting/customized.dat | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/perl/perl/debian/prefix_changes.diff b/meta/recipes-devtools/perl/perl/debian/prefix_changes.diff
index c41efbe..b681c3e 100644
--- a/meta/recipes-devtools/perl/perl/debian/prefix_changes.diff
+++ b/meta/recipes-devtools/perl/perl/debian/prefix_changes.diff
@@ -9,6 +9,7 @@ PREFIX= to the "make install" command (used when packaging
 modules).
 
 Patch-Name: debian/prefix_changes.diff
+Upstream-Status: Pending
 ---
  cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm  | 12 ++++++------
  cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm |  3 +--
diff --git a/meta/recipes-devtools/perl/perl/debian/prune_libs.diff b/meta/recipes-devtools/perl/perl/debian/prune_libs.diff
index d153e0e..a2ed52a 100644
--- a/meta/recipes-devtools/perl/perl/debian/prune_libs.diff
+++ b/meta/recipes-devtools/perl/perl/debian/prune_libs.diff
@@ -10,7 +10,7 @@ We want to keep the dependencies on perl-base as small as possible,
 and some of the original list may be present on buildds (see Bug#128355).
 
 Patch-Name: debian/prune_libs.diff
-
+Upstream-Status: Pending
 ---
  Configure | 5 ++---
  1 file changed, 2 insertions(+), 3 deletions(-)
diff --git a/meta/recipes-devtools/perl/perl/debian/regen-skip.diff b/meta/recipes-devtools/perl/perl/debian/regen-skip.diff
index 8a3fc99..5d9a7c4 100644
--- a/meta/recipes-devtools/perl/perl/debian/regen-skip.diff
+++ b/meta/recipes-devtools/perl/perl/debian/regen-skip.diff
@@ -8,6 +8,7 @@ for instance because the repository only imported the Perl tarball,
 the regeneration check is broken because lib/.gitignore is missing.
 
 Patch-Name: debian/regen-skip.diff
+Upstream-Status: Pending
 ---
  regen/lib_cleanup.pl | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/perl/perl/debian/skip-kfreebsd-crash.diff b/meta/recipes-devtools/perl/perl/debian/skip-kfreebsd-crash.diff
index ecfc0bc..3b37452 100644
--- a/meta/recipes-devtools/perl/perl/debian/skip-kfreebsd-crash.diff
+++ b/meta/recipes-devtools/perl/perl/debian/skip-kfreebsd-crash.diff
@@ -12,6 +12,7 @@ a new unrelated test case.
 Skip the test until the culprit is found.
 
 Patch-Name: debian/skip-kfreebsd-crash.diff
+Upstream-Status: Pending
 ---
  t/op/threads.t | 4 ++++
  1 file changed, 4 insertions(+)
diff --git a/meta/recipes-devtools/perl/perl/debian/skip-upstream-git-tests.diff b/meta/recipes-devtools/perl/perl/debian/skip-upstream-git-tests.diff
index 4c87104..279f4ab 100644
--- a/meta/recipes-devtools/perl/perl/debian/skip-upstream-git-tests.diff
+++ b/meta/recipes-devtools/perl/perl/debian/skip-upstream-git-tests.diff
@@ -9,6 +9,7 @@ upstream. This complicates things needlessly for downstream packagers.
 Skip the tests altogether even if the .git directory exists.
 
 Patch-Name: debian/skip-upstream-git-tests.diff
+Upstream-Status: Pending
 ---
  t/test.pl | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/perl/perl/debian/squelch-locale-warnings.diff b/meta/recipes-devtools/perl/perl/debian/squelch-locale-warnings.diff
index cb31457..4964e48 100644
--- a/meta/recipes-devtools/perl/perl/debian/squelch-locale-warnings.diff
+++ b/meta/recipes-devtools/perl/perl/debian/squelch-locale-warnings.diff
@@ -14,6 +14,7 @@ Any real locale problem will show up after the system upgrade too, and
 the warning will be triggered normally again at that point.
 
 Patch-Name: debian/squelch-locale-warnings.diff
+Upstream-Status: Pending
 ---
  locale.c           | 5 ++++-
  pod/perllocale.pod | 8 ++++++++
diff --git a/meta/recipes-devtools/perl/perl/debian/writable_site_dirs.diff b/meta/recipes-devtools/perl/perl/debian/writable_site_dirs.diff
index 53adc2f..ab373b3 100644
--- a/meta/recipes-devtools/perl/perl/debian/writable_site_dirs.diff
+++ b/meta/recipes-devtools/perl/perl/debian/writable_site_dirs.diff
@@ -6,6 +6,7 @@ Subject: Set umask approproately for site install directories
 Policy requires group writable site directories
 
 Patch-Name: debian/writable_site_dirs.diff
+Upstream-Status: Pending
 ---
  cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
diff --git a/meta/recipes-devtools/perl/perl/ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch b/meta/recipes-devtools/perl/perl/ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch
index 6b05b87..b85b50c 100644
--- a/meta/recipes-devtools/perl/perl/ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch
+++ b/meta/recipes-devtools/perl/perl/ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch
@@ -9,6 +9,8 @@ Fixed:
 Can't locate ../../t/lib/dbmt_common.pl in @INC
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+Upstream-Status: Pending
 ---
  ext/ODBM_File/t/odbm.t |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/python/python/multilib.patch b/meta/recipes-devtools/python/python/multilib.patch
index 50cc591..f5568d2 100644
--- a/meta/recipes-devtools/python/python/multilib.patch
+++ b/meta/recipes-devtools/python/python/multilib.patch
@@ -1,6 +1,6 @@
 Rebased for python-2.7.9
 Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
-
+Upstream-Status: Pending
 Index: Python-2.7.13/configure.ac
 ===================================================================
 --- Python-2.7.13.orig/configure.ac
diff --git a/meta/recipes-devtools/python/python/use_sysroot_ncurses_instead_of_host.patch b/meta/recipes-devtools/python/python/use_sysroot_ncurses_instead_of_host.patch
index 2c65786..fb4a3bc 100644
--- a/meta/recipes-devtools/python/python/use_sysroot_ncurses_instead_of_host.patch
+++ b/meta/recipes-devtools/python/python/use_sysroot_ncurses_instead_of_host.patch
@@ -2,6 +2,7 @@ Python tries to use ncursesw from the host,
 if it is not found causes an error on configure,
 we should use ncursesw from sysroot instead
 
+Upstream-Status: Pending
 
 Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
diff --git a/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
index 173394f..eb99d14 100644
--- a/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
+++ b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- a/configure
 +++ b/configure
 @@ -4468,10 +4468,6 @@ fi
diff --git a/meta/recipes-devtools/ruby/ruby/extmk.patch b/meta/recipes-devtools/ruby/ruby/extmk.patch
index 8b68450..a5b2184 100644
--- a/meta/recipes-devtools/ruby/ruby/extmk.patch
+++ b/meta/recipes-devtools/ruby/ruby/extmk.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 diff -ru ruby-1.8.7-p248.orig/ext/extmk.rb ruby-1.8.7-p248/ext/extmk.rb
 --- ruby-1.8.7-p248.orig/ext/extmk.rb	2009-12-24 03:01:58.000000000 -0600
 +++ ruby-1.8.7-p248/ext/extmk.rb	2010-02-12 15:55:27.370061558 -0600
diff --git a/meta/recipes-extended/acpica/files/no-werror.patch b/meta/recipes-extended/acpica/files/no-werror.patch
index 5d28f47..a6e7b54 100644
--- a/meta/recipes-extended/acpica/files/no-werror.patch
+++ b/meta/recipes-extended/acpica/files/no-werror.patch
@@ -1,7 +1,7 @@
 Description: remove -Werror flag
 Forwarded: not-needed
 Author: Fathi Boudra <fathi.boudra@linaro.org>
-
+Upstream-Status: Pending
 ---
  generate/unix/iasl/Makefile |   12 ++++++------
  1 file changed, 6 insertions(+), 6 deletions(-)
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch
index 8fa2c40..3ec3956 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch
@@ -10,6 +10,7 @@ Subject: [PATCH] Robert Yang <liezhi.yang@windriver.com> Date: Fri, 30 Jan
 2015 00:40:22 -0800  Subject: [PATCH] contrib.mak: fix for parallel build
 
 Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
+Upstream-Status: Pending
 ---
  contrib/contrib.mak | 2 ++
  1 file changed, 2 insertions(+)
diff --git a/meta/recipes-extended/libnsl/libnsl2/0001-include-sys-cdefs.h-explicitly.patch b/meta/recipes-extended/libnsl/libnsl2/0001-include-sys-cdefs.h-explicitly.patch
index c6c259a..bd647ac 100644
--- a/meta/recipes-extended/libnsl/libnsl2/0001-include-sys-cdefs.h-explicitly.patch
+++ b/meta/recipes-extended/libnsl/libnsl2/0001-include-sys-cdefs.h-explicitly.patch
@@ -7,7 +7,7 @@ glibc includes this header indirectly but not musl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream_status: Pending
+Upstream-Status: Pending
 
  src/rpcsvc/nis.h    | 1 +
  src/rpcsvc/nislib.h | 1 +
diff --git a/meta/recipes-extended/libnsl/libnsl2/0002-Define-glibc-specific-macros.patch b/meta/recipes-extended/libnsl/libnsl2/0002-Define-glibc-specific-macros.patch
index 68d819c..75fda4b 100644
--- a/meta/recipes-extended/libnsl/libnsl2/0002-Define-glibc-specific-macros.patch
+++ b/meta/recipes-extended/libnsl/libnsl2/0002-Define-glibc-specific-macros.patch
@@ -11,7 +11,7 @@ if not existing. Helps compiling with musl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream_status: Pending
+Upstream-Status: Pending
 
 diff --git a/src/rpcsvc/nis.h b/src/rpcsvc/nis.h
 index 88cbca0..23fc20c 100644
diff --git a/meta/recipes-extended/lsb/lsbinitscripts/functions.patch b/meta/recipes-extended/lsb/lsbinitscripts/functions.patch
index feef610..9c58d90 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts/functions.patch
+++ b/meta/recipes-extended/lsb/lsbinitscripts/functions.patch
@@ -9,6 +9,7 @@ Signed-off-by: Saul Wold <sgw@linux.intel.com>
 Rebase on 9.72
 
 Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+Upstream-Status: Pending
 ---
  initscripts-9.72/rc.d/init.d/functions | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch b/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
index 0684bee..9865020 100644
--- a/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
+++ b/meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
@@ -9,6 +9,7 @@ during build depending upong numa being staged or not
 
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
 ---
  m4/ltp-numa.m4 | 10 +++++++++-
  1 file changed, 9 insertions(+), 1 deletion(-)
diff --git a/meta/recipes-extended/ltp/ltp/0003-Add-knob-to-control-tirpc-support.patch b/meta/recipes-extended/ltp/ltp/0003-Add-knob-to-control-tirpc-support.patch
index bf1176f..5cf1e05 100644
--- a/meta/recipes-extended/ltp/ltp/0003-Add-knob-to-control-tirpc-support.patch
+++ b/meta/recipes-extended/ltp/ltp/0003-Add-knob-to-control-tirpc-support.patch
@@ -8,6 +8,7 @@ does not yet work.
 
 Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
 ---
  configure.ac | 9 +++++++++
  1 file changed, 9 insertions(+)
diff --git a/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch b/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
index 2de9363..cf74463 100644
--- a/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
+++ b/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
@@ -10,6 +10,7 @@ different and does not implement all GNU extentions
 Disable tests specifically not building _yet_ on musl based systems
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
 ---
  Makefile                                    | 5 +++++
  testcases/kernel/Makefile                   | 5 ++++-
diff --git a/meta/recipes-extended/ltp/ltp/0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch b/meta/recipes-extended/ltp/ltp/0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
index 8dab1ed..b9390e2 100644
--- a/meta/recipes-extended/ltp/ltp/0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
+++ b/meta/recipes-extended/ltp/ltp/0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
@@ -7,6 +7,7 @@ musl does not implement fts like glibc and therefore it depends on
 external implementation for all fts APIs
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
 ---
  testcases/kernel/controllers/Makefile.inc        | 3 +++
  testcases/kernel/controllers/cpuset/Makefile.inc | 3 +++
diff --git a/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch b/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
index 41f2623..e325ce4 100644
--- a/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
+++ b/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
@@ -8,6 +8,7 @@ defined or not.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
+Upstream-Status: Pending
 ---
  testcases/kernel/syscalls/accept4/accept4_01.c     |  9 ++++-
  testcases/kernel/syscalls/getcpu/getcpu01.c        | 40 +++++++++++++++++++++-
diff --git a/meta/recipes-extended/ltp/ltp/0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch b/meta/recipes-extended/ltp/ltp/0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch
index 5b0c444..b9fce88 100644
--- a/meta/recipes-extended/ltp/ltp/0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch
+++ b/meta/recipes-extended/ltp/ltp/0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch
@@ -10,6 +10,8 @@ Include <asm-generic/types.h> to get __s32 definitions
 its not a generally available typedef
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
 ---
  testcases/kernel/syscalls/epoll2/include/epoll.h | 8 ++++++--
  utils/sctp/include/netinet/sctp.h                | 9 +++++++--
diff --git a/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch b/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch
index 4ac14dc..25f6ba7 100644
--- a/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch
+++ b/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch
@@ -7,6 +7,8 @@ sigset API from signal.h is shadowed by this name conflict
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Dengke Du <dengke.du@windriver.com>
+
+Upstream-Status: Pending
 ---
  testcases/kernel/mem/shmt/shmt04.c                    | 10 +++++-----
  testcases/kernel/mem/shmt/shmt06.c                    | 10 +++++-----
diff --git a/meta/recipes-extended/ltp/ltp/0018-guard-mallocopt-with-__GLIBC__.patch b/meta/recipes-extended/ltp/ltp/0018-guard-mallocopt-with-__GLIBC__.patch
index 5198fe9..a79763d 100644
--- a/meta/recipes-extended/ltp/ltp/0018-guard-mallocopt-with-__GLIBC__.patch
+++ b/meta/recipes-extended/ltp/ltp/0018-guard-mallocopt-with-__GLIBC__.patch
@@ -6,6 +6,7 @@ Subject: [PATCH 18/32] guard mallocopt() with __GLIBC__
 mallocopt is not available on non glibc implementations
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
 ---
  utils/benchmark/ebizzy-0.3/ebizzy.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
diff --git a/meta/recipes-extended/ltp/ltp/0020-getdents-define-getdents-getdents64-only-for-glibc.patch b/meta/recipes-extended/ltp/ltp/0020-getdents-define-getdents-getdents64-only-for-glibc.patch
index 0e4e458..7060a64 100644
--- a/meta/recipes-extended/ltp/ltp/0020-getdents-define-getdents-getdents64-only-for-glibc.patch
+++ b/meta/recipes-extended/ltp/ltp/0020-getdents-define-getdents-getdents64-only-for-glibc.patch
@@ -7,6 +7,8 @@ getdents/getdents64 are implemented in musl and when we define static
 functions with same name, it errors out.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
 ---
  testcases/kernel/syscalls/getdents/getdents.h | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
diff --git a/meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch b/meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch
index c8cbe58..3e79c9f 100644
--- a/meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch
+++ b/meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch
@@ -10,6 +10,8 @@ Fixes errors like
 error: 'MREMAP_MAYMOVE' undeclared (first use in this function)
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
 ---
  testcases/kernel/syscalls/mremap/mremap01.c | 4 +++-
  testcases/kernel/syscalls/mremap/mremap02.c | 2 ++
diff --git a/meta/recipes-extended/ltp/ltp/0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch b/meta/recipes-extended/ltp/ltp/0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch
index 4680c03..529f4ed 100644
--- a/meta/recipes-extended/ltp/ltp/0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch
+++ b/meta/recipes-extended/ltp/ltp/0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch
@@ -6,6 +6,8 @@ Subject: [PATCH 23/32] ptrace:  Use int instead of enum __ptrace_request
 __ptrace_request is only available with glibc
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
 ---
  testcases/kernel/syscalls/ptrace/ptrace03.c           | 4 ++++
  testcases/kernel/syscalls/ptrace/spawn_ptrace_child.h | 4 ++++
diff --git a/meta/recipes-extended/ltp/ltp/0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch b/meta/recipes-extended/ltp/ltp/0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch
index 03c67a5..03aa45d 100644
--- a/meta/recipes-extended/ltp/ltp/0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch
+++ b/meta/recipes-extended/ltp/ltp/0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch
@@ -7,6 +7,8 @@ Fixes musl build failure e.g.
 error: 'SA_NOMASK' undeclared here (not in a function)
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
 ---
  testcases/kernel/syscalls/rt_sigaction/rt_sigaction01.c     | 1 +
  testcases/kernel/syscalls/rt_sigaction/rt_sigaction02.c     | 2 +-
diff --git a/meta/recipes-extended/ltp/ltp/0025-mc_gethost-include-sys-types.h.patch b/meta/recipes-extended/ltp/ltp/0025-mc_gethost-include-sys-types.h.patch
index aad3cb0..afcba63 100644
--- a/meta/recipes-extended/ltp/ltp/0025-mc_gethost-include-sys-types.h.patch
+++ b/meta/recipes-extended/ltp/ltp/0025-mc_gethost-include-sys-types.h.patch
@@ -7,6 +7,8 @@ Fix build on musl
 error: unknown type name 'u_char'
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
 ---
  testcases/network/multicast/mc_gethost/mc_gethost.c | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta/recipes-extended/ltp/ltp/0026-crash01-Define-_GNU_SOURCE.patch b/meta/recipes-extended/ltp/ltp/0026-crash01-Define-_GNU_SOURCE.patch
index 58b8ed4..f65fad1 100644
--- a/meta/recipes-extended/ltp/ltp/0026-crash01-Define-_GNU_SOURCE.patch
+++ b/meta/recipes-extended/ltp/ltp/0026-crash01-Define-_GNU_SOURCE.patch
@@ -7,6 +7,8 @@ Fixes musl build errors like
 error: 'SA_NOMASK' undeclared (first use in this function)
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
 ---
  testcases/misc/crash/crash01.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-extended/ltp/ltp/0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch b/meta/recipes-extended/ltp/ltp/0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch
index f75e33b..adf6f27 100644
--- a/meta/recipes-extended/ltp/ltp/0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch
+++ b/meta/recipes-extended/ltp/ltp/0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch
@@ -7,6 +7,8 @@ _SC_2_C_VERSION is not available on musl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Dengke Du <dengke.du@windriver.com>
+
+Upstream-Status: Pending
 ---
  testcases/kernel/syscalls/sysconf/sysconf01.c | 2 ++
  1 file changed, 2 insertions(+)
diff --git a/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch b/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
index b26aa13..c730d46 100644
--- a/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
+++ b/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
@@ -8,6 +8,8 @@ When _GNU_SOURCE is used then both typedefs are same and using
 sighandler_t makes it work on musl too
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
 ---
  include/lapi/rt_sigaction.h                      | 2 +-
  testcases/kernel/syscalls/rt_sigsuspend/Makefile | 3 +++
diff --git a/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch b/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
index c5fac9b..efa6d06 100644
--- a/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
+++ b/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
@@ -8,6 +8,8 @@ e.g. musl does not implement the _NP mutex types
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Dengke Du <dengke.du@windriver.com>
+
+Upstream-Status: Pending
 ---
  lib/tst_res.c | 4 ++++
  1 file changed, 4 insertions(+)
diff --git a/meta/recipes-extended/stress/files/texinfo.patch b/meta/recipes-extended/stress/files/texinfo.patch
index 5ac5951..f23a1f6 100644
--- a/meta/recipes-extended/stress/files/texinfo.patch
+++ b/meta/recipes-extended/stress/files/texinfo.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 --- a/doc/stress.texi
 +++ b/doc/stress.texi
 @@ -62,47 +62,47 @@
diff --git a/meta/recipes-extended/xinetd/xinetd/xinetd-CVE-2013-4342.patch b/meta/recipes-extended/xinetd/xinetd/xinetd-CVE-2013-4342.patch
index c44c5a1..852a43f 100644
--- a/meta/recipes-extended/xinetd/xinetd/xinetd-CVE-2013-4342.patch
+++ b/meta/recipes-extended/xinetd/xinetd/xinetd-CVE-2013-4342.patch
@@ -11,6 +11,7 @@ https://bugzilla.redhat.com/attachment.cgi?id=799732&action=diff
 
 CVE: CVE-2013-4342
 Signed-off-by: Li Wang <li.wang@windriver.com>
+Upstream-Status: Backport
 ---
  xinetd/builtins.c |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMake-define-GBM_BO_MAP-only-when-symbol-is-found.patch b/meta/recipes-graphics/piglit/piglit/0001-CMake-define-GBM_BO_MAP-only-when-symbol-is-found.patch
index 0750676..9d6eaaa 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMake-define-GBM_BO_MAP-only-when-symbol-is-found.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMake-define-GBM_BO_MAP-only-when-symbol-is-found.patch
@@ -23,6 +23,7 @@ should be defined.
 
 Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
 Reviewed-by: Jan Vesely <jan.vesely@rutgers.edu>
+Upstream-Status: Backport
 ---
  CMakeLists.txt | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
diff --git a/meta/recipes-graphics/piglit/piglit/0002-util-egl-Honour-Surfaceless-MESA-in-get_default_disp.patch b/meta/recipes-graphics/piglit/piglit/0002-util-egl-Honour-Surfaceless-MESA-in-get_default_disp.patch
index 734de2b..39f0d86 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-util-egl-Honour-Surfaceless-MESA-in-get_default_disp.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-util-egl-Honour-Surfaceless-MESA-in-get_default_disp.patch
@@ -7,6 +7,7 @@ Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
 Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
+Upstream-Status: Pending
 ---
  tests/util/piglit-util-egl.c | 7 +++++++
  1 file changed, 7 insertions(+)
diff --git a/meta/recipes-graphics/piglit/piglit/0003-egl_mesa_platform_surfaceless-Don-t-use-eglGetPlatfo.patch b/meta/recipes-graphics/piglit/piglit/0003-egl_mesa_platform_surfaceless-Don-t-use-eglGetPlatfo.patch
index 7ec71dd..ee64415 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-egl_mesa_platform_surfaceless-Don-t-use-eglGetPlatfo.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-egl_mesa_platform_surfaceless-Don-t-use-eglGetPlatfo.patch
@@ -8,6 +8,7 @@ Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
 Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
+Upstream-Status: Pending
 ---
  .../spec/egl_mesa_platform_surfaceless/egl_mesa_platform_surfaceless.c  | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-graphics/piglit/piglit/0004-egl_mesa_platform_surfaceless-Use-EXT-functions-for-.patch b/meta/recipes-graphics/piglit/piglit/0004-egl_mesa_platform_surfaceless-Use-EXT-functions-for-.patch
index b3931dd..8b4fd34 100644
--- a/meta/recipes-graphics/piglit/piglit/0004-egl_mesa_platform_surfaceless-Use-EXT-functions-for-.patch
+++ b/meta/recipes-graphics/piglit/piglit/0004-egl_mesa_platform_surfaceless-Use-EXT-functions-for-.patch
@@ -11,6 +11,7 @@ These EXT symbols are guaranteed to exist since they require
 EGL_EXT_platform_base.
 
 Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
+Upstream-Status: Pending
 ---
  .../egl_mesa_platform_surfaceless.c                | 23 ++++++++++++++++++++--
  1 file changed, 21 insertions(+), 2 deletions(-)
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-Prevents-omapfb-from-from-crashing-when-pixelclock-o.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-Prevents-omapfb-from-from-crashing-when-pixelclock-o.patch
index c4cf16e..ac19219 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-Prevents-omapfb-from-from-crashing-when-pixelclock-o.patch
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-Prevents-omapfb-from-from-crashing-when-pixelclock-o.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] Prevents omapfb from from crashing when pixelclock of 0 is
 
 Due to a Linux design bug it is easy to get a pixelclock set to zero
 when changing displays at runtime.
+
+Upstream-Status: Pending
 ---
  src/omapfb-output.c | 9 +++++++--
  1 file changed, 7 insertions(+), 2 deletions(-)
diff --git a/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch
index af19b37..7147fda 100644
--- a/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch
+++ b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch
@@ -1,3 +1,7 @@
+
+Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
+Upstream-Status: Pending
+
 diff --git a/Makefile.orig b/Makefile
 index 16a2369..fa797a2 100644
 --- a/Makefile.orig
@@ -5,8 +9,8 @@ index 16a2369..fa797a2 100644
 @@ -1,10 +1,11 @@
 -# FIXME: Use autoconf ?
 -HAS_GTK_GUI = 1
-+# Upstream-Status: Inappropriate [configuration]
-+# Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
++#
++#
  
  DESTDIR =
  SBINDIR = /usr/sbin
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch b/meta/recipes-sato/webkit/webkitgtk/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
index 93a69c0..0f6eeed 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
@@ -9,6 +9,8 @@ This was not possible to override from the command line and in OpenEmbedded
 through the use of qemu target emulation.
 
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Upstream-Status: Pending
 ---
  Source/cmake/OptionsGTK.cmake | 6 ------
  1 file changed, 6 deletions(-)
diff --git a/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch b/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
index 1237142..c5e92ac 100644
--- a/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
+++ b/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
@@ -27,6 +27,8 @@ The same for the following hardcoded types for cross compiling:
 Change the above correspondingly.
 
 Signed-off-by: Dengke Du <dengke.du@windriver.com>
+
+Upstream-Status: Pending
 ---
  configure.in | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
diff --git a/meta/recipes-support/attr/acl/test-fix-directory-permissions.patch b/meta/recipes-support/attr/acl/test-fix-directory-permissions.patch
index cd4510c..a76cbbe 100644
--- a/meta/recipes-support/attr/acl/test-fix-directory-permissions.patch
+++ b/meta/recipes-support/attr/acl/test-fix-directory-permissions.patch
@@ -10,6 +10,8 @@ Date:   Wed May 11 15:16:06 2016 -0500
 
     Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
 
+Upstream-Status: Pending
+
 diff --git a/test/root/permissions.test b/test/root/permissions.test
 index 42615f5..098b52a 100644
 --- a/test/root/permissions.test
diff --git a/meta/recipes-support/nss/nss/Fix-compilation-for-X32.patch b/meta/recipes-support/nss/nss/Fix-compilation-for-X32.patch
index f7f2c21..80b8690 100644
--- a/meta/recipes-support/nss/nss/Fix-compilation-for-X32.patch
+++ b/meta/recipes-support/nss/nss/Fix-compilation-for-X32.patch
@@ -6,6 +6,8 @@ Subject: [PATCH 7/7] Fix compilation for X32
 X32 uses 32-bit pointers, not 64-bit.
 
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+
+Upstream-Status: Pending
 ---
  nss/lib/freebl/poly1305-donna-x64-sse2-incremental-source.c | 4 ++++
  1 file changed, 4 insertions(+)
diff --git a/meta/recipes-support/rng-tools/rng-tools/underquote.patch b/meta/recipes-support/rng-tools/rng-tools/underquote.patch
index 1422571..afd08d5 100644
--- a/meta/recipes-support/rng-tools/rng-tools/underquote.patch
+++ b/meta/recipes-support/rng-tools/rng-tools/underquote.patch
@@ -7,6 +7,8 @@ Fix underquoted m4 entry. This causes a failure if gcrypt isn't present:
 RP
 2016/2/16
 
+Upstream-Status: Pending
+
 Index: rng-tools-5/configure.ac
 ===================================================================
 --- rng-tools-5.orig/configure.ac
-- 
2.7.4


