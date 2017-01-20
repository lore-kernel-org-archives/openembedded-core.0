Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id E0205731A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567304"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:32 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:09:31 -0600
Message-Id: <cover.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 00/55] OEQA Framework Refactor & Improvements
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset is related to OEQA Framework for details read the RFC send to the
Openembedded architecture ML.

http://lists.openembedded.org/pipermail/openembedded-architecture/2016-December/000351.html

Also adds the migration of the runtime testing leaving only selftest remains
to migrate.

The testing was made using GDC Autobuilder building in different archs and running selftest.

The following changes since commit b47ecf28775830efab423fa12f0addb68671cc06:

  poky.ent: Added "pip3" as an essential host installation package (2017-01-20 11:57:25 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/oeqa_runtime_migration
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/oeqa_runtime_migration

Aníbal Limón (31):
  oeqa/core: Add base OEQA framework
  oeqa/core: Add loader, context and decorator modules
  oeqa/core/decorator: Add support for OETestDepends
  oeqa/core/decorator: Add support for OETestDataDepends and
    skipIfDataVar
  scripts/oe-test: Add new oe-test script
  oeqa/core/context: Add support of OETestContextExecutor
  oeqa/core/cases: Add example test cases
  oeqa/core: Add README
  oe/data: Add export2json function
  classes/rootfs-postcommands: Add write_image_test_data
  classes/populate_sdk_base: Add write_sdk_test_data to postprocess
  oeqa: Move common files to oeqa/files instead of runtime only
  oeqa/sdk: Move test cases inside cases directory
  oeqa/{runtime,sdk}/files: Move testsdkmakefile from runtime to sdk
    module
  oeqa/sdk: Add case and context modules for the SDK component
  classes/testsdk: Migrates testsdk.bbclass to use new OESDKTestContext
  oeqa/utils: Move targetbuild to buildproject module
  oeqa/utils: {Target,SDK,}BuildProject remove dependency of bb
  oeqa/sdk/cases: Migrate tests to the new OEQA framework
  classes/testsdk: Remove the need of TEST_LOG_DIR variable
  oeqa/sdkext: Move test cases inside cases directory
  oeqa/sdkext: Adds case and context modules.
  classes/testsdk: Migrate to use the new OESDKExtTestContext
  oeqa/sdkext/cases: Migrate test case to new OEQA framework
  oeqa/runtime: Fix TargetBuildProject instances
  oeqa: Fix files handling on runtime tests.
  oeqa/runtime: Move to runtime_cases
  oeqa/runtime/context: Add runtime option group and options for target
    type and server ip.
  oeqa/runtime/context: Move helper functions for process args to
    executor
  oeqa/utils/dump: Move get_host_dumper to OERuntimeTestContextExecutor
    class
  oeqa/runtime/context.py: Prepare for qemu

Mariano Lopez (24):
  oeqa/core: Add utils module for OEQA framework
  oeqa/core/decorator: Add support for OETestID and OETestTag
  oeqa/core/decorator: Add support for OETimeout decorator
  oeqa/core: Add tests for the OEQA framework
  oeqa/utils/__init__.py: Adds compatibility with bitbake logger
  oeqa/core/target Add OESSHTarget to sent commands to targets using SSH
  oeqa/runtime: Add case, context and loader classes for runtime testing
  oeqa/runtime: Add OEHasPackage decorator
  oeqa/core/decorator/data.py: Add skipIfNotFeature decorator
  oeqa/runtime/files: Move runtime files from old directory
  oeqa/runtime/utils/targetbuildproject.py: Don't use more than 80
    characters per line
  oeqa/core/decorator: Add skipIfNotDataVar and skipIfNotInDataVar
  oeqa/core/context: Add option to select tests to run
  oeqa/runtime/context.py: Add logger to getTarget
  core/target/qemu.py Adds qemu target
  testimage.bbclass: Migrate class to use new runtime framework
  oeqa/runtime/cases: Migrate runtime tests.
  runtime/cases/smart.py: Migrate smart tests
  oeqa/core/utils/test.py: Add functions to get module path
  testimage.bbclass: Add support for package extraction
  testimage.bbclass: Add package install feature
  oeqa/runtime/context.py: Add defaults for runtime context
  testexport.bbclass: Migrate testexport to use new framework
  selftest/runtime-test.py: Adapt test to use new runtime framework

 .../lib/oeqa/runtime/{ => cases}/selftest.json     |   0
 .../lib/oeqa/runtime/{ => cases}/selftest.py       |  34 +--
 meta/classes/populate_sdk_base.bbclass             |   9 +-
 meta/classes/rootfs-postcommands.bbclass           |  18 ++
 meta/classes/testexport.bbclass                    | 211 +++++++---------
 meta/classes/testimage.bbclass                     | 263 ++++++++++++++++----
 meta/classes/testsdk.bbclass                       | 167 +++++++------
 meta/lib/oe/data.py                                |  28 +++
 meta/lib/oeqa/core/README                          |  38 +++
 meta/lib/oeqa/core/__init__.py                     |   0
 meta/lib/oeqa/core/case.py                         |  46 ++++
 meta/lib/oeqa/core/cases/__init__.py               |   0
 meta/lib/oeqa/core/cases/example/data.json         |   1 +
 meta/lib/oeqa/core/cases/example/test_basic.py     |  20 ++
 meta/lib/oeqa/core/context.py                      | 239 ++++++++++++++++++
 meta/lib/oeqa/core/decorator/__init__.py           |  71 ++++++
 meta/lib/oeqa/core/decorator/data.py               |  98 ++++++++
 meta/lib/oeqa/core/decorator/depends.py            |  94 ++++++++
 meta/lib/oeqa/core/decorator/oeid.py               |  23 ++
 meta/lib/oeqa/core/decorator/oetag.py              |  24 ++
 meta/lib/oeqa/core/decorator/oetimeout.py          |  25 ++
 meta/lib/oeqa/core/exception.py                    |  14 ++
 meta/lib/oeqa/core/loader.py                       | 235 ++++++++++++++++++
 meta/lib/oeqa/core/runner.py                       |  76 ++++++
 meta/lib/oeqa/core/target/__init__.py              |  33 +++
 meta/lib/oeqa/core/target/qemu.py                  |  45 ++++
 meta/lib/oeqa/core/target/ssh.py                   | 266 +++++++++++++++++++++
 meta/lib/oeqa/core/tests/__init__.py               |   0
 meta/lib/oeqa/core/tests/cases/data.py             |  20 ++
 meta/lib/oeqa/core/tests/cases/depends.py          |  38 +++
 .../oeqa/core/tests/cases/loader/invalid/oeid.py   |  15 ++
 .../oeqa/core/tests/cases/loader/valid/another.py  |   9 +
 meta/lib/oeqa/core/tests/cases/oeid.py             |  18 ++
 meta/lib/oeqa/core/tests/cases/oetag.py            |  18 ++
 meta/lib/oeqa/core/tests/cases/timeout.py          |  18 ++
 meta/lib/oeqa/core/tests/common.py                 |  35 +++
 meta/lib/oeqa/core/tests/test_data.py              |  51 ++++
 meta/lib/oeqa/core/tests/test_decorators.py        | 135 +++++++++++
 meta/lib/oeqa/core/tests/test_loader.py            |  86 +++++++
 meta/lib/oeqa/core/tests/test_runner.py            |  38 +++
 meta/lib/oeqa/core/utils/__init__.py               |   0
 meta/lib/oeqa/core/utils/misc.py                   |  37 +++
 meta/lib/oeqa/core/utils/path.py                   |  19 ++
 meta/lib/oeqa/core/utils/test.py                   |  86 +++++++
 meta/lib/oeqa/{runtime => }/files/test.c           |   0
 meta/lib/oeqa/{runtime => }/files/test.cpp         |   0
 meta/lib/oeqa/{runtime => }/files/test.pl          |   0
 meta/lib/oeqa/{runtime => }/files/test.py          |   0
 meta/lib/oeqa/oetest.py                            |  92 +------
 meta/lib/oeqa/runtime/buildcvs.py                  |  31 ---
 meta/lib/oeqa/runtime/buildgalculator.py           |  24 --
 meta/lib/oeqa/runtime/buildiptables.py             |  31 ---
 meta/lib/oeqa/runtime/case.py                      |  17 ++
 meta/lib/oeqa/runtime/{ => cases}/_ptest.py        |   0
 meta/lib/oeqa/runtime/{ => cases}/_qemutiny.py     |   0
 meta/lib/oeqa/runtime/cases/buildcvs.py            |  35 +++
 meta/lib/oeqa/runtime/cases/buildgalculator.py     |  31 +++
 meta/lib/oeqa/runtime/cases/buildiptables.py       |  39 +++
 meta/lib/oeqa/runtime/cases/connman.py             |  30 +++
 meta/lib/oeqa/runtime/cases/date.py                |  38 +++
 meta/lib/oeqa/runtime/cases/df.py                  |  13 +
 meta/lib/oeqa/runtime/cases/gcc.py                 |  76 ++++++
 meta/lib/oeqa/runtime/cases/kernelmodule.py        |  40 ++++
 meta/lib/oeqa/runtime/cases/ldd.py                 |  25 ++
 meta/lib/oeqa/runtime/cases/logrotate.py           |  42 ++++
 meta/lib/oeqa/runtime/cases/multilib.py            |  41 ++++
 meta/lib/oeqa/runtime/cases/pam.py                 |  33 +++
 meta/lib/oeqa/runtime/{ => cases}/parselogs.py     | 187 +++++++++------
 meta/lib/oeqa/runtime/cases/perl.py                |  37 +++
 meta/lib/oeqa/runtime/cases/ping.py                |  24 ++
 meta/lib/oeqa/runtime/cases/python.py              |  43 ++++
 meta/lib/oeqa/runtime/cases/rpm.py                 | 141 +++++++++++
 meta/lib/oeqa/runtime/cases/scanelf.py             |  26 ++
 meta/lib/oeqa/runtime/cases/scp.py                 |  33 +++
 meta/lib/oeqa/runtime/cases/skeletoninit.py        |  33 +++
 meta/lib/oeqa/runtime/{ => cases}/smart.py         | 172 ++++++-------
 meta/lib/oeqa/runtime/cases/ssh.py                 |  15 ++
 meta/lib/oeqa/runtime/cases/syslog.py              |  57 +++++
 meta/lib/oeqa/runtime/{ => cases}/systemd.py       | 151 ++++++------
 meta/lib/oeqa/runtime/cases/x32lib.py              |  19 ++
 meta/lib/oeqa/runtime/cases/xorg.py                |  17 ++
 meta/lib/oeqa/runtime/connman.py                   |  31 ---
 meta/lib/oeqa/runtime/context.py                   | 143 +++++++++++
 meta/lib/oeqa/runtime/date.py                      |  31 ---
 meta/lib/oeqa/runtime/decorator/package.py         |  53 ++++
 meta/lib/oeqa/runtime/df.py                        |  12 -
 meta/lib/oeqa/runtime/gcc.py                       |  47 ----
 meta/lib/oeqa/runtime/kernelmodule.py              |  34 ---
 meta/lib/oeqa/runtime/ldd.py                       |  21 --
 meta/lib/oeqa/runtime/loader.py                    |  16 ++
 meta/lib/oeqa/runtime/logrotate.py                 |  30 ---
 meta/lib/oeqa/runtime/multilib.py                  |  42 ----
 meta/lib/oeqa/runtime/pam.py                       |  25 --
 meta/lib/oeqa/runtime/perl.py                      |  30 ---
 meta/lib/oeqa/runtime/ping.py                      |  22 --
 meta/lib/oeqa/runtime/python.py                    |  35 ---
 meta/lib/oeqa/runtime/rpm.py                       | 120 ----------
 meta/lib/oeqa/runtime/scanelf.py                   |  28 ---
 meta/lib/oeqa/runtime/scp.py                       |  22 --
 meta/lib/oeqa/runtime/skeletoninit.py              |  29 ---
 meta/lib/oeqa/runtime/ssh.py                       |  19 --
 meta/lib/oeqa/runtime/syslog.py                    |  52 ----
 meta/lib/oeqa/runtime/utils/__init__.py            |   0
 meta/lib/oeqa/runtime/utils/targetbuildproject.py  |  36 +++
 meta/lib/oeqa/runtime/x32lib.py                    |  18 --
 meta/lib/oeqa/runtime/xorg.py                      |  16 --
 meta/lib/oeqa/sdk/__init__.py                      |   3 -
 meta/lib/oeqa/sdk/case.py                          |  12 +
 meta/lib/oeqa/sdk/{ => cases}/buildcvs.py          |  15 +-
 meta/lib/oeqa/sdk/{ => cases}/buildgalculator.py   |  28 ++-
 meta/lib/oeqa/sdk/{ => cases}/buildiptables.py     |  16 +-
 meta/lib/oeqa/sdk/cases/gcc.py                     |  42 ++++
 meta/lib/oeqa/sdk/cases/perl.py                    |  27 +++
 meta/lib/oeqa/sdk/{ => cases}/python.py            |  25 +-
 meta/lib/oeqa/sdk/context.py                       | 133 +++++++++++
 .../oeqa/{runtime => sdk}/files/testsdkmakefile    |   0
 meta/lib/oeqa/sdk/gcc.py                           |  36 ---
 meta/lib/oeqa/sdk/perl.py                          |  28 ---
 meta/lib/oeqa/sdk/utils/__init__.py                |   0
 meta/lib/oeqa/sdk/utils/sdkbuildproject.py         |  45 ++++
 meta/lib/oeqa/sdkext/__init__.py                   |   3 -
 meta/lib/oeqa/sdkext/case.py                       |  21 ++
 meta/lib/oeqa/sdkext/{ => cases}/devtool.py        |  49 ++--
 meta/lib/oeqa/sdkext/{ => cases}/sdk_update.py     |  17 +-
 meta/lib/oeqa/sdkext/context.py                    |  21 ++
 meta/lib/oeqa/selftest/runtime-test.py             |  42 ++--
 meta/lib/oeqa/utils/__init__.py                    |  30 +++
 meta/lib/oeqa/utils/buildproject.py                |  52 ++++
 meta/lib/oeqa/utils/dump.py                        |  11 +-
 meta/lib/oeqa/utils/package_manager.py             | 181 ++++++++++++++
 scripts/oe-test                                    | 105 ++++++++
 131 files changed, 4631 insertions(+), 1517 deletions(-)
 rename meta-selftest/lib/oeqa/runtime/{ => cases}/selftest.json (100%)
 rename meta-selftest/lib/oeqa/runtime/{ => cases}/selftest.py (53%)
 create mode 100644 meta/lib/oeqa/core/README
 create mode 100644 meta/lib/oeqa/core/__init__.py
 create mode 100644 meta/lib/oeqa/core/case.py
 create mode 100644 meta/lib/oeqa/core/cases/__init__.py
 create mode 100644 meta/lib/oeqa/core/cases/example/data.json
 create mode 100644 meta/lib/oeqa/core/cases/example/test_basic.py
 create mode 100644 meta/lib/oeqa/core/context.py
 create mode 100644 meta/lib/oeqa/core/decorator/__init__.py
 create mode 100644 meta/lib/oeqa/core/decorator/data.py
 create mode 100644 meta/lib/oeqa/core/decorator/depends.py
 create mode 100644 meta/lib/oeqa/core/decorator/oeid.py
 create mode 100644 meta/lib/oeqa/core/decorator/oetag.py
 create mode 100644 meta/lib/oeqa/core/decorator/oetimeout.py
 create mode 100644 meta/lib/oeqa/core/exception.py
 create mode 100644 meta/lib/oeqa/core/loader.py
 create mode 100644 meta/lib/oeqa/core/runner.py
 create mode 100644 meta/lib/oeqa/core/target/__init__.py
 create mode 100644 meta/lib/oeqa/core/target/qemu.py
 create mode 100644 meta/lib/oeqa/core/target/ssh.py
 create mode 100644 meta/lib/oeqa/core/tests/__init__.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/data.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/depends.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/loader/invalid/oeid.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/loader/valid/another.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/oeid.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/oetag.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/timeout.py
 create mode 100644 meta/lib/oeqa/core/tests/common.py
 create mode 100755 meta/lib/oeqa/core/tests/test_data.py
 create mode 100755 meta/lib/oeqa/core/tests/test_decorators.py
 create mode 100755 meta/lib/oeqa/core/tests/test_loader.py
 create mode 100755 meta/lib/oeqa/core/tests/test_runner.py
 create mode 100644 meta/lib/oeqa/core/utils/__init__.py
 create mode 100644 meta/lib/oeqa/core/utils/misc.py
 create mode 100644 meta/lib/oeqa/core/utils/path.py
 create mode 100644 meta/lib/oeqa/core/utils/test.py
 rename meta/lib/oeqa/{runtime => }/files/test.c (100%)
 rename meta/lib/oeqa/{runtime => }/files/test.cpp (100%)
 rename meta/lib/oeqa/{runtime => }/files/test.pl (100%)
 rename meta/lib/oeqa/{runtime => }/files/test.py (100%)
 delete mode 100644 meta/lib/oeqa/runtime/buildcvs.py
 delete mode 100644 meta/lib/oeqa/runtime/buildgalculator.py
 delete mode 100644 meta/lib/oeqa/runtime/buildiptables.py
 create mode 100644 meta/lib/oeqa/runtime/case.py
 rename meta/lib/oeqa/runtime/{ => cases}/_ptest.py (100%)
 rename meta/lib/oeqa/runtime/{ => cases}/_qemutiny.py (100%)
 create mode 100644 meta/lib/oeqa/runtime/cases/buildcvs.py
 create mode 100644 meta/lib/oeqa/runtime/cases/buildgalculator.py
 create mode 100644 meta/lib/oeqa/runtime/cases/buildiptables.py
 create mode 100644 meta/lib/oeqa/runtime/cases/connman.py
 create mode 100644 meta/lib/oeqa/runtime/cases/date.py
 create mode 100644 meta/lib/oeqa/runtime/cases/df.py
 create mode 100644 meta/lib/oeqa/runtime/cases/gcc.py
 create mode 100644 meta/lib/oeqa/runtime/cases/kernelmodule.py
 create mode 100644 meta/lib/oeqa/runtime/cases/ldd.py
 create mode 100644 meta/lib/oeqa/runtime/cases/logrotate.py
 create mode 100644 meta/lib/oeqa/runtime/cases/multilib.py
 create mode 100644 meta/lib/oeqa/runtime/cases/pam.py
 rename meta/lib/oeqa/runtime/{ => cases}/parselogs.py (64%)
 create mode 100644 meta/lib/oeqa/runtime/cases/perl.py
 create mode 100644 meta/lib/oeqa/runtime/cases/ping.py
 create mode 100644 meta/lib/oeqa/runtime/cases/python.py
 create mode 100644 meta/lib/oeqa/runtime/cases/rpm.py
 create mode 100644 meta/lib/oeqa/runtime/cases/scanelf.py
 create mode 100644 meta/lib/oeqa/runtime/cases/scp.py
 create mode 100644 meta/lib/oeqa/runtime/cases/skeletoninit.py
 rename meta/lib/oeqa/runtime/{ => cases}/smart.py (49%)
 create mode 100644 meta/lib/oeqa/runtime/cases/ssh.py
 create mode 100644 meta/lib/oeqa/runtime/cases/syslog.py
 rename meta/lib/oeqa/runtime/{ => cases}/systemd.py (51%)
 create mode 100644 meta/lib/oeqa/runtime/cases/x32lib.py
 create mode 100644 meta/lib/oeqa/runtime/cases/xorg.py
 delete mode 100644 meta/lib/oeqa/runtime/connman.py
 create mode 100644 meta/lib/oeqa/runtime/context.py
 delete mode 100644 meta/lib/oeqa/runtime/date.py
 create mode 100644 meta/lib/oeqa/runtime/decorator/package.py
 delete mode 100644 meta/lib/oeqa/runtime/df.py
 delete mode 100644 meta/lib/oeqa/runtime/gcc.py
 delete mode 100644 meta/lib/oeqa/runtime/kernelmodule.py
 delete mode 100644 meta/lib/oeqa/runtime/ldd.py
 create mode 100644 meta/lib/oeqa/runtime/loader.py
 delete mode 100644 meta/lib/oeqa/runtime/logrotate.py
 delete mode 100644 meta/lib/oeqa/runtime/multilib.py
 delete mode 100644 meta/lib/oeqa/runtime/pam.py
 delete mode 100644 meta/lib/oeqa/runtime/perl.py
 delete mode 100644 meta/lib/oeqa/runtime/ping.py
 delete mode 100644 meta/lib/oeqa/runtime/python.py
 delete mode 100644 meta/lib/oeqa/runtime/rpm.py
 delete mode 100644 meta/lib/oeqa/runtime/scanelf.py
 delete mode 100644 meta/lib/oeqa/runtime/scp.py
 delete mode 100644 meta/lib/oeqa/runtime/skeletoninit.py
 delete mode 100644 meta/lib/oeqa/runtime/ssh.py
 delete mode 100644 meta/lib/oeqa/runtime/syslog.py
 create mode 100644 meta/lib/oeqa/runtime/utils/__init__.py
 create mode 100644 meta/lib/oeqa/runtime/utils/targetbuildproject.py
 delete mode 100644 meta/lib/oeqa/runtime/x32lib.py
 delete mode 100644 meta/lib/oeqa/runtime/xorg.py
 create mode 100644 meta/lib/oeqa/sdk/case.py
 rename meta/lib/oeqa/sdk/{ => cases}/buildcvs.py (59%)
 rename meta/lib/oeqa/sdk/{ => cases}/buildgalculator.py (45%)
 rename meta/lib/oeqa/sdk/{ => cases}/buildiptables.py (58%)
 create mode 100644 meta/lib/oeqa/sdk/cases/gcc.py
 create mode 100644 meta/lib/oeqa/sdk/cases/perl.py
 rename meta/lib/oeqa/sdk/{ => cases}/python.py (46%)
 create mode 100644 meta/lib/oeqa/sdk/context.py
 rename meta/lib/oeqa/{runtime => sdk}/files/testsdkmakefile (100%)
 delete mode 100644 meta/lib/oeqa/sdk/gcc.py
 delete mode 100644 meta/lib/oeqa/sdk/perl.py
 create mode 100644 meta/lib/oeqa/sdk/utils/__init__.py
 create mode 100644 meta/lib/oeqa/sdk/utils/sdkbuildproject.py
 create mode 100644 meta/lib/oeqa/sdkext/case.py
 rename meta/lib/oeqa/sdkext/{ => cases}/devtool.py (73%)
 rename meta/lib/oeqa/sdkext/{ => cases}/sdk_update.py (63%)
 create mode 100644 meta/lib/oeqa/sdkext/context.py
 create mode 100644 meta/lib/oeqa/utils/buildproject.py
 create mode 100755 scripts/oe-test

-- 
2.1.4


