X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Anuj Mittal" <anuj.mittal@intel.com>
Subject: [honister][PATCH 00/38] Pull request (cover letter only)
Date: Thu, 24 Feb 2022 14:02:39 +0800
Message-Id: <cover.1645682352.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

The following changes since commit 418a9c4c31615a9e3e011fc2b21fb7154bc6c93a:

  build-appliance-image: Update to honister head revision (2022-02-09 23:15:24 +0000)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/honister-next

Bruce Ashfield (4):
  linux-yocto/5.10: update to v5.10.96
  linux-yocto/5.10: update to v5.10.99
  linux-yocto/5.10: ppc/riscv: fix build with binutils 2.3.8
  linux-yocto/5.10: fix dssall build error with binutils 2.3.8

Christian Eggers (2):
  mc: fix build if ncurses have been configured without wide characters
  sdk: fix search for dynamic loader

Daniel Müller (1):
  scripts/runqemu-ifdown: Don't treat the last iptables command as
    special

Florian Amstutz (1):
  devtool: deploy-target: Remove stripped binaries in pseudo context

Joe Slater (1):
  virglrenderer: fix CVE-2022-0135 and -0175

Jose Quaresma (12):
  gstreamer1.0: 1.18.5 -> 1.18.6
  gstreamer1.0-plugins-base: 1.18.5 -> 1.18.6
  gstreamer1.0-plugins-good: 1.18.5 -> 1.18.6
  gstreamer1.0-plugins-bad: 1.18.5 -> 1.18.6
  gstreamer1.0-plugins-ugly: 1.18.5 -> 1.18.6
  gstreamer1.0-vaapi: 1.18.5 -> 1.18.6
  gstreamer1.0-libav: 1.18.5 -> 1.18.6
  gstreamer1.0-omx: 1.18.5 -> 1.18.6
  gstreamer1.0-rtsp-server: 1.18.5 -> 1.18.6
  gstreamer1.0-python: 1.18.5 -> 1.18.6
  gst-devtools: 1.18.5 -> 1.18.6
  gst-examples: 1.18.5 -> 1.18.6

Justin Bronder (1):
  initramfs-framework: unmount automounts before switch_root

Michael Halstead (1):
  uninative: Upgrade to 3.5

Richard Purdie (8):
  vim: Upgrade 4269 -> 4134
  binutils: Add fix for CVE-2021-45078
  default-distrovars.inc: Switch connectivity check to a
    yoctoproject.org page
  oeqa/buildtools: Switch to our webserver instead of example.com
  expat: Upgrade 2.4.4 -> 2.4.5
  vim: Upgrade 8.2.4314 -> 8.2.4424
  tiff: Add backports for two CVEs from upstream
  expat: Upgrade 2.4.5 -> 2.4.6

Saul Wold (1):
  recipetool: Fix circular reference in SRC_URI

Sean Anderson (1):
  libpcap: Disable DPDK explicitly

Stefan Herbrechtsmeier (2):
  cve-check: create directory of CVE_CHECK_MANIFEST before copy
  gcc-target: fix glob to remove gcc-<version> binary

Zoltán Böszörményi (1):
  qemuboot: Fix build error if UNINATIVE_LOADER is unset

pgowda (1):
  gcc : Fix CVE-2021-46195

wangmy (1):
  linux-firmware: upgrade 20211216 -> 20220209

 meta/classes/cve-check.bbclass                |   1 +
 meta/classes/qemuboot.bbclass                 |   2 +
 meta/classes/sanity.bbclass                   |   2 +-
 .../distro/include/default-distrovars.inc     |   2 +-
 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 meta/files/toolchain-shar-relocate.sh         |   2 +-
 meta/lib/oeqa/sdk/buildtools-cases/https.py   |   4 +-
 .../libpcap/libpcap_1.10.1.bb                 |   3 +-
 .../expat/{expat_2.4.4.bb => expat_2.4.6.bb}  |   2 +-
 .../initrdscripts/initramfs-framework/finish  |  12 +
 .../binutils/binutils-2.37.inc                |   1 +
 ...87d12167b1e36193385485c1f6ce92f74f02.patch | 247 ++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-11.2.inc        |   1 +
 meta/recipes-devtools/gcc/gcc-target.inc      |   2 +-
 .../gcc/gcc/0001-CVE-2021-46195.patch         | 128 +++++++++
 ...FTBFS-with-ncurses-build-with-disabl.patch |  87 ++++++
 meta/recipes-extended/mc/mc_4.8.27.bb         |   5 +-
 .../virglrenderer/cve-2022-0135.patch         | 117 +++++++++
 .../virglrenderer/cve-2022-0175.patch         | 107 ++++++++
 .../virglrenderer/virglrenderer_0.9.1.bb      |   2 +
 ...20211216.bb => linux-firmware_20220209.bb} |   4 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 ...tools_1.18.5.bb => gst-devtools_1.18.6.bb} |   2 +-
 ...mples_1.18.5.bb => gst-examples_1.18.6.bb} |   2 +-
 ...1.18.5.bb => gstreamer1.0-libav_1.18.6.bb} |   2 +-
 ...x_1.18.5.bb => gstreamer1.0-omx_1.18.6.bb} |   2 +-
 ....bb => gstreamer1.0-plugins-bad_1.18.6.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-base_1.18.6.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-good_1.18.6.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.18.6.bb} |   2 +-
 ....18.5.bb => gstreamer1.0-python_1.18.6.bb} |   2 +-
 ....bb => gstreamer1.0-rtsp-server_1.18.6.bb} |   2 +-
 ...1.18.5.bb => gstreamer1.0-vaapi_1.18.6.bb} |   2 +-
 ...er1.0_1.18.5.bb => gstreamer1.0_1.18.6.bb} |   2 +-
 ...al-buffer-overflow-for-ASCII-tags-wh.patch |   0
 ...99c99f987dc32ae110370cfdd7df7975586b.patch |  30 +++
 ...0712f4c3a5b449f70c57988260a667ddbdef.patch |  32 +++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   4 +-
 meta/recipes-support/vim/vim.inc              |   7 +-
 scripts/lib/devtool/deploy.py                 |   2 +-
 scripts/lib/recipetool/create.py              |   2 +-
 scripts/runqemu-ifdown                        |   1 +
 44 files changed, 828 insertions(+), 53 deletions(-)
 rename meta/recipes-core/expat/{expat_2.4.4.bb => expat_2.4.6.bb} (91%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/161e87d12167b1e36193385485c1f6ce92f74f02.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-46195.patch
 create mode 100644 meta/recipes-extended/mc/files/0001-Ticket-4200-fix-FTBFS-with-ncurses-build-with-disabl.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0135.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/cve-2022-0175.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20211216.bb => linux-firmware_20220209.bb} (99%)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.18.5.bb => gst-devtools_1.18.6.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.5.bb => gst-examples_1.18.6.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.18.5.bb => gstreamer1.0-libav_1.18.6.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.18.5.bb => gstreamer1.0-omx_1.18.6.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.18.5.bb => gstreamer1.0-plugins-bad_1.18.6.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.18.5.bb => gstreamer1.0-plugins-base_1.18.6.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.18.5.bb => gstreamer1.0-plugins-good_1.18.6.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.18.5.bb => gstreamer1.0-plugins-ugly_1.18.6.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.18.5.bb => gstreamer1.0-python_1.18.6.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.18.5.bb => gstreamer1.0-rtsp-server_1.18.6.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.18.5.bb => gstreamer1.0-vaapi_1.18.6.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.5.bb => gstreamer1.0_1.18.6.bb} (97%)
 rename meta/recipes-multimedia/libtiff/{files => tiff}/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch (100%)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch

-- 
2.35.1

