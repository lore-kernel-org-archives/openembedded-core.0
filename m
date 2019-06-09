Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 76AD97D40F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:05 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id m30so3294735pff.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hhifFTZMLIBpQ5tb4MkIK9plIoedxjrdUImd24Il8Fs=;
	b=CFqmehbXzbpzKE/oBECGx2gKjUoETeG4NmB1dUDhcgwsnqocl7rZKTYoZdjyIZ9s6z
	lArxR6wjDRjEkn1ACErK04zNm77O3BNUPWBbi4eM95NP978mFyWRs4m2gtH9kiLNMJc4
	+IInfc4Uw46wHnP9VXmKasBJ0uKk2+z0kjE1HArTUS6TfW/3u50/TyGdHRlT0ybQGlu6
	3fDRvnhlCn8mr3xtLoB4JsY0oTl0AGuWau1cAvZsNJ8CEDbP6rm2dvJZarBhLylYstrl
	Mn0dq7Xlc31J7q4/FlU8E/pV/jP+/tOm9yjLg/lkEtBq/sBPI5ZArZSCTBpcY9bnlned
	DxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hhifFTZMLIBpQ5tb4MkIK9plIoedxjrdUImd24Il8Fs=;
	b=RYsmFHqRxyYz0AaDlVbWZjvKUYz0ayTOdr+lWw1Fk+sjQGHIq1K7o3ct8g17A9GtV9
	cqeJMSEVdic/K0CfkDp+DuuUKmMdpHqYr3Ij4bqNo3ml0vXSKSx1vSAZhEF8Uq7UGKiz
	vKdCCy9gObLcOamIn+W6EeuwVYQCVqUGe9AFfTJnr7nG4TIhINE7/22I+nngbix5E8/w
	X9nrLwNS4InDB72sBxEi2hxUiOM+PSXD29cZalGHioht97c7VAG8y38lDQHkQW2KL+li
	3mnsN+IJq7q0sYee4vKxTSsmxLAKmtdAFTrhkAH0mM/fk+GiZzN6MeGjJnKlO2pB/HV5
	PO7A==
X-Gm-Message-State: APjAAAWPG4WkrQVM641i1W/j7RzIYhz3MGD7iVxF7iOuVK9fRXUn4ZXw
	Wv9z+jerTi0feoT8awQgZlR6faHQ
X-Google-Smtp-Source: APXvYqxGPBIuLqDAjB4GV1H75/B1qfq2Z/gyH4kVa72TeYfnAZksYiMjkgWzCDN1PhRuLY3YpDhwgA==
X-Received: by 2002:a17:90a:b30a:: with SMTP id
	d10mr16746160pjr.8.1560092046126; 
	Sun, 09 Jun 2019 07:54:06 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:53:35 -0700
Message-Id: <cover.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Warrior-next 00/27] Warrior patch review
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Warrior next patch series
Comments by Wed

The following changes since commit a2915db76d6a2007b22b20f945498c84e7fa8132:

  dbus-test: Improve ptest dependencies dependencies (2019-06-09 11:00:46 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/warrior-nmut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/warrior-nmut

Adrian Bunk (1):
  openssl: Upgrade 1.1.1b -> 1.1.1c

Adrian Freihofer (1):
  qemurunner: fix undefined variable

Armin Kuster (6):
  ltp: add runtime test
  ltp_compliance: add new runtime
  resulttool: add ltp test support
  resulttool: add LTP compliance section
  logparser: Add decoding ltp logs
  logparser: Add LTP compliance section

Bruce Ashfield (10):
  linux-yocto/5.0: update to v5.0.13
  linux-yocto/4.19: update to v4.19.40
  linux-yocto/4.19: update to v4.19.44
  kernel: package modules.builtin.modinfo
  linux-yocto/5.0: update to v5.0.17
  linux-yocto-rt/5.0: update to -rt9
  linux-yocto/5.0: update to v5.0.19
  linux-yocto-rt/5.0: update to -rt11
  linux-yocto/5.0: fix systemtap on arm
  linux-yocto: ptest: Add SCSI debug configuration for util-linux

Hongxu Jia (1):
  lib/oe/reciputils.py: support character `+' in git pv

Jon Mason (2):
  resulttool: modify to be multi-machine
  resulttool: Remove prints if no tests occur

Kevin Hao (2):
  runqemu: Add the support to pass multi ports to tcpserial parameter
  oeqa/utils/qemurunner: Set both the threadport&serverport with
    tcpserial parameter

Richard Purdie (3):
  yocto-uninative: Update to 2.5 release
  uninative: Switch from bz2 to xz
  meta/lib+scripts: Convert to SPDX license headers

sangeeta jain (1):
  resulttool/manualexecution: Enable creation of test case configuration

 LICENSE                                            |  24 ++--
 meta/COPYING.GPLv2 => LICENSE.GPL-2.0-only         |  61 +---------
 meta-selftest/COPYING.MIT => LICENSE.MIT           |  12 +-
 meta-skeleton/COPYING.MIT                          |  17 ---
 meta/classes/kernel.bbclass                        |   2 +-
 meta/classes/uninative.bbclass                     |   4 +-
 meta/conf/distro/include/yocto-uninative.inc       |   8 +-
 meta/lib/bblayers/create.py                        |   4 +
 meta/lib/buildstats.py                             |   3 +
 meta/lib/oe/__init__.py                            |   4 +
 meta/lib/oe/buildhistory_analysis.py               |   2 +
 meta/lib/oe/cachedpath.py                          |   2 +
 meta/lib/oe/classextend.py                         |   4 +
 meta/lib/oe/classutils.py                          |   3 +
 meta/lib/oe/copy_buildsystem.py                    |   3 +
 meta/lib/oe/data.py                                |   4 +
 meta/lib/oe/distro_check.py                        |   4 +
 meta/lib/oe/elf.py                                 |   4 +
 meta/lib/oe/gpg_sign.py                            |   4 +
 meta/lib/oe/license.py                             |   4 +-
 meta/lib/oe/lsb.py                                 |   4 +
 meta/lib/oe/maketype.py                            |   3 +
 meta/lib/oe/manifest.py                            |   4 +
 meta/lib/oe/package.py                             |   4 +
 meta/lib/oe/package_manager.py                     |   4 +
 meta/lib/oe/packagedata.py                         |   4 +
 meta/lib/oe/packagegroup.py                        |   4 +
 meta/lib/oe/patch.py                               |   4 +
 meta/lib/oe/path.py                                |   4 +
 meta/lib/oe/prservice.py                           |   3 +
 meta/lib/oe/qa.py                                  |   4 +
 meta/lib/oe/recipeutils.py                         |   4 +-
 meta/lib/oe/rootfs.py                              |   3 +
 meta/lib/oe/sdk.py                                 |   4 +
 meta/lib/oe/sstatesig.py                           |   3 +
 meta/lib/oe/terminal.py                            |   3 +
 meta/lib/oe/types.py                               |   4 +
 meta/lib/oe/useradd.py                             |   3 +
 meta/lib/oe/utils.py                               |   4 +
 meta/lib/oeqa/buildperf/__init__.py                |   8 +-
 meta/lib/oeqa/buildperf/base.py                    |   9 +-
 meta/lib/oeqa/buildperf/test_basic.py              |   9 +-
 meta/lib/oeqa/controllers/__init__.py              |   3 +
 meta/lib/oeqa/controllers/masterimage.py           |   4 +-
 meta/lib/oeqa/controllers/testtargetloader.py      |   4 +
 meta/lib/oeqa/core/case.py                         |   5 +-
 meta/lib/oeqa/core/cases/example/test_basic.py     |   4 +-
 meta/lib/oeqa/core/context.py                      |   6 +-
 meta/lib/oeqa/core/decorator/__init__.py           |   5 +-
 meta/lib/oeqa/core/decorator/data.py               |   5 +-
 meta/lib/oeqa/core/decorator/depends.py            |   5 +-
 meta/lib/oeqa/core/decorator/oetag.py              |   5 +-
 meta/lib/oeqa/core/decorator/oetimeout.py          |   5 +-
 meta/lib/oeqa/core/exception.py                    |   5 +-
 meta/lib/oeqa/core/loader.py                       |   5 +-
 meta/lib/oeqa/core/runner.py                       |   5 +-
 meta/lib/oeqa/core/target/__init__.py              |   5 +-
 meta/lib/oeqa/core/target/qemu.py                  |   5 +-
 meta/lib/oeqa/core/target/ssh.py                   |   5 +-
 meta/lib/oeqa/core/tests/cases/data.py             |   5 +-
 meta/lib/oeqa/core/tests/cases/depends.py          |   5 +-
 .../oeqa/core/tests/cases/loader/valid/another.py  |   5 +-
 meta/lib/oeqa/core/tests/cases/oetag.py            |   5 +-
 meta/lib/oeqa/core/tests/cases/timeout.py          |   5 +-
 meta/lib/oeqa/core/tests/common.py                 |   5 +-
 meta/lib/oeqa/core/tests/test_data.py              |   4 +-
 meta/lib/oeqa/core/tests/test_decorators.py        |   6 +-
 meta/lib/oeqa/core/tests/test_loader.py            |   6 +-
 meta/lib/oeqa/core/tests/test_runner.py            |   6 +-
 meta/lib/oeqa/core/utils/concurrencytest.py        |   2 +
 meta/lib/oeqa/core/utils/misc.py                   |   5 +-
 meta/lib/oeqa/core/utils/path.py                   |   5 +-
 meta/lib/oeqa/core/utils/test.py                   |   5 +-
 meta/lib/oeqa/oetest.py                            |   4 +-
 meta/lib/oeqa/runexported.py                       |   6 +-
 meta/lib/oeqa/runtime/case.py                      |   5 +-
 meta/lib/oeqa/runtime/cases/_qemutiny.py           |   4 +
 meta/lib/oeqa/runtime/cases/apt.py                 |   4 +
 meta/lib/oeqa/runtime/cases/buildcpio.py           |   4 +
 meta/lib/oeqa/runtime/cases/buildgalculator.py     |   4 +
 meta/lib/oeqa/runtime/cases/buildlzip.py           |   4 +
 meta/lib/oeqa/runtime/cases/connman.py             |   4 +
 meta/lib/oeqa/runtime/cases/date.py                |   4 +
 meta/lib/oeqa/runtime/cases/df.py                  |   4 +
 meta/lib/oeqa/runtime/cases/dnf.py                 |   4 +
 meta/lib/oeqa/runtime/cases/gcc.py                 |   4 +
 meta/lib/oeqa/runtime/cases/gi.py                  |   4 +
 meta/lib/oeqa/runtime/cases/gstreamer.py           |   4 +
 meta/lib/oeqa/runtime/cases/kernelmodule.py        |   4 +
 meta/lib/oeqa/runtime/cases/ksample.py             |   4 +
 meta/lib/oeqa/runtime/cases/ldd.py                 |   4 +
 meta/lib/oeqa/runtime/cases/logrotate.py           |   4 +
 meta/lib/oeqa/runtime/cases/ltp.py                 | 118 +++++++++++++++++++
 meta/lib/oeqa/runtime/cases/ltp_compliance.py      |  97 +++++++++++++++
 meta/lib/oeqa/runtime/cases/multilib.py            |   4 +
 meta/lib/oeqa/runtime/cases/oe_syslog.py           |   4 +
 meta/lib/oeqa/runtime/cases/opkg.py                |   4 +
 meta/lib/oeqa/runtime/cases/pam.py                 |   4 +
 meta/lib/oeqa/runtime/cases/parselogs.py           |   4 +
 meta/lib/oeqa/runtime/cases/perl.py                |   4 +
 meta/lib/oeqa/runtime/cases/ping.py                |   4 +
 meta/lib/oeqa/runtime/cases/ptest.py               |   4 +
 meta/lib/oeqa/runtime/cases/python.py              |   4 +
 meta/lib/oeqa/runtime/cases/rpm.py                 |   4 +
 meta/lib/oeqa/runtime/cases/scp.py                 |   4 +
 meta/lib/oeqa/runtime/cases/skeletoninit.py        |   4 +
 meta/lib/oeqa/runtime/cases/ssh.py                 |   4 +
 meta/lib/oeqa/runtime/cases/stap.py                |   4 +
 meta/lib/oeqa/runtime/cases/systemd.py             |   4 +
 meta/lib/oeqa/runtime/cases/x32lib.py              |   4 +
 meta/lib/oeqa/runtime/cases/xorg.py                |   4 +
 meta/lib/oeqa/runtime/context.py                   |   5 +-
 meta/lib/oeqa/runtime/decorator/package.py         |   5 +-
 meta/lib/oeqa/runtime/loader.py                    |   5 +-
 meta/lib/oeqa/runtime/utils/targetbuildproject.py  |   5 +-
 meta/lib/oeqa/sdk/case.py                          |   5 +-
 meta/lib/oeqa/sdk/cases/assimp.py                  |   4 +
 meta/lib/oeqa/sdk/cases/buildcpio.py               |   4 +
 meta/lib/oeqa/sdk/cases/buildepoxy.py              |   4 +
 meta/lib/oeqa/sdk/cases/buildgalculator.py         |   4 +
 meta/lib/oeqa/sdk/cases/buildlzip.py               |   4 +
 meta/lib/oeqa/sdk/cases/gcc.py                     |   4 +
 meta/lib/oeqa/sdk/cases/perl.py                    |   4 +
 meta/lib/oeqa/sdk/cases/python.py                  |   4 +
 meta/lib/oeqa/sdk/context.py                       |   5 +-
 meta/lib/oeqa/sdk/testsdk.py                       |   5 +-
 meta/lib/oeqa/sdk/utils/sdkbuildproject.py         |   5 +-
 meta/lib/oeqa/sdkext/case.py                       |   5 +-
 meta/lib/oeqa/sdkext/cases/devtool.py              |   5 +-
 meta/lib/oeqa/sdkext/context.py                    |   5 +-
 meta/lib/oeqa/sdkext/testsdk.py                    |   5 +-
 meta/lib/oeqa/selftest/case.py                     |   5 +-
 .../lib/oeqa/selftest/cases/_sstatetests_noauto.py |   4 +
 meta/lib/oeqa/selftest/cases/archiver.py           |   4 +
 meta/lib/oeqa/selftest/cases/bblayers.py           |   4 +
 meta/lib/oeqa/selftest/cases/bbtests.py            |   4 +
 meta/lib/oeqa/selftest/cases/buildhistory.py       |   4 +
 meta/lib/oeqa/selftest/cases/buildoptions.py       |   4 +
 meta/lib/oeqa/selftest/cases/containerimage.py     |   4 +
 meta/lib/oeqa/selftest/cases/devtool.py            |   4 +
 meta/lib/oeqa/selftest/cases/distrodata.py         |   4 +
 meta/lib/oeqa/selftest/cases/eSDK.py               |   4 +
 meta/lib/oeqa/selftest/cases/efibootpartition.py   |   2 +
 meta/lib/oeqa/selftest/cases/fetch.py              |   4 +
 meta/lib/oeqa/selftest/cases/gotoolchain.py        |   4 +
 meta/lib/oeqa/selftest/cases/image_typedep.py      |   4 +
 meta/lib/oeqa/selftest/cases/imagefeatures.py      |   4 +
 meta/lib/oeqa/selftest/cases/layerappend.py        |   4 +
 meta/lib/oeqa/selftest/cases/liboe.py              |   4 +
 meta/lib/oeqa/selftest/cases/lic_checksum.py       |   4 +
 meta/lib/oeqa/selftest/cases/manifest.py           |   4 +
 meta/lib/oeqa/selftest/cases/meta_ide.py           |   4 +
 meta/lib/oeqa/selftest/cases/multiconfig.py        |   4 +
 meta/lib/oeqa/selftest/cases/oelib/buildhistory.py |   4 +
 meta/lib/oeqa/selftest/cases/oelib/elf.py          |   4 +
 meta/lib/oeqa/selftest/cases/oelib/license.py      |   4 +
 meta/lib/oeqa/selftest/cases/oelib/path.py         |   4 +
 meta/lib/oeqa/selftest/cases/oelib/types.py        |   4 +
 meta/lib/oeqa/selftest/cases/oelib/utils.py        |   4 +
 meta/lib/oeqa/selftest/cases/oescripts.py          |   4 +
 meta/lib/oeqa/selftest/cases/package.py            |   4 +
 meta/lib/oeqa/selftest/cases/pkgdata.py            |   4 +
 meta/lib/oeqa/selftest/cases/prservice.py          |   4 +
 meta/lib/oeqa/selftest/cases/recipetool.py         |   4 +
 meta/lib/oeqa/selftest/cases/recipeutils.py        |   4 +
 meta/lib/oeqa/selftest/cases/resulttooltests.py    |   6 +-
 meta/lib/oeqa/selftest/cases/runcmd.py             |   4 +
 meta/lib/oeqa/selftest/cases/runqemu.py            |   2 +
 meta/lib/oeqa/selftest/cases/runtime_test.py       |   4 +
 meta/lib/oeqa/selftest/cases/selftest.py           |   4 +
 meta/lib/oeqa/selftest/cases/signing.py            |   4 +
 meta/lib/oeqa/selftest/cases/sstate.py             |   4 +
 meta/lib/oeqa/selftest/cases/sstatetests.py        |   4 +
 meta/lib/oeqa/selftest/cases/tinfoil.py            |   4 +
 meta/lib/oeqa/selftest/cases/wic.py                |  16 +--
 meta/lib/oeqa/selftest/context.py                  |   5 +-
 meta/lib/oeqa/targetcontrol.py                     |   4 +-
 meta/lib/oeqa/utils/__init__.py                    |   3 +
 meta/lib/oeqa/utils/buildproject.py                |   4 +-
 meta/lib/oeqa/utils/commands.py                    |   4 +-
 meta/lib/oeqa/utils/decorators.py                  |   4 +-
 meta/lib/oeqa/utils/dump.py                        |   4 +
 meta/lib/oeqa/utils/ftools.py                      |   4 +
 meta/lib/oeqa/utils/git.py                         |   2 +-
 meta/lib/oeqa/utils/gitarchive.py                  |   9 +-
 meta/lib/oeqa/utils/httpserver.py                  |   4 +
 meta/lib/oeqa/utils/logparser.py                   |  65 ++++++++++
 meta/lib/oeqa/utils/metadata.py                    |   2 +-
 meta/lib/oeqa/utils/network.py                     |   4 +
 meta/lib/oeqa/utils/package_manager.py             |   4 +
 meta/lib/oeqa/utils/qemurunner.py                  |   9 +-
 meta/lib/oeqa/utils/qemutinyrunner.py              |   4 +-
 meta/lib/oeqa/utils/sshcontrol.py                  |   5 +-
 meta/lib/oeqa/utils/subprocesstweak.py             |   3 +
 meta/lib/oeqa/utils/targetbuild.py                 |   4 +-
 meta/lib/oeqa/utils/testexport.py                  |   4 +-
 meta/lib/rootfspostcommands.py                     |   4 +
 .../openssl/openssl/CVE-2019-1543.patch            |  69 -----------
 .../openssl/openssl/afalg.patch                    |   6 +-
 .../{openssl_1.1.1b.bb => openssl_1.1.1c.bb}       |   5 +-
 .../qemu/nativesdk-qemu-helper_1.0.bb              |   2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   |   6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb    |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb |   8 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb  |   8 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      |  20 ++--
 meta/recipes-kernel/linux/linux-yocto_5.0.bb       |  20 ++--
 oe-init-build-env                                  |  13 +-
 scripts/autobuilder-worker-prereq-tests            |   2 +-
 scripts/bitbake-prserv-tool                        |   3 +
 scripts/bitbake-whatchanged                        |  12 +-
 scripts/buildhistory-collect-srcrevs               |  12 +-
 scripts/buildhistory-diff                          |   3 +
 scripts/buildstats-diff                            |  10 +-
 scripts/combo-layer                                |  12 +-
 scripts/combo-layer-hook-default.sh                |   3 +
 scripts/contrib/bb-perf/bb-matrix-plot.sh          |  15 +--
 scripts/contrib/bb-perf/bb-matrix.sh               |  15 +--
 scripts/contrib/bb-perf/buildstats-plot.sh         |  15 +--
 scripts/contrib/bb-perf/buildstats.sh              |  15 +--
 scripts/contrib/bbvars.py                          |  14 +--
 scripts/contrib/build-perf-test-wrapper.sh         |  10 +-
 scripts/contrib/ddimage                            |   3 +
 scripts/contrib/devtool-stress.py                  |  13 +-
 scripts/contrib/dialog-power-control               |   2 +
 scripts/contrib/documentation-audit.sh             |   3 +-
 scripts/contrib/graph-tool                         |  13 +-
 scripts/contrib/list-packageconfig-flags.py        |  15 +--
 scripts/contrib/oe-build-perf-report-email.py      |  10 +-
 scripts/contrib/patchreview.py                     |   3 +
 scripts/contrib/patchtest.sh                       |  18 +--
 scripts/contrib/serdevtry                          |   3 +-
 scripts/contrib/test_build_time.sh                 |  16 +--
 scripts/contrib/test_build_time_worker.sh          |   4 +-
 scripts/contrib/uncovered                          |  15 +--
 scripts/contrib/verify-homepage.py                 |   4 +-
 scripts/cp-noerror                                 |   2 +
 scripts/create-pull-request                        |  15 +--
 scripts/crosstap                                   |  13 +-
 scripts/devtool                                    |  12 +-
 scripts/gen-lockedsig-cache                        |   3 +
 scripts/gen-site-config                            |  12 +-
 scripts/lib/argparse_oe.py                         |   4 +
 scripts/lib/build_perf/__init__.py                 |   9 +-
 scripts/lib/build_perf/html.py                     |   9 +-
 scripts/lib/build_perf/report.py                   |   9 +-
 scripts/lib/buildstats.py                          |   9 +-
 scripts/lib/checklayer/__init__.py                 |   4 +-
 scripts/lib/checklayer/case.py                     |   4 +-
 scripts/lib/checklayer/cases/bsp.py                |   4 +-
 scripts/lib/checklayer/cases/common.py             |   4 +-
 scripts/lib/checklayer/cases/distro.py             |   4 +-
 scripts/lib/checklayer/context.py                  |   4 +-
 scripts/lib/devtool/__init__.py                    |  12 +-
 scripts/lib/devtool/build.py                       |  12 +-
 scripts/lib/devtool/build_image.py                 |  12 +-
 scripts/lib/devtool/build_sdk.py                   |  12 +-
 scripts/lib/devtool/deploy.py                      |  12 +-
 scripts/lib/devtool/export.py                      |  12 +-
 scripts/lib/devtool/import.py                      |  12 +-
 scripts/lib/devtool/package.py                     |  12 +-
 scripts/lib/devtool/runqemu.py                     |  12 +-
 scripts/lib/devtool/sdk.py                         |  12 +-
 scripts/lib/devtool/search.py                      |  12 +-
 scripts/lib/devtool/standard.py                    |  12 +-
 scripts/lib/devtool/upgrade.py                     |  13 +-
 scripts/lib/devtool/utilcmds.py                    |  12 +-
 scripts/lib/recipetool/append.py                   |  12 +-
 scripts/lib/recipetool/create.py                   |  12 +-
 scripts/lib/recipetool/create_buildsys.py          |  12 +-
 scripts/lib/recipetool/create_buildsys_python.py   |  12 +-
 scripts/lib/recipetool/create_kernel.py            |  12 +-
 scripts/lib/recipetool/create_kmod.py              |  12 +-
 scripts/lib/recipetool/create_npm.py               |  12 +-
 scripts/lib/recipetool/edit.py                     |  12 +-
 scripts/lib/recipetool/newappend.py                |  12 +-
 scripts/lib/recipetool/setvar.py                   |  12 +-
 scripts/lib/resulttool/log.py                      |   9 +-
 scripts/lib/resulttool/manualexecution.py          |  41 +++++--
 scripts/lib/resulttool/merge.py                    |  10 +-
 scripts/lib/resulttool/regression.py               |  10 +-
 scripts/lib/resulttool/report.py                   | 131 +++++++++++++++++----
 scripts/lib/resulttool/resultutils.py              |  10 +-
 scripts/lib/resulttool/store.py                    |  10 +-
 .../resulttool/template/test_report_full_text.txt  |  46 +++++++-
 scripts/lib/scriptpath.py                          |  12 +-
 scripts/lib/scriptutils.py                         |  12 +-
 scripts/lib/wic/__init__.py                        |  12 +-
 scripts/lib/wic/engine.py                          |  16 +--
 scripts/lib/wic/filemap.py                         |   9 +-
 scripts/lib/wic/help.py                            |  17 +--
 scripts/lib/wic/ksparser.py                        |  15 +--
 scripts/lib/wic/misc.py                            |  16 +--
 scripts/lib/wic/partition.py                       |  16 +--
 scripts/lib/wic/pluginbase.py                      |  12 +-
 scripts/lib/wic/plugins/imager/direct.py           |  16 +--
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  16 +--
 .../lib/wic/plugins/source/bootimg-partition.py    |  15 +--
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  16 +--
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |  15 +--
 scripts/lib/wic/plugins/source/rawcopy.py          |  15 +--
 scripts/lib/wic/plugins/source/rootfs.py           |  16 +--
 scripts/lnr                                        |   3 +
 scripts/multilib_header_wrapper.h                  |  18 +--
 scripts/native-intercept/chown                     |   3 +
 scripts/oe-build-perf-report                       |  10 +-
 scripts/oe-build-perf-test                         |  11 +-
 scripts/oe-buildenv-internal                       |  13 +-
 scripts/oe-check-sstate                            |  12 +-
 scripts/oe-depends-dot                             |  12 +-
 scripts/oe-find-native-sysroot                     |  12 +-
 scripts/oe-git-archive                             |  10 +-
 scripts/oe-git-proxy                               |   3 +-
 scripts/oe-gnome-terminal-phonehome                |   2 +
 scripts/oe-pkgdata-util                            |  13 +-
 scripts/oe-publish-sdk                             |  16 +--
 scripts/oe-pylint                                  |   2 +
 scripts/oe-run-native                              |  14 +--
 scripts/oe-selftest                                |  12 +-
 scripts/oe-setup-builddir                          |  13 +-
 scripts/oe-test                                    |   4 +-
 scripts/oe-trim-schemas                            |   3 +
 scripts/oepydevshell-internal.py                   |   3 +
 scripts/opkg-query-helper.py                       |  15 +--
 scripts/postinst-intercepts/delay_to_first_boot    |   4 +
 scripts/postinst-intercepts/postinst_intercept     |   2 +
 scripts/postinst-intercepts/update_font_cache      |   3 +
 .../postinst-intercepts/update_gio_module_cache    |   3 +
 .../postinst-intercepts/update_gtk_immodules_cache |   3 +
 scripts/postinst-intercepts/update_icon_cache      |   3 +
 scripts/postinst-intercepts/update_pixbuf_cache    |   3 +
 scripts/postinst-intercepts/update_udev_hwdb       |   3 +
 scripts/pythondeps                                 |   2 +
 scripts/recipetool                                 |  12 +-
 scripts/relocate_sdk.py                            |  13 +-
 scripts/resulttool                                 |   9 +-
 scripts/rpm2cpio.sh                                |   1 -
 scripts/runqemu                                    |  24 ++--
 scripts/runqemu-addptable2image                    |  14 +--
 scripts/runqemu-export-rootfs                      |  12 +-
 scripts/runqemu-extract-sdk                        |  12 +-
 scripts/runqemu-gen-tapdevs                        |  12 +-
 scripts/runqemu-ifdown                             |  12 +-
 scripts/runqemu-ifup                               |  12 +-
 scripts/send-error-report                          |   3 +
 scripts/send-pull-request                          |  15 +--
 scripts/sstate-cache-management.sh                 |  13 +-
 scripts/sstate-diff-machines.sh                    |   4 +-
 scripts/sstate-sysroot-cruft.sh                    |   4 +-
 scripts/sysroot-relativelinks.py                   |   4 +
 scripts/task-time                                  |   3 +
 scripts/test-reexec                                |  15 +--
 scripts/test-remote-image                          |  14 +--
 scripts/tiny/dirsize.py                            |  16 +--
 scripts/tiny/ksize.py                              |  16 +--
 scripts/tiny/ksum.py                               |  16 +--
 scripts/verify-bashisms                            |   3 +
 scripts/wic                                        |  16 +--
 scripts/yocto-check-layer                          |   4 +-
 scripts/yocto-check-layer-wrapper                  |   4 +-
 360 files changed, 1482 insertions(+), 1595 deletions(-)
 rename meta/COPYING.GPLv2 => LICENSE.GPL-2.0-only (84%)
 rename meta-selftest/COPYING.MIT => LICENSE.MIT (77%)
 delete mode 100644 meta-skeleton/COPYING.MIT
 create mode 100644 meta/lib/oeqa/runtime/cases/ltp.py
 create mode 100644 meta/lib/oeqa/runtime/cases/ltp_compliance.py
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2019-1543.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1b.bb => openssl_1.1.1c.bb} (97%)

-- 
2.7.4


