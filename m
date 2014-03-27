Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C02E16E716
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 12:44:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Mar 2014 05:44:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,742,1389772800"; d="scan'208";a="508170127"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga002.fm.intel.com with ESMTP; 27 Mar 2014 05:44:01 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Mar 2014 14:43:56 +0200
Message-Id: <cover.1395924018.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] Fix run-postinsts
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
X-List-Received-Date: Thu, 27 Mar 2014 12:44:22 -0000

The following changes since commit 0150bc30d3674301631c2e9b6c64e01058fd1070:

  bitbake: runqueue: Really fix sigchld handling (2014-03-18 23:05:53 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b5666_unique_run_postinsts
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b5666_unique_run_postinsts

Laurentiu Palcu (1):
  run-postinsts: fix issue with checking IMAGE_FEATURES

 .../run-postinsts/run-postinsts/run-postinsts      |   30 +++++++++++++++-----
 .../run-postinsts/run-postinsts_1.0.bb             |    2 --
 2 files changed, 23 insertions(+), 9 deletions(-)

-- 
1.7.9.5


