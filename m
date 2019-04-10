Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id DB7747D8FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:11:58 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id s15so2843292wra.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=1JvwGeXZlGpUtI4W1iQXOptI1J+Us7ER+RPwgNE7Mcs=;
	b=h/PXGZo55sRd71iUhpllCMpGHTNvQrXBb8e30rDsxsGRxsGmhSPnDzznJXbyHWZxra
	vc8blOu5XNGbg4KXC/yv86g3xaQ67hXWNcXy7t4hOdkMvkIlBT4n0VwUIJV3TKCXfJ2f
	ILnU0C5aUE8rlcww+5rtac0QjqTrb8HTaYahom7FCSDueq2OVmic6sj4TSuycpQ56MNs
	c34vxAP2rkud7tOjRCVtLc9i/ToD4V42zCEHSj0/SMRrteoTC/tUeESacCi35yNKUFoE
	kbDNIxESro57a9Qxv+eFMh1W/x1oiYYnyOJXCL/G1H1KOnmrmrRi470W95xXyhnILpxF
	Flrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1JvwGeXZlGpUtI4W1iQXOptI1J+Us7ER+RPwgNE7Mcs=;
	b=m2ifvMGUlVfK1NMmiOxlVdyHw3GX4XLrn0lEVMuiDMZ20YT+JwjV4WlRDV8eBjr1sh
	OMFcb4vffE1yufRp3c0fcc3WIPAcGEF5a2qjO6BxqwvE85+IXJZS1P1n2lQv0OuC81Im
	YjiJgU7DI1w3rpM8E8BNI6GhTQHzOLRf4+ftvZ2EAd3SNQs6K9Lp2xG6IM2zJUH/Z38C
	RUV7vSHEorEYEzdLFPKZCXpzXAhxUV0pz21/89LOnLJvhhyo80kLRkcXLGUWY3KHAuxU
	rmuqP2/Hy1YAxx6nElmIxfRplvOoKiN7pRV0MhUXoJv3xgg+qtO6PodBUPyMVHlbnvza
	t8mw==
X-Gm-Message-State: APjAAAWxtutWVmtzTivmqOIZD3NlBdJH+UEA1w+qy6OVkh8NZVIunYTo
	pbuUExrwbLYWiw+5l0FEud+9/wkPyVU=
X-Google-Smtp-Source: APXvYqwPPbV/c840cBZ5h+o/npaDx2jth+HhVpsYcum7dhOdqpr6Jl2ciCatsVsv+L6yHkWBq2HE0w==
X-Received: by 2002:a5d:4e87:: with SMTP id e7mr28188147wru.161.1554901919317; 
	Wed, 10 Apr 2019 06:11:59 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.11.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:11:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:19 +0530
Message-Id: <cover.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/33] Sumo next patch review
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
X-List-Received-Date: Wed, 10 Apr 2019 13:11:59 -0000

Here are the next batch for sumo. Please review and reply in two days.
Base line they passed a-full

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


