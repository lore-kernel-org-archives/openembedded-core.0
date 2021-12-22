Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][dunfell 00/14] Patch review
Date: Wed, 22 Dec 2021 04:12:13 -1000
Message-Id: <cover.1640181998.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

Please review this set of patches for dunfell and have comments back by end
of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3047

with the exception of a known intermittent autobuilder issue on oe-selftest-centos
which passed on subsequent retest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2977

The following changes since commit 90a07178ea26be453d101c2e8b33d3a0f437635d:

  build-appliance-image: Update to dunfell head revision (2021-12-14 22:49:32 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Anuj Mittal (1):
  gstreamer1.0: fix failing ptest

Bruce Ashfield (5):
  linux-yocto/5.4: update to v5.4.159
  linux-yocto/5.4: update to v5.4.162
  linux-yocto/5.4: update to v5.4.163
  linux-yocto/5.4: update to v5.4.165
  linux-yocto/5.4: update to v5.4.167

Ernst Sjöstrand (1):
  dropbear: Fix CVE-2020-36254

Marta Rybczynska (1):
  bluez: fix CVE-2021-0129

Mingli Yu (1):
  bootchart2: remove wait_boot logic

Minjae Kim (2):
  vim: fix CVE-2021-4069
  inetutils: fix CVE-2021-40491

Steve Sakoman (1):
  selftest: skip virgl test on fedora 34 entirely

sana kazi (2):
  openssh: Fix CVE-2021-41617
  openssh: Whitelist CVE-2016-20012

 meta/lib/oeqa/selftest/cases/runtime_test.py  |   2 +
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 .../bluez5/bluez5/CVE-2021-0129.patch         | 109 ++++++++++++++++++
 .../inetutils/inetutils/CVE-2021-40491.patch  |  67 +++++++++++
 .../inetutils/inetutils_1.9.4.bb              |   1 +
 .../openssh/openssh/CVE-2021-41617.patch      |  52 +++++++++
 .../openssh/openssh_8.2p1.bb                  |  10 ++
 meta/recipes-core/dropbear/dropbear.inc       |   4 +-
 .../dropbear/dropbear/CVE-2020-36254.patch    |  29 +++++
 ...ake-sure-only-one-bootchartd-process.patch |  68 +++++++++++
 .../bootchart2/bootchart2_0.14.9.bb           |   1 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 ++--
 ...-use-too-strict-timeout-for-validati.patch |  33 ++++++
 .../gstreamer/gstreamer1.0_1.16.3.bb          |   1 +
 .../vim/files/CVE-2021-4069.patch             |  43 +++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 18 files changed, 439 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2021-0129.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2021-40491.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2020-36254.patch
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/0001-bootchartd.in-make-sure-only-one-bootchartd-process.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-4069.patch

-- 
2.25.1

