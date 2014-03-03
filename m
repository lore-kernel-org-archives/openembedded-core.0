Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6F86D6F564
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 09:44:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Mar 2014 01:44:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,576,1389772800"; d="scan'208";a="484729172"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 03 Mar 2014 01:43:33 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Mar 2014 11:43:29 +0200
Message-Id: <cover.1393839480.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] fix package archs ordering for RPM
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
X-List-Received-Date: Mon, 03 Mar 2014 09:44:42 -0000

This got messed up by me trying to fix a multilib problem using python sets.
Unfortunately sets do not keep the initial ordering and an image might end
up containing packages meant for other architectures... So, revert the offending
commit and fix the original issue by just checking if a channel was already added
or not.

laurentiu

The following changes since commit 8f36e1ef1afd10594391596391564e8904a840f2:

  poky.conf: add CentOS 6.5 to SANITY_TESTED_DISTROS (2014-02-28 18:05:47 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b5890_rpm_pkg_arch_selection_logic_fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b5890_rpm_pkg_arch_selection_logic_fix

Laurentiu Palcu (2):
  Revert "lib/oe/package_manager.py: RpmPM: fix issue with multilib
    builds"
  package_manager.py: RpmPM: don't add smart channel if already added

 meta/lib/oe/package_manager.py |   19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

-- 
1.7.9.5


