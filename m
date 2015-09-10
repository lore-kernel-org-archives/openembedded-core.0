Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8F7366E26B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 19:10:08 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so37100810wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 12:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=4aGnsiz1HS8sNCFjw94GtoWbTnNnhIQzY/cjQuBavXI=;
	b=YfDVRlji6xkaUXTi1EWcfAWMMPU1no81hTAEm9jeVbcOLgMf+MXnkqOPeiH/0HUurE
	D9xlpAICS/PFNB05QAwcHg/zI00jf2OOgUQASjYPi+zXyZJBJjcbePPJgUgSQ8uSTjac
	jeXzlu92DPvE9vqv+JonbVqlGZSXpVBmiroS0XoX3jngHGOuHo0yoGWEyAXSpRqeq8eH
	tBqaSbENBHRtOm1fprDza8WWzdVpifWT/Ywh5DntLCBwusF1QMWcEBLDjRc5J6+b1yCA
	JY8NV88kVFJPqogfBPhjNtmtgnkPZ6YpCS913DqkaoZgR6uLnorPDb3NO5pDD1+8V/X0
	89oA==
X-Gm-Message-State: ALoCoQkt87ZBSrCqKiD2aSA83FUpuZQoO3qGLVv92YQpQVQz16KiONLdjioYW1VZsYTo+HC4zb2z
X-Received: by 10.194.103.228 with SMTP id fz4mr48111160wjb.53.1441912208065; 
	Thu, 10 Sep 2015 12:10:08 -0700 (PDT)
Received: from Blackadder.home
	(host81-153-67-238.range81-153.btcentralplus.com. [81.153.67.238])
	by smtp.gmail.com with ESMTPSA id
	ht5sm10772971wib.10.2015.09.10.12.10.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Sep 2015 12:10:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2015 20:10:03 +0100
Message-Id: <1441912203-27833-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.3.2 (Apple Git-55)
MIME-Version: 1.0
Subject: [PATCH] meta: Fix Upstream-Status statements
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
X-List-Received-Date: Thu, 10 Sep 2015 19:10:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix a variety of problems such as typos, bad punctuations, or incorrect
Upstream-Status values.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../files/0001-Unset-need_charset_alias-when-building-for-musl.patch   | 2 +-
 meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch               | 2 +-
 meta/recipes-bsp/setserial/setserial/ldflags.patch                     | 2 +-
 .../bind/bind-ensure-searching-for-json-headers-searches-sysr.patch    | 2 +-
 .../0001-Removed-icon-from-connman-gnome-about-applet.patch            | 2 +-
 meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch   | 2 +-
 .../iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch  | 2 +-
 .../libpcap/libpcap/libpcap-pkgconfig-support.patch                    | 2 +-
 .../nfs-utils/files/nfs-utils-debianize-start-statd.patch              | 2 +-
 meta/recipes-core/base-passwd/base-passwd/input.patch                  | 2 +-
 meta/recipes-core/base-passwd/base-passwd/nobash.patch                 | 2 +-
 meta/recipes-core/base-passwd/base-passwd/noshadow.patch               | 2 +-
 meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch       | 2 +-
 .../0001-Unset-need_charset_alias-when-building-for-musl.patch         | 2 +-
 meta/recipes-core/dbus/dbus/os-test.patch                              | 2 +-
 .../ldconfig-native-2.12.1/add-64-bit-flag-for-ELF64-entries.patch     | 2 +-
 meta/recipes-core/udev/udev/fix_rule-syntax-regex-ptest.patch          | 3 +--
 meta/recipes-core/zlib/zlib-1.2.8/ldflags-tests.patch                  | 2 +-
 meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch         | 2 +-
 .../bison/0001-Unset-need_charset_alias-when-building-for-musl.patch   | 2 +-
 .../0001-Fix-regression-in-recent-change-related-to-zlib-in-n.patch    | 2 +-
 .../e2fsprogs/e2fsprogs/0012-Fix-musl-build-failures.patch             | 2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs/fix-icache.patch             | 2 +-
 .../misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch        | 2 +-
 meta/recipes-devtools/elfutils/elfutils/Fix_elf_cvt_gunhash.patch      | 2 +-
 .../gcc-4.9/0054-gcc-Makefile.in-fix-parallel-building-failure.patch   | 2 +-
 meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-r212171.patch               | 2 +-
 .../gcc/gcc-4.9/0059-gcc-PR-rtl-optimization-63348.patch               | 2 +-
 .../m4/m4/0001-Unset-need_charset_alias-when-building-for-musl.patch   | 2 +-
 meta/recipes-devtools/mklibs/files/fix_cross_compile.patch             | 2 +-
 .../mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch     | 2 +-
 meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch                | 2 +-
 .../patch/0001-Unset-need_charset_alias-when-building-for-musl.patch   | 2 +-
 .../perl/perl/test/dist-threads-t-join.t-adjust-ps-option.patch        | 2 +-
 .../test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_findfil.patch    | 2 +-
 meta/recipes-devtools/python/python/setuptweaks.patch                  | 2 +-
 meta/recipes-devtools/python/python3/setuptweaks.patch                 | 2 +-
 meta/recipes-devtools/rpm/rpm/dbconvert.patch                          | 3 ++-
 meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch                     | 2 +-
 meta/recipes-devtools/rpm/rpm/rpm-fix-logio-cp.patch                   | 2 +-
 meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch                     | 2 +-
 .../rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch | 2 +-
 .../strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch             | 2 +-
 .../valgrind/valgrind/pass-maltivec-only-if-it-supported.patch         | 2 +-
 .../configure.in-drop-the-test-of-xmllint-and-xsltproc.patch           | 2 +-
 .../augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch  | 2 +-
 .../0001-Unset-need_charset_alias-when-building-for-musl.patch         | 2 +-
 .../0001-Unset-need_charset_alias-when-building-for-musl.patch         | 2 +-
 .../0001-Unset-need_charset_alias-when-building-for-musl.patch         | 2 +-
 .../grep/0001-Unset-need_charset_alias-when-building-for-musl.patch    | 2 +-
 .../0001-Unset-need_charset_alias-when-building-for-musl.patch         | 2 +-
 meta/recipes-extended/libaio/libaio/libaio_fix_for_mips_syscalls.patch | 2 +-
 .../0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch     | 2 +-
 .../0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch    | 2 +-
 .../files/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch | 2 +-
 .../mailx/files/0011-outof-Introduce-expandaddr-flag.patch             | 2 +-
 .../0012-unpack-Disable-option-processing-for-email-addresses.patch    | 2 +-
 .../files/0013-fio.c-Unconditionally-require-wordexp-support.patch     | 2 +-
 .../mailx/files/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch     | 2 +-
 meta/recipes-extended/mailx/files/0015-usr-sbin-sendmail.patch         | 2 +-
 .../recipes-extended/mailx/files/explicitly.disable.krb5.support.patch | 2 +-
 meta/recipes-extended/mc/mc/mc-CTRL.patch                              | 2 +-
 .../files/0001-Unset-need_charset_alias-when-building-for-musl.patch   | 2 +-
 .../psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch              | 2 +-
 .../0001-Unset-need_charset_alias-when-building-for-musl.patch         | 2 +-
 .../slang/slang/sprintf-bug-concerning-8-bit-characters.patch          | 3 ++-
 meta/recipes-extended/texinfo/texinfo-4.8/check-locale-h.patch         | 2 +-
 .../recipes-extended/texinfo/texinfo-4.8/do-compile-native-tools.patch | 2 +-
 meta/recipes-extended/texinfo/texinfo-4.8/using-native-makeinfo.patch  | 2 +-
 .../texinfo/0001-Unset-need_charset_alias-when-building-for-musl.patch | 2 +-
 .../wget/0001-Unset-need_charset_alias-when-building-for-musl.patch    | 2 +-
 .../xdg-utils/xdg-utils/0001-Reinstate-xdg-terminal.patch              | 2 +-
 .../clutter/clutter-1.0/run-installed-tests-with-tap-output.patch      | 2 +-
 .../fontconfig/fontconfig/revert-static-pkgconfig.patch                | 2 +-
 meta/recipes-graphics/libepoxy/libepoxy/no-need-for-python3.patch      | 2 +-
 .../libpfm/files/0001-Makefile-Add-LDFLAGS-variable-to-SLDFLAGS.patch  | 2 +-
 .../trace-cmd/trace-cmd/blktrace-api-compatibility.patch               | 2 +-
 .../do-not-change-eos-event-to-gap-event-if.patch                      | 2 +-
 .../get-caps-from-src-pad-when-query-caps.patch                        | 2 +-
 .../taglist-not-send-to-down-stream-if-all-the-frame-cor.patch         | 2 +-
 .../0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch    | 2 +-
 .../gstreamer1.0-plugins-good/decrease_asteriskh263_rank.patch         | 2 +-
 .../0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch    | 2 +-
 meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch                     | 2 +-
 meta/recipes-support/gnupg/gnupg/pkgconfig.patch                       | 2 +-
 meta/recipes-support/gpgme/gpgme/pkgconfig.patch                       | 2 +-
 .../libassuan/libassuan/libassuan-add-pkgconfig-support.patch          | 2 +-
 meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch       | 2 +-
 .../libgcrypt/files/fix-ICE-failure-on-mips-with-option-O-and-g.patch  | 2 +-
 meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch  | 2 +-
 .../0001-Unset-need_charset_alias-when-building-for-musl.patch         | 2 +-
 meta/recipes-support/lzop/lzop/x32_abi_miniacc_h.patch                 | 2 +-
 meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch                  | 2 +-
 meta/recipes-support/npth/npth/pkgconfig.patch                         | 2 +-
 94 files changed, 96 insertions(+), 95 deletions(-)

diff --git a/meta/recipes-bsp/grub/files/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-bsp/grub/files/0001-Unset-need_charset_alias-when-building-for-musl.patch
index 3706e6b..67dc115 100644
--- a/meta/recipes-bsp/grub/files/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ b/meta/recipes-bsp/grub/files/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all downstream
 projects will get it eventually. For now we apply the fix to
 coreutils
 
-Upstream-Status: Not Required
+Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch b/meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch
index c4655cf..3e99d0d 100644
--- a/meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch
+++ b/meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch
@@ -1,7 +1,7 @@
 Obey LDFLAGS
 
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Upstream-status: Pending
+Upstream-Status: Pending
 
 --- hostap-utils-0.4.7.orig/Makefile
 +++ hostap-utils-0.4.7/Makefile
diff --git a/meta/recipes-bsp/setserial/setserial/ldflags.patch b/meta/recipes-bsp/setserial/setserial/ldflags.patch
index 4313d2c..174adc8 100644
--- a/meta/recipes-bsp/setserial/setserial/ldflags.patch
+++ b/meta/recipes-bsp/setserial/setserial/ldflags.patch
@@ -1,7 +1,7 @@
 Obey LDFLAGS
 
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Upstream-status: Pending
+Upstream-Status: Pending
 
 --- setserial-2.17.orig/Makefile.in
 +++ setserial-2.17/Makefile.in
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index dedc437..13df3bb 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -25,7 +25,7 @@ to make use of the combination some day.
 [1] https://trac.macports.org/ticket/45305
 [2] https://trac.macports.org/changeset/126406
 
-Upstream-status: Inappropriate [OE Specific]
+Upstream-Status: Inappropriate [OE Specific]
 Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
 ---
  configure.in | 2 +-
diff --git a/meta/recipes-connectivity/connman/connman-gnome/0001-Removed-icon-from-connman-gnome-about-applet.patch b/meta/recipes-connectivity/connman/connman-gnome/0001-Removed-icon-from-connman-gnome-about-applet.patch
index 4f36b95..7957500 100644
--- a/meta/recipes-connectivity/connman/connman-gnome/0001-Removed-icon-from-connman-gnome-about-applet.patch
+++ b/meta/recipes-connectivity/connman/connman-gnome/0001-Removed-icon-from-connman-gnome-about-applet.patch
@@ -10,7 +10,7 @@ it was removed.
 
 [OE-Core #2509]
 
-Upstream-Status : Pending
+Upstream-Status: Pending
 
 Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
 ---
diff --git a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch
index 2cdd1ac..e95fe35 100644
--- a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch
+++ b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch
@@ -1,7 +1,7 @@
 Obey LDFLAGS
 
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Upstream-status: Pending
+Upstream-Status: Pending
 
 --- irda-utils-0.9.18.orig/findchip/Makefile
 +++ irda-utils-0.9.18/findchip/Makefile
diff --git a/meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch b/meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
index e64dd0a..a0a77b2 100644
--- a/meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
+++ b/meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] iw: version.sh: don't use git describe for versioning
 
 It will detect top-level git repositories like the Angstrom setup-scripts and break.
 
-Upstream-Status: Unknown
+Upstream-Status: Pending
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
diff --git a/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support.patch b/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support.patch
index 9cfb9df..b861513 100644
--- a/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support.patch
+++ b/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] libpcap: pkgconfig support
 
 Adding basic structure to support pkg-config.
 
-Upstream-status: Inappropriate [embedded specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
 ---
diff --git a/meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start-statd.patch b/meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start-statd.patch
index 5a2d5c8..8500229 100644
--- a/meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start-statd.patch
+++ b/meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start-statd.patch
@@ -1,6 +1,6 @@
 [PATCH] nfs-utils: debianize start-statd
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 make start-statd command to use nfscommon configure, too.
 
diff --git a/meta/recipes-core/base-passwd/base-passwd/input.patch b/meta/recipes-core/base-passwd/base-passwd/input.patch
index f1bfc2f..3abbcad 100644
--- a/meta/recipes-core/base-passwd/base-passwd/input.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/input.patch
@@ -1,6 +1,6 @@
 Add an input group for the /dev/input/* devices.
 
-Upstream-Status: Invalid [configuration]
+Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Darren Hart <dvhart@linux.intel.com>
 
diff --git a/meta/recipes-core/base-passwd/base-passwd/nobash.patch b/meta/recipes-core/base-passwd/base-passwd/nobash.patch
index eed87db..b5a6922 100644
--- a/meta/recipes-core/base-passwd/base-passwd/nobash.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/nobash.patch
@@ -1,7 +1,7 @@
 use /bin/sh instead of /bin/bash, since the latter may not be included in
 some images such as minimal
 
-Upstream-Status: Invalid [configuration]
+Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
diff --git a/meta/recipes-core/base-passwd/base-passwd/noshadow.patch b/meta/recipes-core/base-passwd/base-passwd/noshadow.patch
index e1cded6..e27bf7d 100644
--- a/meta/recipes-core/base-passwd/base-passwd/noshadow.patch
+++ b/meta/recipes-core/base-passwd/base-passwd/noshadow.patch
@@ -1,6 +1,6 @@
 remove "*" for root since we don't have a /etc/shadow so far.
 
-Upstream-Status: Invalid [configuration]
+Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
diff --git a/meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch b/meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch
index 781f5af..bda8685 100644
--- a/meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch
+++ b/meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch
@@ -2,7 +2,7 @@ From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sun, 3 Mar 2013 12:31:40 -0600
 Subject: [PATCH] menuconfig,check-lxdiaglog.sh: Allow specification of ncurses location
 
-Upstream-status: Submitted 
+Upstream-Status: Submitted
 
 [ based on: https://lkml.org/lkml/2013/3/3/103 ]
 
diff --git a/meta/recipes-core/coreutils/coreutils-8.24/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-core/coreutils/coreutils-8.24/0001-Unset-need_charset_alias-when-building-for-musl.patch
index abdfa2a..ba1a4ba 100644
--- a/meta/recipes-core/coreutils/coreutils-8.24/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ b/meta/recipes-core/coreutils/coreutils-8.24/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all downstream
 projects will get it eventually. For now we apply the fix to
 coreutils
 
-Upstream-Status: Not Required
+Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-core/dbus/dbus/os-test.patch b/meta/recipes-core/dbus/dbus/os-test.patch
index 79554b1..54c257f 100644
--- a/meta/recipes-core/dbus/dbus/os-test.patch
+++ b/meta/recipes-core/dbus/dbus/os-test.patch
@@ -6,7 +6,7 @@ unconditionally as the oe-core initscript has a redhat-style pid file
 path.
 
 Signed-off-by: Andy Ross <andy.ross@windriver.com>
-Upstream-Status: innappropriate [embedded]
+Upstream-Status: Inappropriate [embedded]
 
 diff -u a/configure.ac b/configure.ac
 --- a/configure.ac	2012-08-28 11:23:43.040609874 -0700
diff --git a/meta/recipes-core/glibc/ldconfig-native-2.12.1/add-64-bit-flag-for-ELF64-entries.patch b/meta/recipes-core/glibc/ldconfig-native-2.12.1/add-64-bit-flag-for-ELF64-entries.patch
index a0fabae..a9af110 100644
--- a/meta/recipes-core/glibc/ldconfig-native-2.12.1/add-64-bit-flag-for-ELF64-entries.patch
+++ b/meta/recipes-core/glibc/ldconfig-native-2.12.1/add-64-bit-flag-for-ELF64-entries.patch
@@ -9,7 +9,7 @@ Due to this defect, ctypes.util.find_library() python function fails to
 detect any library due to the old file format that ldconfig-native
 creates. This fix sets architecture-dependent 64bit flags for 64-bit ELF.
 
-Upstream-status: Inappropriate [embedded specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
 ---
diff --git a/meta/recipes-core/udev/udev/fix_rule-syntax-regex-ptest.patch b/meta/recipes-core/udev/udev/fix_rule-syntax-regex-ptest.patch
index 548a241..593c46c 100644
--- a/meta/recipes-core/udev/udev/fix_rule-syntax-regex-ptest.patch
+++ b/meta/recipes-core/udev/udev/fix_rule-syntax-regex-ptest.patch
@@ -18,8 +18,7 @@ Ignore the argument and use a relative path instead.
 
 
 Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
-Upstream status pending
-Upstream status Inappropriate (cross environment path)
+Upstream-Status: Inappropriate (cross environment path)
 
 diff -Naur udev-182.orig/src/keymap/95-keymap.rules udev-182/src/keymap/95-keymap.rules
 --- udev-182.orig/src/keymap/95-keymap.rules	2012-02-07 00:01:55.154640792 +0100
diff --git a/meta/recipes-core/zlib/zlib-1.2.8/ldflags-tests.patch b/meta/recipes-core/zlib/zlib-1.2.8/ldflags-tests.patch
index 650794f..19c40b7 100644
--- a/meta/recipes-core/zlib/zlib-1.2.8/ldflags-tests.patch
+++ b/meta/recipes-core/zlib/zlib-1.2.8/ldflags-tests.patch
@@ -1,7 +1,7 @@
 Obey LDFLAGS for tests
 
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Upstream-status: Pending
+Upstream-Status: Pending
 
 --- zlib-1.2.8.orig/Makefile.in
 +++ zlib-1.2.8/Makefile.in
diff --git a/meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch b/meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch
index e5beaae..6108c0d 100644
--- a/meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch
+++ b/meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch
@@ -1,4 +1,4 @@
-Upstream Status: Backport
+Upstream-Status: Backport
 
 https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=2c62985659da21a3fe16062d211a7158f79ad2e9
 
diff --git a/meta/recipes-devtools/bison/bison/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-devtools/bison/bison/0001-Unset-need_charset_alias-when-building-for-musl.patch
index abdfa2a..ba1a4ba 100644
--- a/meta/recipes-devtools/bison/bison/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ b/meta/recipes-devtools/bison/bison/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all downstream
 projects will get it eventually. For now we apply the fix to
 coreutils
 
-Upstream-Status: Not Required
+Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-devtools/ccache/files/0001-Fix-regression-in-recent-change-related-to-zlib-in-n.patch b/meta/recipes-devtools/ccache/files/0001-Fix-regression-in-recent-change-related-to-zlib-in-n.patch
index a8400d5..f5bd9aa 100644
--- a/meta/recipes-devtools/ccache/files/0001-Fix-regression-in-recent-change-related-to-zlib-in-n.patch
+++ b/meta/recipes-devtools/ccache/files/0001-Fix-regression-in-recent-change-related-to-zlib-in-n.patch
@@ -14,7 +14,7 @@ prerequisite.
 This fix is to revert 0220de9c8ebfb18caae2ac1aa163d060e98ceade and
 instead make sure that LDFLAGS comes before extra_ldflags.
 
-Upstream-status: Backport
+Upstream-Status: Backport
 ---
  Makefile.in  |  2 +-
  NEWS.txt     | 10 ++++++++++
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0012-Fix-musl-build-failures.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0012-Fix-musl-build-failures.patch
index 2624f90..0b8008d 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0012-Fix-musl-build-failures.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0012-Fix-musl-build-failures.patch
@@ -15,7 +15,7 @@ those are larger commits containing other changes not needed here.
 
 Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
 
-Upstream-status: Backport
+Upstream-Status: Backport
 ---
  lib/ext2fs/unix_io.c | 6 +++---
  misc/create_inode.c  | 1 +
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/fix-icache.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/fix-icache.patch
index 03c0abc..d38cc4d 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/fix-icache.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/fix-icache.patch
@@ -16,7 +16,7 @@ cache[0]: cached ino 15 when bufsize = 156 by ext2fs_read_inode_full()
 Then the ino 14 would hit the cache[1] when bufsize = 128 (but it was
 cached by bufsize = 156), so there would be errors.
 
-Upstream-Status: [Submitted]
+Upstream-Status: Submitted
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch
index 9b467c3..cba0ce0 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] misc/mke2fs.c: return error when failed to populate filesystem
 We need return retval when "mke2fs -d" failed, otherwise the "$?" would
 be 0 which is misleading.
 
-Upstream-Status Submitted
+Upstream-Status: Submitted
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
diff --git a/meta/recipes-devtools/elfutils/elfutils/Fix_elf_cvt_gunhash.patch b/meta/recipes-devtools/elfutils/elfutils/Fix_elf_cvt_gunhash.patch
index 374cba5..f861e89 100644
--- a/meta/recipes-devtools/elfutils/elfutils/Fix_elf_cvt_gunhash.patch
+++ b/meta/recipes-devtools/elfutils/elfutils/Fix_elf_cvt_gunhash.patch
@@ -1,6 +1,6 @@
 Fix elf_cvt_gunhash if dest and src are same.
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 The 'dest' and 'src' can be same, we need to save the value of src32[2]
 before swaping it.
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0054-gcc-Makefile.in-fix-parallel-building-failure.patch b/meta/recipes-devtools/gcc/gcc-4.9/0054-gcc-Makefile.in-fix-parallel-building-failure.patch
index 4c98ca2..7e8efa1 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9/0054-gcc-Makefile.in-fix-parallel-building-failure.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0054-gcc-Makefile.in-fix-parallel-building-failure.patch
@@ -18,7 +18,7 @@ of gengtype).
 [GCC #61899]
 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61899
 
-Upstream-Status: Send to gcc-patches@gcc.gnu.org mailing list
+Upstream-Status: Submitted [gcc-patches@gcc.gnu.org]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-r212171.patch b/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-r212171.patch
index 4b312d4..d442ba8 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-r212171.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-r212171.patch
@@ -11,7 +11,7 @@ Subject: [PATCH] r212171
 
 git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@212171 138bc75d-0d04-0410-961f-82ee72b054a4
 
-Upstream-status: Backport [https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=212171]
+Upstream-Status: Backport [https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=212171]
 Signed-off-by: Baoshan Pang <baoshan.pang@windriver.com>
 ---
  gcc/except.c |   23 ++++++++++++++++++-----
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0059-gcc-PR-rtl-optimization-63348.patch b/meta/recipes-devtools/gcc/gcc-4.9/0059-gcc-PR-rtl-optimization-63348.patch
index 6d24aa4..de827cb 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9/0059-gcc-PR-rtl-optimization-63348.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0059-gcc-PR-rtl-optimization-63348.patch
@@ -11,7 +11,7 @@ https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63348
 
 git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@215613 138bc75d-0d04-0410-961f-82ee72b054a4
 
-Upstream-status: Backport [https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=215613]
+Upstream-Status: Backport [https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=215613]
 Signed-off-by: Baoshan Pang <baoshan.pang@windriver.com>
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 ---
diff --git a/meta/recipes-devtools/m4/m4/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-devtools/m4/m4/0001-Unset-need_charset_alias-when-building-for-musl.patch
index abdfa2a..ba1a4ba 100644
--- a/meta/recipes-devtools/m4/m4/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ b/meta/recipes-devtools/m4/m4/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all downstream
 projects will get it eventually. For now we apply the fix to
 coreutils
 
-Upstream-Status: Not Required
+Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch b/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
index 7eb8659..13e4606 100644
--- a/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
+++ b/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
@@ -1,6 +1,6 @@
 Remove dependency on dpkg
 
-Upstream-Status Submitted
+Upstream-Status: Submitted
 
 Asking the host OS whether it supports multiarch is not useful
 in a cross-compilation environment, or if the user has specified
diff --git a/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch b/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
index 3f14ca1..bc56593 100644
--- a/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
+++ b/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch
@@ -3,7 +3,7 @@ From: Yuanjie Huang <yuanjie.huang@windriver.com>
 Date: Wed, 15 Apr 2015 14:00:06 +0800
 Subject: [PATCH] Show GNU unique symbols as provided symbols
 
-Upstream-Status Submitted
+Upstream-Status: Submitted
 
 GNU Unique symbol is a GNU extension employed by new version of GCC
 by default. Even Standard C++ library in GCC 4.9 provides some symbols,
diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch b/meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch
index f4f0ef8..4dfc137 100644
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch
@@ -1,7 +1,7 @@
 Obey LDFLAGS
 
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Upstream-status: Pending
+Upstream-Status: Pending
 
 --- uuid-1.6.2.orig/Makefile.in
 +++ uuid-1.6.2/Makefile.in
diff --git a/meta/recipes-devtools/patch/patch/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-devtools/patch/patch/0001-Unset-need_charset_alias-when-building-for-musl.patch
index abdfa2a..ba1a4ba 100644
--- a/meta/recipes-devtools/patch/patch/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ b/meta/recipes-devtools/patch/patch/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all downstream
 projects will get it eventually. For now we apply the fix to
 coreutils
 
-Upstream-Status: Not Required
+Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-devtools/perl/perl/test/dist-threads-t-join.t-adjust-ps-option.patch b/meta/recipes-devtools/perl/perl/test/dist-threads-t-join.t-adjust-ps-option.patch
index 08a6b0a..c8293c3 100644
--- a/meta/recipes-devtools/perl/perl/test/dist-threads-t-join.t-adjust-ps-option.patch
+++ b/meta/recipes-devtools/perl/perl/test/dist-threads-t-join.t-adjust-ps-option.patch
@@ -2,7 +2,7 @@ dist/threads/t/join.t: adjust ps option
 
 The ps's option '-f' is not supported by busybox in oe.
 
-Upstream-Status: [oe specific]
+Upstream-Status: Inappropriate
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  dist/threads/t/join.t | 6 +++---
diff --git a/meta/recipes-devtools/perl/perl/test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_findfil.patch b/meta/recipes-devtools/perl/perl/test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_findfil.patch
index 1ee818c..ce577fe 100644
--- a/meta/recipes-devtools/perl/perl/test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_findfil.patch
+++ b/meta/recipes-devtools/perl/perl/test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_findfil.patch
@@ -2,7 +2,7 @@ ext/DynaLoader/t/DynaLoader.t: fix calling dl_findfile() failed
 
 Use '$Config{libc}' as the libc file name
 
-Upstream-Status: oe specific
+Upstream-Status: Inappropriate
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  ext/DynaLoader/t/DynaLoader.t | 2 +-
diff --git a/meta/recipes-devtools/python/python/setuptweaks.patch b/meta/recipes-devtools/python/python/setuptweaks.patch
index c34ef16..3a91b19 100644
--- a/meta/recipes-devtools/python/python/setuptweaks.patch
+++ b/meta/recipes-devtools/python/python/setuptweaks.patch
@@ -1,7 +1,7 @@
 This patch removes various ways native system options can pass into the python 
 compilation and somehow break C modules.
 
-Upstream-Status: Configuration [OE Specific]
+Upstream-Status: Inappropriate [OE Specific]
 
 RP 2012/04/23
 
diff --git a/meta/recipes-devtools/python/python3/setuptweaks.patch b/meta/recipes-devtools/python/python3/setuptweaks.patch
index c34ef16..3a91b19 100644
--- a/meta/recipes-devtools/python/python3/setuptweaks.patch
+++ b/meta/recipes-devtools/python/python3/setuptweaks.patch
@@ -1,7 +1,7 @@
 This patch removes various ways native system options can pass into the python 
 compilation and somehow break C modules.
 
-Upstream-Status: Configuration [OE Specific]
+Upstream-Status: Inappropriate [OE Specific]
 
 RP 2012/04/23
 
diff --git a/meta/recipes-devtools/rpm/rpm/dbconvert.patch b/meta/recipes-devtools/rpm/rpm/dbconvert.patch
index 78de7d9..09a6b9c 100644
--- a/meta/recipes-devtools/rpm/rpm/dbconvert.patch
+++ b/meta/recipes-devtools/rpm/rpm/dbconvert.patch
@@ -1,4 +1,5 @@
-Upstream-Status: Not applicable
+Upstream-Status: Inappropriate
+Signed-off-by: Matthew McClintock <msm@freescale.com>
 
 Hack to prevent unneeded demo app from building on older libc
 where it will break the build
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch b/meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch
index edb6ea2..77020a3 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch
@@ -1,6 +1,6 @@
 Support both db5 and db6.
 
-Upstream-status: Inappropriate [configuration]
+Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-fix-logio-cp.patch b/meta/recipes-devtools/rpm/rpm/rpm-fix-logio-cp.patch
index fa1ff43..27a0a8d 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-fix-logio-cp.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-fix-logio-cp.patch
@@ -1,7 +1,7 @@
 Occasionally the cp -p fails with a non-zero return code.  This will cause
 the system abort the build.
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch b/meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch
index fcbc25d..d8feed7 100644
--- a/meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch
@@ -3,7 +3,7 @@ rpmpgp.c: Add missing if defs around crypto implementations
 Without these, the system will error trying to find the correct crypto 
 library to use.
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
diff --git a/meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch b/meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch
index 5a70f14..71045ae 100644
--- a/meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch
+++ b/meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch
@@ -4,7 +4,7 @@ Date: Wed, 14 May 2014 21:19:41 +0000
 Subject: [PATCH] - verify: fix: broken logic for %ghost avoidance (Mark
  Hatle).
 
-Upstream-status: backport
+Upstream-Status: Backport
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 ---
diff --git a/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch b/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch
index f70766b..0853959 100644
--- a/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch
+++ b/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Add linux/aarch64/arch_regs.h
 It is missing from the tarball, but it is present in git for v4.10
 
 Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
-Upstream-status: Pending
+Upstream-Status: Pending
 ---
  linux/aarch64/arch_regs.h | 2 ++
  1 file changed, 2 insertions(+)
diff --git a/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch b/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch
index 12ad4c3..f8167cb 100644
--- a/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-supported.patch
@@ -1,4 +1,4 @@
-Upstream-status: Backport
+Upstream-Status: Backport
 
 r14566 | florian | 2014-09-24 17:02:54 -0500 (Wed, 24 Sep 2014) | 4 lines
 
diff --git a/meta/recipes-devtools/xmlto/xmlto-0.0.26/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch b/meta/recipes-devtools/xmlto/xmlto-0.0.26/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch
index 69ca432..6d547a6 100644
--- a/meta/recipes-devtools/xmlto/xmlto-0.0.26/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch
+++ b/meta/recipes-devtools/xmlto/xmlto-0.0.26/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch
@@ -3,7 +3,7 @@ configure.in: drop the test of xmllint and xsltproc
 The test is unnecessary, the xmllint and xsltproc were explicitly
 added to RDEPENDS.
 
-Upstream-Status: oe-specific
+Upstream-Status: Inappropriate
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  configure.in | 4 ++--
diff --git a/meta/recipes-extended/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
index b85a6a6..9a19876 100644
--- a/meta/recipes-extended/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ b/meta/recipes-extended/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all downstream
 projects will get it eventually. For now we apply the fix to
 coreutils
 
-Upstream-Status: Not Required
+Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-extended/cpio/cpio-2.11/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/cpio/cpio-2.11/0001-Unset-need_charset_alias-when-building-for-musl.patch
index 4979415..6ae2139 100644
--- a/meta/recipes-extended/cpio/cpio-2.11/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ b/meta/recipes-extended/cpio/cpio-2.11/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all downstream
 projects will get it eventually. For now we apply the fix to
 coreutils
 
-Upstream-Status: Not Required
+Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-extended/diffutils/diffutils-3.3/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/diffutils/diffutils-3.3/0001-Unset-need_charset_alias-when-building-for-musl.patch
index abdfa2a..ba1a4ba 100644
--- a/meta/recipes-extended/diffutils/diffutils-3.3/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ b/meta/recipes-extended/diffutils/diffutils-3.3/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all downstream
 projects will get it eventually. For now we apply the fix to
 coreutils
 
-Upstream-Status: Not Required
+Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-extended/findutils/findutils/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/findutils/findutils/0001-Unset-need_charset_alias-when-building-for-musl.patch
index 85d243b..8729e1b 100644
--- a/meta/recipes-extended/findutils/findutils/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ b/meta/recipes-extended/findutils/findutils/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all downstream
 projects will get it eventually. For now we apply the fix to
 coreutils
 
-Upstream-Status: Not Required
+Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-extended/grep/grep/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/grep/grep/0001-Unset-need_charset_alias-when-building-for-musl.patch
index abdfa2a..ba1a4ba 100644
--- a/meta/recipes-extended/grep/grep/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ b/meta/recipes-extended/grep/grep/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all downstream
 projects will get it eventually. For now we apply the fix to
 coreutils
 
-Upstream-Status: Not Required
+Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-extended/groff/groff-1.22.3/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/groff/groff-1.22.3/0001-Unset-need_charset_alias-when-building-for-musl.patch
index 0aaf701..b61b432 100644
--- a/meta/recipes-extended/groff/groff-1.22.3/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ b/meta/recipes-extended/groff/groff-1.22.3/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all downstream
 projects will get it eventually. For now we apply the fix to
 coreutils
 
-Upstream-Status: Not Required
+Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-extended/libaio/libaio/libaio_fix_for_mips_syscalls.patch b/meta/recipes-extended/libaio/libaio/libaio_fix_for_mips_syscalls.patch
index 022276a..9c6850c 100644
--- a/meta/recipes-extended/libaio/libaio/libaio_fix_for_mips_syscalls.patch
+++ b/meta/recipes-extended/libaio/libaio/libaio_fix_for_mips_syscalls.patch
@@ -1,4 +1,4 @@
-Upstream status: Inappropriate [embedded specific]
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Phil Staub <Phil.Staub@windriver.com>
 
diff --git a/meta/recipes-extended/mailx/files/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch b/meta/recipes-extended/mailx/files/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch
index 126f505..77da333 100644
--- a/meta/recipes-extended/mailx/files/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch
+++ b/meta/recipes-extended/mailx/files/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch
@@ -5,7 +5,7 @@ Subject: Don't reuse weak symbol optopt to fix FTBFS on mips*
 This patch is taken from 
 ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
 
-Upstream-status: Inappropriate [upstream is dead]
+Upstream-Status: Inappropriate [upstream is dead]
 ---
  getopt.c |   10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
diff --git a/meta/recipes-extended/mailx/files/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch b/meta/recipes-extended/mailx/files/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
index f70f8fc..6bad433 100644
--- a/meta/recipes-extended/mailx/files/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
+++ b/meta/recipes-extended/mailx/files/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
@@ -5,7 +5,7 @@ Subject: Patched out SSL2 support since it is no longer supported by OpenSSL.
 This patch is taken from
 ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
 
-Upstream-status: Inappropriate [upstream is dead]
+Upstream-Status: Inappropriate [upstream is dead]
 ---
  mailx.1   |    2 +-
  openssl.c |    4 +---
diff --git a/meta/recipes-extended/mailx/files/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch b/meta/recipes-extended/mailx/files/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch
index 0ee133a..13b73ae 100644
--- a/meta/recipes-extended/mailx/files/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch
+++ b/meta/recipes-extended/mailx/files/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch
@@ -5,7 +5,7 @@ Subject: Fixed Lintian warning (warning: macro `N' not defined)
 This patch is taken from
 ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
 
-Upstream-status: Inappropriate [upstream is dead]
+Upstream-Status: Inappropriate [upstream is dead]
 ---
  mailx.1 |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-extended/mailx/files/0011-outof-Introduce-expandaddr-flag.patch b/meta/recipes-extended/mailx/files/0011-outof-Introduce-expandaddr-flag.patch
index fdce13f..5d61645 100644
--- a/meta/recipes-extended/mailx/files/0011-outof-Introduce-expandaddr-flag.patch
+++ b/meta/recipes-extended/mailx/files/0011-outof-Introduce-expandaddr-flag.patch
@@ -12,7 +12,7 @@ a vulnerability in Heirloom mailx because this feature was documented.
 This patch is taken from
 ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
 
-Upstream-status: Inappropriate [upstream is dead]
+Upstream-Status: Inappropriate [upstream is dead]
 ---
  mailx.1 | 14 ++++++++++++++
  names.c |  3 +++
diff --git a/meta/recipes-extended/mailx/files/0012-unpack-Disable-option-processing-for-email-addresses.patch b/meta/recipes-extended/mailx/files/0012-unpack-Disable-option-processing-for-email-addresses.patch
index b51472f..8cdbfd8 100644
--- a/meta/recipes-extended/mailx/files/0012-unpack-Disable-option-processing-for-email-addresses.patch
+++ b/meta/recipes-extended/mailx/files/0012-unpack-Disable-option-processing-for-email-addresses.patch
@@ -7,7 +7,7 @@ Subject: [PATCH 2/4] unpack: Disable option processing for email addresses
 This patch is taken from
 ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
 
-Upstream-status: Inappropriate [upstream is dead]
+Upstream-Status: Inappropriate [upstream is dead]
 ---
  extern.h  | 2 +-
  names.c   | 8 ++++++--
diff --git a/meta/recipes-extended/mailx/files/0013-fio.c-Unconditionally-require-wordexp-support.patch b/meta/recipes-extended/mailx/files/0013-fio.c-Unconditionally-require-wordexp-support.patch
index 5bf3cdd..5558d86 100644
--- a/meta/recipes-extended/mailx/files/0013-fio.c-Unconditionally-require-wordexp-support.patch
+++ b/meta/recipes-extended/mailx/files/0013-fio.c-Unconditionally-require-wordexp-support.patch
@@ -6,7 +6,7 @@ Subject: [PATCH 3/4] fio.c: Unconditionally require wordexp support
 This patch is taken from
 ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
 
-Upstream-status: Inappropriate [upstream is dead]
+Upstream-Status: Inappropriate [upstream is dead]
 ---
  fio.c | 67 +++++--------------------------------------------------------------
  1 file changed, 5 insertions(+), 62 deletions(-)
diff --git a/meta/recipes-extended/mailx/files/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch b/meta/recipes-extended/mailx/files/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch
index 6f162ea..f65cfa8 100644
--- a/meta/recipes-extended/mailx/files/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch
+++ b/meta/recipes-extended/mailx/files/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch
@@ -6,7 +6,7 @@ Subject: [PATCH 4/4] globname: Invoke wordexp with WRDE_NOCMD (CVE-2004-2771)
 This patch is taken from
 ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
 
-Upstream-status: Inappropriate [upstream is dead]
+Upstream-Status: Inappropriate [upstream is dead]
 ---
  fio.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-extended/mailx/files/0015-usr-sbin-sendmail.patch b/meta/recipes-extended/mailx/files/0015-usr-sbin-sendmail.patch
index 7e33789..2b59914 100644
--- a/meta/recipes-extended/mailx/files/0015-usr-sbin-sendmail.patch
+++ b/meta/recipes-extended/mailx/files/0015-usr-sbin-sendmail.patch
@@ -10,7 +10,7 @@ Index: heirloom-mailx-12.5/Makefile
 This patch is taken from
 ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.debian.tar.xz
 
-Upstream-status: Inappropriate [upstream is dead]
+Upstream-Status: Inappropriate [upstream is dead]
 
 --- heirloom-mailx-12.5.orig/Makefile	2011-04-26 17:23:22.000000000 -0400
 +++ heirloom-mailx-12.5/Makefile	2015-01-27 13:20:04.733542801 -0500
diff --git a/meta/recipes-extended/mailx/files/explicitly.disable.krb5.support.patch b/meta/recipes-extended/mailx/files/explicitly.disable.krb5.support.patch
index 8c7178b..b74fd04 100644
--- a/meta/recipes-extended/mailx/files/explicitly.disable.krb5.support.patch
+++ b/meta/recipes-extended/mailx/files/explicitly.disable.krb5.support.patch
@@ -1,7 +1,7 @@
 krb5 support is autodetected from sysroot making builds undeterministic
 feel free to improve this to support explicitly enabling/disabling it
 
-Upstream-Status: Penging
+Upstream-Status: Pending
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
diff --git a/meta/recipes-extended/mc/mc/mc-CTRL.patch b/meta/recipes-extended/mc/mc/mc-CTRL.patch
index e23d9dd..ee4ba9f 100644
--- a/meta/recipes-extended/mc/mc/mc-CTRL.patch
+++ b/meta/recipes-extended/mc/mc/mc-CTRL.patch
@@ -15,7 +15,7 @@ Therefore this should be good to include in OpenEmbedded.
 
 Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
 
-Upstream-status: Accepted (should be included in v4.8.14)
+Upstream-Status: Accepted (should be included in v4.8.14)
 
 diff -u mc-4.8.1.7.org/lib/tty/tty-ncurses.c mc-4.8.1.7/lib/tty/tty-ncurses.c
 --- mc-4.8.1.7.org/lib/tty/tty-ncurses.c
diff --git a/meta/recipes-extended/parted/files/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/parted/files/0001-Unset-need_charset_alias-when-building-for-musl.patch
index abdfa2a..ba1a4ba 100644
--- a/meta/recipes-extended/parted/files/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ b/meta/recipes-extended/parted/files/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all downstream
 projects will get it eventually. For now we apply the fix to
 coreutils
 
-Upstream-Status: Not Required
+Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch b/meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch
index c0835e0..c8afcac 100644
--- a/meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch
+++ b/meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch
@@ -7,7 +7,7 @@ When building against musl libc, PATH_MAX is defined in <limits.h>.
 
 Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
 
-Upstream-status: Accepted (Should be in next release after 22.21)
+Upstream-Status: Accepted (Should be in next release after 22.21)
 ---
  src/pstree.c | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta/recipes-extended/sed/sed-4.2.2/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/sed/sed-4.2.2/0001-Unset-need_charset_alias-when-building-for-musl.patch
index abdfa2a..ba1a4ba 100644
--- a/meta/recipes-extended/sed/sed-4.2.2/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ b/meta/recipes-extended/sed/sed-4.2.2/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all downstream
 projects will get it eventually. For now we apply the fix to
 coreutils
 
-Upstream-Status: Not Required
+Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-extended/slang/slang/sprintf-bug-concerning-8-bit-characters.patch b/meta/recipes-extended/slang/slang/sprintf-bug-concerning-8-bit-characters.patch
index ddf5cce..5b637cb 100644
--- a/meta/recipes-extended/slang/slang/sprintf-bug-concerning-8-bit-characters.patch
+++ b/meta/recipes-extended/slang/slang/sprintf-bug-concerning-8-bit-characters.patch
@@ -1,4 +1,5 @@
-Upstream-Status: Backported
+Upstream-Status: Backport
+Signed-off-by: Marius Avram <marius.avram@intel.com>
 
 From 3a05d1a920140e9f2c72791c12f664213feb46df Mon Sep 17 00:00:00 2001
 From: Manfred Hanke <Manfred.Hanke@tngtech.com>
diff --git a/meta/recipes-extended/texinfo/texinfo-4.8/check-locale-h.patch b/meta/recipes-extended/texinfo/texinfo-4.8/check-locale-h.patch
index 4a8cc57..f4d6660 100644
--- a/meta/recipes-extended/texinfo/texinfo-4.8/check-locale-h.patch
+++ b/meta/recipes-extended/texinfo/texinfo-4.8/check-locale-h.patch
@@ -1,6 +1,6 @@
 fix the macro check
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 configure does not check if locale.h exists, but check setlocale,
 if setlocale exist, the locale.h should exist.
diff --git a/meta/recipes-extended/texinfo/texinfo-4.8/do-compile-native-tools.patch b/meta/recipes-extended/texinfo/texinfo-4.8/do-compile-native-tools.patch
index 2cc5fbb..81ebe26 100644
--- a/meta/recipes-extended/texinfo/texinfo-4.8/do-compile-native-tools.patch
+++ b/meta/recipes-extended/texinfo/texinfo-4.8/do-compile-native-tools.patch
@@ -3,7 +3,7 @@ From: "Roy.Li" <rongqing.li@windriver.com>
 Date: Wed, 10 Sep 2014 17:03:29 +0800
 Subject: [PATCH] do not compile host tools, since we have native
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
 ---
diff --git a/meta/recipes-extended/texinfo/texinfo-4.8/using-native-makeinfo.patch b/meta/recipes-extended/texinfo/texinfo-4.8/using-native-makeinfo.patch
index d9bed69..2297051 100644
--- a/meta/recipes-extended/texinfo/texinfo-4.8/using-native-makeinfo.patch
+++ b/meta/recipes-extended/texinfo/texinfo-4.8/using-native-makeinfo.patch
@@ -3,7 +3,7 @@ From: "Roy.Li" <rongqing.li@windriver.com>
 Date: Wed, 10 Sep 2014 17:10:03 +0800
 Subject: [PATCH] using native makeinfo
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
 ---
diff --git a/meta/recipes-extended/texinfo/texinfo/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/texinfo/texinfo/0001-Unset-need_charset_alias-when-building-for-musl.patch
index 6ea6380..c7338aa 100644
--- a/meta/recipes-extended/texinfo/texinfo/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ b/meta/recipes-extended/texinfo/texinfo/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all downstream
 projects will get it eventually. For now we apply the fix to
 coreutils
 
-Upstream-Status: Not Required
+Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-extended/wget/wget/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/wget/wget/0001-Unset-need_charset_alias-when-building-for-musl.patch
index c1cbd14..0b3c6f5 100644
--- a/meta/recipes-extended/wget/wget/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ b/meta/recipes-extended/wget/wget/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all downstream
 projects will get it eventually. For now we apply the fix to
 coreutils
 
-Upstream-Status: Not Required
+Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-extended/xdg-utils/xdg-utils/0001-Reinstate-xdg-terminal.patch b/meta/recipes-extended/xdg-utils/xdg-utils/0001-Reinstate-xdg-terminal.patch
index 6d5cc2f..4cd1baf 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils/0001-Reinstate-xdg-terminal.patch
+++ b/meta/recipes-extended/xdg-utils/xdg-utils/0001-Reinstate-xdg-terminal.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Reinstate xdg-terminal
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 
-Upstream-status: Inappropriate [Revert]
+Upstream-Status: Inappropriate [Revert]
 ---
  scripts/Makefile.in  |   6 +-
  scripts/xdg-terminal | 622 +++++++++++++++++++++++++++++++++++++++++++++++++++
diff --git a/meta/recipes-graphics/clutter/clutter-1.0/run-installed-tests-with-tap-output.patch b/meta/recipes-graphics/clutter/clutter-1.0/run-installed-tests-with-tap-output.patch
index 86d841b..f5c18c5 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0/run-installed-tests-with-tap-output.patch
+++ b/meta/recipes-graphics/clutter/clutter-1.0/run-installed-tests-with-tap-output.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Run installed tests with tap output
 Configure output from installed-tests to be TAP compliant such that
 gnome-desktop-testing-runner properly interprets the results.
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Tim Orling <TicoTimo@gmail.com>
 ---
diff --git a/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch b/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
index a2f3409..fca1e65 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
+++ b/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig.patch
@@ -5,7 +5,7 @@ we end up with -I <sysroot>/<sysroot>/usr/include/fontconfig in CFLAGS of client
 is matchbox-panel-2 and it was working fine with gcc < 5 because it tolerated non-existing paths in -I flags but gcc-5
 gently refuses and rightly so.
 
-Upstream-Status: Not-Submitted [OE-Specific]
+Upstream-Status: Inappropriate [OE-Specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Index: fontconfig-2.11.93/fontconfig.pc.in
diff --git a/meta/recipes-graphics/libepoxy/libepoxy/no-need-for-python3.patch b/meta/recipes-graphics/libepoxy/libepoxy/no-need-for-python3.patch
index dc5ef28..4b8fea5 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy/no-need-for-python3.patch
+++ b/meta/recipes-graphics/libepoxy/libepoxy/no-need-for-python3.patch
@@ -1,7 +1,7 @@
 There is no need to use python3 by this package (the python scripts
 that are using during configuration only need python2.7+)
 
-Upstream-Status: innapropriate [configuration]
+Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Gary Thomas <gary@mlbassoc.com>
 --
diff --git a/meta/recipes-kernel/libpfm/files/0001-Makefile-Add-LDFLAGS-variable-to-SLDFLAGS.patch b/meta/recipes-kernel/libpfm/files/0001-Makefile-Add-LDFLAGS-variable-to-SLDFLAGS.patch
index be58706..d59a7f7 100644
--- a/meta/recipes-kernel/libpfm/files/0001-Makefile-Add-LDFLAGS-variable-to-SLDFLAGS.patch
+++ b/meta/recipes-kernel/libpfm/files/0001-Makefile-Add-LDFLAGS-variable-to-SLDFLAGS.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Makefile: Add LDFLAGS variable to SLDFLAGS.
 * Add LDFLAGS variable to SLDFLAGS so that extra linker
   flags can be sent via this variable.
 
-Upstream status Sumbitted [perfmon2-libpfm4-commits@lists.sourceforge.net]
+Upstream-Status: Submitted [perfmon2-libpfm4-commits@lists.sourceforge.net]
 
 Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
 ---
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compatibility.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compatibility.patch
index 0789e9f..320db6a 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compatibility.patch
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compatibility.patch
@@ -3,7 +3,7 @@ trace-cmd: Add blktrace_api compatibility for TC_BARRIER
 Newer kernels replace TC_BARRIER with TC_FLUSH. Ensure trace-cmd
 can build regardless of the linux-kernel-headers version.
 
-Upstream-Status: Innapropriate [Stop gap]
+Upstream-Status: Inappropriate [Stop gap]
 
 Signed-off-by: Darren Hart <dvhart@linux.intel.com>
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event-if.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event-if.patch
index 0407a30..aa55de1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event-if.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event-if.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] ENGR00312034: do not change eos event to gap event if no
 
 https://bugzilla.gnome.org/show_bug.cgi?id=727074
 
-Upstream Status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: zhouming <b42586@freescale.com>
 ---
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch
index 0fc561c..284abbe 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
 
 https://bugzilla.gnome.org/show_bug.cgi?id=728312
 
-Upstream Status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: zhouming <b42586@freescale.com>
 ---
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/taglist-not-send-to-down-stream-if-all-the-frame-cor.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
index 51fdc7e..62a52b0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] taglist not send to down stream if all the frame corrupted
 
 https://bugzilla.gnome.org/show_bug.cgi?id=737246
 
-Upstream status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Jian Li <lj.qfy.sh@gmail.com>
 ---
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch
index 53147df..d1973d4 100755
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] gstrtpmp4gpay: set dafault value for MPEG4 without codec
 
 https://bugzilla.gnome.org/show_bug.cgi?id=734263
 
-Upstream Status: Submitted
+Upstream-Status: Submitted
 
 Signed-off-by: Song Bing <b06498@freescale.com>
 ---
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/decrease_asteriskh263_rank.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/decrease_asteriskh263_rank.patch
index 7f94f50..288631b 100755
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/decrease_asteriskh263_rank.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/decrease_asteriskh263_rank.patch
@@ -8,7 +8,7 @@ Decrease the rank as we havn't this kind of decoder.
 
 https://bugzilla.gnome.org/show_bug.cgi?id=739935
 
-Upstream Status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Song Bing <b06498@freescale.com>
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch
index b6edda1..1505cbe 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch
@@ -23,7 +23,7 @@ rewind in slow speed, such as -2X.
 
 https://bugzilla.gnome.org/show_bug.cgi?id=749258
 
-Upstream-Status: Backport [1.5.1]
+Upstream-Status: Backport [1.5.1]
 ---
  libs/gst/base/gstbasesink.c |   26 ++++++++++++++++++++++----
  1 file changed, 22 insertions(+), 4 deletions(-)
diff --git a/meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch b/meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch
index 770d8f6..d3cb43b 100644
--- a/meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch
+++ b/meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch
@@ -1,7 +1,7 @@
 Obey LDFLAGS
 
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Upstream-status: Inappropriate [old version]
+Upstream-Status: Inappropriate [old version]
 
 --- gdbm-1.8.3.orig/Makefile.in
 +++ gdbm-1.8.3/Makefile.in
diff --git a/meta/recipes-support/gnupg/gnupg/pkgconfig.patch b/meta/recipes-support/gnupg/gnupg/pkgconfig.patch
index 5e036ba..f958603 100644
--- a/meta/recipes-support/gnupg/gnupg/pkgconfig.patch
+++ b/meta/recipes-support/gnupg/gnupg/pkgconfig.patch
@@ -1,6 +1,6 @@
 Use pkg-config to find pth instead of pth-config.
 
-Upstream-Status: Rejected
+Upstream-Status: Denied
 [not submitted but they've been clear they don't want a pkg-config dependency]
 
 RP 2014/5/22
diff --git a/meta/recipes-support/gpgme/gpgme/pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/pkgconfig.patch
index f79e865..e2f1f4f 100644
--- a/meta/recipes-support/gpgme/gpgme/pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/pkgconfig.patch
@@ -1,7 +1,7 @@
 Update gpgme to use pkgconfig instead of -config files since its
 simpler and less error prone when cross compiling.
 
-Upstream-Status: Rejected [Upstream not interested in pkg-config support]
+Upstream-Status: Denied [Upstream not interested in pkg-config support]
 RP 2015/4/17
 
 diff --git a/configure.ac b/configure.ac
diff --git a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
index f130d85..b6ccdda 100644
--- a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
@@ -2,7 +2,7 @@ Add pkgconfig support to libassuan.
 This patch is rejected by upstream for the reason below:
 They think pkgconfig adds no portability and maintaining them is not worthwhile.
 
-Upstream-Status: Rejected
+Upstream-Status: Denied
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
diff --git a/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch b/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch
index 82c93bd..67ddfc6 100644
--- a/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch
+++ b/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch
@@ -1,6 +1,6 @@
 Add and use pkg-config for libgcrypt instead of -config scripts.
 
-Upstream-Status: Rejected [upstream have indicated they don't want a pkg-config dependency]
+Upstream-Status: Denied [upstream have indicated they don't want a pkg-config dependency]
 
 RP 2014/5/22
 
diff --git a/meta/recipes-support/libgcrypt/files/fix-ICE-failure-on-mips-with-option-O-and-g.patch b/meta/recipes-support/libgcrypt/files/fix-ICE-failure-on-mips-with-option-O-and-g.patch
index 56c591f..582e62f 100644
--- a/meta/recipes-support/libgcrypt/files/fix-ICE-failure-on-mips-with-option-O-and-g.patch
+++ b/meta/recipes-support/libgcrypt/files/fix-ICE-failure-on-mips-with-option-O-and-g.patch
@@ -37,7 +37,7 @@ than 2.
 4. File a bug to GNU, but it could not be reproduced on there environment.
 http://gcc.gnu.org/bugzilla/show_bug.cgi?id=60643
 
-Upstream-Status: [oe specific]
+Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
index 0f136fd..b5886c5 100644
--- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Rejected
+Upstream-Status: Denied
 
 Add pkgconfig support to libksba.
 This patch is rejected by upstream for the reason below:
diff --git a/meta/recipes-support/libunistring/libunistring/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-support/libunistring/libunistring/0001-Unset-need_charset_alias-when-building-for-musl.patch
index a62194b..2aeacb8 100644
--- a/meta/recipes-support/libunistring/libunistring/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ b/meta/recipes-support/libunistring/libunistring/0001-Unset-need_charset_alias-when-building-for-musl.patch
@@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all downstream
 projects will get it eventually. For now we apply the fix to
 coreutils
 
-Upstream-Status: Not Required
+Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-support/lzop/lzop/x32_abi_miniacc_h.patch b/meta/recipes-support/lzop/lzop/x32_abi_miniacc_h.patch
index 527589f..739be82 100644
--- a/meta/recipes-support/lzop/lzop/x32_abi_miniacc_h.patch
+++ b/meta/recipes-support/lzop/lzop/x32_abi_miniacc_h.patch
@@ -4,7 +4,7 @@ x32 ABI requires to have 64-bit variable to store FLAGS register
 instead of size_t that is 32-bit variable, this fix operand
 type mismatch when try to pop previous pushf value.
 
-Upstream-status: Submitted
+Upstream-Status: Submitted
 
 Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
 
diff --git a/meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch b/meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch
index a76560a..459f5e3 100644
--- a/meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch
+++ b/meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch
@@ -1,6 +1,6 @@
 replace deprecated GnuTLS functions with newer ones if available 
 
-Upstream Status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Armin Kuster <akuster808@gmail.com>
 
diff --git a/meta/recipes-support/npth/npth/pkgconfig.patch b/meta/recipes-support/npth/npth/pkgconfig.patch
index 178ed54..b6a12e7 100644
--- a/meta/recipes-support/npth/npth/pkgconfig.patch
+++ b/meta/recipes-support/npth/npth/pkgconfig.patch
@@ -1,6 +1,6 @@
 Added npth pkgconfig file
 
-Upstream-Status: Incompatible [oe-core specific]
+Upstream-Status: Pending
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
-- 
2.3.2 (Apple Git-55)


