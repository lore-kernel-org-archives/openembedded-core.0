Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DABC36DEDA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 16:25:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Mar 2014 09:19:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,743,1389772800"; d="scan'208";a="509052946"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 27 Mar 2014 09:19:17 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Mar 2014 18:18:52 +0200
Message-Id: <cover.1395933640.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] package_manager.py: delete RPM db locks after calling rpmresolve
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
X-List-Received-Date: Thu, 27 Mar 2014 16:25:38 -0000

The following changes since commit c4eeaa8e35e926b6d1f633549f76d1ba9ed9278b:

  bitbake: knotty: Show a link to the logfile for failed setscene tasks (2014-03-27 10:42:08 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b6049_do_rootfs_crash
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b6049_do_rootfs_crash

Laurentiu Palcu (1):
  package_manager.py: delete RPM db locks after calling rpmresolve

 meta/lib/oe/package_manager.py |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

-- 
1.7.9.5


