Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][dunfell 00/14] Patch review
Date: Mon, 29 Aug 2022 11:02:19 -1000
Message-Id: <cover.1661806803.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

Please review this set of changes for dunfell and have comments back by end
of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4151

The following changes since commit a3cba15142e98177119ef36c09f553d09acf35ef:

  build-appliance-image: Update to dunfell head revision (2022-08-22 16:07:02 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (3):
  mobile-broadband-provider-info: upgrade 20220511 -> 20220725
  tzdata: upgrade 2022a -> 2022b
  wireless-regdb: upgrade 2022.06.06 -> 2022.08.12

Anuj Mittal (1):
  cryptodev-module: fix build with 5.11+ kernels

Bruce Ashfield (1):
  linux-yocto/5.4: update to v5.4.210

Ernst Sjöstrand (1):
  cve-check: Don't use f-strings

Hitendra Prajapati (5):
  libtiff: CVE-2022-34526 A stack overflow was discovered
  golang: fix CVE-2022-30629 and CVE-2022-30631
  golang: fix CVE-2022-30632 and CVE-2022-30633
  golang: fix CVE-2022-30635 and CVE-2022-32148
  golang: CVE-2022-32189 a denial of service

Paul Eggleton (1):
  relocate_sdk.py: ensure interpreter size error causes relocation to
    fail

Pawan Badganchi (1):
  libxml2: Add fix for CVE-2016-3709

Richard Purdie (1):
  vim: Upgrade 9.0.0115 -> 9.0.0242

 meta/lib/oe/cve_check.py                      |   2 +-
 .../mobile-broadband-provider-info_git.bb     |   4 +-
 .../libxml/libxml2/CVE-2016-3709.patch        |  89 ++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   1 +
 meta/recipes-devtools/go/go-1.14.inc          |   7 +
 .../go/go-1.14/CVE-2022-30629.patch           |  47 +++++++
 .../go/go-1.14/CVE-2022-30631.patch           | 116 ++++++++++++++++
 .../go/go-1.14/CVE-2022-30632.patch           |  71 ++++++++++
 .../go/go-1.14/CVE-2022-30633.patch           | 131 ++++++++++++++++++
 .../go/go-1.14/CVE-2022-30635.patch           | 120 ++++++++++++++++
 .../go/go-1.14/CVE-2022-32148.patch           |  49 +++++++
 .../go/go-1.14/CVE-2022-32189.patch           | 113 +++++++++++++++
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../cryptodev/cryptodev-module_1.10.bb        |   1 +
 .../files/fix-build-for-Linux-5.11-rc1.patch  |  32 +++++
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +--
 ....06.06.bb => wireless-regdb_2022.08.12.bb} |   2 +-
 .../libtiff/files/CVE-2022-34526.patch        |  29 ++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/relocate_sdk.py                       |  10 +-
 23 files changed, 842 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2016-3709.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-30629.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-30631.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-30632.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-30633.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-30635.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-32148.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-32189.patch
 create mode 100644 meta/recipes-kernel/cryptodev/files/fix-build-for-Linux-5.11-rc1.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.06.06.bb => wireless-regdb_2022.08.12.bb} (94%)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-34526.patch

-- 
2.25.1

