Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RgYKd-0007zx-Uw
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 10:00:56 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Dec 2011 00:53:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="51820955"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Dec 2011 00:53:38 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Dec 2011 16:53:34 +0800
Message-Id: <cover.1325234092.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/6] upgrading from Dexuan: Dec 30, 2011
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
X-List-Received-Date: Fri, 30 Dec 2011 09:00:56 -0000

The following changes since commit 9fc755cdb528f0913baf1f2d86ef62ee4cae92f2:

  Add Upstream-Status to patches (2011-12-29 13:58:12 -0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/stage/master_under_test
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/stage/master_under_test

Dexuan Cui (6):
  mdadm: upgrade to the latest version 3.2.3
  liburcu: upgrade from 0.6.4 to the latest 0.6.7
  lttng-ust: upgrade from 0.15 to the latest 0.16
  libpciaccess: upgrade from 0.12.1 to 0.12.902
  util-macros: upgrade from 1.15.0 to the latest 1.16.0
  distro_tracking_fields.inc: update the info

 .../conf/distro/include/distro_tracking_fields.inc |  107 +++++++++++---------
 .../0001-mdadm-fix-build-failures-ppc64.patch      |   52 ----------
 .../mdadm/{mdadm_3.2.2.bb => mdadm_3.2.3.bb}       |   13 +--
 .../fix_deletion_of_last_handle.patch              |   51 +++++++++
 ...ciaccess_0.12.1.bb => libpciaccess_0.12.902.bb} |    8 +-
 ...util-macros_1.15.0.bb => util-macros_1.16.0.bb} |    4 +-
 meta/recipes-kernel/lttng/fix-powerpc64.patch      |   17 ---
 .../lttng/{lttng-ust_0.15.bb => lttng-ust_0.16.bb} |    9 +-
 .../liburcu/{liburcu_0.6.4.bb => liburcu_0.6.7.bb} |    6 +-
 9 files changed, 128 insertions(+), 139 deletions(-)
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-fix-build-failures-ppc64.patch
 rename meta/recipes-extended/mdadm/{mdadm_3.2.2.bb => mdadm_3.2.3.bb} (65%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess-0.12.902/fix_deletion_of_last_handle.patch
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.12.1.bb => libpciaccess_0.12.902.bb} (50%)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.15.0.bb => util-macros_1.16.0.bb} (75%)
 delete mode 100644 meta/recipes-kernel/lttng/fix-powerpc64.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_0.15.bb => lttng-ust_0.16.bb} (79%)
 rename meta/recipes-support/liburcu/{liburcu_0.6.4.bb => liburcu_0.6.7.bb} (80%)

-- 
1.7.6



