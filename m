Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 306B66AFC2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 15:03:38 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Aug 2013 08:03:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,846,1367996400"; d="scan'208";a="279913356"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.176])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Aug 2013 08:03:30 -0700
From: Saul Wold <sgw@linux.intel.com>
To: paul.eggleton@linux.intel.com, ross.burton@intel.com,
	richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2013 08:03:30 -0700
Message-Id: <cover.1376060231.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [CONSOLIDATED PULL 00/17] Review & ACK
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
X-List-Received-Date: Fri, 09 Aug 2013 15:03:38 -0000

Ross, Paul:

I build this set, along with the Python3 and Read-Only, which are removed
pending some more review, on the AB. While there were some failures due to
other updates, those were also removed.

Thanks
	Sau!

The following changes since commit 291ab168fac15eae0e4c9234e16f394b0e1547a0:

  subversion: Add patch to use neon 0.30 (2013-08-07 07:43:31 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Bian Naimeng (1):
  bash: reference acl*.m4 from ${S}

Chen Qi (2):
  busybox: remove syslog-startup.conf if sysvinit not in DISTRO_FEATURES
  checkroot.sh: respect the value of ENABLE_ROOTFS_FSCK

Cristian Iorga (3):
  net-tools: upgrade to v1.60-25
  gst-fluendo-mpegdemux: upgrade to v0.10.72
  build-appliance-image: upgrade to
    ac60aa8cf707eec58e2cb51e7c406250d0b43ef1 commit.

Cristiana Voicu (3):
  tzdata: upgrade to 2013d
  ed: upgrade to 1.9
  mkfontscale: upgrade to 1.1.1

Jukka Rissanen (1):
  procps: Add cgroup support

Kai Kang (1):
  sudo: quote BUILD_CC

Martin Jansa (2):
  buildhistory: use package_qa_handle_error for version-going-backwards
  buildhistory: use bb.utils.mkdirhier instead of os.makedirs

Otavio Salvador (1):
  blacklist.bbclass: Avoid blacklist specific handle in base.bbclass

Riku Voipio (1):
  qemu: pass CFLAGS via ./configure instead of a patch

Ross Burton (1):
  separatebuilddir: add comments

Victor Kamensky (1):
  systemtap: fix build failure on host system with dyninst installed

 meta/classes/base.bbclass                          | 10 ---
 meta/classes/blacklist.bbclass                     | 25 ++++++++
 meta/classes/buildhistory.bbclass                  | 24 +++----
 meta/classes/insane.bbclass                        |  1 +
 meta/conf/distro/include/seperatebuilddir.inc      |  4 ++
 meta/recipes-core/busybox/busybox.inc              | 13 ++--
 .../images/build-appliance-image_8.0.bb            |  2 +-
 .../initscripts/initscripts-1.0/checkroot.sh       |  2 +-
 .../qemu/files/fix-configure-checks.patch          | 22 -------
 meta/recipes-devtools/qemu/qemu.inc                |  4 +-
 meta/recipes-extended/bash/bash.inc                |  4 +-
 meta/recipes-extended/ed/{ed_1.8.bb => ed_1.9.bb}  |  7 +-
 .../net-tools-config.h                             |  0
 .../net-tools-config.make                          |  0
 ...net-tools_1.60-24.2.bb => net-tools_1.60-25.bb} |  5 +-
 .../procps-3.2.8/procps-3.2.8-ps-cgroup.patch      | 74 ++++++++++++++++++++++
 meta/recipes-extended/procps/procps_3.2.8.bb       |  1 +
 meta/recipes-extended/sudo/sudo.inc                |  2 +-
 .../recipes-extended/tzcode/tzcode-native_2013d.bb |  6 +-
 .../tzdata/{tzdata_2013b.bb => tzdata_2013d.bb}    |  4 +-
 .../{mkfontscale_1.1.0.bb => mkfontscale_1.1.1.bb} |  6 +-
 meta/recipes-kernel/systemtap/systemtap_git.bb     |  2 +-
 ...0.10.71.bb => gst-fluendo-mpegdemux_0.10.72.bb} |  6 +-
 23 files changed, 146 insertions(+), 78 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/files/fix-configure-checks.patch
 rename meta/recipes-extended/ed/{ed_1.8.bb => ed_1.9.bb} (68%)
 rename meta/recipes-extended/net-tools/{net-tools-1.60-24.2 => net-tools}/net-tools-config.h (100%)
 rename meta/recipes-extended/net-tools/{net-tools-1.60-24.2 => net-tools}/net-tools-config.make (100%)
 rename meta/recipes-extended/net-tools/{net-tools_1.60-24.2.bb => net-tools_1.60-25.bb} (94%)
 create mode 100644 meta/recipes-extended/procps/procps-3.2.8/procps-3.2.8-ps-cgroup.patch
 rename meta/recipes-extended/tzdata/{tzdata_2013b.bb => tzdata_2013d.bb} (98%)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.1.0.bb => mkfontscale_1.1.1.bb} (78%)
 rename meta/recipes-multimedia/gstreamer/{gst-fluendo-mpegdemux_0.10.71.bb => gst-fluendo-mpegdemux_0.10.72.bb} (70%)

-- 
1.8.1.4


