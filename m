Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TDuCP-0003Nd-Lf
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 11:34:33 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Sep 2012 02:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,441,1344236400"; d="scan'208";a="223464660"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 18 Sep 2012 02:21:51 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2012 12:21:42 +0300
Message-Id: <cover.1347959838.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/4] SDK and adt_installer fixes
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
X-List-Received-Date: Tue, 18 Sep 2012 09:34:33 -0000

Hi,

This patchset contains some SDK/adt-installer fixes.

Thanks,
Laurentiu

The following changes since commit 913944d904266bf90af0cad94b4f0fb3652bd29d:

  upstream_tracking: update lsb and ltp (2012-09-14 17:12:52 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/adt_sdk_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/adt_sdk_fixes

Laurentiu Palcu (4):
  adt-installer: fix package installation issue
  SDK: fix installation into symlinked directories
  adt-installer: ensure directory exists before copying/removing
  SDK: remove references to Poky distro from tarball installer

 meta/classes/populate_sdk_base.bbclass             |   12 +++--
 .../installer/adt-installer/adt_installer          |    6 ++-
 .../adt-installer/scripts/adt_installer_internal   |   56 ++++++++++----------
 3 files changed, 42 insertions(+), 32 deletions(-)

-- 
1.7.9.5



