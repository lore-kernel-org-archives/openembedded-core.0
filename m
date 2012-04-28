Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SO2yB-0005LH-70
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Apr 2012 10:25:31 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Apr 2012 01:15:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="159322185"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by fmsmga002.fm.intel.com with ESMTP; 28 Apr 2012 01:15:50 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Apr 2012 16:12:24 +0800
Message-Id: <cover.1335600691.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/8][PULL] Recipe upgrades for ofono, iptables, etc.
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
X-List-Received-Date: Sat, 28 Apr 2012 08:25:31 -0000

Hi Saul,

This pull request upgrades some recipes.

Please help to review and pull.

Thanks,
Dongxiao

The following changes since commit 5a1f172d35be610688842a8a9a84f24edb9aeb51:

  bitbake.conf: use TUNE_PKGARCH instead of TARGET_ARCH in SDK_NAME (2012-04-26 10:59:20 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/upgrade
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/upgrade

Dongxiao Xu (8):
  gst-fluendo-mpegdemux: upgrade to version 0.10.70
  telepathy-mission-control: upgrade to version 5.12.0
  telepathy-glib: upgrade to version 0.18.1
  bluez-hcidump: upgrade to version 2.4
  iproute2: upgrade to version 3.3.0
  ofono: upgrade to version 1.6
  iptables: upgrade to version 1.4.13
  distro_tracking_fields: Change for ofono, iptables, etc

 .../conf/distro/include/distro_tracking_fields.inc |   46 ++++++++++----------
 .../{bluez-hcidump_2.3.bb => bluez-hcidump_2.4.bb} |    4 +-
 .../configure-cross.patch                          |    0
 .../{iproute2_3.2.0.bb => iproute2_3.3.0.bb}       |    2 +-
 .../ofono/{ofono_1.5.bb => ofono_1.6.bb}           |    2 +-
 ...thy-glib_0.17.5.bb => telepathy-glib_0.18.1.bb} |    4 +-
 ...11.0.bb => telepathy-mission-control_5.12.0.bb} |    6 +-
 .../iptables/iptables/GNUmakefile.patch            |   18 --------
 .../{iptables_1.4.12.2.bb => iptables_1.4.13.bb}   |    5 +-
 ...0.10.69.bb => gst-fluendo-mpegdemux_0.10.70.bb} |    4 +-
 10 files changed, 36 insertions(+), 55 deletions(-)
 rename meta/recipes-connectivity/bluez/{bluez-hcidump_2.3.bb => bluez-hcidump_2.4.bb} (83%)
 rename meta/recipes-connectivity/iproute2/{iproute2-3.2.0 => iproute2-3.3.0}/configure-cross.patch (100%)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.2.0.bb => iproute2_3.3.0.bb} (97%)
 rename meta/recipes-connectivity/ofono/{ofono_1.5.bb => ofono_1.6.bb} (97%)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.17.5.bb => telepathy-glib_0.18.1.bb} (82%)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.11.0.bb => telepathy-mission-control_5.12.0.bb} (91%)
 delete mode 100644 meta/recipes-extended/iptables/iptables/GNUmakefile.patch
 rename meta/recipes-extended/iptables/{iptables_1.4.12.2.bb => iptables_1.4.13.bb} (89%)
 rename meta/recipes-multimedia/gstreamer/{gst-fluendo-mpegdemux_0.10.69.bb => gst-fluendo-mpegdemux_0.10.70.bb} (71%)

-- 
1.7.4.1



