Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 380EA7D6D4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 18:15:35 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id k3so6678254pga.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 11:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=el9UmJF25ahdQ4s2Os5H3P1PSw3iAgPaEDNdVvntcws=;
	b=Nk9hBRsEus7rTGJXKfl7/ecKRZH7HZ2tDSYyup9y6TparItZFcYePeaJzOtKAtkdr1
	UbweLZwsYMJ20610aR1RgRZHCh8l8xDQ7aiw5llXKo18pYyBfpkyabVeDNNpxlK9eYeB
	WSDuia/9sSe8wNz5x/vR0B3+Kx0OZAWRiGBYIyHtTTE+H0O/2iSMFYJ1rROXr6BCRd1y
	hj9JXxmRxgV998R5f1OENeUccrglrRHa9sADTjWEUkpJQrXcH+NoNfIC6Cf3i2mNeDJQ
	Ghifso0vTUAaV0LRoUBA1LECemATIyZQrIIvbR4burg6V7WwL6wLpc/2i3dGq4oo4juW
	goqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=el9UmJF25ahdQ4s2Os5H3P1PSw3iAgPaEDNdVvntcws=;
	b=XtX6MMebEF6wadgLOMytLrCGKHyI8CMfCOZggkeym6xa7iJ+uM/UBeffWoyPJzTC7p
	di0IwACq6ynrPdGU7IDeJfZtJqlkbo6QV8e+VBNbrwtgfOdov8xnEr5DpDSp0fChMj/7
	5pP/xrwEtIwvMLeI1hSf5dpPDsw2exmIuunpMf+4bdeCme3ONlJ7GuTINg+7MNdcw8O4
	sovbJ6zKA4xQqS1eMLLHgmrzDzOtM6ViYT7fS6AKrXlbb7T5kLpV+PLkNm8tckLC93xz
	y/+Qu+N6zX3PcTJibrCcybMH9KEpnXiVL/Ubh87eJZOMqkjb4mRS+FGgKq+jnHTztPBw
	NFAA==
X-Gm-Message-State: APjAAAXvpCoiakOTcLmXnTAVseKasbS095q71UwvoBbMl5QQchmHMxvd
	XCYTygX75aGs2CgOq/MeceOxzSNV
X-Google-Smtp-Source: APXvYqyzNlB5yNafINESYIM06HTH1AtytjocuHd/YhT4WfxjvBCQ09K0uo4Adt8o2PSIE+YnyWQjjQ==
X-Received: by 2002:a62:1d0d:: with SMTP id d13mr65285060pfd.96.1555179335988; 
	Sat, 13 Apr 2019 11:15:35 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7ca0:5fa6:145:76be])
	by smtp.gmail.com with ESMTPSA id
	o5sm137868343pfa.135.2019.04.13.11.15.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 13 Apr 2019 11:15:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Apr 2019 11:14:59 -0700
Message-Id: <cover.1555179238.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/33] sumo-next pull request
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
X-List-Received-Date: Sat, 13 Apr 2019 18:15:35 -0000

please consider these changes for sumo

The following changes since commit 0a2db923fd17019d07d88204b355aa46590f0b97:

  build-appliance-image: Update to sumo head revision (2019-03-27 23:21:58 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/sumo-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/sumo-next

Chen Qi (2):
  pkgdata.py: avoid target-sdk-dummy-provides to mess things up
  logging: use warning instead warn

Davis, Michael (1):
  wic: Support for changing the imager.

Geoff Parker (1):
  wic: make engine.py:get_partitions() resilient to parted/dmidecode
    stderr output

Kai Kang (1):
  wic: search nonarch STAGING_DATADIR for multilib

Khem Raj (1):
  lib/oe: Fix collections ABCs DeprecationWarning in Python 3.7+

Leonardo Augusto (1):
  scripts/lib/wic/engine: Fix cp's target path for ext* filesystems

Mazliana (1):
  oeqa/manual/bsp-hw.json: add non-IA tests

Richard Purdie (9):
  oeqa/manual: Remove bitbake-selftest execution
  oeqa/manual/build-appliance: Drop test which is already automated
  resulttool: Allow store to work on single files
  resulttool: Allow extraction of ptest data
  scripts/wic: Be consistent about how we call bitbake
  wic/engine: Fix missing parted autobuilder failures
  oeqa/selftest/devtool: Ensure dbus is built befoe running test
  oeqa: Default to buffer mode for tests
  devtool: Split tests into multiple classes

Robert Yang (1):
  oeqa/manual/bsp-qemu.json: Update for QEMU_USE_KVM

Ross Burton (1):
  wic: use explicit errno import

Sudhir Sharma (1):
  oeqa/manual: Add manual runtime 'compliance' testcases to json

William Bourque (1):
  wic/engine.py: Load paths from PATH environment variable

Yeoh Ee Peng (8):
  oeqa/manual: transfer manual test cases from testopia to oeqa
  oeqa/manual/toaster: transfer manual toaster test cases to oeqa
  oeqa/manual/toaster: updated test id naming
  resulttool: Enable report for single result file
  resulttool/manualexecution: Standardize input check
  resulttool/manualexecution: Enable display full steps without press
    enter
  resulttool/manualexecution: Fixed step sorted by integer
  resulttool/manualexecution: Refactor and simplify codebase

sangeeta jain (4):
  oeqa/manual/sdk.json: Updated toolchain tarball to core-image-sato
  oeqa/manual/bsp-hw.json: test id updated and obsolete test cases
    removed
  oeqa/manual/compliance-test.json: test id updated and missing test
    cases added
  oeqa/manual/kernel-dev.json: test id updated

 meta/lib/oe/maketype.py                          |    9 +-
 meta/lib/oe/terminal.py                          |    6 +-
 meta/lib/oeqa/core/context.py                    |    2 +-
 meta/lib/oeqa/core/runner.py                     |    5 -
 meta/lib/oeqa/manual/abat.patch                  |   64 +
 meta/lib/oeqa/manual/bsp-hw.json                 | 1286 +++++++++++
 meta/lib/oeqa/manual/bsp-qemu.json               |  222 ++
 meta/lib/oeqa/manual/build-appliance.json        |   96 +
 meta/lib/oeqa/manual/compliance-test.json        |  194 ++
 meta/lib/oeqa/manual/crops.json                  |  294 +++
 meta/lib/oeqa/manual/eclipse-plugin.json         |  322 +++
 meta/lib/oeqa/manual/kernel-dev.json             |  200 ++
 meta/lib/oeqa/manual/oe-core.json                |  264 +++
 meta/lib/oeqa/manual/sdk.json                    |   32 +
 meta/lib/oeqa/manual/toaster-managed-mode.json   | 2572 ++++++++++++++++++++++
 meta/lib/oeqa/manual/toaster-unmanaged-mode.json | 1170 ++++++++++
 meta/lib/oeqa/selftest/cases/devtool.py          |  115 +-
 meta/lib/oeqa/selftest/cases/efibootpartition.py |    1 -
 meta/lib/oeqa/selftest/cases/imagefeatures.py    |    2 -
 meta/lib/oeqa/selftest/cases/pkgdata.py          |    1 +
 meta/lib/oeqa/selftest/cases/runqemu.py          |    2 -
 meta/lib/oeqa/selftest/context.py                |    2 +-
 meta/lib/oeqa/utils/qemurunner.py                |    4 +-
 scripts/combo-layer                              |    2 +-
 scripts/contrib/verify-homepage.py               |    2 +-
 scripts/lib/devtool/export.py                    |    2 +-
 scripts/lib/devtool/import.py                    |    8 +-
 scripts/lib/devtool/standard.py                  |   16 +-
 scripts/lib/devtool/upgrade.py                   |    6 +-
 scripts/lib/recipetool/append.py                 |   14 +-
 scripts/lib/recipetool/create.py                 |    4 +-
 scripts/lib/recipetool/create_kmod.py            |    2 +-
 scripts/lib/recipetool/create_npm.py             |    6 +-
 scripts/lib/recipetool/newappend.py              |    4 +-
 scripts/lib/resulttool/manualexecution.py        |   61 +-
 scripts/lib/resulttool/resultutils.py            |   39 +-
 scripts/lib/resulttool/store.py                  |   23 +-
 scripts/lib/wic/engine.py                        |   26 +-
 scripts/lib/wic/filemap.py                       |    9 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py |   10 +-
 scripts/resulttool                               |   10 -
 scripts/runqemu                                  |   16 +-
 scripts/wic                                      |   18 +-
 43 files changed, 6941 insertions(+), 202 deletions(-)
 create mode 100644 meta/lib/oeqa/manual/abat.patch
 create mode 100644 meta/lib/oeqa/manual/bsp-hw.json
 create mode 100644 meta/lib/oeqa/manual/bsp-qemu.json
 create mode 100644 meta/lib/oeqa/manual/build-appliance.json
 create mode 100644 meta/lib/oeqa/manual/compliance-test.json
 create mode 100644 meta/lib/oeqa/manual/crops.json
 create mode 100644 meta/lib/oeqa/manual/eclipse-plugin.json
 create mode 100644 meta/lib/oeqa/manual/kernel-dev.json
 create mode 100644 meta/lib/oeqa/manual/oe-core.json
 create mode 100644 meta/lib/oeqa/manual/sdk.json
 create mode 100644 meta/lib/oeqa/manual/toaster-managed-mode.json
 create mode 100644 meta/lib/oeqa/manual/toaster-unmanaged-mode.json

-- 
2.7.4


