Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8F48C6073C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 06:38:06 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id d5so1936783pjz.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 22:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F7N6oTj0tyUG2fnMMf8Ug4NISvrb+OwYWIGnsw1Y5qg=;
	b=BHZl+SX90NEyXFNntvyWuajsBiDm3U8UPmBn9vbjKMehtVXENLj+FtgsOpQ7uFkKxP
	Ft1f2AGLFQcfd5PFSpZbCR0aPkTgMQULn8CySHb3/IxqW9+v4fQahrqlWYhg3UzPslT8
	7dDeSmLMEgxMYdZtwNHBpRvJihHL32zzrkj68BxgvGtHkgXKPbrkDB+I9BSngP2WCSoM
	11kQLFXvES51WmU5Cq7zgjxpYv0Yd4o+Um8a1dL+qtPE4B8QCdXOyTSjKtbV0+MIoc/2
	yA5EQUOpXR57goiEWJhdm+gxlFrfZair7HMugpq5YnqhO2QNWEV6WpnOK5cMl5F5/wnd
	9IXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F7N6oTj0tyUG2fnMMf8Ug4NISvrb+OwYWIGnsw1Y5qg=;
	b=SJZ7NZkiWyE5dbPI14xUgJnn8KubtY/0OyQLzKlpzZsANk0IB3SLobwVjqVKtAGCDn
	oAiQGCLK1gzWz6KNLH8NHg/CG9XER+vVy3Zn8Us4R4GhX7eUldkB9p4gCUEqCzc7l8Ny
	cGCzHTl1omKMRVlMpZqQWR3kv9u7lTQHXMfcB47O6LeS6P+SW9N/2OS8G5PDxhhP37m5
	0k8Gr2VlVeb9309ksDrbawTIioCI5K1bz2yyLPj3wejmnm/Xbu0gDdu2iHiNOvPCKsvI
	1G5eP6i2Ool/sk9CgKoL6HktSKdyM4RkAz23APwYEVswVpeYNyXUAp0pgdXSEqqlByS0
	gYNQ==
X-Gm-Message-State: APjAAAXMYNnDu9mC7jVV+crCD0vwts0VcZ1jve2+zcVqXQd/liXRIaVc
	apjWM/Dae/wkCAdxj/pJ1G4E/uW+F9o=
X-Google-Smtp-Source: APXvYqyTRrqGXQFscgWyMwQcaAdRCHV2DGk/zxJd9z38moX9217At4pQjWNZua91bochUP6hlIpDaQ==
X-Received: by 2002:a17:90a:c697:: with SMTP id
	n23mr3263843pjt.37.1581575886601; 
	Wed, 12 Feb 2020 22:38:06 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	a10sm1323885pgm.81.2020.02.12.22.38.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 12 Feb 2020 22:38:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2020 22:38:10 -0800
Message-Id: <cover.1581575578.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 0/9] recipe updates, testing fixes
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
X-List-Received-Date: Thu, 13 Feb 2020 06:38:06 -0000
Content-Transfer-Encoding: 8bit

- Update gdb to 9.1 and musl to latest
- Fix packages busybox, ltp to build with musl exposed 64bit time_t
  problems
- rest of all fixes are found testing core-image-sato-sdk on
  qemuarm/qemux86_64
- Add a check for gold being used on rv32/rv64

The following changes since commit 34535f3e0ca6f6e37e6457fc800dfbfff64d9298:

  bitbake: doc: minor tweaks to ch 1 of BB user manual (2020-02-08 17:41:17 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib kraj/pu
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kraj/pu

Khem Raj (9):
  qemuarm: Disable highmem when QB_MACHINE is virt
  oeqa: Use --disable-maintainer-mode configure option
  libsolv: Enable rpm packageconfig by default only if rpm O_P_M is
    enabled
  dnf,libdnf: Ignore if PACKAGE_CLASSES does not have rpm
  musl: Update to latest tip
  gdb: Upgrade to 9.1 release
  busybox: Backport patches to support removal of __NR_clock_gettime
  binutils: Bail out if gold is used on 32/64 bit RISC-V
  ltp: Fix tescases with 64bit time_t using 32bit arches

 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 meta/conf/machine/qemuarm.conf                |   2 +-
 meta/lib/oeqa/runtime/cases/buildcpio.py      |   2 +-
 meta/lib/oeqa/sdk/cases/buildcpio.py          |   2 +-
 ...rappers-around-clock_gettime-closes-.patch | 113 +++++++++++++++
 ...-Use-64-prefix-syscall-if-we-have-to.patch |  53 +++++++
 ...-Use-64-prefix-syscall-if-we-have-to.patch |  43 ++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |   3 +
 meta/recipes-core/musl/musl_git.bb            |   2 +-
 meta/recipes-devtools/binutils/binutils.inc   |   7 +
 meta/recipes-devtools/dnf/dnf_4.2.2.bb        |   2 +
 meta/recipes-devtools/gdb/gdb-8.3.1.inc       |  22 ---
 meta/recipes-devtools/gdb/gdb-9.1.inc         |  21 +++
 ...ian_8.3.1.bb => gdb-cross-canadian_9.1.bb} |   0
 .../{gdb-cross_8.3.1.bb => gdb-cross_9.1.bb}  |   0
 ...ake-man-install-relative-to-DESTDIR.patch} |   9 +-
 ...x-nat-Define-_ABIO32-if-not-defined.patch} |   9 +-
 ...-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch} |   7 +-
 ...ort-for-Renesas-SH-sh4-architecture.patch} |  41 +++---
 ...eadline.a-when-using-disable-static.patch} |  13 +-
 ...s.h.patch => 0006-use-asm-sgidefs.h.patch} |   9 +-
 ...Use-exorted-definitions-of-SIGRTMIN.patch} |  11 +-
 ...atch => 0008-Change-order-of-CFLAGS.patch} |  13 +-
 ...9-resolve-restrict-keyword-conflict.patch} |  17 +--
 ...> 0010-Fix-invalid-sigprocmask-call.patch} |  23 ++-
 ...h => 0011-gdbserver-ctrl-c-handling.patch} |  31 ++--
 .../gdb/gdb/CVE-2019-1010180.patch            | 132 ------------------
 .../gdb/{gdb_8.3.1.bb => gdb_9.1.bb}          |   0
 meta/recipes-devtools/libdnf/libdnf_0.28.1.bb |   1 +
 .../libsolv/libsolv_0.7.10.bb                 |   2 +-
 ...or-time64-unsafe-syscalls-before-usi.patch |  81 +++++++++++
 meta/recipes-extended/ltp/ltp_20190930.bb     |   1 +
 32 files changed, 416 insertions(+), 258 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-date-Use-64-prefix-syscall-if-we-have-to.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-time-Use-64-prefix-syscall-if-we-have-to.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb-8.3.1.inc
 create mode 100644 meta/recipes-devtools/gdb/gdb-9.1.inc
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.3.1.bb => gdb-cross-canadian_9.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_8.3.1.bb => gdb-cross_9.1.bb} (100%)
 rename meta/recipes-devtools/gdb/gdb/{0002-make-man-install-relative-to-DESTDIR.patch => 0001-make-man-install-relative-to-DESTDIR.patch} (77%)
 rename meta/recipes-devtools/gdb/gdb/{0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch => 0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch} (82%)
 rename meta/recipes-devtools/gdb/gdb/{0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch => 0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch} (89%)
 rename meta/recipes-devtools/gdb/gdb/{0005-Add-support-for-Renesas-SH-sh4-architecture.patch => 0004-Add-support-for-Renesas-SH-sh4-architecture.patch} (96%)
 rename meta/recipes-devtools/gdb/gdb/{0006-Dont-disable-libreadline.a-when-using-disable-static.patch => 0005-Dont-disable-libreadline.a-when-using-disable-static.patch} (83%)
 rename meta/recipes-devtools/gdb/gdb/{0007-use-asm-sgidefs.h.patch => 0006-use-asm-sgidefs.h.patch} (84%)
 rename meta/recipes-devtools/gdb/gdb/{0008-Use-exorted-definitions-of-SIGRTMIN.patch => 0007-Use-exorted-definitions-of-SIGRTMIN.patch} (81%)
 rename meta/recipes-devtools/gdb/gdb/{0009-Change-order-of-CFLAGS.patch => 0008-Change-order-of-CFLAGS.patch} (75%)
 rename meta/recipes-devtools/gdb/gdb/{0010-resolve-restrict-keyword-conflict.patch => 0009-resolve-restrict-keyword-conflict.patch} (80%)
 rename meta/recipes-devtools/gdb/gdb/{0011-Fix-invalid-sigprocmask-call.patch => 0010-Fix-invalid-sigprocmask-call.patch} (65%)
 rename meta/recipes-devtools/gdb/gdb/{0001-gdbserver-ctrl-c-handling.patch => 0011-gdbserver-ctrl-c-handling.patch} (45%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch
 rename meta/recipes-devtools/gdb/{gdb_8.3.1.bb => gdb_9.1.bb} (100%)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch

-- 
2.25.0


