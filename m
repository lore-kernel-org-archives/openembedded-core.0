Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TEhJU-0004Kn-Rm
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 16:01:09 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Sep 2012 06:48:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,453,1344236400"; d="scan'208";a="208702950"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 20 Sep 2012 06:48:08 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2012 16:47:57 +0300
Message-Id: <cover.1348148406.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2 0/6] SDK and adt_installer fixes
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
X-List-Received-Date: Thu, 20 Sep 2012 14:01:09 -0000

Changes in v2:
Since the previous patchset was not merged I took the liberty of adding
another 2 fixes and send another patchset so that they're merged in the
right order.

Changes in v1:

Hi,

This patchset contains some SDK/adt-installer fixes.

Thanks,
Laurentiu

The following changes since commit 913944d904266bf90af0cad94b4f0fb3652bd29d:

  upstream_tracking: update lsb and ltp (2012-09-14 17:12:52 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/adt_sdk_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/adt_sdk_fixes

Laurentiu Palcu (6):
  adt-installer: fix package installation issue
  SDK: fix installation into symlinked directories
  adt-installer: ensure directory exists before copying/removing
  SDK: remove references to Poky distro from tarball installer
  SDK: relocate symlinks too
  SDK: allow toolchain installation from another directory

 meta/classes/populate_sdk_base.bbclass             |   21 +++++--
 .../installer/adt-installer/adt_installer          |    6 +-
 .../adt-installer/scripts/adt_installer_internal   |   61 +++++++++++---------
 3 files changed, 54 insertions(+), 34 deletions(-)

-- 
1.7.9.5



