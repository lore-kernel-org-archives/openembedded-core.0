Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UGCdY-0003Yc-VU
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 19:12:25 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Mar 2013 10:55:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,845,1355126400"; d="scan'208";a="214773764"
Received: from unknown (HELO dell-desktop.rb.intel.com) ([10.237.105.59])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Mar 2013 10:55:23 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2013 19:54:59 +0200
Message-Id: <cover.1363283478.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 00/17] Package Upgrades
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Mar 2013 18:12:26 -0000

The following changes since commit 365eb9b5d22208c967dcd91d8ab52faed20f04b5:

  bitbake: bitbake-layers: fix duplicated help info (2013-03-10 04:36:52 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rmoisan/branch-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/branch-updates

Radu Moisan (17):
  rxvt-unicode: Upgrade to v9.17
  iputils: Upgrade to v20121221
  gawk: Upgrade to v4.0.2
  tzdata: Upgrade to v2013a
  ed: Upgrade to v1.7
  u-boo-fw-utils: Upgrade to v2013.01.01
  u-boot-mkimage: Upgrade to v2013.01.01
  u-boot: Upgrade to v2013.01.01
  atk: Upgrade to v 2.7.91
  hdparm: Upgrade to v9.43
  cronie: Upgrade to v1.4.9
  systemtap: Upgrade to v2.1
  liburcu: Upgrade to v0.7.6
  babeltrace: Upgrade to v1.0.3
  apr-util: Upgrade to v1.5.1
  watchdog: Upgrade to v5.13
  mobile-broadband-provider-info: Upgrade to v20120614

 ...2012.04.01.bb => u-boot-fw-utils_2013.01.01.bb} |    6 +-
 ..._2012.04.01.bb => u-boot-mkimage_2013.01.01.bb} |    6 +-
 .../{u-boot_2012.04.01.bb => u-boot_2013.01.01.bb} |    8 +--
 .../mobile-broadband-provider-info_git.bb          |    4 +-
 .../cronie/{cronie_1.4.8.bb => cronie_1.4.9.bb}    |    6 +-
 .../ed/{ed-1.6 => ed-1.7}/ed-1.2-build.patch       |    0
 meta/recipes-extended/ed/{ed_1.6.bb => ed_1.7.bb}  |    4 +-
 .../gawk/{gawk_4.0.1.bb => gawk_4.0.2.bb}          |    6 +-
 .../hdparm/{hdparm_9.39.bb => hdparm_9.43.bb}      |    6 +-
 .../files/debian/add-icmp-return-codes.diff        |   43 ------------
 .../iputils/files/debian/fix-arping-timeouts.diff  |   26 -------
 .../files/debian/fix-dead-host-ping-stats.diff     |   16 -----
 .../iputils/files/debian/targets.diff              |   14 ++--
 .../iputils/files/debian/use_gethostbyname2.diff   |   36 +++++-----
 .../{iputils_s20101006.bb => iputils_s20121221.bb} |   14 ++--
 .../tzdata/{tzdata_2012j.bb => tzdata_2013a.bb}    |    6 +-
 .../watchdog/files/fix-ping-failure.patch          |   74 --------------------
 .../{watchdog_5.12.bb => watchdog_5.13.bb}         |    6 +-
 .../{babeltrace_1.0.0.bb => babeltrace_1.0.3.bb}   |    2 +-
 .../systemtap/obsolete_automake_macros.patch       |   22 ++----
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    4 +-
 .../rxvt.desktop                                   |    0
 .../rxvt.png                                       |  Bin 2847 -> 2847 bytes
 .../xwc.patch                                      |    0
 .../{rxvt-unicode_9.15.bb => rxvt-unicode_9.17.bb} |    6 +-
 .../apr/{apr-util_1.4.1.bb => apr-util_1.5.1.bb}   |    6 +-
 .../atk/{atk_2.6.0.bb => atk_2.7.91.bb}            |    8 ++-
 .../atk/files/remove-gnome-comile-warnings.patch   |   17 +++++
 .../liburcu/{liburcu_0.7.4.bb => liburcu_0.7.6.bb} |    6 +-
 29 files changed, 98 insertions(+), 254 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2012.04.01.bb => u-boot-fw-utils_2013.01.01.bb} (84%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2012.04.01.bb => u-boot-mkimage_2013.01.01.bb} (84%)
 rename meta/recipes-bsp/u-boot/{u-boot_2012.04.01.bb => u-boot_2013.01.01.bb} (82%)
 rename meta/recipes-extended/cronie/{cronie_1.4.8.bb => cronie_1.4.9.bb} (94%)
 rename meta/recipes-extended/ed/{ed-1.6 => ed-1.7}/ed-1.2-build.patch (100%)
 rename meta/recipes-extended/ed/{ed_1.6.bb => ed_1.7.bb} (81%)
 rename meta/recipes-extended/gawk/{gawk_4.0.1.bb => gawk_4.0.2.bb} (86%)
 rename meta/recipes-extended/hdparm/{hdparm_9.39.bb => hdparm_9.43.bb} (87%)
 delete mode 100644 meta/recipes-extended/iputils/files/debian/add-icmp-return-codes.diff
 delete mode 100644 meta/recipes-extended/iputils/files/debian/fix-arping-timeouts.diff
 delete mode 100644 meta/recipes-extended/iputils/files/debian/fix-dead-host-ping-stats.diff
 rename meta/recipes-extended/iputils/{iputils_s20101006.bb => iputils_s20121221.bb} (80%)
 rename meta/recipes-extended/tzdata/{tzdata_2012j.bb => tzdata_2013a.bb} (98%)
 delete mode 100644 meta/recipes-extended/watchdog/files/fix-ping-failure.patch
 rename meta/recipes-extended/watchdog/{watchdog_5.12.bb => watchdog_5.13.bb} (79%)
 rename meta/recipes-kernel/lttng/{babeltrace_1.0.0.bb => babeltrace_1.0.3.bb} (94%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.15 => rxvt-unicode-9.17}/rxvt.desktop (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.15 => rxvt-unicode-9.17}/rxvt.png (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.15 => rxvt-unicode-9.17}/xwc.patch (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.15.bb => rxvt-unicode_9.17.bb} (93%)
 rename meta/recipes-support/apr/{apr-util_1.4.1.bb => apr-util_1.5.1.bb} (91%)
 rename meta/recipes-support/atk/{atk_2.6.0.bb => atk_2.7.91.bb} (68%)
 create mode 100644 meta/recipes-support/atk/files/remove-gnome-comile-warnings.patch
 rename meta/recipes-support/liburcu/{liburcu_0.7.4.bb => liburcu_0.7.6.bb} (77%)

-- 
1.7.9.5



