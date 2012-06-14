Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SfFrk-0005c8-Aq
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 21:38:00 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Jun 2012 12:27:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="180153716"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.138])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jun 2012 12:27:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2012 12:27:04 -0700
Message-Id: <cover.1339701375.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [Consolidated Pull 00/17] bug fixes and updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jun 2012 19:38:00 -0000

Richard,

Various fixes and updates, I have built and tested the changes.

This includes some work from Robert to provide pybootchartgui,
updated with some of the work you did for build profiling. Basic
touch testing of it brings up a window when given the right directory.

Sau!


The following changes since commit c4d0b1c5438039dab07103c151c0c5a76a4c9499:

  connman: bump PR and add some comments (2012-06-13 13:11:11 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrei Gherzan (1):
  coreutils: Fix a typo in v6.9 (bracket not braket)

Bogdan Marinescu (1):
  libpcre: updated to version 8.30

Bruce Ashfield (2):
  linux-yocto/3.4: update yaffs2 and drop rc6
  linux-yocto/3.4: create linux-yocto-rt recipe

Robert Yang (6):
  pybootchartgui: add the original code
  pybootchartgui: remove the original examples
  pybootchartgui: make the build profiling in pictures
  pybootchartgui: split the output chart into multiple ones
  pybootchartgui: Fix the filename and add a default format
  opkg 0.1.8: do_fetch failed since no checksum specified

Saul Wold (7):
  distro_tracking_fields: move to meta-yocto as seperate files
  busybox: Add check for wifi/bluetooth to enable rfkill
  curl: enable ssl support
  quilt: added ac_cv_path_BASH to CACHED_CONFIGUREVARS
  eglibc: added ac_cv_path_ to CACHED_CONFIGUREVARS
  gcc-target: ensure target packages have the correct virtual package
    names
  beecrypt: add patch for build issue on Fedora 17

 .../conf/distro/include/distro_tracking_fields.inc | 6485 --------------------
 meta/recipes-core/busybox/busybox.inc              |    2 +
 meta/recipes-core/coreutils/coreutils_6.9.bb       |    2 +-
 meta/recipes-core/eglibc/eglibc.inc                |    2 +
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    2 +-
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    2 +-
 meta/recipes-devtools/gcc/gcc-package-runtime.inc  |    4 +
 .../opkg/opkg-0.1.8/add_vercmp.patch               |   36 -
 meta/recipes-devtools/opkg/opkg_0.1.8.bb           |    3 +
 meta/recipes-devtools/quilt/quilt_0.60.bb          |    5 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |   32 +
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   14 +-
 .../beecrypt/beecrypt/fix-for-gcc-4.7.patch        |   39 +
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |    5 +-
 meta/recipes-support/curl/curl_7.24.0.bb           |   10 +-
 .../libpcre/{libpcre_8.21.bb => libpcre_8.30.bb}   |   10 +-
 scripts/pybootchartgui/AUTHORS                     |   11 +
 scripts/pybootchartgui/COPYING                     |  674 ++
 scripts/pybootchartgui/README                      |   36 +
 scripts/pybootchartgui/pybootchartgui.py           |    7 +
 scripts/pybootchartgui/pybootchartgui/batch.py     |   23 +
 scripts/pybootchartgui/pybootchartgui/draw.py      |  408 ++
 scripts/pybootchartgui/pybootchartgui/gui.py       |  273 +
 scripts/pybootchartgui/pybootchartgui/main.py      |   76 +
 scripts/pybootchartgui/pybootchartgui/parsing.py   |  264 +
 .../pybootchartgui/pybootchartgui/process_tree.py  |  270 +
 scripts/pybootchartgui/pybootchartgui/samples.py   |   93 +
 .../pybootchartgui/tests/parser_test.py            |   93 +
 .../pybootchartgui/tests/process_tree_test.py      |   78 +
 30 files changed, 2416 insertions(+), 6545 deletions(-)
 delete mode 100644 meta/conf/distro/include/distro_tracking_fields.inc
 delete mode 100644 meta/recipes-devtools/opkg/opkg-0.1.8/add_vercmp.patch
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
 create mode 100644 meta/recipes-support/beecrypt/beecrypt/fix-for-gcc-4.7.patch
 rename meta/recipes-support/libpcre/{libpcre_8.21.bb => libpcre_8.30.bb} (86%)
 create mode 100644 scripts/pybootchartgui/AUTHORS
 create mode 100644 scripts/pybootchartgui/COPYING
 create mode 100644 scripts/pybootchartgui/README
 create mode 100755 scripts/pybootchartgui/pybootchartgui.py
 create mode 100644 scripts/pybootchartgui/pybootchartgui/__init__.py
 create mode 100644 scripts/pybootchartgui/pybootchartgui/batch.py
 create mode 100644 scripts/pybootchartgui/pybootchartgui/draw.py
 create mode 100644 scripts/pybootchartgui/pybootchartgui/gui.py
 create mode 100644 scripts/pybootchartgui/pybootchartgui/main.py
 create mode 100644 scripts/pybootchartgui/pybootchartgui/parsing.py
 create mode 100644 scripts/pybootchartgui/pybootchartgui/process_tree.py
 create mode 100644 scripts/pybootchartgui/pybootchartgui/samples.py
 create mode 100644 scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
 create mode 100644 scripts/pybootchartgui/pybootchartgui/tests/process_tree_test.py

-- 
1.7.7.6



