Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 076C96204F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 15:16:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 17 Jan 2014 07:12:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,674,1384329600"; d="scan'208";a="460537456"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jan 2014 07:16:20 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2014 17:16:17 +0200
Message-Id: <cover.1389971728.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] adt_installer: do not install rootfs if target is not selected
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
X-List-Received-Date: Fri, 17 Jan 2014 15:16:22 -0000

The following changes since commit cfd1520b4b492ab27b2900ba3510abe6f288097e:

  oe-selftest: separated the SStateBase and SStateTests in different modules (2014-01-16 12:18:52 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b5727_adt_installer_fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b5727_adt_installer_fix

Laurentiu Palcu (1):
  adt_installer: do not install rootfs if target is not selected

 .../installer/adt-installer/adt_installer          |    4 ++--
 .../installer/adt-installer/adt_installer.conf     |   24 ++++++++++----------
 .../adt-installer/scripts/adt_installer_internal   |    2 +-
 3 files changed, 15 insertions(+), 15 deletions(-)

-- 
1.7.9.5


