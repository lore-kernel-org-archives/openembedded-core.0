Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id B47F171B87
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 17:37:34 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y68so5435178pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 10:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fsAtXh965STyo/+IM9h+SPTqsHzdDdN4wGoS9Y7UNC4=;
	b=gjoV5k2xM2K2fRbDRNpC6x7J8nRI4j777YnmI8DCgLD0THDsujPBV0y5InZJt+S5tC
	h2YittsiZRtmXNRyTYE668b0vMSzgRqHEVMeYgizI8hwAsd5vAKIHuho93MWINM4VQsi
	ardCgBzX9cAze6DyF5VPiSKds/LQ3oO81wy0gLG9MjYhA4iYK8TdlLIBcdjDq0tmQgJl
	qolomUrRFWLQbouPH2EQbFucuTxxg/09e6VxuH+lZDIJHmNfmZfKGu5oLNCiDPn5/3/Q
	LEemf9TkWVie15qGZhUt7QHBCcr2hqPvEVD9eCozafDg3L4U+MgjMnMaB3EcoZMMD0Am
	RXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fsAtXh965STyo/+IM9h+SPTqsHzdDdN4wGoS9Y7UNC4=;
	b=KGufzf7SIk++4GTEQTnEVlqNa9u3jK9qvSRwwowzBvgSbiSr62BDXrDTPqy9wgl6tg
	xr8quKFekuIpi9p+Ajea62uw0YSQXCS1xyE2tljIQAgeo/gt7371TVtxLdKHNU8zO1Es
	n17LFXDRsThIK39k3/z4lmxcOL8ZUe951xRQfBrnarhZyimZbPDZfWQEMOqTxZLc6aFj
	+CJo0YYpG4V8bJCQViFLO++GjvtCV1ugxQucWa55GQe2zL6wnzP6tG0gi6712L9+r5Pf
	5mNxkMOsxyrSz9lciLEUEcpzfSCjS384N32wla/RQiN+TVq/JHmc75coC8JhaOZSzNXe
	1KPg==
X-Gm-Message-State: ABUngvdq83y+4hwdffmMQRHVdrCNoAvr8lgT0nbcAJPcEB65TKRvumyOWlC+2U9S1dkdew==
X-Received: by 10.99.66.130 with SMTP id p124mr15630233pga.30.1478194655877;
	Thu, 03 Nov 2016 10:37:35 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:614c:a5d9:489d:9d27])
	by smtp.gmail.com with ESMTPSA id
	y200sm1864109pfb.16.2016.11.03.10.37.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Nov 2016 10:37:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2016 10:36:49 -0700
Message-Id: <cover.1478184013.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
MIME-Version: 1.0
Subject: [PATCH 00/43] Krogoth-next pull request
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
X-List-Received-Date: Thu, 03 Nov 2016 17:37:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider these changes for krogoth-next


The following changes since commit 40f4a6d075236265086cc79400dea3c14720383a:

  bsp-guide: Updated the yocto-bsp create selections in the example. (2016-10-13 23:16:56 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/krogoth-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/krogoth-next

Aníbal Limón (1):
  bitbake: bb.event: fix infinite loop on print_ui_queue

Armin Kuster (2):
  meta-linux-yocto: update to 4.1.33
  meta-linux-yocto: update 4.4 to 4.4.26

Bruce Ashfield (7):
  linux-yocto/4.1: update to 4.1.33
  linux-yocto/4.4: update to v4.4.22
  linux-yocto/4.1/4.4: remove innappropriate standard/base patches
  linux-yocto/4.4/4.8: kernel config warning cleanups
  linux-yocto/4.4: update to v4.4.26
  linux-yocto/4.1: fix CVE-2016-5195 (dirtycow)
  perf: adapt to Makefile.config

California Sullivan (4):
  parselogs.py: Add amd_nb error to x86_common whitelist
  parselogs.py: Add dmi and ioremap errors to ignore list for core2
  parselogs.py: Ignore Skylake graphics firmware load errors on
    genericx86-64
  parselogs.py: Add disabling eDP error to x86_common whitelist

Christopher Larson (1):
  perf: Fix to obey LD failure on qemux86-64

Ed Bartosh (1):
  bitbake: event.py: output errors and warnings to stderr

Enrico Scholz (1):
  bitbake: fetch: copy files with -H

Joshua Lock (1):
  bitbake: event: prevent unclosed file warning in print_ui_queue

Juro Bystricky (3):
  libgcc-common.inc: Fix broken symlinks for multilib SDK
  gcc-runtime.inc: add CPP support for mips64-n32 tune
  gcc-runtime.inc: Add CPP support for x86-64-x32 tune

Jussi Kukkonen (1):
  This is a backport from master of 2 consecutive fixes.

Khem Raj (1):
  binutils: Fix gas error with cfi_section inconsistencies

Markus Lehtonen (1):
  rpm: prevent race in tempdir creation

Ola x Nilsson (2):
  devtool: build_image: Fix recipe filter
  devtool: Use the wildcard flag in update_recipe_patch

Pascal Bach (1):
  glibc: fix CVE-2016-1234, CVE-2016-3075, CVE-2016-5417

Paul Eggleton (8):
  devtool: update-recipe: fix --initial-rev option
  devtool: reset: allow reset to work if the recipe file has been
    deleted
  recipetool: create: fix handling of github URLs
  lib/oe/recipeutils: fix patch_recipe*() with empty input
  recipetool: create: fix greedy regex that broke support for github
    tarballs
  oe-selftest: recipetool: add tests for git URL mangling
  devtool: add: fix error message when only specifying a recipe name
  classes/externalsrc: re-run do_configure when configure files change

Richard Purdie (3):
  parselogs: Ignore amb_nb warning messages under qemux86*
  parselogs: Ignore uvesafb timeouts
  oeqa/parselogs: Don't use cwd for file transfers

Saul Wold (1):
  archiver: fix gcc-source handling

Sona Sarmadi (2):
  dropbear: fix multiple CVEs
  bash: Security fix CVE-2016-0634

Sujith Haridasan (1):
  perf: Fix to obey LD failure

Zheng Ruoqin (1):
  bind: fix two CVEs

 bitbake/lib/bb/event.py                            |   17 +-
 bitbake/lib/bb/fetch2/__init__.py                  |    2 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |   17 +-
 .../recipes-kernel/linux/linux-yocto_4.4.bbappend  |   17 +-
 meta/classes/archiver.bbclass                      |    5 +-
 meta/classes/autotools.bbclass                     |    2 +
 meta/classes/cmake.bbclass                         |    2 +
 meta/classes/externalsrc.bbclass                   |   22 +
 meta/lib/oe/recipeutils.py                         |    2 +-
 meta/lib/oeqa/runtime/parselogs.py                 |   29 +-
 meta/lib/oeqa/selftest/recipetool.py               |   43 +
 .../bind/bind/CVE-2016-2775.patch                  |   90 +
 .../bind/bind/CVE-2016-2776.patch                  |  123 +
 meta/recipes-connectivity/bind/bind_9.10.3-P3.bb   |    2 +
 meta/recipes-core/base-files/base-files/profile    |    6 +-
 meta/recipes-core/dropbear/dropbear.inc            |    4 +
 .../dropbear/dropbear/CVE-2016-7406.patch          |  102 +
 .../dropbear/dropbear/CVE-2016-7407.patch          | 2486 ++++++++++++++++++++
 .../dropbear/dropbear/CVE-2016-7408.patch          |  101 +
 .../dropbear/dropbear/CVE-2016-7409.patch          |   27 +
 meta/recipes-core/glibc/glibc/CVE-2016-1234.patch  |  427 ++++
 meta/recipes-core/glibc/glibc/CVE-2016-3075.patch  |   37 +
 meta/recipes-core/glibc/glibc/CVE-2016-5417.patch  |   28 +
 meta/recipes-core/glibc/glibc_2.23.bb              |    3 +
 meta/recipes-devtools/binutils/binutils-2.26.inc   |    1 +
 ..._sections-check-to-only-consider-compact-.patch |   97 +
 meta/recipes-devtools/gcc/gcc-runtime.inc          |   18 +
 meta/recipes-devtools/gcc/libgcc-common.inc        |    8 +-
 ...more-verbose-error-logging-in-rpmTempFile.patch |   26 +-
 .../rpmdb-prevent-race-in-tmpdir-creation.patch    |   41 +
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |    1 +
 .../recipes-extended/bash/bash/CVE-2016-0634.patch |  136 ++
 meta/recipes-extended/bash/bash_4.3.30.bb          |    1 +
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |    6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |    6 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       |   20 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       |   20 +-
 meta/recipes-kernel/perf/perf.bb                   |   13 +-
 scripts/lib/devtool/build_image.py                 |    2 +-
 scripts/lib/devtool/standard.py                    |   18 +-
 scripts/lib/recipetool/create.py                   |    2 +-
 43 files changed, 3923 insertions(+), 99 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2775.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2776.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2016-7406.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2016-7407.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2016-7408.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2016-7409.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2016-1234.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2016-3075.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2016-5417.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpmdb-prevent-race-in-tmpdir-creation.patch
 create mode 100644 meta/recipes-extended/bash/bash/CVE-2016-0634.patch

-- 
2.3.5


