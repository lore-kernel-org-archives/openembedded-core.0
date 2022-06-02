Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][dunfell 00/11] Patch review
Date: Wed,  1 Jun 2022 16:30:40 -1000
Message-Id: <cover.1654136888.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

Please review this set of patches for dunfell and have comments back by end
of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3738

The following changes since commit add860e1a69f848097bbc511137a62d5746e5019:

  oeqa/selftest/cve_check: add tests for recipe and image reports (2022-05-24 04:31:18 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Dan Tran (1):
  ncurses: Fix CVE-2022-29458

Ernst Sjöstrand (2):
  cve-check: Add helper for symlink handling
  cve-check: Only include installed packages for rootfs manifest

Ranjitsinh Rathod (3):
  ruby: Upgrade ruby to 2.7.6 for security fix
  ruby: Whitelist CVE-2021-28966 as this affects Windows OS only
  libsdl2: Add fix for CVE-2021-33657

Richard Purdie (2):
  vim: Upgrade 8.2.4912 -> 8.2.5034 to fix 9 CVEs
  cve-check: Allow warnings to be disabled

Riyaz (1):
  libxml2: Fix CVE-2022-29824 for libxml2

Virendra Thakur (1):
  ffmpeg: Fix for CVE-2022-1475

leimaohui (1):
  cve-check.bbclass: Added do_populate_sdk[recrdeptask].

 meta/classes/cve-check.bbclass                | 109 ++++--
 .../libxml2/CVE-2022-29824-dependent.patch    |  53 +++
 .../libxml/libxml2/CVE-2022-29824.patch       | 348 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   2 +
 .../ncurses/files/CVE-2022-29458.patch        | 135 +++++++
 meta/recipes-core/ncurses/ncurses_6.2.bb      |   1 +
 .../ruby/{ruby_2.7.5.bb => ruby_2.7.6.bb}     |   8 +-
 .../libsdl2/libsdl2/CVE-2021-33657.patch      |  38 ++
 .../libsdl2/libsdl2_2.0.12.bb                 |   1 +
 .../ffmpeg/ffmpeg/CVE-2022-1475.patch         |  36 ++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 12 files changed, 694 insertions(+), 42 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-29824-dependent.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-29824.patch
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2022-29458.patch
 rename meta/recipes-devtools/ruby/{ruby_2.7.5.bb => ruby_2.7.6.bb} (90%)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/CVE-2021-33657.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-1475.patch

-- 
2.25.1

