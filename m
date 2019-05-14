Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 49A676C216
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:09 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id g9so7595341plm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=n2klTvrsBqbdOnUVihWOHxYJfCjlbOkYQKkZsyyQFbE=;
	b=orquxIBQNw/4wJjuU6yXXzPPI9abJj+51T1z4UUkcCy4ZJAIz2UaNjp8R0UYlrsZ+C
	MUFKZXPKXRTeVGVevescDbTaA4/HcAFrFWtg19RrueBT4M4xdYwDiS2H+IAGH+8mAD1j
	52kd4S3wgtYiCtztmNIsW0N/2DYedxfG5+b4zxv5zW4e8lFwXp1pSyqwUy5rOsW7HYrr
	XoRLQkY4ELXF74vdzBczSN3se2N2Fo1rAmY5Ls0SrL9mqPKSUKHSAFahKJ+hP+w/NccS
	UMhn/oESD9S02/2/X+HaJSIx44acf9MMTNeZc51tPh3gbc6GR/+eRWFn21Me5mNFSyeR
	WLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=n2klTvrsBqbdOnUVihWOHxYJfCjlbOkYQKkZsyyQFbE=;
	b=BPqWY3lRtZSX31tCRr7A8q1ljcKyKd7nLMd49LHdikysu/u/yJthfEwO6lX2729e9j
	cjGivBmI6Q7XKEfmOqHOEPjb9gbUWTvJNgAxRQ+G9vbaW5zHvNv9YrQ+wnkUMevsJqdD
	QF8SNbPcoDwQDUYLF4KJeBP1mSMBvzMi7AM7Pk27mY5ukK0IGcHY7vib1aZjzP0xO/sF
	jLPzPZ1lJwBaKnQIFAjWgR+1e/18A+FlK920LrgfumRWuOwcOrXGNDw18bJukOwvydXV
	Nz629WrRCTGbaDB9iUqYc1ukAAt1iIcQZLHKUpIPavn69N68/6AC5MvxqUmg4uDJX/G9
	njPQ==
X-Gm-Message-State: APjAAAWNAYT0Gnbfzrrp1j5+/YrhBWoqZf2MkiVRRjfxtYMqHmRCRgsr
	vU3iBzN4nyX7pb1DFvXrBQvFOv5W
X-Google-Smtp-Source: APXvYqym/vOdizT4HLo9erDHoStvY52p5VOfUHv2vWZk7x2ZryB0DDh8MfOctcOorMZtc3UdjWDhoQ==
X-Received: by 2002:a17:902:4481:: with SMTP id
	l1mr22291687pld.121.1557809649931; 
	Mon, 13 May 2019 21:54:09 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:53:42 -0700
Message-Id: <cover.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 00/23] Patch review for warrior-next
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
X-List-Received-Date: Tue, 14 May 2019 04:54:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review these for the next warrior update

The following changes since commit fdc068de3c493dea3a22bb8f91273f7b7978c639:

  linux-yocto/5.0: update TCP patch to mainline version (2019-05-04 14:52:34 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/warrior-nmut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/warrior-nmut

Alex Kiernan (3):
  go: Exclude vcs files when installing deps
  recipetool: fix unbound variable when fixed SRCREV can't be found
  uboot-sign: Fix build when UBOOT_DTB_BINARY is empty

Andreas Obergschwandtner (1):
  uboot-sign: add support for different u-boot configurations

Chen Qi (3):
  ghostscript: set CVE_PRODUCT
  flac: also add flac to CVE_PRODUCT
  squashfs-tools: set CVE_PRODUCT

Douglas Royds (1):
  distutils: Run python from the PATH in the -native case as well

Hongxu Jia (2):
  cpio/tar/native.bbclass: move rmt to sbindir and add a prefix to avoid
    native clashing
  acpica: use update-alternatives for acpidump

Joshua Watt (2):
  bitbake.conf: Account for older versions of bitbake
  resulttool: Add option to dump all ptest logs

Martin Jansa (1):
  opkg: fix ptest packaging when OPKGLIBDIR == libdir

Max Kellermann (1):
  useradd-staticids: print exception after parse_args() error

Mingli Yu (1):
  nettle: fix the Segmentation fault

Oleksandr Kravchuk (1):
  bitbake.conf: use https instead of http

Paul Barker (1):
  gdb: Fix aarch64 build with musl

Richard Purdie (3):
  oeqa/ssh: Avoid unicode decode exceptions
  oeqa: Drop OETestID
  oeqa/core/runner: Handle unexpectedSucesses

Ross Burton (1):
  wic: change expand behaviour to match docs

Stefan Müller-Klieser (1):
  cml1.bbclass: fix undefined behavior

Ying-Chun Liu (PaulLiu) (1):
  uboot-sign: Fix u-boot-nodtb symlinks

 meta/classes/cml1.bbclass                          |  2 +-
 meta/classes/distutils.bbclass                     | 11 ++-
 meta/classes/distutils3.bbclass                    |  7 +-
 meta/classes/go.bbclass                            |  2 +-
 meta/classes/native.bbclass                        |  1 +
 meta/classes/uboot-sign.bbclass                    | 89 ++++++++++++++--------
 meta/classes/useradd-staticids.bbclass             |  8 +-
 meta/conf/bitbake.conf                             | 26 ++++---
 meta/lib/oeqa/core/decorator/oeid.py               | 23 ------
 meta/lib/oeqa/core/runner.py                       | 41 +++-------
 meta/lib/oeqa/core/target/ssh.py                   |  4 +-
 .../oeqa/core/tests/cases/loader/invalid/oeid.py   | 15 ----
 meta/lib/oeqa/core/tests/cases/oeid.py             | 18 -----
 meta/lib/oeqa/core/tests/test_decorators.py        | 23 ------
 meta/lib/oeqa/core/tests/test_loader.py            | 11 ++-
 meta/lib/oeqa/runtime/cases/buildcpio.py           |  2 -
 meta/lib/oeqa/runtime/cases/buildgalculator.py     |  2 -
 meta/lib/oeqa/runtime/cases/buildlzip.py           |  2 -
 meta/lib/oeqa/runtime/cases/connman.py             |  3 -
 meta/lib/oeqa/runtime/cases/date.py                |  2 -
 meta/lib/oeqa/runtime/cases/df.py                  |  2 -
 meta/lib/oeqa/runtime/cases/dnf.py                 | 15 ----
 meta/lib/oeqa/runtime/cases/gcc.py                 |  5 --
 meta/lib/oeqa/runtime/cases/kernelmodule.py        |  2 -
 meta/lib/oeqa/runtime/cases/ksample.py             |  1 -
 meta/lib/oeqa/runtime/cases/ldd.py                 |  2 -
 meta/lib/oeqa/runtime/cases/logrotate.py           |  3 -
 meta/lib/oeqa/runtime/cases/multilib.py            |  3 -
 meta/lib/oeqa/runtime/cases/oe_syslog.py           |  5 --
 meta/lib/oeqa/runtime/cases/pam.py                 |  2 -
 meta/lib/oeqa/runtime/cases/parselogs.py           |  2 -
 meta/lib/oeqa/runtime/cases/perl.py                |  2 -
 meta/lib/oeqa/runtime/cases/ping.py                |  2 -
 meta/lib/oeqa/runtime/cases/ptest.py               |  2 -
 meta/lib/oeqa/runtime/cases/python.py              |  2 -
 meta/lib/oeqa/runtime/cases/rpm.py                 |  7 --
 meta/lib/oeqa/runtime/cases/scp.py                 |  2 -
 meta/lib/oeqa/runtime/cases/skeletoninit.py        |  2 -
 meta/lib/oeqa/runtime/cases/ssh.py                 |  2 -
 meta/lib/oeqa/runtime/cases/stap.py                |  2 -
 meta/lib/oeqa/runtime/cases/systemd.py             |  5 --
 meta/lib/oeqa/runtime/cases/x32lib.py              |  2 -
 meta/lib/oeqa/runtime/cases/xorg.py                |  2 -
 meta/lib/oeqa/sdkext/cases/devtool.py              |  7 --
 meta/lib/oeqa/selftest/cases/archiver.py           |  4 -
 meta/lib/oeqa/selftest/cases/bblayers.py           |  8 --
 meta/lib/oeqa/selftest/cases/bbtests.py            | 26 -------
 meta/lib/oeqa/selftest/cases/buildoptions.py       | 10 ---
 meta/lib/oeqa/selftest/cases/containerimage.py     |  2 -
 meta/lib/oeqa/selftest/cases/devtool.py            | 39 ----------
 meta/lib/oeqa/selftest/cases/distrodata.py         |  2 -
 meta/lib/oeqa/selftest/cases/eSDK.py               |  3 -
 meta/lib/oeqa/selftest/cases/fetch.py              |  2 -
 meta/lib/oeqa/selftest/cases/image_typedep.py      |  2 -
 meta/lib/oeqa/selftest/cases/imagefeatures.py      |  9 ---
 meta/lib/oeqa/selftest/cases/layerappend.py        |  2 -
 meta/lib/oeqa/selftest/cases/liboe.py              |  4 -
 meta/lib/oeqa/selftest/cases/lic_checksum.py       |  2 -
 meta/lib/oeqa/selftest/cases/manifest.py           |  3 -
 meta/lib/oeqa/selftest/cases/meta_ide.py           |  4 -
 meta/lib/oeqa/selftest/cases/oelib/buildhistory.py |  4 -
 meta/lib/oeqa/selftest/cases/oescripts.py          |  2 -
 meta/lib/oeqa/selftest/cases/package.py            |  4 -
 meta/lib/oeqa/selftest/cases/pkgdata.py            |  9 ---
 meta/lib/oeqa/selftest/cases/prservice.py          | 10 ---
 meta/lib/oeqa/selftest/cases/recipetool.py         | 39 ----------
 meta/lib/oeqa/selftest/cases/recipeutils.py        |  1 -
 meta/lib/oeqa/selftest/cases/runcmd.py             | 17 -----
 meta/lib/oeqa/selftest/cases/runqemu.py            | 13 ----
 meta/lib/oeqa/selftest/cases/runtime_test.py       |  9 ---
 meta/lib/oeqa/selftest/cases/selftest.py           |  2 -
 meta/lib/oeqa/selftest/cases/signing.py            |  4 -
 meta/lib/oeqa/selftest/cases/sstatetests.py        | 21 -----
 meta/lib/oeqa/selftest/cases/tinfoil.py            | 11 ---
 meta/lib/oeqa/selftest/cases/wic.py                | 59 --------------
 meta/recipes-devtools/gdb/gdb-8.2.1.inc            |  1 +
 ...-AArch64-Fix-the-gdb-build-with-musl-libc.patch | 52 +++++++++++++
 meta/recipes-devtools/opkg/opkg_0.4.0.bb           |  7 +-
 .../squashfs-tools/squashfs-tools_git.bb           |  2 +
 meta/recipes-extended/acpica/acpica_20180508.bb    |  2 +-
 meta/recipes-extended/cpio/cpio_2.12.bb            |  6 +-
 .../ghostscript/ghostscript_9.26.bb                |  3 +
 meta/recipes-extended/tar/tar_1.31.bb              |  6 +-
 meta/recipes-multimedia/flac/flac_1.3.2.bb         |  2 +-
 meta/recipes-support/nettle/nettle_3.4.1.bb        |  2 +-
 scripts/lib/recipetool/create.py                   |  2 +-
 scripts/lib/resulttool/log.py                      | 54 +++++++++----
 scripts/lib/resulttool/resultutils.py              | 16 ++++
 scripts/wic                                        |  2 +-
 89 files changed, 235 insertions(+), 622 deletions(-)
 delete mode 100644 meta/lib/oeqa/core/decorator/oeid.py
 delete mode 100644 meta/lib/oeqa/core/tests/cases/loader/invalid/oeid.py
 delete mode 100644 meta/lib/oeqa/core/tests/cases/oeid.py
 create mode 100644 meta/recipes-devtools/gdb/gdb/0012-AArch64-Fix-the-gdb-build-with-musl-libc.patch

-- 
2.7.4


