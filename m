Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 75D1760F1A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 15:04:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Sep 2013 08:05:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,847,1371106800"; d="scan'208";a="398739984"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 05 Sep 2013 08:04:59 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2013 18:04:02 +0300
Message-Id: <cover.1378393096.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 0/1] run-postinsts: move script execution from S98 to S99 in rcS.d
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
X-List-Received-Date: Thu, 05 Sep 2013 15:04:59 -0000

The following changes since commit f41b7a7d4d0463a0dfafe6621d01680b81798019:

  bitbake: hob: remove PACKAGE_INSTALL variable setting from hob (2013-09-04 14:18:49 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b4484_postinstalls_dont_run_for_ipk
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b4484_postinstalls_dont_run_for_ipk

Laurentiu Palcu (1):
  run-postinsts: move script execution from S98 to S99 in rcS.d

 .../run-postinsts/run-postinsts_1.0.bb             |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5


