Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3A11260CAD
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:00 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id p14so2421672pfn.4
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3sbMLVGdjPsGkBCo/y5p9KbVoMr6IzwNJ+nRXmCK3Ew=;
	b=hNz4dSmSDvpBUE9kd/Vdln1whfRoT2OFe9jJW6M0M7NISElBC636CSHvIq4Nqcelz3
	hM8Xiauj6CqV+5n1+IvE2Q5cU5YxqhkwckpMlw50scTyTHT0OK8QDEwco8dfxJfvEhSi
	iiiJrIPLO//kcmZn5JtXRx6GYXdtjbOO7aBGEgPX3Yo3Tc4Yn3pMzXgFY2hKQjFIDtG2
	mVPzOkfAB+uNMMaXO35xKkEW3yQ1Xgkq5hrQfdd5hEwIWmS+KbMsV4+12njLu70OtphS
	JfCEWf00Fe4c4DfV7wkx1mOm3ZzOmozlo5vJXR3VCVXgoU2lwV9AO3CVDmKUtlMXZsJp
	jrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3sbMLVGdjPsGkBCo/y5p9KbVoMr6IzwNJ+nRXmCK3Ew=;
	b=bWw7NjgQ1EQxgmDBdJK8bKuL439YepLbRmUDgFfDFVEHAPqk+C0X7PgFv30wNbB677
	VTpcwqvYPVhIv+ouwKHQAKVLN7dkgIVuQdZOMu/fVtXFwGbBA0rxB17OnohY9R+MEj4S
	W07BfPsGLsnbhixZdtHdBVmPpBtuLEET+x3g/SCW5XZzszgLj7SJDc/DygR8ILWnR5uY
	kVRxu9tSbzJ+hMCmMhHxY9Yg9qabcLf9nzEz7kh3hXpP7pZSJFzITnrAzl/qr4Mh6+xt
	erDzunljR4v7L1hMx91atCKPuGM4T0DGjJF5JxElCCfdZH6YTt4dqBeK+I21+6/Vd2X1
	hJ0Q==
X-Gm-Message-State: APjAAAU5veykEJMrXooBkGdiEFr/aOuyzNybRdI0RO0brORtaf5YTGQu
	wvoEHguzunvXiEegMmWfisBG35v+
X-Google-Smtp-Source: APXvYqyz+EH0F32N5MOsdEU4+PPz+Gb4/Oh3iCH5GPh1JWzpsNkCI+ALoIsuxC9UeM0mcYrAvgVqcg==
X-Received: by 2002:a63:5947:: with SMTP id j7mr10179781pgm.48.1581264600948; 
	Sun, 09 Feb 2020 08:10:00 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.00
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:28 -0800
Message-Id: <cover.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [zeus 00/29] Patch review
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These are the additional changes to help address reproducibility issues and additional fixes
we would like to be included in 3.0.2

Please have comments back by Tuesday

The following changes since commit 9b1bf083129be2b849db52d4f0eda9eb6077c97e:

  python2: add ntpath (2020-02-02 18:19:50 -0800)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/zeus-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/zeus-nut

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

Tom Hochstein (1):
  devtool/standard.py: Allow recipe to disable menuconfig logic

 meta/classes/patch.bbclass                    |   7 +
 meta/classes/reproducible_build.bbclass       |  40 ++-
 meta/lib/oeqa/selftest/cases/reproducible.py  |   9 +-
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
 43 files changed, 933 insertions(+), 252 deletions(-)
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


