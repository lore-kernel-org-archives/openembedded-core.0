Return-Path: <laurentiu.palcu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id A5EDA61613
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 07:31:28 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Sep 2013 00:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,845,1371106800"; d="scan'208";a="291065109"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Sep 2013 00:31:13 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2013 10:31:09 +0300
Message-Id: <cover.1378366233.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] image.bbclass: leave metadata in place if a PM is installed in the image
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
X-List-Received-Date: Thu, 05 Sep 2013 07:31:28 -0000

The following changes since commit f41b7a7d4d0463a0dfafe6621d01680b81798019:

  bitbake: hob: remove PACKAGE_INSTALL variable setting from hob (2013-09-04 14:18:49 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b4484_postinstalls_dont_run_for_ipk
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b4484_postinstalls_dont_run_for_ipk

Laurentiu Palcu (1):
  image.bbclass: leave metadata in place if a PM is installed in the
    image

 meta/classes/image.bbclass |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
1.7.9.5


