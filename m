Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 00/24] Pull request (cover letter only)
Date: Fri,  9 Sep 2022 13:08:26 -1000
Message-Id: <cover.1662764861.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

The following changes since commit 2363d69d687fc8e53a7c97bf5300e59c9a04f22e:

  gcr: Define _GNU_SOURCE (2022-09-03 13:09:42 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alex Stewart (1):
  maintainers: update opkg maintainer

Chee Yang Lee (1):
  sqlite: add CVE-2022-35737 patch to SRC_URI

Enrico Scholz (5):
  npm: replace 'npm pack' call by 'tar czf'
  npm: return content of 'package.json' in 'npm_pack'
  npm: take 'version' directly from 'package.json'
  lib:npm_registry: initial checkin
  npm: use npm_registry to cache package

Joshua Watt (1):
  classes: cve-check: Get shared database lock

Khem Raj (1):
  apr: Cache configure tests which use AC_TRY_RUN

LUIS ENRIQUEZ (1):
  kernel-fitimage.bbclass: add padding algorithm property in config
    nodes

Ming Liu (1):
  meta: introduce UBOOT_MKIMAGE_KERNEL_TYPE

Rasmus Villemoes (1):
  bitbake.conf: set BB_DEFAULT_UMASK using ??=

Richard Purdie (2):
  vim: Upgrade 9.0.0242 -> 9.0.0341
  pseudo: Update to include recent upstream minor fixes

Robert Joslyn (1):
  curl: Backport patch for CVE-2022-35252

Ross Burton (1):
  cve-check: close cursors as soon as possible

Ulrich Ölmann (1):
  scripts/runqemu.README: fix typos and trailing whitespaces

Yang Xu (1):
  insane.bbclass: Skip patches not in oe-core by full path

pgowda (1):
  binutils : CVE-2022-38533

wangmy (5):
  libtasn1: upgrade 4.18.0 -> 4.19.0
  liburcu: upgrade 0.13.1 -> 0.13.2
  libwpe: upgrade 1.12.2 -> 1.12.3
  libatomic-ops: upgrade 7.6.12 -> 7.6.14
  lz4: upgrade 1.9.3 -> 1.9.4

 meta/classes/cve-check.bbclass                |  36 ++--
 meta/classes/insane.bbclass                   |   3 +-
 meta/classes/kernel-fitimage.bbclass          |   4 +-
 meta/classes/kernel-uboot.bbclass             |   3 +
 meta/classes/kernel-uimage.bbclass            |   2 +-
 meta/classes/npm.bbclass                      |  63 ++++---
 meta/classes/uboot-sign.bbclass               |   3 +
 meta/conf/bitbake.conf                        |   2 +-
 meta/conf/distro/include/maintainers.inc      |   8 +-
 meta/lib/oe/npm_registry.py                   | 169 ++++++++++++++++++
 meta/lib/oeqa/selftest/cases/fitimage.py      |   4 +-
 .../recipes-core/meta/cve-update-db-native.bb |  51 +++---
 .../binutils/binutils-2.38.inc                |   1 +
 .../binutils/0015-CVE-2022-38533.patch        |  36 ++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 ...ure-due-to-libc-using-libc-functions.patch |  42 -----
 .../{libwpe_1.12.2.bb => libwpe_1.12.3.bb}    |   6 +-
 ...-runtime-test-for-mmap-that-can-map-.patch |  62 +++++++
 meta/recipes-support/apr/apr_1.7.0.bb         |  15 +-
 .../curl/curl/CVE-2022-35252.patch            |  72 ++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 ...{libtasn1_4.18.0.bb => libtasn1_4.19.0.bb} |   2 +-
 ...-ops_7.6.12.bb => libatomic-ops_7.6.14.bb} |   4 +-
 .../{liburcu_0.13.1.bb => liburcu_0.13.2.bb}  |   2 +-
 .../lz4/files/CVE-2021-3520.patch             |  27 ---
 .../lz4/{lz4_1.9.3.bb => lz4_1.9.4.bb}        |  10 +-
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |   4 +-
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/runqemu.README                        |  16 +-
 29 files changed, 489 insertions(+), 165 deletions(-)
 create mode 100644 meta/lib/oe/npm_registry.py
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2022-38533.patch
 delete mode 100644 meta/recipes-sato/webkit/libwpe/0001-Fix-build-failure-due-to-libc-using-libc-functions.patch
 rename meta/recipes-sato/webkit/{libwpe_1.12.2.bb => libwpe_1.12.3.bb} (72%)
 create mode 100644 meta/recipes-support/apr/apr/0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-35252.patch
 rename meta/recipes-support/gnutls/{libtasn1_4.18.0.bb => libtasn1_4.19.0.bb} (90%)
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.6.12.bb => libatomic-ops_7.6.14.bb} (80%)
 rename meta/recipes-support/liburcu/{liburcu_0.13.1.bb => liburcu_0.13.2.bb} (91%)
 delete mode 100644 meta/recipes-support/lz4/files/CVE-2021-3520.patch
 rename meta/recipes-support/lz4/{lz4_1.9.3.bb => lz4_1.9.4.bb} (78%)

-- 
2.25.1

