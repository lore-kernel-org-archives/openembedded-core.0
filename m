Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2A5D77199D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Oct 2017 15:43:19 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id j3so7608136pga.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Oct 2017 08:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jCEou73pczFQl/cV9uTbcNmlZe44DBykflLoDZlfe6g=;
	b=OFqqXyD2Qe3fb1Osi/CethTnbeJn0vEjcIVh8bO8orp1ORTNQL+8i5LuooPTj1L6e5
	fbgLXS09Df8M9x7m6Eodj131/Ka+ufq20aLTwoYwcaIWRe42AD54qtG/7QcN9etxOCah
	YvGveRBTOgYGVq9Uy5WekGur7/eJd5dkaiHwdO5SJOGs0KDFtRIxMmLbWmRefZcuUH14
	bV4iOTGKhojOy/OguLry7XaWVCQzM/eQ0QYiKz3EaWwFZg6SVOh++DPC8QHtJByFSDKg
	J10OfV+T86aITcjewWm0ay1yK96pzDG144zK+LKSJPF+JJYjxvXO3OF7N7dfh5V6R9iU
	W9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jCEou73pczFQl/cV9uTbcNmlZe44DBykflLoDZlfe6g=;
	b=E3zz40iCnHdYssKKbWd+aogg3+8U5nT/LHkXiP6XPbuYDBkRyV6fmIv5h+QBlzTGjg
	iObzyJCgaPOwuLmKe4B9KGuYQ3oAghnRQwQLZ3YXMWe96bjYccrOVT/awyTmS4Q66Prf
	worPJb6Y2w74LOxaeG3VwZolLX7a42UQCNIB/11UjKYPiKcCo2XSGtzc3Xyb5Z86O+OR
	lLfixinCrn+Z8gU0cJuPnVMek0my4AYLVRMH8HXZjdbAj7rOCCMtF7iD6K1BOKKPqCbO
	EGJUiiNzTTI1NGaBCTxLQtQLkZzElWQkMAzrrJmSrZcSydAPJDIgiPyEysJRPwFs4yR3
	QE+Q==
X-Gm-Message-State: AMCzsaVcF2uaUBjBFIkHWVOJfX8nZoo2A6xy9QEfjTwYh6omR0iC+Qc0
	KcTXRIeWhVchXXB95x1GrqI=
X-Google-Smtp-Source: ABhQp+T9Wt3ezIjB610n4aFkqY/7Va3sM/2QDCY+Fh31ddVHx+PJWSPlsutlAaUwtTuVHlZVj2ifhA==
X-Received: by 10.98.103.143 with SMTP id t15mr3776716pfj.270.1509205401052;
	Sat, 28 Oct 2017 08:43:21 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:ed3b:62fb:fae2:3e1d])
	by smtp.gmail.com with ESMTPSA id
	125sm19104390pff.14.2017.10.28.08.43.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 28 Oct 2017 08:43:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sat, 28 Oct 2017 08:42:42 -0700
Message-Id: <cover.1509205113.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 00/36] Pyro-next pull request
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
X-List-Received-Date: Sat, 28 Oct 2017 15:43:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Cover letter only

Please consider these changes for Pyro.
Clean AB

The following changes since commit 50cc15335ebcdfa2a2fc52c11fa01695dfdb9e26:

  goarch.bbclass: Replace logic for setting GOARM (2017-10-24 14:55:01 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/pyro-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/pyro-next

André Draszik (15):
  gdb: fix gdbserver not working in musl/mips context
  busybox: add backported patch to support iproute 'scope'
  openssh: allow to override OpenSSL HostKeys when read-only-rootfs
  selftest/archiver: add tests for recipe type filtering
  selftest/archiver: only execute deploy_archives task
  copyleft_filter.bbclass: restore possiblity to filter on type
  kernel-fitimage: sanitize dtb section name (unbreak MIPS)
  kernel-fitimage: unbreak UBOOT_ENTRYSYMBOL support
  kernel-uimage: optimise UBOOT_ENTRYSYMBOL support
  kernel-uboot: support compressed kernel on MIPS
  kernel-fitimage: support MIPS (compressed)
  curl: enable threaded resolver
  useradd-staticids: don't create username-group if gid is specified
  json-c: backport patch to fix gcc7 compilation
  valgrind: enable on mips soft-float

David Reyna (2):
  bitbake: toaster: reserve HEAD from imported layers
  bitbake: toaster: allow dots in user path names

Enrico Scholz (1):
  wic: accept '-' in bitbake variables

Jose Perez Carranza (2):
  oeqa/runtime: Replace buildiptables for buildlzip on runtime tests
  oeqa/sdk: Replace buildiptables for buildlzip tests

Joshua Watt (1):
  openssh: Fix key generation with systemd

Markus Lehtonen (3):
  oe-build-perf-report: accept parenthesis in tag names
  oe-build-perf-report: allow slashes in {branch} field in tag names
  oe-build-perf-report: use correct x-axis max value in html charts

Mikko Rapeli (1):
  bitbake: Fix return value checks from subprocess.call()'s

Ming Liu (1):
  busybox: fix a linking issue

Nathan Rossi (1):
  kernel-uimage.bbclass: Fix up generation of uImage from vmlinux

Peter Kjellerstedt (1):
  oe-pkgdata-util: package-info: Allow extra variables to be displayed

Richard Purdie (2):
  debianutils: Add a native version (for run-parts)
  ca-certificates: Fix postinst dependency issues

Ross Burton (3):
  useradd: don't override pseudo environment
  oeqa/selftest/recipetool: use stable tarball for recipetool create
    test
  bitbake: tests/fetch: handle network failures gracefully

Samuli Piippo (1):
  binutils: apply mingw fix only for binutils-cross-canadian

Thomas PERROT (1):
  Avoid a circular dependency between do_concat_dtb and
    do_assemble_fitimage

Tom Rini (1):
  image_types.bbclass: Make u-boot signed images more versatile

 bitbake/lib/bb/tests/fetch.py                      |   2 +
 bitbake/lib/bb/ui/ncurses.py                       |   2 +-
 bitbake/lib/bb/utils.py                            |   2 +-
 bitbake/lib/toaster/toastergui/api.py              |   6 +-
 .../toaster/toastergui/static/js/importlayer.js    |  19 +++-
 .../toaster/toastergui/templates/importlayer.html  |   4 +-
 .../toaster/toastergui/templates/projectconf.html  |   8 +-
 meta/classes/copyleft_filter.bbclass               |  32 +++---
 meta/classes/image.bbclass                         |   9 --
 meta/classes/image_types.bbclass                   |   6 +-
 meta/classes/image_types_uboot.bbclass             |  29 -----
 meta/classes/kernel-fitimage.bbclass               |  11 +-
 meta/classes/kernel-uboot.bbclass                  |   8 +-
 meta/classes/kernel-uimage.bbclass                 |  26 ++---
 meta/classes/rootfs-postcommands.bbclass           |   4 +-
 meta/classes/uboot-sign.bbclass                    |  21 ++--
 meta/classes/useradd-staticids.bbclass             |  10 +-
 meta/classes/useradd.bbclass                       |   2 +-
 .../cases/{buildiptables.py => buildlzip.py}       |   6 +-
 .../sdk/cases/{buildiptables.py => buildlzip.py}   |   8 +-
 meta/lib/oeqa/selftest/archiver.py                 |  78 ++++++++++++-
 meta/lib/oeqa/selftest/recipetool.py               |  12 +-
 meta/recipes-connectivity/openssh/openssh/init     |  31 +-----
 .../openssh/openssh/sshd_check_keys                |  64 +++++++++++
 .../openssh/openssh/sshdgenkeys.service            |  16 +--
 meta/recipes-connectivity/openssh/openssh_7.4p1.bb |   8 ++
 ...mproper-optimization-req.r.rtm_scope-may-.patch |  33 ++++++
 .../0001-iproute-support-scope-.-Closes-8561.patch | 122 +++++++++++++++++++++
 .../busybox-tar-add-IF_FEATURE_-checks.patch       |  70 ++++++++++++
 meta/recipes-core/busybox/busybox_1.24.1.bb        |   3 +
 .../binutils/binutils-cross-canadian.inc           |   2 +
 meta/recipes-devtools/binutils/binutils.inc        |   1 -
 meta/recipes-devtools/gdb/gdb-7.12.1.inc           |   1 +
 ..._gdb_patches_120-sigprocmask-invalid-call.patch |  45 ++++++++
 ...-FALLTHRU-comment-to-handle-GCC7-warnings.patch |  77 +++++++++++++
 meta/recipes-devtools/json-c/json-c_0.12.bb        |   1 +
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |   2 -
 .../ca-certificates/ca-certificates_20161130.bb    |  11 +-
 meta/recipes-support/curl/curl_7.53.1.bb           |   7 +-
 .../debianutils/debianutils_4.8.1.bb               |   4 +-
 scripts/lib/wic/utils/misc.py                      |   2 +-
 scripts/oe-build-perf-report                       |   9 +-
 scripts/oe-pkgdata-util                            |  12 +-
 43 files changed, 643 insertions(+), 183 deletions(-)
 delete mode 100644 meta/classes/image_types_uboot.bbclass
 rename meta/lib/oeqa/runtime/cases/{buildiptables.py => buildlzip.py} (89%)
 rename meta/lib/oeqa/sdk/cases/{buildiptables.py => buildlzip.py} (84%)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/sshd_check_keys
 create mode 100644 meta/recipes-core/busybox/busybox/0001-ip-fix-an-improper-optimization-req.r.rtm_scope-may-.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-iproute-support-scope-.-Closes-8561.patch
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-tar-add-IF_FEATURE_-checks.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/package_devel_gdb_patches_120-sigprocmask-invalid-call.patch
 create mode 100644 meta/recipes-devtools/json-c/json-c/0001-Add-FALLTHRU-comment-to-handle-GCC7-warnings.patch

-- 
2.7.4


