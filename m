Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1959E7328A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 16:46:49 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id i5so8904884pag.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 09:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2jc8Z8w5KL3Ff39Y63hL2AeWzoAEx4Wf/j5npN4tV1I=;
	b=dRJIby/K0BT4Mcw3PQihGWuwQOFFiir/LT6tdra5AfVPP/mqr/l7CS2VE9jjpA68dO
	WW0UFfCF4uS8B7SIOSQ6nxh8YeJw5LPgK2Rue7iyFsYnhKj7zFb0v7XG6bcp0ngr+jJn
	Qc8+k8KahSQASz7G4X8i/U0xCStJU2wjQRoFQX0o6dZTjFfOD/kyDkk5F5ub79frk4Pw
	3n2RlJ1b/z8pTMwf77PDTZR5nRdO3tvcrnBVLDQqW/Dl7eyFcA+7ND0Lmj+rTVssW8+3
	Ok0X20eFTgh8pyH5E5jC5BzLDKYkgX+GPEi8nV424Ifh5Cu4Szk6psDM3vDaoFAF5U66
	FzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2jc8Z8w5KL3Ff39Y63hL2AeWzoAEx4Wf/j5npN4tV1I=;
	b=DD9Rm+wOPbVvQjIhn/Pp01rBYhFnlDDOHWL2RTORexKdUyeJoYjYiE3LORkwrrMl6D
	fKGOj076yqbWqjjzHCl4HcS+lEwhCXWMg/ltPwRl059sb80sVVZBF+cWS/7RTvr2Ilqr
	4sHd9zCKUgKipUiJuupwG8JSahHwe2MrUT+H2FEyV777aBNpW8uOrsyr96xWfHwNk4XB
	1r+SqO/lWXHjoaryb2xF5i0zwGMOHNdteu0q3Qh6VHGXpwrwmBqSqIqqMY1lwpe7uwpf
	NDbcPx9Kk94trYlE+VQiVt4x0+7q8OtjqAfQYPbuvqY7PDHUtfddMU/7JZJXxVArrAC6
	xjQg==
X-Gm-Message-State: AOPr4FXxW+FIvWH20Qph9/D+euhbq3vwX4sAun+mPiNxC/x/P5UpkOJlyS2lMd5Y+mnMRg==
X-Received: by 10.66.194.196 with SMTP id hy4mr24613435pac.43.1463158010490;
	Fri, 13 May 2016 09:46:50 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	b27sm28614242pfc.74.2016.05.13.09.46.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 May 2016 09:46:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2016 09:46:44 -0700
Message-Id: <cover.1463157783.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
MIME-Version: 1.0
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [PATCH 0/6] Glibc/gdb upgrade switch to gcc-6 as default
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
X-List-Received-Date: Fri, 13 May 2016 16:46:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is essentially v2 of the gcc-6 series for remaining patches
Fixes linux-yocto to build with gcc-6
Adds recipes for glibc-2.24 and gdb 7.11
Python native fix to add native expat dependency that OE builds

feature-arm-vfp.inc fixes build breakage seen on rpi

Finally switch to using gcc-6/glibc-2.24/gdb-7.11 as default


André Draszik (1):
  feature-arm-vfp.inc: fix overzealous ARMPKGSFX_FPU modification

Bruce Ashfield (1):
  linux-yocto/4.4: gcc6 build fixes (powerpc and mips)

Khem Raj (4):
  glibc: Add recipes for 2.24 release
  python-native: Point to expat in native sysroot and add missing dep on
    expat-native
  gdb: Upgrade to 7.11
  tcmode-default: Bump gcc,glibc,gdb

 meta/conf/distro/include/tcmode-default.inc        |  6 +--
 meta/conf/machine/include/arm/feature-arm-vfp.inc  |  2 +-
 .../fix_for_centos_5.8.patch                       | 18 --------
 ...tive_2.23.bb => cross-localedef-native_2.24.bb} | 18 ++++----
 ...glibc-initial_2.23.bb => glibc-initial_2.24.bb} |  0
 .../{glibc-locale_2.23.bb => glibc-locale_2.24.bb} |  0
 .../{glibc-mtrace_2.23.bb => glibc-mtrace_2.24.bb} |  0
 ...glibc-scripts_2.23.bb => glibc-scripts_2.24.bb} |  0
 ...libc-Look-for-host-system-ld.so.cache-as-.patch |  8 ++--
 ...libc-Fix-buffer-overrun-with-a-relocated-.patch |  8 ++--
 ...libc-Raise-the-size-of-arrays-containing-.patch | 34 ++++++---------
 ...ivesdk-glibc-Allow-64-bit-atomics-for-x86.patch | 10 +++--
 ...500-e5500-e6500-603e-fsqrt-implementation.patch |  6 +--
 ...-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch |  8 ++--
 ...-Fix-undefined-reference-to-__sqrt_finite.patch |  6 +--
 ...qrt-f-are-now-inline-functions-and-call-o.patch |  6 +--
 ...bug-1443-which-explains-what-the-patch-do.patch |  8 ++--
 ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch | 10 ++---
 ...qrt-f-are-now-inline-functions-and-call-o.patch |  6 +--
 ...ersion-output-matching-grok-gold-s-output.patch | 14 +++----
 ...-configure.ac-handle-correctly-libc_cv_ro.patch |  6 +--
 .../glibc/glibc/0014-Add-unused-attribute.patch    |  8 ++--
 ...thin-the-path-sets-wrong-config-variables.patch | 10 ++---
 ...-timezone-re-written-tzselect-as-posix-sh.patch | 16 ++++----
 ...move-bash-dependency-for-nscd-init-script.patch |  8 ++--
 ...c-Cross-building-and-testing-instructions.patch |  6 +--
 ...019-eglibc-Help-bootstrap-cross-toolchain.patch |  8 ++--
 .../glibc/0020-eglibc-cherry-picked-from.patch     | 18 ++++----
 .../0021-eglibc-Clear-cache-lines-on-ppc8xx.patch  | 10 ++---
 ...0022-eglibc-Resolve-__fpscr_values-on-SH4.patch |  8 ++--
 .../glibc/0023-eglibc-Install-PIC-archives.patch   |  8 ++--
 ...ard-port-cross-locale-generation-support.patch} | 30 +++++++-------
 ...0025-Define-DUMMY_LOCALE_T-if-not-defined.patch | 32 +++++++++++++++
 ...ing-SSE-make-sure-fpmath-is-not-set-to-us.patch | 48 ----------------------
 .../glibc/{glibc_2.23.bb => glibc_2.24.bb}         | 12 +++---
 .../gdb/{gdb-7.10.1.inc => gdb-7.11.inc}           |  0
 meta/recipes-devtools/gdb/gdb-common.inc           | 20 +++++++--
 ...nadian_7.10.1.bb => gdb-cross-canadian_7.11.bb} |  0
 meta/recipes-devtools/gdb/gdb-cross_7.10.1.bb      |  4 --
 meta/recipes-devtools/gdb/gdb-cross_7.11.bb        |  2 +
 meta/recipes-devtools/gdb/gdb.inc                  | 10 -----
 .../gdb/0001-include-sys-types.h-for-mode_t.patch  | 10 ++---
 ...002-make-man-install-relative-to-DESTDIR.patch} |  8 ++--
 ...-linux-nat-Define-_ABIO32-if-not-defined.patch} |  8 ++--
 ...efine-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch} | 11 ++---
 ...-support-for-Renesas-SH-sh4-architecture.patch} | 32 +++++++--------
 ...-libreadline.a-when-using-disable-static.patch} | 21 ++++++++--
 ...gidefs.h.patch => 0007-use-asm-sgidefs.h.patch} | 15 +++----
 ...0008-Use-exorted-definitions-of-SIGRTMIN.patch} | 44 +++++++++-----------
 ...AGS.patch => 0009-Change-order-of-CFLAGS.patch} | 18 ++++----
 .../0010-resolve-restrict-keyword-conflict.patch   | 48 ++++++++++++++++++++++
 .../gdb/{gdb_7.10.1.bb => gdb_7.11.bb}             |  1 +
 .../python/python-native_2.7.11.bb                 |  4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |  4 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |  4 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 18 ++++----
 56 files changed, 346 insertions(+), 332 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/cross-localedef-native/fix_for_centos_5.8.patch
 rename meta/recipes-core/glibc/{cross-localedef-native_2.23.bb => cross-localedef-native_2.24.bb} (84%)
 rename meta/recipes-core/glibc/{glibc-initial_2.23.bb => glibc-initial_2.24.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-locale_2.23.bb => glibc-locale_2.24.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.23.bb => glibc-mtrace_2.24.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.23.bb => glibc-scripts_2.24.bb} (100%)
 rename meta/recipes-core/glibc/glibc/{0025-eglibc-Forward-port-cross-locale-generation-support.patch => 0024-eglibc-Forward-port-cross-locale-generation-support.patch} (97%)
 create mode 100644 meta/recipes-core/glibc/glibc/0025-Define-DUMMY_LOCALE_T-if-not-defined.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0026-When-disabling-SSE-make-sure-fpmath-is-not-set-to-us.patch
 rename meta/recipes-core/glibc/{glibc_2.23.bb => glibc_2.24.bb} (93%)
 rename meta/recipes-devtools/gdb/{gdb-7.10.1.inc => gdb-7.11.inc} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.10.1.bb => gdb-cross-canadian_7.11.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb-cross_7.10.1.bb
 create mode 100644 meta/recipes-devtools/gdb/gdb-cross_7.11.bb
 rename meta/recipes-devtools/gdb/gdb/{0001-make-man-install-relative-to-DESTDIR.patch => 0002-make-man-install-relative-to-DESTDIR.patch} (78%)
 rename meta/recipes-devtools/gdb/gdb/{0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch => 0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch} (84%)
 rename meta/recipes-devtools/gdb/gdb/{0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch => 0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch} (83%)
 rename meta/recipes-devtools/gdb/gdb/{0003-Add-support-for-Renesas-SH-sh4-architecture.patch => 0005-Add-support-for-Renesas-SH-sh4-architecture.patch} (97%)
 rename meta/recipes-devtools/gdb/gdb/{force-readline-static.patch => 0006-Dont-disable-libreadline.a-when-using-disable-static.patch} (67%)
 rename meta/recipes-devtools/gdb/gdb/{0001-use-asm-sgidefs.h.patch => 0007-use-asm-sgidefs.h.patch} (69%)
 rename meta/recipes-devtools/gdb/gdb/{0001-Use-exported-definitions-of-SIGRTMIN.patch => 0008-Use-exorted-definitions-of-SIGRTMIN.patch} (49%)
 rename meta/recipes-devtools/gdb/gdb/{0002-Change-order-of-CFLAGS.patch => 0009-Change-order-of-CFLAGS.patch} (69%)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0010-resolve-restrict-keyword-conflict.patch
 rename meta/recipes-devtools/gdb/{gdb_7.10.1.bb => gdb_7.11.bb} (89%)

-- 
2.8.2


