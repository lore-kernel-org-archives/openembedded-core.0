Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f53.google.com (mail-pl0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id A083274DEE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 13:54:00 +0000 (UTC)
Received: by mail-pl0-f53.google.com with SMTP id v18-v6so17208997ply.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2018 06:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=uI613dTx/r3fKeyxhwgVPK+nr9FJXyeUM/sjldYCqqU=;
	b=XQZE0XWx5FUync69KZL5RIvhuNxzVf7A1HN2jYS4vMNK63LpQ5PpHhtv0zyQpeKOTt
	nMVT05dH0mB7AmLdc+9jAQ6oUPCoh4RFTB8XxUhXmHHofuqKK5kUElSrNOLX/CoEKdTI
	7KIZd4mPrU0D8wcPA30zOXq8x0927GKx+KpNZHpLVHIG8UsVEpSs8Ry1QHHNxBG67BsX
	ZBE8Pf1nxH7q/pTk0WSxPRsdzUtzlTM+qipFmgYzsiVHb4EdUDBSMC/Wd5DG7O4/vPke
	fXw8uEXmiKTjXwAe7tkmOge/OPZid5NPUlHQqVoFLyAv2/lNmGbYVK2q6FGtfJ79jifQ
	WHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=uI613dTx/r3fKeyxhwgVPK+nr9FJXyeUM/sjldYCqqU=;
	b=kcNS/ZZw/uJkCN7jnFVkqHg1aWSgpDXx0Btv5yND6SC4uekaKePghu/PbtlEcgVeUS
	pwafPTgD1xw3vTB+SBBHs5npKgJ4kAGiK1mm0cfwAH13J8Oq9DoyAx4pLwgB30spOhkp
	PSq5yLjfrEqGGrSjov4wXb//latCF5bymyuSyQfCsc/fbsMruuU+KFujdTd7fdfaipWl
	qf3PiWDOSPcvxEVBlSDm3GVfXhg4IH+iuAgCIPiOF4Mdgc2mKiIislI5E07Z3LebuyWU
	Ly1n0685i0VcA2MRF5/TmW4BP7yX5LyfUny/fq/bg9jqkBlHRCdqB72ZeYKofJ3RF2O8
	45hQ==
X-Gm-Message-State: ALQs6tA8hh8+R69gobqWKUMEUtwPYwQ63UE/aYOPXUvQ1QtOn2fU7pOZ
	btMaSiyHCrH/lfgT3VEqRX8=
X-Google-Smtp-Source: AIpwx4+jH8hOkvjHZBSSFNo/swIZ5dptXNjKAIFd3h+yqKENnmGkb45E0HFsmHxkLZmRNKcZB/cxgg==
X-Received: by 2002:a17:902:d88a:: with SMTP id
	b10-v6mr13262852plz.172.1522936441313; 
	Thu, 05 Apr 2018 06:54:01 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:9956:e5c2:70f8:aaf8])
	by smtp.gmail.com with ESMTPSA id
	t18sm17126170pfg.103.2018.04.05.06.54.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Apr 2018 06:54:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2018 06:53:18 -0700
Message-Id: <cover.1522936224.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/38] Morty Next pull request
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
X-List-Received-Date: Thu, 05 Apr 2018 13:54:00 -0000

Please consider these changes for Morty. Clean AB build

This included sdk locale and host glibc 2.27 fixes.

The following changes since commit 34b26ec18450a3bc72f7b8a0f2df0bfaae1140dd:

  linux-firmware: Add reference to iwlwifi-8000C firmware (2018-03-19 15:58:33 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib stable/morty-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stable/morty-next

Alexander Kanavin (2):
  selftest/signing: add --batch to gpg invocation when importing keys
  populate_sdk_base.bbclass: add documentation packages to SDKs if
    api-documentation is in DISTRO_FEATURES

Andreas Oberritter (1):
  libc-package.bbclass: split binary localedata even more if asked to

Armin Kuster (3):
  lib/oe/terminal.py: use an absolute path to execute
    oe-gnome-terminal-phonehome
  distcc: Change SRC_URI
  package_manager: fix install_glob to use morty sdk pkgdir

Christopher Larson (1):
  buildhistory: fix latest_srcrev in the common case

Ed Bartosh (1):
  toolchain-shar-extract: compare SDK and host gcc versions

Gianfranco Costamagna (1):
  glibc-locale.inc: fix typo in comment

Juro Bystricky (1):
  glibc-locale.inc: avoid duplicate packages

Linus Wallgren (1):
  lib/oe/package_manager: .deb pre/postinst args

Martin Jansa (1):
  package_manager: flush installed_pkgs file before oe-pkgdata-util uses
    it

Maxin B. John (1):
  grub-efi: fix build failure

Richard Purdie (4):
  lib/oe/package_manager/sdk: Ensure do_populate_sdk_ext and
    do_populate_sdk repos don't conflict
  glibc: Separate locale files to their own sstate task
  image/packagegroup/populate_sdk: Drop do_populate_sysroot task
    properly
  glibc-package: Avoid race sstate races with do_stash_locale

Ross Burton (15):
  default-distrovars: don't rename locales for nativesdk
  glibc: don't use host locales in nativesdk
  glibc: relocate locale paths in nativesdk
  lib/oe/package_manager: bail if createrepo can't be found
  package_manager: don't race on a file when installing complementary
    packages
  package_manager: improve install_complementary
  package-manager: add install_glob()
  sdk: install specified locales into SDK
  sdk: only install locales if we're using glibc
  populate_sdk: install UTF-8 locales in SDKs
  populate_sdk_base: depend on nativesdk-glibc-locale
  cross-localedef-native: add way to specify which locale archive to
    write
  qemu: fix memfd_create with glibc 2.27
  sdk: generate locale archive and remove packages
  sdk: streamline locale removal

Stephano Cetola (1):
  package_manager: remove strings and migrate to direct arrays

Tanu Kaskinen (4):
  e2fsprogs: fix compatibility with glibc 2.27
  libvorbis: CVE-2017-14633
  libvorbis: CVE-2017-14632
  libvorbis: CVE-2018-5146

Zhenbo Gao (1):
  archiver: avoid archiving source for glibc-locale

 meta/classes/archiver.bbclass                      |   6 +
 meta/classes/buildhistory.bbclass                  |   2 +-
 meta/classes/image.bbclass                         |   2 +-
 meta/classes/libc-package.bbclass                  |  39 ++-
 meta/classes/packagegroup.bbclass                  |   2 +-
 meta/classes/populate_sdk_base.bbclass             |  11 +-
 meta/classes/populate_sdk_ext.bbclass              |   3 +-
 meta/conf/distro/include/default-distrovars.inc    |   1 +
 meta/files/toolchain-shar-extract.sh               |   8 +
 meta/lib/oe/package.py                             |  13 +-
 meta/lib/oe/package_manager.py                     | 328 +++++++++++----------
 meta/lib/oe/sdk.py                                 |  85 +++++-
 meta/lib/oe/terminal.py                            |   2 +-
 meta/lib/oeqa/selftest/signing.py                  |   2 +-
 ...ix-check-for-sys-sysmacros.h-under-glibc-.patch |  48 +++
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |   1 +
 .../glibc/cross-localedef-native_2.24.bb           |   1 +
 meta/recipes-core/glibc/glibc-collateral.inc       |   2 +-
 meta/recipes-core/glibc/glibc-initial.inc          |   2 +-
 meta/recipes-core/glibc/glibc-locale.inc           |   5 +-
 meta/recipes-core/glibc/glibc-mtrace.inc           |   2 +-
 meta/recipes-core/glibc/glibc-package.inc          |  45 +--
 meta/recipes-core/glibc/glibc-scripts.inc          |   2 +-
 meta/recipes-core/glibc/glibc/archive-path.patch   |  39 +++
 .../glibc/glibc/relocate-locales.patch             |  33 +++
 meta/recipes-core/glibc/glibc_2.24.bb              |   7 +-
 meta/recipes-core/meta/buildtools-tarball.bb       |   1 -
 meta/recipes-devtools/distcc/distcc_3.2.bb         |   2 +-
 ...rename-copy_file_range-to-copy_file_chunk.patch |  62 ++++
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb  |   1 +
 meta/recipes-devtools/qemu/qemu/memfd.patch        |  57 ++++
 meta/recipes-devtools/qemu/qemu_2.7.0.bb           |   1 +
 .../libvorbis/libvorbis/CVE-2017-14632.patch       |  62 ++++
 .../libvorbis/libvorbis/CVE-2017-14633.patch       |  42 +++
 .../libvorbis/libvorbis/CVE-2018-5146.patch        | 100 +++++++
 .../libvorbis/libvorbis_1.3.5.bb                   |   6 +-
 36 files changed, 809 insertions(+), 216 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/0001-configure-fix-check-for-sys-sysmacros.h-under-glibc-.patch
 create mode 100644 meta/recipes-core/glibc/glibc/archive-path.patch
 create mode 100644 meta/recipes-core/glibc/glibc/relocate-locales.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-rename-copy_file_range-to-copy_file_chunk.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/memfd.patch
 create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14632.patch
 create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14633.patch
 create mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2018-5146.patch

-- 
2.7.4


