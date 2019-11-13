Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 512F86C0E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:24 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id q13so1899484pff.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=AZGSII2oS7qVFCPerinpkMbZO24ieBkICG2myV4KZaM=;
	b=WH7AwpshNqB1oZnrYi4ufbOM4238KoLrbW9F1QB66d9neJB0ZyC5sUUoXymo7DsYRJ
	S8b+MoMguc/cFU78JZ0foTSeQC7yfakOSHYe9Irjq0pBTrnrYtE/xzMAhRQBeG+akanU
	f004vWWPa8Oy9ebLFz3gUjMMDL4d6cyuI7HXkmF57VuIKrHe4d4R9tLrwH7mJoP/V/Y8
	VtIEs5YuXK9cPBsCeJVNM2zAAqLcx2jgj4GJdKGTNwVQxwfQ8f938Dj2vWc5ERpAmDd7
	Ya/OWN/raADaKh+GVp13jbe+9XPB8u1HvM7QDkSjp2AXEj4jbTsmuMtvk2iV0xR/N6g8
	caGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=AZGSII2oS7qVFCPerinpkMbZO24ieBkICG2myV4KZaM=;
	b=PCVthFJxYtnLJY343EcTBevUtWc0mc0F6cTmXt7RVqGSx3qC2ETOaQ0cCVi0sX0zso
	+OWi+Ckk4bvFAGUURW/1vOx/G4IVFBEKZGhK3v47RUm7w31JQjfrj+1zT7BHDcp5S+Rm
	/j5ztqFw6pgItGJo5Zk4F1ccgITeFQgwz3MgFLSTyGqb0bs/JYGnHOmjNBs7JWrfOYrH
	xGyaMNI2EU0mlrXgLs11/VrC6ZMbJD/VtIEXk8SZffswF6gjABg7HKIuusFE78BmOKR0
	SlqnnKtpGgW0QQryDjdWh3fRbTgzV2A/yIaQPiLkYBihpPZ0VNhwpj59CtLEqsZqsE4e
	CTSA==
X-Gm-Message-State: APjAAAVilvWpQWmOIu5OetA9U9MTjB/XThXS0OM2WXThJZOUPXU7soM2
	hJS47Z3wHQINixu26Z7el524FnUQ
X-Google-Smtp-Source: APXvYqzHYtY3KRv75FmTv9vaEVMWqau8kET4ZjljtaOF/qw/laMrevWnlygRZ2PM2UY5oR/i+jafeg==
X-Received: by 2002:a62:bd0a:: with SMTP id a10mr5124215pff.118.1573659145126; 
	Wed, 13 Nov 2019 07:32:25 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:31:42 -0800
Message-Id: <cover.1573658915.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [zeus 00/31] zeus pull request
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:24 -0000

Please merge this series to zeus mainline.

The following changes since commit 5607d38af39294bf97a878b414a0212278b66b2c:

  connman: mark connman-wait-online as SYSTEMD_PACKAGE (2019-10-29 08:20:37 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/zeus-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/zeus-next

Adrian Bunk (1):
  python3: Upgrade 3.7.4 -> 3.7.5

Alexander Kanavin (1):
  selftest: skip virgl test on centos 7 entirely

Anuj Mittal (1):
  libsdl2: fix race when building in parallel

Bruce Ashfield (2):
  linux-yocto/4.19: update to v4.19.78
  linux-yocto/5.2: update to v5.2.20

Changqing Li (2):
  e2fsprogs: fix CVE-2019-5094
  mdadm: fix do_package failed when changed local.conf but not cleaned

Ferry Toth (1):
  sudo: Fix fetching sources

Haris Okanovic (1):
  initscripts/sysfs.sh: Mount /sys/firmware/efi/efivars when possible

He Zhe (1):
  ltp: Fix overcommit_memory failure

Jacob Kroon (1):
  rm_work: Promote do_image_qa stamps to setscene versions

Joe Slater (2):
  libtiff: fix CVE-2019-17546
  libxslt: fix CVE-2019-18197

Richard Purdie (2):
  pseudo: Drop static linking to sqlite3
  pseudo: Add statx support to fix fedora30 issues

Ross Burton (13):
  libpng: whitelist CVE-2019-17371
  procps: whitelist CVE-2018-1121
  libsndfile1: whitelist CVE-2018-13419
  libpam: set CVE_PRODUCT
  file: fix CVE-2019-18218
  file: run test suite when building natively
  cve-check: ensure all known CVEs are in the report
  qemu-helper-native: add missing option to getopt() call
  qemu-helper-native: showing help shouldn't be an error
  qemu-helper-native: pass compiler flags
  cve-check: failure to parse versions should be more visible
  recipeutils-test: use a small dependency in the dummy recipe
  patch: the CVE-2019-13638 fix also handles CVE-2018-20969

Samuli Piippo (1):
  linux-firmware: update packaging for brcm files

Trevor Gamblin (1):
  libgcrypt: fix CVE-2019-13627

Zhixiong Chi (1):
  libtirpc: create the symbol link for rpc header files

 meta-selftest/lib/oeqa/runtime/cases/virgl.py      |   5 -
 .../recipeutils/recipeutils-test_1.2.bb            |   2 +-
 meta/classes/cve-check.bbclass                     |  13 +-
 meta/classes/rm_work.bbclass                       |   9 +
 meta/conf/distro/include/no-static-libs.inc        |   4 -
 meta/lib/oeqa/selftest/cases/runtime_test.py       |   2 +
 .../initscripts/initscripts-1.0/sysfs.sh           |   4 +
 .../e2fsprogs/e2fsprogs/CVE-2019-5094.patch        | 217 +++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb |   1 +
 .../file/file/CVE-2019-18218.patch                 |  55 ++++++
 meta/recipes-devtools/file/file_5.37.bb            |   7 +-
 ...ke-ed-directly-instead-of-using-the-shell.patch |   4 +-
 .../pseudo/files/0001-Add-statx.patch              | 106 ++++++++++
 meta/recipes-devtools/pseudo/pseudo.inc            |  17 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb         |   1 +
 ...code-lib-as-location-for-site-packages-an.patch |   2 +-
 ...55-Dont-parse-domains-containing-GH-13079.patch | 132 -------------
 ...-cc_basename-to-replace-CC-for-checking-c.patch |   2 +-
 .../python/{python3_3.7.4.bb => python3_3.7.5.bb}  |   5 +-
 .../qemu/qemu-helper-native_1.0.bb                 |   2 +-
 meta/recipes-devtools/qemu/qemu-helper/tunctl.c    |  16 +-
 meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb   |  14 ++
 ...memory-update-for-mm-fix-false-positive-O.patch |  57 ++++++
 meta/recipes-extended/ltp/ltp_20190517.bb          |   1 +
 meta/recipes-extended/mdadm/mdadm_4.1.bb           |   5 +-
 meta/recipes-extended/pam/libpam_1.3.1.bb          |   2 +
 meta/recipes-extended/procps/procps_3.3.15.bb      |   9 +-
 meta/recipes-extended/sudo/sudo_1.8.27.bb          |   2 +-
 ...heck-for-build-dir-when-building-version-.patch |  45 +++++
 meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb    |   1 +
 .../linux-firmware/linux-firmware_20190815.bb      |  18 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   |   6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb    |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb |   8 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb  |   8 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      |  20 +-
 meta/recipes-kernel/linux/linux-yocto_5.2.bb       |  22 +--
 meta/recipes-multimedia/libpng/libpng_1.6.37.bb    |   3 +
 .../libsndfile/libsndfile1_1.0.28.bb               |   4 +
 .../libtiff/tiff/CVE-2019-17546.patch              | 103 ++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.10.bb     |   1 +
 ...dsa-ecdsa-Fix-use-of-nonce-use-larger-one.patch | 128 ++++++++++++
 ...-ecc-Add-mitigation-against-timing-attack.patch |  70 +++++++
 meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb  |   2 +
 .../libxslt/files/CVE-2019-18197.patch             |  33 ++++
 meta/recipes-support/libxslt/libxslt_1.1.33.bb     |   1 +
 46 files changed, 949 insertions(+), 226 deletions(-)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2019-5094.patch
 create mode 100644 meta/recipes-devtools/file/file/CVE-2019-18218.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-Add-statx.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-bpo-34155-Dont-parse-domains-containing-GH-13079.patch
 rename meta/recipes-devtools/python/{python3_3.7.4.bb => python3_3.7.5.bb} (98%)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-overcommit_memory-update-for-mm-fix-false-positive-O.patch
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-configure-check-for-build-dir-when-building-version-.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2019-17546.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/0001-dsa-ecdsa-Fix-use-of-nonce-use-larger-one.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/0001-ecc-Add-mitigation-against-timing-attack.patch
 create mode 100644 meta/recipes-support/libxslt/files/CVE-2019-18197.patch

-- 
2.7.4


