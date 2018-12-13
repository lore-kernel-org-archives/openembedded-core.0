Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0A0946C4BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:00 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id u6so1658536plm.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=kdBeSE2qhJ+ouuw2dVMRb58YHF++Llu1jc6RHlR9cEM=;
	b=qlcmGK+lz+JbFUq53ILEMy3aZoFRDLBc8Z6a+AkVu08D9oHLFkwkeMyPZZQ+yM4Jdj
	nuJ9lJSARsQ11KAuXQP6L1uLi4GyLyzULd4Ut/ItbfoppgnZ6CL3cbdXZMWpX7N7jK8h
	aRIGiqJU6DThQDKt/3M0QeLQDO42GjfmO8wZUdvTG9hzOoJEgyko/JwXfgzYjgS9QmNL
	2sIuwgDgYc70QOwZBrXZlA5UrrmkumtR4E/mb6SnQ6IGdVpBJokun9wGeYMXziaBH9Rx
	TXPZyPiw6SBcOygbtRPGk9VWYxs9+qkO1yg6Cxr3uy5ncRVtL3y/cgCAHCekPq/zHyft
	eq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=kdBeSE2qhJ+ouuw2dVMRb58YHF++Llu1jc6RHlR9cEM=;
	b=fFgCs6GZ/pCkG8j1tnS5NMGofoe0VwCCrTF0fargjB+43nkASV9PxJ9EY7VJBirbPR
	UfSGYh/4n/MPkuC0r0Dmf0bHrS0E7hcbxJ2T0i8Sq7ncUzBmh4FBAjrtg3XE6Kkb85Uv
	W6PqGgbUnDOdQExAqyKfc0ZrBNRCB7vCWtULn/k8W7pi4kq3pjWoKyQ3QGrr9wX9kHwh
	D8aO9TxveGje1rF9LBL+4ilc80/R2ttWS3tzhpLOjbt2p2nTaUWU8zSxDjFcuctGEqBs
	JpOyOX7hVBbIfh4Vv9I7u6V8jSx8PBxlm2MsvgboqH3+WeFKrRrfDgHMcLr+SXFTnFS4
	VxBw==
X-Gm-Message-State: AA+aEWa6nQuP5wIL5XNrz6768kbx+us3Pk1MAKpe1xz9jQgl8claoA90
	Fp9zs+hh16O5vqTBe75vIS8Aliq9
X-Google-Smtp-Source: AFSGD/WNcbibKA67wysoyxzSwOpFU404MKigi6jKFVNcqo7+e2fz30/mLFGjxZGEZwjfhs1oiMpqqg==
X-Received: by 2002:a17:902:7107:: with SMTP id
	a7mr442687pll.290.1544737141757; 
	Thu, 13 Dec 2018 13:39:01 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:08 -0800
Message-Id: <cover.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Sumo][PATCH 00/45] Sumo-next patches for review
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:01 -0000

The Bulk of the changres are for QA automation related support
and some misc backports.

Passed "A-Full" build

The following changes since commit a4c7d286883db186f17d4044a6531eac88473403:

  bitbake: bitbake-user-manual: Added "usehead" parameter. (2018-12-10 20:41:28 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib stable/sumo-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stable/sumo-next

Michael Halstead (1):
  scripts/runqemu: Replace subprocess.run() for compatibilty

Richard Purdie (34):
  scripts/runqemu: Tidy up lock handling code
  scripts/runqemu: Improve lockfile handling for python with
    close_fd=True
  oeqa/selftest/signing: Skip tests if gpg isn't found
  oeqa/selftest/signing: Allow tests not to need gpg on the host
  oeqa/selftest/signing: Use do_populate_lic target instead of
    do_package
  oeqa/selftest/case: Use bb.utils.remove() instead of shutil.remove()
  oeqa/selftest/buildoptions: Improve ccache test failure output
  oeqa/utils/commands: Add extra qemu failure logging
  oeqa/utils/qemurunner: Fix python ResourceWarning for unclosed file
  oeqa/utils/commands: Avoid log message duplication
  oeqa/qemurunner: Remove resource python warnings
  oeqa/selftest/buildoptions: Improve ccache test
  oeqa/selftest/buildoptions: Ensure diskmon tests run consistently
  oeqa/selftest/runqemu: Improve testcase failure handling
  oeqa/utils/qemurunner: Avoid tracebacks on closed files
  oeqa/loader: Fix deprecation warning
  oeqa/utils/commands: Avoid unclosed file warnings
  oeqa/selftest/context: Replace deprecated imp module usage
  oeqa/utils/qemurunner.py: Fix python regex warnings
  oeqa/selftest/context: Improve log file handling
  oeqa/core/runner: Improve test case comparision
  oeqa/runner: Ensure we don't print misleading results output
  oeqa/core/threaded: Remove in favour of using concurrenttests
  oeqa/runner: Simplify code
  oeqa: Remove xmlrunner
  oeqa/runtime/ptest: Inject results+logs into stored json results file
  oeqa/runner: Always show a summary of success/fail/error/skip counts
  oeqa/runner: Sort the test result output by result class
  oeqa/selftest: Improvements to the json logging
  oeqa/utils/metadata: Allow to function without the git module
  image-buildinfo,oeqa/selftest/containerimage: Ensure image-buildinfo
    doesn't break tests
  oeqa/selftest/esdk: Ensure parent directory exists
  oeqa/selftest/esdk: Fix typo causing test failure
  busybox: Put klogd/syslogd alternative links in syslog package

Ross Burton (3):
  oeqa/oelib/path: don't leak temporary directories
  oeqa: don't litter /tmp with temporary directories
  oeqa/selftest/esdk: run selftest inside workdir not /tmp

Stefan Lendl (1):
  default-versions.inc: Make PREFERRED_VERSION_openssl* overwritable

Yeoh Ee Peng (6):
  oeqa/core/runner: refactor for OEQA to write json testresult
  oeqa/core/runner: write testresult to json files
  oeqa/selftest/context: write testresult to json files
  testimage.bbclass: write testresult to json files
  testsdk.bbclass: write testresult to json files
  oeqa/selftest: Standardize json logging output directory

 meta-selftest/recipes-test/delay/delay.bb          |  12 +
 meta/classes/image-buildinfo.bbclass               |   2 +
 meta/classes/testimage.bbclass                     |  31 ++-
 meta/classes/testsdk.bbclass                       |  40 ++-
 meta/conf/distro/include/default-versions.inc      |   6 +-
 meta/lib/oeqa/core/context.py                      |   1 -
 meta/lib/oeqa/core/decorator/depends.py            |   9 +-
 meta/lib/oeqa/core/decorator/oetimeout.py          |  40 +--
 meta/lib/oeqa/core/loader.py                       |   2 +-
 meta/lib/oeqa/core/runner.py                       | 186 +++++++-------
 .../core/tests/cases/loader/threaded/threaded.py   |  12 -
 .../tests/cases/loader/threaded/threaded_alone.py  |   8 -
 .../cases/loader/threaded/threaded_depends.py      |  10 -
 .../tests/cases/loader/threaded/threaded_module.py |  12 -
 meta/lib/oeqa/core/tests/common.py                 |  10 -
 meta/lib/oeqa/core/tests/test_data.py              |   4 +-
 meta/lib/oeqa/core/tests/test_decorators.py        |  12 -
 meta/lib/oeqa/core/tests/test_loader.py            |  30 +--
 meta/lib/oeqa/core/threaded.py                     | 275 ---------------------
 meta/lib/oeqa/runtime/cases/ptest.py               |  21 +-
 meta/lib/oeqa/sdk/context.py                       |   5 +-
 meta/lib/oeqa/selftest/case.py                     |   4 +-
 meta/lib/oeqa/selftest/cases/buildoptions.py       |  12 +-
 meta/lib/oeqa/selftest/cases/containerimage.py     |   1 +
 meta/lib/oeqa/selftest/cases/eSDK.py               |  14 +-
 meta/lib/oeqa/selftest/cases/oelib/path.py         |  10 +-
 meta/lib/oeqa/selftest/cases/runqemu.py            |  32 ++-
 meta/lib/oeqa/selftest/cases/signing.py            |  80 ++++--
 meta/lib/oeqa/selftest/context.py                  |  45 +++-
 meta/lib/oeqa/utils/buildproject.py                |   3 +-
 meta/lib/oeqa/utils/commands.py                    |  11 +-
 meta/lib/oeqa/utils/metadata.py                    |  17 +-
 meta/lib/oeqa/utils/qemurunner.py                  |  26 +-
 meta/lib/oeqa/utils/targetbuild.py                 |   5 +-
 meta/recipes-core/busybox/busybox.inc              |   5 +-
 scripts/runqemu                                    |  25 +-
 36 files changed, 409 insertions(+), 609 deletions(-)
 create mode 100644 meta-selftest/recipes-test/delay/delay.bb
 delete mode 100644 meta/lib/oeqa/core/tests/cases/loader/threaded/threaded.py
 delete mode 100644 meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_alone.py
 delete mode 100644 meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_depends.py
 delete mode 100644 meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_module.py
 delete mode 100644 meta/lib/oeqa/core/threaded.py

-- 
2.7.4


