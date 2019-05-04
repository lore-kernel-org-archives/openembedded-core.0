Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5BA7B745BF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:24 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id j26so4221440pgl.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vuAK49WEf1Km2QoX3WeV4V39X1I5RmQEYXh5V7y3b3A=;
	b=NMUY9mLV5/RMRAI65yXbaDT7mdgY8hW64miSVFmVAKMxPN8h7LJiauDD2QYC/oP7iB
	TTBmtyivUmmm78voB5wzKzB0iKFzl1ZkQK9wM4J2BJSN8q7C6ob0IxL7/llEUvJh0Y3r
	NzpZOMn5S6tfSaEzFvJD8XAYWGkvDjcHTvp+EZPXfF9eUBLDpkBjuDnZ2Hw44a4Ycx7m
	ND/elm2zODUoj1JfDrD/7UkNKwUbNKUtLq5p1X7NdtWik520czBjBAYf/fCRhSMy4+vO
	hW39DMLIDYXHDWTk+fGhyEvvR4zF7rrDH8OwCHlorHr52hCN3ll5ETq35Ojp5rm+/7uD
	ilfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vuAK49WEf1Km2QoX3WeV4V39X1I5RmQEYXh5V7y3b3A=;
	b=RyJq7X9bfh/9p7ckoNlbBpQ2OcLcts2fXL7iB5HTWjgW/XYza+BtmGS78g4I2JRu8G
	sUacdO4UmnwDjofI5I4sysblFCnRf5jYQB6fYjkgf3Pa2hrz8aZByvI9ulzCpVjfTHVo
	Yzmk0iNUumo98q24jvBziQD+/mdZkdsfbKwUrmriqqqTR8ok9pI//uarGJlsehkuRYB6
	P9bQCB3UyofuGvwndbT9JgDAk/3zT8JY5GAJV7SJcJSGwTZq8n485eaQhoy/1qHuH1QJ
	RDALnllbLy55vTqSwxEOFllJ4rQBGCrSUVmdokgVf8CBqDhkh8nCYyuyMM3n4p2RdBOs
	YOrA==
X-Gm-Message-State: APjAAAU1St6+kudchrKbpqxz0tvPuI3Drbq3FgtsCY9iPnw4lF0+FHR7
	DdIP6ck4Ui4S7+Zi32pH8Vd/41b/
X-Google-Smtp-Source: APXvYqwuGEwCk5XCCcupqi+9HH2mPEUDwiz1QStDZHFlXzOY4TJGV3mbhv47yqYXallizGrDU5LGYA==
X-Received: by 2002:aa7:9214:: with SMTP id 20mr19801521pfo.202.1556983645070; 
	Sat, 04 May 2019 08:27:25 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:26:36 -0700
Message-Id: <cover.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 00/43] Warrior patch review
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
X-List-Received-Date: Sat, 04 May 2019 15:27:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Community patch review opportunity.

The following changes since commit f571b188177788d8ed0a7f3efe3569f153b1b0d3:

  build-appliance-image: Update to warrior head revision (2019-04-14 21:27:58 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/warrior-next
  http://cgit.openembedded.org//log/?h=stable/warrior-next

Adrian Bunk (3):
  gnutls: upgrade 3.6.5 -> 3.6.7
  dhcp: Replace OE specific patch for compatibility with latest bind
    with upstream patch
  gnome-doc-utils: Remove stale patch

Alexander Kanavin (2):
  python3: add another multilib fix
  buildhistory: call a dependency parser only on actual dependency lists

Anuj Mittal (4):
  gcc: fix CVE-2018-18484
  gdb: fix CVE-2017-9778
  binutils: fix CVE-2019-9074 CVE-2019-9075 CVE-2019-9076 CVE-2019-9077
  openssh: fix CVE-2018-20685, CVE-2019-6109, CVE-2019-6111

Bruce Ashfield (8):
  linux-yocto/5.0: update to v5.0.5
  linux-yocto-rt: update to 5.0.5-rt3
  linux-yocto/5.0: update to v5.0.7
  linux-yocto/4.19: update to v4.19.34
  linux-yocto-rt/4.19: fix merge conflict in lru_drain
  linux-yocto/5.0: port RAID configuration tweaks from master
  linux-yocto/5.0: integrate TCP timeout / hang fix
  linux-yocto/5.0: update TCP patch to mainline version

Changqing Li (2):
  waffle: supprt build waffle without x11
  piglit: support build piglit without x11

Chen Qi (4):
  busybox: fix ptest failure about 'dc'
  base-files: move hostname operations out of issue file settings
  dropbear: set CVE_PRODUCT
  libsdl: set CVE_PRODUCT

Dengke Du (1):
  linux-yocto_5.0: set devicetree for armv5

He Zhe (1):
  ltp: Fix setrlimit03 call succeeded unexpectedly

Jaewon Lee (1):
  Adding back wrapper and using OEPYTHON3HOME variable for python3

Jens Rehsack (1):
  kernel-module-split.bbclass: support CONFIG_MODULE_COMPRESS=y

Joshua Watt (2):
  resulttool: Load results from URL
  resulttool: Add log subcommand

Kai Kang (1):
  cryptodev: fix module loading error

Mardegan, Alberto (1):
  oeqa/core/runner: dump stdout and stderr of each test case

Mariano Lopez (1):
  ptest.bbclass: Use d.getVar instead of os.environ

Martin Jansa (2):
  icecc.bbclass: stop causing everything to be effectivelly MACHINE_ARCH
  glibc: always use bfd linker

Naveen Saini (2):
  core-image-rt: make sure that we append to DEPENDS
  core-image-rt-sdk: make sure that we append to DEPENDS

Oleksandr Kravchuk (1):
  curl: update to 7.64.1

Richard Purdie (4):
  core-image-sato-sdk-ptest: Try and keep image below 4GB limit
  resultool/resultutils: Fix module import error
  utils/multiprocess_launch: Improve failing subprocess output
  python3: Drop ptest hack

Steven Hung (洪于玉) (1):
  kernel.bbclass: convert base_do_unpack_append() to a task

sangeeta jain (1):
  resulttool/manualexecution: Enable test case configuration option

 meta/classes/icecc.bbclass                         |    1 +
 meta/classes/kernel-module-split.bbclass           |   20 +-
 meta/classes/kernel.bbclass                        |    3 +-
 meta/classes/ptest.bbclass                         |    4 +-
 meta/classes/testimage.bbclass                     |    3 +-
 meta/lib/oe/buildhistory_analysis.py               |    2 +-
 meta/lib/oe/utils.py                               |    7 +-
 meta/lib/oeqa/core/runner.py                       |   20 +-
 ...eplace-custom-isc_boolean_t-with-C-standa.patch | 2882 --------------------
 ...d-includes-of-new-BIND9-compatibility-hea.patch |   79 +
 meta/recipes-connectivity/dhcp/dhcp_4.4.1.bb       |    2 +-
 ...ve-progressmeter-force-an-update-at-the-b.patch |  121 +
 .../openssh/openssh/CVE-2018-20685.patch           |   40 +
 .../openssh/openssh/CVE-2019-6109.patch            |  275 ++
 .../openssh/openssh/CVE-2019-6111.patch            |  187 ++
 meta/recipes-connectivity/openssh/openssh_7.9p1.bb |    4 +
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    7 +-
 ...ix-two-test-case-to-also-depend-on-DC_BIG.patch |   39 +
 meta/recipes-core/busybox/busybox_1.30.1.bb        |    1 +
 meta/recipes-core/dropbear/dropbear.inc            |    2 +
 meta/recipes-core/glibc/glibc_2.29.bb              |    2 +-
 meta/recipes-devtools/binutils/binutils-2.32.inc   |    4 +
 .../binutils/binutils/CVE-2019-9074.patch          |   68 +
 .../binutils/binutils/CVE-2019-9075.patch          |  119 +
 .../binutils/binutils/CVE-2019-9076.patch          |   49 +
 .../binutils/binutils/CVE-2019-9077.patch          |   37 +
 meta/recipes-devtools/gcc/gcc-8.3.inc              |    1 +
 ...sion-limit-to-libiberty-s-demangling-code.patch |  325 +++
 meta/recipes-devtools/gdb/gdb-8.2.1.inc            |    1 +
 meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch  |   99 +
 ...ig.py-fix-another-place-where-lib-is-hard.patch |   31 +
 ...EPYTHON3HOME-is-set-use-instead-of-PYTHON.patch |   47 +
 .../python/python3/ptesthack.patch                 |   60 -
 meta/recipes-devtools/python/python3_3.7.2.bb      |    9 +-
 ...trlimit03.c-read-proc-sys-fs-nr_open-for-.patch |   70 +
 meta/recipes-extended/ltp/ltp_20190115.bb          |    1 +
 ...t.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch |   40 -
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |    2 +
 meta/recipes-graphics/libsdl2/libsdl2_2.0.9.bb     |    2 +
 meta/recipes-graphics/piglit/piglit_git.bb         |   13 +-
 meta/recipes-graphics/waffle/waffle_1.5.2.bb       |    7 +-
 meta/recipes-kernel/cryptodev/cryptodev.inc        |    4 +-
 ...01-Fix-module-loading-with-Linux-v5.0-rc5.patch |   59 +
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   |    6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb    |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb |    8 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb  |    8 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      |   20 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb       |   21 +-
 meta/recipes-rt/images/core-image-rt-sdk.bb        |    2 +-
 meta/recipes-rt/images/core-image-rt.bb            |    2 +-
 .../images/core-image-sato-sdk-ptest.bb            |    4 +-
 .../curl/{curl_7.64.0.bb => curl_7.64.1.bb}        |    4 +-
 .../gnutls/{gnutls_3.6.5.bb => gnutls_3.6.7.bb}    |    7 +-
 scripts/lib/resulttool/log.py                      |   56 +
 scripts/lib/resulttool/manualexecution.py          |   14 +-
 scripts/lib/resulttool/merge.py                    |    8 +-
 scripts/lib/resulttool/regression.py               |    6 +-
 scripts/lib/resulttool/report.py                   |    2 +-
 scripts/lib/resulttool/resultutils.py              |   23 +-
 scripts/lib/resulttool/store.py                    |    4 +-
 scripts/resulttool                                 |    2 +
 62 files changed, 1882 insertions(+), 3070 deletions(-)
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-dhcpd-fix-Replace-custom-isc_boolean_t-with-C-standa.patch
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-master-Added-includes-of-new-BIND9-compatibility-hea.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-upstream-Have-progressmeter-force-an-update-at-the-b.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2018-20685.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2019-6109.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2019-6111.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-dc.tests-fix-two-test-case-to-also-depend-on-DC_BIG.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9074.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9075.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9076.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9077.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/0041-Add-a-recursion-limit-to-libiberty-s-demangling-code.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
 delete mode 100644 meta/recipes-devtools/python/python3/ptesthack.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch
 delete mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Fix-module-loading-with-Linux-v5.0-rc5.patch
 rename meta/recipes-support/curl/{curl_7.64.0.bb => curl_7.64.1.bb} (95%)
 rename meta/recipes-support/gnutls/{gnutls_3.6.5.bb => gnutls_3.6.7.bb} (88%)
 create mode 100644 scripts/lib/resulttool/log.py

-- 
2.7.4


