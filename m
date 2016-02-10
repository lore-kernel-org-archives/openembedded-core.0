Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 63D9173170
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 17:43:30 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id b35so1745722qge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 09:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=IdCOk/d1RtjVZGBAmoFbJvvC5NmjGZl2bj/v26mCGXE=;
	b=aF5raNmfGwLTYuyX02GChc11pB5mPl2BpnnoNyuhBIX86qvTBHU+b785ZJYhHx5+CZ
	jSqdIsm5cNAOAthvgu9om9tGrY0ADf0XR4MvBrUy8CVh92ftIEDu+09tylVtkYKqKobd
	E7c1Qzdf9W60KRI5VoVyn13fCIPRkCOUiYhEK+1QrvL4w/xaU94wQ78YYsIc/u0ntX4m
	dP96Z/bzDpKM0QRJdaclb2nSn3ZU/tmY09YF/TVy+tmvqAnKr3F4H5ugPioOSehNhAFr
	Szs9tLPFI7Cnz7usUE/YBu1zPONdV/huuxwmEN3k/7B4KKFaayNadHxXON0sKnqGXGGu
	VkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IdCOk/d1RtjVZGBAmoFbJvvC5NmjGZl2bj/v26mCGXE=;
	b=Wy+GJ0I/Pxi2x8tQ53uKI1uWjvKm5sE+TBq1rRxQ++VYvzckmqXgF/FkpIHlh9Ql06
	GBTaEmv6stHoJwoYSJAXZ0zoG4pYApyJ82egnjSQa/SqI7Viw630WL1pmIcZLGQl+kbE
	bwxFY6UAd5wb+Pn9h1vBeZ3rf+8pe+ttY57ZUTDMQHA4p0uU2D0RRKcY5NPJfXNZOaeG
	KOHzIdkyu990JKTlnGz386cg2b2sRJKfeUoHAiNveLpBz20Q3Uag/4XIa0UxF6lrH/iy
	gTKYyx9jyJsyCUDxjcSq/NQ7F1jIsdL1Ae2lTOBcnlTUAoGfqTxASOvxVbVyT7KPIo65
	ceXw==
X-Gm-Message-State: AG10YOQy7inAlBgLoICXNhl1EJBbFUY1xpBbz2QkhLQa7F8w7rZLQDNpnbqnGEN7eYZtgQ==
X-Received: by 10.140.253.2 with SMTP id y2mr53574254qhc.89.1455126210651;
	Wed, 10 Feb 2016 09:43:30 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	n24sm1723082qkl.17.2016.02.10.09.43.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 09:43:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 17:43:25 +0000
Message-Id: <cover.1455126045.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH 0/9] Upgrade uclibc/musl to latest
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
X-List-Received-Date: Wed, 10 Feb 2016 17:43:30 -0000

ltp upgrade is prerequisite for glibc 2.23
patches to fix more musl recipes
distutils patch to let pythonic recipes work with devtool

The following changes since commit 8092aa8ff63d9b2016bff138ec05ceb0d0155869:

  ptest-runner: Explicitly set EXTRA_OEMAKE as required (2016-02-10 15:51:05 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/pu

Andre McCurdy (4):
  strace: build fix for MIPS + musl libc
  gdb: build fix for MIPS + musl libc
  gdb: drop unnecessary CC_FOR_BUILD etc exports
  nettle.inc: drop duplicate LIC_FILES_CHKSUM and SRC_URI hashes

Khem Raj (4):
  distutils: Consider S != B case
  ltp: Upgrade to 20160126 and fix build on musl
  musl: Upgrade to tip of tree
  uclibc-ng: Bump up to 1.0.12 release

Ross Burton (1):
  uclibc: fetch from master branch not 1.0

 meta/classes/distutils.bbclass                     |  27 +-
 meta/classes/distutils3.bbclass                    |  26 +-
 meta/recipes-core/musl/musl_git.bb                 |   2 +-
 meta/recipes-core/uclibc/uclibc-git.inc            |   6 +-
 meta/recipes-devtools/gdb/gdb-common.inc           |   7 +-
 meta/recipes-devtools/gdb/gdb.inc                  |   1 +
 .../gdb/gdb/0001-use-asm-sgidefs.h.patch           |  35 ++
 .../strace/strace/use-asm-sgidefs.h.patch          |  51 +++
 meta/recipes-devtools/strace/strace_4.11.bb        |   1 +
 .../ltp/ltp/0001-Fix-compilation-for-gcc-5.x.patch |  79 -----
 ...tests_noltp.sh-script-so-have-unique-name.patch | 202 -----------
 ...tch => 0001-ltp-Don-t-link-against-libfl.patch} |  11 +-
 ...-control-whether-numa-support-should-be-c.patch |  43 +++
 ...> 0003-Add-knob-to-control-tirpc-support.patch} |  20 +-
 ...-Add-option-to-select-libc-implementation.patch | 147 ++++++++
 ...rollers-Link-with-libfts-explicitly-on-mu.patch |  45 +++
 ...sendfile-Use-off64_t-instead-of-__off64_t.patch |  31 ++
 .../ltp/ltp/0007-replace-SIGCLD-with-SIGCHLD.patch | 394 +++++++++++++++++++++
 ...__GLIBC_PREREQ-is-defined-before-using-it.patch | 279 +++++++++++++++
 .../ltp/0009-Guard-error.h-with-__GLIBC__.patch    | 270 ++++++++++++++
 ...010-replace-__BEGIN_DECLS-and-__END_DECLS.patch |  73 ++++
 .../0011-Rename-sigset-variable-to-sigset1.patch   | 136 +++++++
 ...fsstress.c-Replace-__int64_t-with-int64_t.patch | 351 ++++++++++++++++++
 ...nclude-fcntl.h-for-getting-O_-definitions.patch |  67 ++++
 ...ing-Include-sys-types.h-for-pid_t-definit.patch |  56 +++
 ...015-mincore01-Rename-PAGESIZE-to-pagesize.patch |  64 ++++
 ...Change-header-from-ustat.h-to-sys-ustat.h.patch |  45 +++
 .../0017-replace-sigval_t-with-union-sigval.patch  |  88 +++++
 .../ltp/0018-guard-mallocopt-with-__GLIBC__.patch  |  32 ++
 ...lace-canonicalize_file_name-with-realpath.patch |  32 ++
 ...define-getdents-getdents64-only-for-glibc.patch |  48 +++
 ..._GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch |  71 ++++
 .../ltp/ltp/0022-include-sys-types.h.patch         |  29 ++
 ...-Use-int-instead-of-enum-__ptrace_request.patch |  48 +++
 ...gaction-rt_sigprocmark-Define-_GNU_SOURCE.patch |  68 ++++
 .../ltp/0025-mc_gethost-include-sys-types.h.patch  |  28 ++
 .../ltp/ltp/0026-crash01-Define-_GNU_SOURCE.patch  |  29 ++
 ...sconf01-Use-_SC_2_C_VERSION-conditionally.patch |  29 ++
 ...n.h-Use-sighandler_t-instead-of-__sighand.patch |  43 +++
 .../ltp/0029-trace_shed-Fix-build-with-musl.patch  |  32 ++
 ...READ_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch |  33 ++
 ...ge-size-offset-as-per-page-size-alignmen.patch} |  17 +-
 ...-regen.sh-Include-asm-unistd.h-explicitly.patch |  30 ++
 .../ltp/ltp/add-knob-for-numa.patch                |  39 --
 .../ltp/ltp/make-setregid02-work.patch             |  61 ----
 .../ltp/{ltp_20150903.bb => ltp_20160126.bb}       |  44 ++-
 meta/recipes-support/nettle/nettle.inc             |  12 +-
 47 files changed, 2835 insertions(+), 447 deletions(-)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-use-asm-sgidefs.h.patch
 create mode 100644 meta/recipes-devtools/strace/strace/use-asm-sgidefs.h.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-Fix-compilation-for-gcc-5.x.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch
 rename meta/recipes-extended/ltp/ltp/{ltp-Do-not-link-against-libfl.patch => 0001-ltp-Don-t-link-against-libfl.patch} (76%)
 create mode 100644 meta/recipes-extended/ltp/ltp/0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
 rename meta/recipes-extended/ltp/ltp/{add-knob-for-tirpc.patch => 0003-Add-knob-to-control-tirpc-support.patch} (54%)
 create mode 100644 meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0006-sendfile-Use-off64_t-instead-of-__off64_t.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0007-replace-SIGCLD-with-SIGCHLD.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0009-Guard-error.h-with-__GLIBC__.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0012-fsstress.c-Replace-__int64_t-with-int64_t.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0013-include-fcntl.h-for-getting-O_-definitions.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0015-mincore01-Rename-PAGESIZE-to-pagesize.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0017-replace-sigval_t-with-union-sigval.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0018-guard-mallocopt-with-__GLIBC__.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0020-getdents-define-getdents-getdents64-only-for-glibc.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0022-include-sys-types.h.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0025-mc_gethost-include-sys-types.h.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0026-crash01-Define-_GNU_SOURCE.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0029-trace_shed-Fix-build-with-musl.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
 rename meta/recipes-extended/ltp/ltp/{0001-ltp-vma03-fix-the-alginment-of-page-size.patch => 0031-vma03-fix-page-size-offset-as-per-page-size-alignmen.patch} (71%)
 create mode 100644 meta/recipes-extended/ltp/ltp/0032-regen.sh-Include-asm-unistd.h-explicitly.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/add-knob-for-numa.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/make-setregid02-work.patch
 rename meta/recipes-extended/ltp/{ltp_20150903.bb => ltp_20160126.bb} (60%)

-- 
2.7.1


