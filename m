Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 360BC60FE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 15:40:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 25 Sep 2013 08:37:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,978,1371106800"; d="scan'208";a="409209620"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 25 Sep 2013 08:40:31 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Sep 2013 18:40:27 +0300
Message-Id: <cover.1380123317.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] ADT installer fixes
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
X-List-Received-Date: Wed, 25 Sep 2013 15:40:35 -0000

The following changes since commit 4d8ab87d25ea6e59dc88375813ef88ee0ac813d0:

  build-appliance: Update SRCREV (2013-09-24 18:09:12 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b5231_b5259_adt_installer_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b5231_b5259_adt_installer_fixes

Laurentiu Palcu (2):
  adt-installer: check if sudo is needed when installing target sysroot
  adt-installer: add warning if MACHINE is not set in
    adt-installer.conf

 .../installer/adt-installer/adt_installer          |   14 ++++-
 .../installer/adt-installer/adt_installer.conf     |   10 ++--
 .../adt-installer/scripts/adt_installer_internal   |   55 ++++++++++++--------
 3 files changed, 51 insertions(+), 28 deletions(-)

-- 
1.7.9.5


