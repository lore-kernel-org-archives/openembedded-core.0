Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Q6pQU-00081X-B0
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 21:27:02 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Apr 2011 12:24:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,299,1299484800"; d="scan'208";a="413640427"
Received: from nbuild1.sc.intel.com (HELO localhost) ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 04 Apr 2011 12:24:40 -0700
Message-Id: <cover.1301921659.git.nitin.a.kamble@intel.com>
Old-Date: Mon, 4 Apr 2011 05:54:19 -0700
Date: Mon, 04 Apr 2011  5:56:20 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 0/3] ldconfig cache generation in cross way
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
X-List-Received-Date: Mon, 04 Apr 2011 19:27:02 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This brings few commits related to the yocto bug #780

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: nitin/bug780
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/bug780

Thanks,
    Nitin A Kamble <nitin.a.kamble@intel.com>
---


Nitin A Kamble (3):
  image.bbclass: make execution ldconfig verbose
  libxcb: fix for broken library link in the image
  ldconfig-native-2.12.1: newer recipe with eglibc sources

 meta/classes/image.bbclass                         |    3 +-
 .../ldconfig-native-2.12.1}/32and64bit.patch       |   94 +++--
 .../eglibc/ldconfig-native-2.12.1/README           |    8 +
 .../endian-ness_handling.patch                     |  451 ++++++++++++++++++++
 .../eglibc/ldconfig-native-2.12.1/flag_fix.patch   |   22 +
 .../ldconfig-native-2.12.1.tar.bz2                 |  Bin 0 -> 21491 bytes
 .../ldconfig-native-2.12.1}/ldconfig.patch         |  125 +++---
 .../ldconfig_aux-cache_path_fix.patch              |   34 ++
 meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb |   27 ++
 .../ldconfig-native-2.5.tar.bz2                    |  Bin 19454 -> 0 bytes
 meta/recipes-core/glibc/ldconfig-native_2.5.bb     |   24 -
 meta/recipes-graphics/xcb/libxcb.inc               |    4 +-
 meta/recipes-graphics/xcb/libxcb_1.1.91.bb         |    2 +-
 meta/recipes-graphics/xcb/libxcb_1.7.bb            |    2 +-
 meta/recipes-graphics/xcb/libxcb_git.bb            |    1 +
 15 files changed, 680 insertions(+), 117 deletions(-)
 rename meta/recipes-core/{glibc/ldconfig-native-2.5 => eglibc/ldconfig-native-2.12.1}/32and64bit.patch (78%)
 create mode 100644 meta/recipes-core/eglibc/ldconfig-native-2.12.1/README
 create mode 100644 meta/recipes-core/eglibc/ldconfig-native-2.12.1/endian-ness_handling.patch
 create mode 100644 meta/recipes-core/eglibc/ldconfig-native-2.12.1/flag_fix.patch
 create mode 100644 meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-native-2.12.1.tar.bz2
 rename meta/recipes-core/{glibc/ldconfig-native-2.5 => eglibc/ldconfig-native-2.12.1}/ldconfig.patch (84%)
 create mode 100644 meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig_aux-cache_path_fix.patch
 create mode 100644 meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
 delete mode 100644 meta/recipes-core/glibc/ldconfig-native-2.5/ldconfig-native-2.5.tar.bz2
 delete mode 100644 meta/recipes-core/glibc/ldconfig-native_2.5.bb

-- 
1.7.2.2



