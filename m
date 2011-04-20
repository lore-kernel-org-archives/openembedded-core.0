Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QCRwL-0008A7-Hn
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Apr 2011 09:35:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Apr 2011 00:32:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,245,1301900400"; d="scan'208";a="735912012"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by orsmga001.jf.intel.com with ESMTP; 20 Apr 2011 00:32:39 -0700
Message-Id: <cover.1303284287.git.dexuan.cui@intel.com>
Old-Date: Wed, 20 Apr 2011 15:24:47 +0800
Date: Wed, 20 Apr 2011 15:30:27 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 0/9] upgrades for libx11 libx, sdk-tools
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
X-List-Received-Date: Wed, 20 Apr 2011 07:35:10 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Most of the changes are about filename/chksum.

Also removed unnecessary patches from SRC_URI since the new versions have
integrated them.

Updated task-poky-tools.bb and task-sdk-gmae.inc to enable lttng-ust for
ARM since lttng-ust can build on ARM from 0.12 on.

Tested on qemux86 and qemuarm with building poky-image-sato-sdk and
meta-toolchain-gmae.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: dcui/master
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/master

Thanks,
    Dexuan Cui <dexuan.cui@intel.com>
---


Dexuan Cui (9):
  libxfixes: upgrade from 4.0.5 to the latest version 5.0
  util-macros: upgrade from 1.11.0 to 1.13.0
  preferred-xorg-versions.inc: update libxfixes, util-macros,
    xorg-cf-files
  mdadm: upgrade from 3.1.4 to the latest version 3.2.1
  liburcu: upgrade from 0.5.2 to 0.5.4
  lttng-ust: upgrade from 0.11 to the latest version 0.12
  task-poky-tools.bb, task-sdk-gmae.inc: enable lttng-ust for ARM
  lttng-viewer: upgrade from 0.12.36 to the latest version 0.12.38
  distro_tracking_fields.inc: update the info for the following recipes

 .../conf/distro/include/distro_tracking_fields.inc |   65 ++++++++--------
 .../distro/include/preferred-xorg-versions.inc     |    8 +-
 meta/recipes-core/tasks/task-poky-tools.bb         |    7 +-
 meta/recipes-extended/mdadm/files/fix-z-now.patch  |   15 ----
 .../mdadm/{mdadm_3.1.4.bb => mdadm_3.2.1.bb}       |    9 +-
 meta/recipes-gnome/tasks/task-poky-sdk-gmae.bb     |    2 +-
 .../tasks/task-poky-standalone-gmae-sdk-target.bb  |    2 +-
 meta/recipes-gnome/tasks/task-sdk-gmae.inc         |    1 +
 .../{libxfixes_4.0.5.bb => libxfixes_5.0.bb}       |    4 +-
 ...util-macros_1.11.0.bb => util-macros_1.13.0.bb} |    4 +-
 ...remove_ppc_specific_time_reading_function.patch |   85 --------------------
 meta/recipes-kernel/lttng/lttng-ust_0.11.bb        |   32 --------
 meta/recipes-kernel/lttng/lttng-ust_0.12.bb        |   28 +++++++
 ...g-viewer_0.12.36.bb => lttng-viewer_0.12.38.bb} |    6 +-
 .../liburcu/{liburcu_0.5.2.bb => liburcu_0.5.4.bb} |   11 +--
 15 files changed, 87 insertions(+), 192 deletions(-)
 delete mode 100644 meta/recipes-extended/mdadm/files/fix-z-now.patch
 rename meta/recipes-extended/mdadm/{mdadm_3.1.4.bb => mdadm_3.2.1.bb} (78%)
 rename meta/recipes-graphics/xorg-lib/{libxfixes_4.0.5.bb => libxfixes_5.0.bb} (79%)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.11.0.bb => util-macros_1.13.0.bb} (79%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust-0.11/remove_ppc_specific_time_reading_function.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust_0.11.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust_0.12.bb
 rename meta/recipes-kernel/lttng/{lttng-viewer_0.12.36.bb => lttng-viewer_0.12.38.bb} (85%)
 rename meta/recipes-support/liburcu/{liburcu_0.5.2.bb => liburcu_0.5.4.bb} (61%)

-- 
1.7.2



