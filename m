Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8B6F16AFBE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 12:53:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Jul 2013 05:53:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,995,1363158000"; d="scan'208";a="340465022"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 04 Jul 2013 05:53:58 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2013 15:53:54 +0300
Message-Id: <cover.1372942368.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] populate_sdk_base: fix bashism
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
X-List-Received-Date: Thu, 04 Jul 2013 12:53:59 -0000

The following changes since commit 8a186a6b3853fc1a7dcf342d421c8926c38949c9:

  bitbake: hob: save button from settings called a nonexisting method (2013-07-03 08:13:35 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b4811_printf_issue_in_sh
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b4811_printf_issue_in_sh

Laurentiu Palcu (1):
  populate_sdk_base: fix bashism

 meta/classes/populate_sdk_base.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5


