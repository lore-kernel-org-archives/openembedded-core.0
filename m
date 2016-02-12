Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id A8203731C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 09:53:32 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id b35so58250270qge.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 01:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hC+qda5DvVE96wnzjPkmpDjPdXsnjzw54OGSW2yFgNk=;
	b=qc2iS7FfCcAgpy5UUmA40njDeULNZtnvm4+sq1Am27EqMcuQLfflGPgFhQqqoqVU10
	YVUB+PPLPq99NXhjKE09Os7W1i9yk2HYhs40iFabEfhTjaUnJxm745byJsLw8jg183bu
	RWLQTPxd9AR5EhH2foiIIuWeaLndk0JgUchwiB50myM5lNe8KQ/zMps7JNSvgRm8nLH4
	aHyE83DTZ5cjXGXUwkjSkdARbCZzWCE5yTrNBuCL0pdw2VOAPhPedxzzZQqoTr4B/ZhL
	l/4rM2ODaNvS5sNkZdAUWjHnhZdHKg1+NgMZ88FPaiRXBX8xJiYTiXKEAzP3KsYVOlQt
	Ta1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hC+qda5DvVE96wnzjPkmpDjPdXsnjzw54OGSW2yFgNk=;
	b=nI+q93aEkIz+qK2g/tToZ5imc7dMoxL2L4utw2Lv9ULKJGFM2vFeEdtlBjoEOei09T
	eH3gEdpvG3+sJ9mJ+Iq31LjI8mCtTa6x6LsWsgdMsvDa2umVHBtY1XVyH9zMymR+bOk5
	ybllivzk6bONrTgYRarEiRsSkFpif5DWgmZo2TO0CpD6HjzAoVNQc0Iyune0ydEdLkpP
	Vs85Uo7Izk228zW5nDAGChnw4xxn5DFKgO95hSAnGbKfb3fg28oI7JXTmr9J/NhjBZ2h
	LGbCnjrGZfjwpP7C1lHDLbxB+8szVbaiG8tfVYNQgABwsHzKKB5MoY/J1o8OYnDmnpkz
	BMJw==
X-Gm-Message-State: AG10YORP463lzHXSSzKlW7nm6BPwu1TCeO6rN3NyAeFu7upWm3bTgHNzCwyTWWFyqV0b2A==
X-Received: by 10.140.44.5 with SMTP id f5mr620225qga.37.1455270812556;
	Fri, 12 Feb 2016 01:53:32 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	g109sm5206113qgg.40.2016.02.12.01.53.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Feb 2016 01:53:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Feb 2016 09:53:26 +0000
Message-Id: <cover.1455270652.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH V2 0/2] ltp upgrade and out of tree builds with distutils
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
X-List-Received-Date: Fri, 12 Feb 2016 09:53:32 -0000

changes since v1:
- ltp build on mips64 is fixed
- use [dirs] to denote current dirs

The following changes since commit 2ff6c2ca2e22eaef37ccb4025bc0b78c42695eed:

  linux-yocto/4.1: galileo backports and support (2016-02-11 22:56:43 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/pu

Khem Raj (2):
  distutils: Consider S != B case
  ltp: Upgrade to 20160126 and fix build on musl

 meta/classes/distutils.bbclass                     |  24 +-
 meta/classes/distutils3.bbclass                    |  19 +-
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
 .../ltp/{ltp_20150903.bb => ltp_20160126.bb}       |  45 ++-
 39 files changed, 2731 insertions(+), 427 deletions(-)
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
 rename meta/recipes-extended/ltp/{ltp_20150903.bb => ltp_20160126.bb} (59%)

-- 
2.7.1


