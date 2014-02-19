Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D7F6C6F137
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 10:51:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 19 Feb 2014 02:47:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,504,1389772800"; d="scan'208";a="477586658"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2014 02:51:19 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 12:51:14 +0200
Message-Id: <cover.1392806896.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/3] Fix buildhistory problem
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
X-List-Received-Date: Wed, 19 Feb 2014 10:51:18 -0000

Tested with all backends. Fixed some other issues in the process...
Buildhistory should be fine now.

laurentiu

The following changes since commit 54562006c1327c5b99daa4cc05a3ba7e38412da1:

  image_types.bbclass: Fix tar IMAGE_CMD to not change directories (2014-02-18 08:38:52 +0000)

are available in the git repository at:

  git://mirror.rb.intel.com/git.yoctoproject.org/poky-contrib lpalcu/buildhistory_fix

for you to fetch changes up to 15ce4b01408e1ec91655103191c4c9436d894597:

  populate_sdk_*.bbclass: remove left over bash routines (2014-02-19 12:45:51 +0200)

----------------------------------------------------------------
Laurentiu Palcu (3):
      package_manager.py: fix installed package list creation for Opkg/Dpkg
      buildhistory.bbclass: fix creation of installed packages list
      populate_sdk_*.bbclass: remove left over bash routines

 meta/classes/buildhistory.bbclass     |   21 +++++++++++++++++----
 meta/classes/populate_sdk_deb.bbclass |   21 ---------------------
 meta/classes/populate_sdk_ipk.bbclass |   20 --------------------
 meta/lib/oe/package_manager.py        |    6 ++++--
 4 files changed, 21 insertions(+), 47 deletions(-)

Laurentiu Palcu (3):
  package_manager.py: fix installed package list creation for Opkg/Dpkg
  buildhistory.bbclass: fix creation of installed packages list
  populate_sdk_*.bbclass: remove left over bash routines

 meta/classes/buildhistory.bbclass     |   21 +++++++++++++++++----
 meta/classes/populate_sdk_deb.bbclass |   21 ---------------------
 meta/classes/populate_sdk_ipk.bbclass |   20 --------------------
 meta/lib/oe/package_manager.py        |    6 ++++--
 4 files changed, 21 insertions(+), 47 deletions(-)

-- 
1.7.9.5


