Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6F68A60B4A
	for <openembedded-core@openembedded.org>;
	Tue, 11 Feb 2020 01:52:22 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id m7so394821pjs.0
	for <openembedded-core@openembedded.org>;
	Mon, 10 Feb 2020 17:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bisJEQc1YZzJmyV+a/sHUtlyDxaMw1TwPSW5nY0aX0c=;
	b=W7JVMcINXPHWFE+kGH15g59/iTxKTRDgFn1tkXG+RCmxOsv35b6E9nQAjz11qT3fPd
	BgmeDp0XayuwHZEDEqyb8elOMY20WFX0Lf2LN6qV59rtmT41cjQy38JJHcOPAWoiY/o2
	0CcjSwA6VqfifWYXWGZmGvymnNMo3mE0UMLiC+0LeVoyHRV+f37K3SoSmjQ9x0k2feBV
	sC/2VB++H9JjSa+EGbapc+Grbu1EERPqKLgfuFfJa7gL2NTIfdZDlNBX2eWa1O2sv2uU
	Vh/ai/3dCEpZCy4NHcLqx4+iHUe9Zr7FS5R/Ue4jLRHLzf4M3p8SbMfhypgytEwVK4kr
	oIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bisJEQc1YZzJmyV+a/sHUtlyDxaMw1TwPSW5nY0aX0c=;
	b=F7R32GN1fT8j3UWrHiDkBaA+K5PO/kFQ1qcJlR29p+V3wlzVP9h0RPOSYnKjwgGH7S
	KjWbko4XiPRwR37W5A/2vfzLnhwn+NKso/Lc4ZhQUoXdJQCfdMWCcClx3qvw5RnivwWT
	nTYOe274+Dlb3ff9viteKG+mXKQLslYXnMFOLtlmyTIbwpsAOB6VY9/xafMLblIn9RfC
	iv2ijGJz6sf/j+moi1y54bN+yaTeUVU/JJ52xI5BusHo9z8mNOCierZezQzA3lREr4ge
	dwOnxIglVfl07ykifrIBtWYKuo5PecyoA5i4iSGlFLp1dOY4sN0/dWB+nkModKwJukJ5
	5j1g==
X-Gm-Message-State: APjAAAVCmT2JxtTTIN3Y2tfRH/Rd5q6rK9baqsLOqo2UUeRR3p0Nw1fS
	V7Gbg8NUsKfgFHErbnYHHyJTLNFF
X-Google-Smtp-Source: APXvYqy+jKeT+lBOoFcjCObqFp47JFKGW2P0dU8WY3JJWXkWa7PKE6UtQjH/QhjLjglduUgERl9BxQ==
X-Received: by 2002:a17:90a:950b:: with SMTP id
	t11mr846442pjo.79.1581385943196; 
	Mon, 10 Feb 2020 17:52:23 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:58cf:c2e4:7ede:a168])
	by smtp.gmail.com with ESMTPSA id u12sm1432183pgr.3.2020.02.10.17.52.22
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 10 Feb 2020 17:52:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 10 Feb 2020 17:51:50 -0800
Message-Id: <cover.1581385841.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [zeus 00/30] Pull request
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
X-List-Received-Date: Tue, 11 Feb 2020 01:52:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Consolidated pull request.
Cover leter only.

The following changes since commit 9b1bf083129be2b849db52d4f0eda9eb6077c97e:

  python2: add ntpath (2020-02-02 18:19:50 -0800)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/zeus-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/zeus-next

Alejandro del Castillo (1):
  opkg-utils: upgrade to version 0.4.2

Alexander Kanavin (1):
  perl: do not install files that contain build host specific data

Anuj Mittal (3):
  Revert "bzip2: Fix CVE-2019-12900"
  curl: fix CVE-2019-15601
  cpio: fix CVE-2019-14866

Joshua Watt (2):
  classes/reproducible_build: Read SDE file later
  mc: Fix build reproducibility

Lee Chee Yang (1):
  rsync: whitelist CVE-2017-16548

Richard Purdie (17):
  opkg-utils: Fix reproducibility issues in opkg-build
  oeqa/reproducible: Improve test output and ensure deb+ipk compared
  sudo: Set vardir deterministically
  libxshmfence: Set shm directory deterministically
  mc: Set zipinfo presence determinstically
  mc: Fix manpage date indeterminism
  tar: Fix build determinism, disable rsh
  patch: Extend to native/nativesdk and depend upon
  libidn2: Fix reproducibility issue
  perl: Fix various reproducibile build issues
  openssl: Fix reproducibility issue
  iputils: Fix build determinism
  libinput: Fix determinism issue
  libgcrypt: Fix determinism issue
  sysvinit: Fix Reproducibility issue
  libevdev: Fix determinism issue
  ncurses: Fix reproducibility issue

Ross Burton (2):
  gtk+3: sort resources for reproducible binaries
  sudo: specify where target tools are

Taras Kondratiuk via Openembedded-core (1):
  gcc-9.2: fix bug #91102 'aarch64 ICE on Linux kernel with -Os'

Tom Hochstein (2):
  devtool/standard.py: Allow recipe to disable menuconfig logic
  u-boot.inc: Fix devtool build u-boot for u-boot without menuconfig

 meta/classes/patch.bbclass                    |   7 +
 meta/classes/reproducible_build.bbclass       |  40 ++-
 meta/lib/oeqa/selftest/cases/reproducible.py  |   9 +-
 meta/recipes-bsp/u-boot/u-boot.inc            |   2 +
 .../openssl/openssl/reproducible.patch        |  32 ++
 .../openssl/openssl_1.1.1d.bb                 |   1 +
 meta/recipes-core/meta/buildtools-tarball.bb  |   1 +
 meta/recipes-core/ncurses/ncurses.inc         |   1 +
 .../recipes-core/sysvinit/sysvinit_2.88dsf.bb |   1 +
 meta/recipes-devtools/gcc/gcc-9.2.inc         |   1 +
 ...02-aarch64-ICE-on-Linux-kernel-with-.patch |  95 ++++++
 ...Switch-all-scripts-to-use-Python-3.x.patch | 113 -------
 ...ld-clamp-mtimes-to-SOURCE_DATE_EPOCH.patch |  44 ---
 .../opkg-utils/fix-reproducibility.patch      |  32 ++
 .../opkg-utils/opkg-utils/pipefail.patch      |  31 --
 ...pkg-utils_0.4.1.bb => opkg-utils_0.4.2.bb} |  13 +-
 meta/recipes-devtools/patch/patch_2.7.6.bb    |   3 +
 .../perl/files/determinism.patch              |  81 +++++
 meta/recipes-devtools/perl/perl-ptest.inc     |   3 +
 meta/recipes-devtools/perl/perl_5.30.0.bb     |   4 +
 meta/recipes-devtools/rsync/rsync_3.1.3.bb    |   3 +
 .../bzip2/bzip2-1.0.6/CVE-2019-12900.patch    |  36 --
 .../cpio/cpio-2.12/CVE-2019-14866.patch       | 316 ++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.12.bb       |   1 +
 .../iputils/iputils_s20190709.bb              |   3 +-
 meta/recipes-extended/libidn/libidn2_2.2.0.bb |   3 +-
 ...Add-option-to-control-configure-args.patch |  99 ++++++
 .../recipes-extended/mc/files/nomandate.patch |  21 ++
 meta/recipes-extended/mc/mc_4.8.23.bb         |   7 +-
 meta/recipes-extended/sudo/sudo.inc           |   2 +-
 meta/recipes-extended/sudo/sudo_1.8.27.bb     |  10 +-
 meta/recipes-extended/tar/tar_1.32.bb         |   2 +
 .../gtk+/gtk+3/sort-resources.patch           |  19 ++
 meta/recipes-gnome/gtk+/gtk+3_3.24.8.bb       |   1 +
 .../wayland/libinput/determinism.patch        |  21 ++
 .../wayland/libinput_1.14.1.bb                |   4 +-
 .../xorg-lib/libxshmfence_1.3.bb              |   2 +
 .../curl/curl/CVE-2019-15601.patch            |  46 +++
 meta/recipes-support/curl/curl_7.66.0.bb      |   1 +
 .../libevdev/libevdev/determinism.patch       |  34 ++
 .../libevdev/libevdev_1.8.0.bb                |   3 +-
 .../libgcrypt/files/determinism.patch         |  32 ++
 .../libgcrypt/libgcrypt_1.8.4.bb              |   1 +
 scripts/lib/devtool/standard.py               |   6 +-
 44 files changed, 935 insertions(+), 252 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/reproducible.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.2/re-PR-target-91102-aarch64-ICE-on-Linux-kernel-with-.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-Switch-all-scripts-to-use-Python-3.x.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-build-clamp-mtimes-to-SOURCE_DATE_EPOCH.patch
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/fix-reproducibility.patch
 delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/pipefail.patch
 rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.4.1.bb => opkg-utils_0.4.2.bb} (83%)
 create mode 100644 meta/recipes-devtools/perl/files/determinism.patch
 delete mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.12/CVE-2019-14866.patch
 create mode 100644 meta/recipes-extended/mc/files/0001-Add-option-to-control-configure-args.patch
 create mode 100644 meta/recipes-extended/mc/files/nomandate.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/sort-resources.patch
 create mode 100644 meta/recipes-graphics/wayland/libinput/determinism.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-15601.patch
 create mode 100644 meta/recipes-support/libevdev/libevdev/determinism.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/determinism.patch

-- 
2.17.1


