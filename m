Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1R4YA5-0001Lb-4l
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 15:08:57 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Sep 2011 06:03:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,393,1312182000"; d="scan'208";a="52283362"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by fmsmga001.fm.intel.com with ESMTP; 16 Sep 2011 06:03:30 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2011 21:01:50 +0800
Message-Id: <cover.1316177782.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/3] Added multilib support for DEBIAN_NAME
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
X-List-Received-Date: Fri, 16 Sep 2011 13:08:57 -0000

This series of patches is meant to fix bug [YOCTO #1486].

It added multilib support in package_name_hook() so MLPREFIX is kept in the 
package name after the debian package renaming. 

It changed the logic of multilib_sanity_check() that all the equal duplicated files 
from different multilib variants are allowed to be installed into the same rootfs.

It also fixed several recipes to support the multilib in debian package renaming.

The following changes since commit bb4dad44432b2e40ac3cf16baa45befbae3e70f5:
  Darren Hart (1):
        Prevent IMAGE_FEATURES from contaminating initrd

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/bug1486
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug1486

Lianhao Lu (3):
  debian/_ipk.bbclass: Added multilib support for package_name_hook()
  Misc: Added MLPREFIX to final pkg names in case of DEBIAN_NAMES.
  image/package.bbclass: Revise multilib support for DEBIAN_NAME.

 meta/classes/debian.bbclass                    |    4 ++++
 meta/classes/image.bbclass                     |   17 +++++------------
 meta/classes/package.bbclass                   |    2 +-
 meta/classes/package_ipk.bbclass               |    1 +
 meta/classes/rootfs_ipk.bbclass                |    2 +-
 meta/recipes-core/libxml/libxml2.inc           |    2 +-
 meta/recipes-core/libxml/libxml2_2.7.8.bb      |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.12.7.bb         |    4 ++--
 meta/recipes-gnome/gtk+/gtk+_2.16.6.bb         |    4 ++--
 meta/recipes-gnome/gtk+/gtk+_2.22.1.bb         |    4 ++--
 meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb |    4 ++--
 11 files changed, 22 insertions(+), 24 deletions(-)



