Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNrMC-0002iM-8O
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 20:29:16 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Nov 2011 11:23:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,477,1315206000"; d="scan'208";a="34587126"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Nov 2011 11:23:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 11:22:40 -0800
Message-Id: <cover.1320780004.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [CONSOLIDATED PULL 00/17] Updates and Fixes
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
X-List-Received-Date: Tue, 08 Nov 2011 19:29:16 -0000

Richard,

I have reviewed and build/booted these changes.

There are 2 changes from Tom that I need your advice on, please review
the gmp and python changes, I do not want to hold these up if they are 
correct, but I wanted to think if there was a better way to handle the
python one.

Thanks
	Sau!

The following changes since commit 157db263b50fabf4afcbea3c2a5364c0752ae0e2:

  clutter-gst: fix patch filename (2011-11-08 17:33:19 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Mark Hatle (1):
  pseudo: Uprev pseudo to version 1.2

Matthew McClintock (1):
  Add new IMAGE_CLASSES variable for classes for image generation

Otavio Salvador (5):
  libcap: fix sstate for native package
  files/device_table-minimal.txt: add /dev/kmsg
  dhcp: drop unused dhcp3.inc file
  dhcp: rename dhcp4.inc to dhcp.inc
  dhcp: move server configuration to dhcp-server-config

Tom Zanussi (6):
  tune-corei7: Add tune file for Intel Core i7 machines
  tune-ivb: Add tune file for Intel Ivy Bridge machines
  machine/include/tune-atom.inc: add atom-specific settings
  ** gmp_5.0.2: Set CC_FOR_BUILD to BUILD_CC
  libzypp: fix mishandling of hyphenated arches
  ** python: skip setup.py 'import check' when cross-compiling

Xiaofeng Yan (4):
  libarchive: update to 2.8.5
  distro_tracking_fields.inc: update to libarchive to 2.8.5
  qmmp: update to 0.5.2
  distro_tracking_fields.inc: Modify the status of qmmp

 meta/classes/image.bbclass                         |    3 +-
 .../conf/distro/include/distro_tracking_fields.inc |   19 ++-
 meta/conf/local.conf.sample.extended               |    6 +
 meta/conf/machine/include/tune-atom.inc            |   26 +++-
 meta/conf/machine/include/tune-corei7.inc          |   17 ++
 meta/conf/machine/include/tune-ivb.inc             |   11 ++
 meta/files/device_table-minimal.txt                |    1 +
 .../dhcp/{dhcp4.inc => dhcp.inc}                   |   10 +-
 meta/recipes-connectivity/dhcp/dhcp3.inc           |   49 ------
 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb       |    4 +-
 .../pseudo/pseudo/realpath_fix.patch               |  165 --------------------
 .../pseudo/{pseudo_1.1.1.bb => pseudo_1.2.bb}      |    7 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    6 +-
 .../python/setup_py_skip_cross_import_check.patch  |   27 ++++
 meta/recipes-devtools/python/python_2.7.2.bb       |    5 +
 ...rchive_2.8.4.yocto.1.bb => libarchive_2.8.5.bb} |    8 +-
 meta/recipes-extended/libzypp/libzypp_git.bb       |    8 +-
 .../qt-apps/{qmmp_0.5.1.bb => qmmp_0.5.2.bb}       |   51 ++++---
 meta/recipes-support/gmp/gmp_5.0.2.bb              |    3 +-
 meta/recipes-support/libcap/libcap.inc             |   15 ++-
 meta/recipes-support/libcap/libcap_2.22.bb         |    2 +-
 21 files changed, 174 insertions(+), 269 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-corei7.inc
 create mode 100644 meta/conf/machine/include/tune-ivb.inc
 rename meta/recipes-connectivity/dhcp/{dhcp4.inc => dhcp.inc} (91%)
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp3.inc
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo/realpath_fix.patch
 rename meta/recipes-devtools/pseudo/{pseudo_1.1.1.bb => pseudo_1.2.bb} (48%)
 create mode 100644 meta/recipes-devtools/python/python/setup_py_skip_cross_import_check.patch
 rename meta/recipes-extended/libarchive/{libarchive_2.8.4.yocto.1.bb => libarchive_2.8.5.bb} (76%)
 rename meta/recipes-qt/qt-apps/{qmmp_0.5.1.bb => qmmp_0.5.2.bb} (48%)

-- 
1.7.6.4



