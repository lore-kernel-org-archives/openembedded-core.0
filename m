Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6D55060119
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 17:51:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 03 Feb 2016 09:51:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,391,1449561600"; d="scan'208";a="907810188"
Received: from sghosh7-mobl1.amr.corp.intel.com (HELO swold-mobl.jf.intel.com)
	([10.254.78.200])
	by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2016 09:51:37 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Wed,  3 Feb 2016 09:51:36 -0800
Message-Id: <cover.1454521792.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 00/24][Jethro V2] Jethro Consolidated Patchset
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
X-List-Received-Date: Wed, 03 Feb 2016 17:51:42 -0000

Richard,

This is the the udpated patch set for 2.0.1 after reviewing
the open CVEs and Medium+ bugs with available backports.

V2 added 2 patches I had in my Poky branch, but got left out here.

This has patches that address the AB failures from the other day

There will be a set of patches going to poky for the meta-yocto-bsp
fixes when they are available and tested.

Thanks
Sau!

The following changes since commit 3e403cc1bdeefd4f39e54bae2269ca56307e8468:

  libpcre: bug fixes include security (2016-01-30 12:10:16 +0000)

are available in the git repository at:

  ssh://git@git.openembedded.org/openembedded-core-contrib sgw/jethro

for you to fetch changes up to 226a26e51eb0789686509d3e22a3766e2e3e8666:

  piglit: don't use /tmp to write generated sources to (2016-02-03 09:48:20 -0800)

----------------------------------------------------------------
Alejandro Hernandez (3):
      linux-yocto: Update SRCREV for qemux86* for 3.14, fixes CVE-2016-0728
      linux-yocto: Update SRCREV for qemux86* for 3.19, fixes CVE-2016-0728
      linux-yocto: Update SRCREV for qemux86* for 4.1, fixes CVE-2016-0728

Armin Kuster (12):
      tzcode: update to 2016a
      tzdata: update to 2016a
      dpkg: Security fix CVE-2015-0860
      libxml2: Security fix CVE-2015-8241
      libxml2: Security fix CVE-2015-8710
      bind: Security fix CVE-2015-8000
      bind: Security fix CVE-2015-8461
      librsvg: Security fix CVE-2015-7558
      gdk-pixbuf: Security fix CVE-2015-7674
      grub: Security fix CVE-2015-8370
      glibc-locale: fix QA warning
      git: Security fix CVE-2015-7545

Bogdan-Alexandru Voiculescu (1):
      uClibc: enable utmp for shadow compatibility

Jianxun Zhang (1):
      kernel-yocto: fix checkout bare-cloned kernel repositories

Joe Slater (1):
      ghostscript: add dependency for pnglibconf.h

Jussi Kukkonen (1):
      gcr: Require x11 DISTRO_FEATURE

Maxin B. John (2):
      libpng: update URL that no longer exists
      libpng12: update URL that no longer exists

Paul Eggleton (1):
      gen-lockedsig-cache: fix bad destination path joining

Ross Burton (2):
      busybox: fix build of last applet
      piglit: don't use /tmp to write generated sources to

 meta/classes/kernel-yocto.bbclass                  |  13 +-
 meta/recipes-bsp/grub/files/CVE-2015-8370.patch    |  59 +++
 meta/recipes-bsp/grub/grub2.inc                    |   1 +
 .../bind/bind/CVE-2015-8000.patch                  | 278 +++++++++++++
 .../bind/bind/CVE-2015-8461.patch                  |  44 ++
 meta/recipes-connectivity/bind/bind_9.10.2-P4.bb   |   2 +
 .../busybox/busybox/0001-randconfig-fix.patch      |  33 ++
 meta/recipes-core/busybox/busybox_1.23.2.bb        |   1 +
 meta/recipes-core/glibc/glibc-locale.inc           |   2 +-
 meta/recipes-core/libxml/libxml2.inc               |   2 +
 .../libxml/libxml2/CVE-2015-8241.patch             |  40 ++
 .../libxml/libxml2/CVE-2015-8710.patch             |  71 ++++
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |   2 +
 .../recipes-devtools/dpkg/dpkg/CVE-2015-0860.patch |  52 +++
 meta/recipes-devtools/dpkg/dpkg_1.18.2.bb          |   1 +
 .../git/git-2.5.0/0008-CVE-2015-7545-1.patch       | 446 +++++++++++++++++++++
 .../git/git-2.5.0/0009-CVE-2015-7545-2.patch       | 112 ++++++
 .../git/git-2.5.0/0010-CVE-2015-7545-3.patch       | 112 ++++++
 .../git/git-2.5.0/0011-CVE-2015-7545-4.patch       | 150 +++++++
 .../git/git-2.5.0/0012-CVE-2015-7545-5.patch       |  69 ++++
 meta/recipes-devtools/git/git_2.5.0.bb             |   8 +
 .../ghostscript/ghostscript/png_mak.patch          |  21 +
 .../ghostscript/ghostscript_9.16.bb                |   1 +
 .../recipes-extended/tzcode/tzcode-native_2015g.bb |  25 --
 .../recipes-extended/tzcode/tzcode-native_2016a.bb |  25 ++
 .../tzdata/{tzdata_2015g.bb => tzdata_2016a.bb}    |  10 +-
 meta/recipes-gnome/gcr/gcr_3.16.0.bb               |   4 +-
 .../gdk-pixbuf/gdk-pixbuf/CVE-2015-7674.patch      |  39 ++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb |   1 +
 .../librsvg/librsvg/CVE-2015-7558_1.patch          | 139 +++++++
 .../librsvg/librsvg/CVE-2015-7558_2.patch          | 230 +++++++++++
 .../librsvg/librsvg/CVE-2015-7558_3.patch          | 223 +++++++++++
 meta/recipes-gnome/librsvg/librsvg_2.40.10.bb      |   6 +-
 meta/recipes-graphics/piglit/piglit_git.bb         |   6 +
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      |   6 +-
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      |   4 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       |   6 +-
 meta/recipes-lsb4/libpng/libpng12_1.2.53.bb        |   2 +-
 meta/recipes-multimedia/libpng/libpng_1.6.17.bb    |   2 +-
 scripts/gen-lockedsig-cache                        |   2 +-
 40 files changed, 2205 insertions(+), 45 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2015-8370.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8000.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8461.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-randconfig-fix.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8710.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/CVE-2015-0860.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/0008-CVE-2015-7545-1.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/0009-CVE-2015-7545-2.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/0010-CVE-2015-7545-3.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/0011-CVE-2015-7545-4.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/0012-CVE-2015-7545-5.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/png_mak.patch
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2015g.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2016a.bb
 rename meta/recipes-extended/tzdata/{tzdata_2015g.bb => tzdata_2016a.bb} (96%)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2015-7674.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_1.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_2.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_3.patch

Alejandro Hernandez (3):
  linux-yocto: Update SRCREV for qemux86* for 3.14, fixes CVE-2016-0728
  linux-yocto: Update SRCREV for qemux86* for 3.19, fixes CVE-2016-0728
  linux-yocto: Update SRCREV for qemux86* for 4.1, fixes CVE-2016-0728

Armin Kuster (12):
  tzcode: update to 2016a
  tzdata: update to 2016a
  dpkg: Security fix CVE-2015-0860
  libxml2: Security fix CVE-2015-8241
  libxml2: Security fix CVE-2015-8710
  bind: Security fix CVE-2015-8000
  bind: Security fix CVE-2015-8461
  librsvg: Security fix CVE-2015-7558
  gdk-pixbuf: Security fix CVE-2015-7674
  grub: Security fix CVE-2015-8370
  glibc-locale: fix QA warning
  git: Security fix CVE-2015-7545

Bogdan-Alexandru Voiculescu (1):
  uClibc: enable utmp for shadow compatibility

Jianxun Zhang (1):
  kernel-yocto: fix checkout bare-cloned kernel repositories

Joe Slater (1):
  ghostscript: add dependency for pnglibconf.h

Jussi Kukkonen (1):
  gcr: Require x11 DISTRO_FEATURE

Maxin B. John (2):
  libpng: update URL that no longer exists
  libpng12: update URL that no longer exists

Paul Eggleton (1):
  gen-lockedsig-cache: fix bad destination path joining

Ross Burton (2):
  busybox: fix build of last applet
  piglit: don't use /tmp to write generated sources to

 meta/classes/kernel-yocto.bbclass                  |  13 +-
 meta/recipes-bsp/grub/files/CVE-2015-8370.patch    |  59 +++
 meta/recipes-bsp/grub/grub2.inc                    |   1 +
 .../bind/bind/CVE-2015-8000.patch                  | 278 +++++++++++++
 .../bind/bind/CVE-2015-8461.patch                  |  44 ++
 meta/recipes-connectivity/bind/bind_9.10.2-P4.bb   |   2 +
 .../busybox/busybox/0001-randconfig-fix.patch      |  33 ++
 meta/recipes-core/busybox/busybox_1.23.2.bb        |   1 +
 meta/recipes-core/glibc/glibc-locale.inc           |   2 +-
 meta/recipes-core/libxml/libxml2.inc               |   2 +
 .../libxml/libxml2/CVE-2015-8241.patch             |  40 ++
 .../libxml/libxml2/CVE-2015-8710.patch             |  71 ++++
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |   2 +
 .../recipes-devtools/dpkg/dpkg/CVE-2015-0860.patch |  52 +++
 meta/recipes-devtools/dpkg/dpkg_1.18.2.bb          |   1 +
 .../git/git-2.5.0/0008-CVE-2015-7545-1.patch       | 446 +++++++++++++++++++++
 .../git/git-2.5.0/0009-CVE-2015-7545-2.patch       | 112 ++++++
 .../git/git-2.5.0/0010-CVE-2015-7545-3.patch       | 112 ++++++
 .../git/git-2.5.0/0011-CVE-2015-7545-4.patch       | 150 +++++++
 .../git/git-2.5.0/0012-CVE-2015-7545-5.patch       |  69 ++++
 meta/recipes-devtools/git/git_2.5.0.bb             |   8 +
 .../ghostscript/ghostscript/png_mak.patch          |  21 +
 .../ghostscript/ghostscript_9.16.bb                |   1 +
 ...code-native_2015g.bb => tzcode-native_2016a.bb} |  16 +-
 .../tzdata/{tzdata_2015g.bb => tzdata_2016a.bb}    |  10 +-
 meta/recipes-gnome/gcr/gcr_3.16.0.bb               |   4 +-
 .../gdk-pixbuf/gdk-pixbuf/CVE-2015-7674.patch      |  39 ++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb |   1 +
 .../librsvg/librsvg/CVE-2015-7558_1.patch          | 139 +++++++
 .../librsvg/librsvg/CVE-2015-7558_2.patch          | 230 +++++++++++
 .../librsvg/librsvg/CVE-2015-7558_3.patch          | 223 +++++++++++
 meta/recipes-gnome/librsvg/librsvg_2.40.10.bb      |   6 +-
 meta/recipes-graphics/piglit/piglit_git.bb         |   6 +
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      |   6 +-
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      |   4 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       |   6 +-
 meta/recipes-lsb4/libpng/libpng12_1.2.53.bb        |   2 +-
 meta/recipes-multimedia/libpng/libpng_1.6.17.bb    |   2 +-
 scripts/gen-lockedsig-cache                        |   2 +-
 39 files changed, 2188 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2015-8370.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8000.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8461.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-randconfig-fix.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8710.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/CVE-2015-0860.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/0008-CVE-2015-7545-1.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/0009-CVE-2015-7545-2.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/0010-CVE-2015-7545-3.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/0011-CVE-2015-7545-4.patch
 create mode 100644 meta/recipes-devtools/git/git-2.5.0/0012-CVE-2015-7545-5.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/png_mak.patch
 rename meta/recipes-extended/tzcode/{tzcode-native_2015g.bb => tzcode-native_2016a.bb} (40%)
 rename meta/recipes-extended/tzdata/{tzdata_2015g.bb => tzdata_2016a.bb} (96%)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2015-7674.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_1.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_2.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_3.patch

-- 
2.5.0


