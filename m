Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6F3EF716CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 06:35:12 +0000 (UTC)
Received: by pacwv17 with SMTP id wv17so132793355pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 23:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1KohTvmj0v9h2uo9g7fEBJnW+D8ZxKuVo0jyiGWv0l0=;
	b=huafukOW89itLzCmV91gNJkUlg/c5/HYDhZ64Z4qjtRirbmL1i0DD1wbbMKHGdDohw
	NFN7sWDzWIrE1KmwmA3C1OsnaF9cQ5Pz9EzbePNFtSGhLaVpKL4jo5ptn8wGxEQbt0zJ
	6CTraLFCFMP4ylLfqOIYbsQX4QElvNPzULLDHWWC3LBtqal6Y8b6rS9ECCrc5kZzOpvg
	Ydr2qomqHD6Yg3CNrUIU5XjqIp52v/h1A0p2UkNm3exq8U79LwAf4Y3kKtcU3jFQWl6R
	Yslwr7sWJEK693LTtnVFjGFCL1zZwfCmB3K5RQ3uNzkEinc8CpkrwIY/tSwSQJjfwS4T
	XLGw==
X-Received: by 10.66.235.200 with SMTP id uo8mr29258070pac.18.1430202913439;
	Mon, 27 Apr 2015 23:35:13 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by mx.google.com with ESMTPSA id
	jd5sm21216748pbd.35.2015.04.27.23.35.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Apr 2015 23:35:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Apr 2015 23:35:07 -0700
Message-Id: <cover.1430202778.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/1] gcc-5
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
X-List-Received-Date: Tue, 28 Apr 2015 06:35:13 -0000


Add recipes for gcc-5, its not default _yet_
enable it in local.conf as described in patch header to use it

The following changes since commit a9eededcb33b2ee41a061298610126436dfc2c11:

  ptest: add recommends to ptest-runner (2015-04-27 15:26:15 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/for-master
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/for-master

Khem Raj (1):
  gcc: Add 5 recipes

 meta/recipes-devtools/gcc/gcc-5.1.inc              |  123 +
 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |   42 +
 .../gcc/gcc-5.1/0002-uclibc-conf.patch             |   53 +
 .../0003-gcc-uclibc-locale-ctype_touplow_t.patch   |   87 +
 .../gcc/gcc-5.1/0004-uclibc-locale.patch           | 2862 ++++++++++++++++++++
 .../gcc/gcc-5.1/0005-uclibc-locale-no__x.patch     |  257 ++
 .../gcc/gcc-5.1/0006-uclibc-locale-wchar_fix.patch |   68 +
 .../gcc/gcc-5.1/0007-uclibc-locale-update.patch    |  542 ++++
 .../gcc/gcc-5.1/0008-missing-execinfo_h.patch      |   28 +
 .../gcc/gcc-5.1/0009-c99-snprintf.patch            |   28 +
 .../0010-gcc-poison-system-directories.patch       |  192 ++
 .../gcc/gcc-5.1/0011-gcc-poison-dir-extend.patch   |   39 +
 .../0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |   73 +
 .../gcc/gcc-5.1/0013-64-bit-multilib-hack.patch    |   85 +
 .../gcc/gcc-5.1/0014-optional-libstdc.patch        |  101 +
 ...0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |   59 +
 .../gcc/gcc-5.1/0016-COLLECT_GCC_OPTIONS.patch     |   38 +
 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |   96 +
 .../gcc-5.1/0018-fortran-cross-compile-hack.patch  |   46 +
 .../gcc/gcc-5.1/0019-libgcc-sjlj-check.patch       |   74 +
 .../gcc/gcc-5.1/0020-cpp-honor-sysroot.patch       |   54 +
 .../gcc-5.1/0021-MIPS64-Default-to-N64-ABI.patch   |   57 +
 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  216 ++
 ...0023-gcc-Fix-argument-list-too-long-error.patch |   40 +
 .../gcc/gcc-5.1/0024-Disable-sdt.patch             |  113 +
 .../gcc/gcc-5.1/0025-libtool.patch                 |   42 +
 ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |   43 +
 ...tilib-config-files-from-B-instead-of-usin.patch |  102 +
 ...-libdir-from-.la-which-usually-points-to-.patch |   31 +
 .../gcc/gcc-5.1/0029-export-CPP.patch              |   53 +
 ...AltiVec-generation-on-powepc-linux-target.patch |   44 +
 ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |   42 +
 ...Ensure-target-gcc-headers-can-be-included.patch |   98 +
 ...-t-build-with-disable-dependency-tracking.patch |   54 +
 ...h-host-directory-during-relink-if-inst_pr.patch |   38 +
 ...-link-the-plugins-with-libgomp-explicitly.patch |   83 +
 .../recipes-devtools/gcc/gcc-cross-canadian_5.1.bb |    5 +
 meta/recipes-devtools/gcc/gcc-cross-initial_5.1.bb |    2 +
 meta/recipes-devtools/gcc/gcc-cross_5.1.bb         |    3 +
 .../gcc/gcc-crosssdk-initial_5.1.bb                |    3 +
 meta/recipes-devtools/gcc/gcc-crosssdk_5.1.bb      |    2 +
 meta/recipes-devtools/gcc/gcc-runtime_5.1.bb       |    7 +
 meta/recipes-devtools/gcc/gcc-sanitizers_5.1.bb    |    2 +
 meta/recipes-devtools/gcc/gcc-source_5.1.bb        |    2 +
 meta/recipes-devtools/gcc/gcc_5.1.bb               |    7 +
 meta/recipes-devtools/gcc/libgcc-initial_5.1.bb    |    2 +
 meta/recipes-devtools/gcc/libgcc_5.1.bb            |    2 +
 meta/recipes-devtools/gcc/libgfortran_5.1.bb       |    3 +
 48 files changed, 6043 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1.inc
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0002-uclibc-conf.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0003-gcc-uclibc-locale-ctype_touplow_t.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0004-uclibc-locale.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0005-uclibc-locale-no__x.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0006-uclibc-locale-wchar_fix.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0007-uclibc-locale-update.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0008-missing-execinfo_h.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0009-c99-snprintf.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0010-gcc-poison-system-directories.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0011-gcc-poison-dir-extend.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0013-64-bit-multilib-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0014-optional-libstdc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0016-COLLECT_GCC_OPTIONS.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0018-fortran-cross-compile-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0019-libgcc-sjlj-check.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0020-cpp-honor-sysroot.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0021-MIPS64-Default-to-N64-ABI.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0022-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0023-gcc-Fix-argument-list-too-long-error.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0024-Disable-sdt.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0025-libtool.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0026-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0027-Use-the-multilib-config-files-from-B-instead-of-usin.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0028-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0029-export-CPP.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0031-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0032-Ensure-target-gcc-headers-can-be-included.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0033-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.1/0035-Dont-link-the-plugins-with-libgomp-explicitly.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-canadian_5.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_5.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross_5.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial_5.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_5.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-runtime_5.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-sanitizers_5.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-source_5.1.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc_5.1.bb
 create mode 100644 meta/recipes-devtools/gcc/libgcc-initial_5.1.bb
 create mode 100644 meta/recipes-devtools/gcc/libgcc_5.1.bb
 create mode 100644 meta/recipes-devtools/gcc/libgfortran_5.1.bb

-- 
2.1.4


