Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D28E7719E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 05:47:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w625lJ30022568
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 1 Jul 2018 22:47:21 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Sun, 1 Jul 2018 22:47:18 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 2 Jul 2018 13:57:05 +0800
Message-ID: <cover.1530510873.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/8] upgrade 8 recipes
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
X-List-Received-Date: Mon, 02 Jul 2018 05:47:21 -0000
Content-Type: text/plain

Build successfully:
- qemux86-64 + glibc
- qemux86-64 + musl
- qemuarm64 + glibc
- qemuarm64 + musl

//Hongxu

The following changes since commit 6f8f984ba363f764e83290b972ec31a90aad1603:

  initrdscripts/init-live.sh: fix mounts w/ spaces fail to move to real rootfs (2018-06-28 23:33:55 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/upgrade-20180701
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/upgrade-20180701

Hongxu Jia (8):
  gnupg: 2.2.5 -> 2.2.8
  gpgme: 1.10.0 -> 1.11.1
  man-db: 2.8.2 -> 2.8.3
  elfutils: 0.170 -> 0.172
  man-pages: 4.14 -> 4.16
  help2man-native: 1.47.5 -> 1.47.6
  libgcrypt: 1.8.2 -> 1.8.3
  ncurses: 6.1 -> 6.1+20180630

 .../{ncurses_6.1.bb => ncurses_6.1+20180630.bb}    |   2 +-
 .../{elfutils_0.170.bb => elfutils_0.172.bb}       |  22 +-
 .../elfutils/files/0001-dso-link-change.patch      |   8 +-
 ...0001-libasm-may-link-with-libbz2-if-found.patch |  12 +-
 ...-elf_cvt_gunhash-if-dest-and-src-are-same.patch |   4 +-
 .../elfutils/files/0003-fixheadercheck.patch       |   6 +-
 .../0004-Disable-the-test-to-convert-euc-jp.patch  |   4 +-
 .../files/0005-fix-a-stack-usage-warning.patch     |   8 +-
 .../files/0006-Fix-build-on-aarch64-musl.patch     |   4 +-
 ...-path-where-we-have-str-as-uninitialized-.patch |  12 +-
 ...de-alternatives-for-glibc-assumptions-hel.patch | 201 ++++++-------
 ...ferences-between-mips-machine-identifiers.patch |   4 -
 .../{arm_backend.diff => 0001-arm_backend.patch}   | 322 +++++++++++----------
 .../files/debian/0001-disable_werror.patch         |  35 +++
 .../files/debian/0001-fix-gcc7-ftbfs.patch         |  57 ++++
 .../{hppa_backend.diff => 0001-hppa_backend.patch} | 170 ++++++-----
 ...{mips_backend.patch => 0001-mips_backend.patch} |  31 +-
 ...s_readelf_w.patch => 0001-mips_readelf_w.patch} |  24 +-
 .../debian/0001-testsuite-ignore-elflint.patch     |  57 ++++
 ...-support-for-mips64-abis-in-mips_retval.c.patch |   3 -
 .../0003-Add-mips-n64-relocation-format-hack.patch |   5 +-
 .../elfutils/files/debian/hurd_path.patch          |  14 +
 .../elfutils/files/debian/ignore_strmerge.diff     |  11 +
 .../elfutils/files/debian/kfreebsd_path.patch      |  17 ++
 ...-native_1.47.5.bb => help2man-native_1.47.6.bb} |   4 +-
 .../man-db/{man-db_2.8.2.bb => man-db_2.8.3.bb}    |   4 +-
 .../{man-pages_4.14.bb => man-pages_4.16.bb}       |   4 +-
 .../gnupg/{gnupg_2.2.5.bb => gnupg_2.2.8.bb}       |   4 +-
 .../gpgme/gpgme/0001-pkgconfig.patch               |  18 +-
 ...python-gpg-error-config-should-not-be-use.patch |  10 +-
 .../0003-Correctly-install-python-modules.patch    |   6 +-
 .../gpgme/gpgme/0004-python-import.patch           |   6 +-
 ...g-skip-all-lib-or-usr-lib-directories-in-.patch |   6 +-
 .../gpgme/gpgme/0006-fix-build-path-issue.patch    |   6 +-
 .../0007-qt-python-Add-variables-to-tests.patch    |  12 +-
 .../gpgme/{gpgme_1.10.0.bb => gpgme_1.11.1.bb}     |   6 +-
 .../{libgcrypt_1.8.2.bb => libgcrypt_1.8.3.bb}     |   4 +-
 37 files changed, 675 insertions(+), 448 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses_6.1.bb => ncurses_6.1+20180630.bb} (86%)
 rename meta/recipes-devtools/elfutils/{elfutils_0.170.bb => elfutils_0.172.bb} (79%)
 rename meta/recipes-devtools/elfutils/files/debian/{arm_backend.diff => 0001-arm_backend.patch} (87%)
 create mode 100644 meta/recipes-devtools/elfutils/files/debian/0001-disable_werror.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/debian/0001-fix-gcc7-ftbfs.patch
 rename meta/recipes-devtools/elfutils/files/debian/{hppa_backend.diff => 0001-hppa_backend.patch} (89%)
 rename meta/recipes-devtools/elfutils/files/debian/{mips_backend.patch => 0001-mips_backend.patch} (97%)
 rename meta/recipes-devtools/elfutils/files/debian/{mips_readelf_w.patch => 0001-mips_readelf_w.patch} (48%)
 create mode 100644 meta/recipes-devtools/elfutils/files/debian/0001-testsuite-ignore-elflint.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/debian/hurd_path.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/debian/ignore_strmerge.diff
 create mode 100644 meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch
 rename meta/recipes-devtools/help2man/{help2man-native_1.47.5.bb => help2man-native_1.47.6.bb} (79%)
 rename meta/recipes-extended/man-db/{man-db_2.8.2.bb => man-db_2.8.3.bb} (90%)
 rename meta/recipes-extended/man-pages/{man-pages_4.14.bb => man-pages_4.16.bb} (87%)
 rename meta/recipes-support/gnupg/{gnupg_2.2.5.bb => gnupg_2.2.8.bb} (92%)
 rename meta/recipes-support/gpgme/{gpgme_1.10.0.bb => gpgme_1.11.1.bb} (93%)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.8.2.bb => libgcrypt_1.8.3.bb} (92%)

-- 
2.7.4


