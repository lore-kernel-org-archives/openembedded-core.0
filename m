Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6C8156F57A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 16:37:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Mar 2014 08:32:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,578,1389772800"; d="scan'208";a="465587406"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 03 Mar 2014 08:36:42 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Mar 2014 18:36:38 +0200
Message-Id: <cover.1393864497.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] image.py, rootfs.py, package_manager.py: redirect stderr to stdout when calling check_output()
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
X-List-Received-Date: Mon, 03 Mar 2014 16:37:03 -0000

The following changes since commit 54c2e993ec129563c7ae9f3fdee74ab60da28698:

  bsps: update H/W reference boards to v3.10.32 (2014-03-02 17:25:30 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b5902_errors_not_displayed
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b5902_errors_not_displayed

Laurentiu Palcu (1):
  image.py, rootfs.py, package_manager.py: redirect stderr to stdout
    when calling check_output()

 meta/lib/oe/image.py           |    2 +-
 meta/lib/oe/package_manager.py |   48 +++++++++++++++++++++-------------------
 meta/lib/oe/rootfs.py          |    2 +-
 3 files changed, 27 insertions(+), 25 deletions(-)

-- 
1.7.9.5


