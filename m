Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5CCB9601A0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 07:18:02 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by fmsmga103.fm.intel.com with ESMTP; 16 Sep 2014 00:09:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,533,1406617200"; d="scan'208";a="477796936"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by azsmga001.ch.intel.com with ESMTP; 16 Sep 2014 00:18:02 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Sep 2014 10:17:59 +0300
Message-Id: <cover.1410851846.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] Build Appliance: Fix VM disk image location
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
X-List-Received-Date: Tue, 16 Sep 2014 07:18:09 -0000

The following changes since commit fceef0cace6670a8c5f15cd2f31a191176732730:

  bitbake: data_smart: Fix remove operator and its interaction with data expansion (2014-09-13 08:52:49 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB6728
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB6728

Cristian Iorga (1):
  build-appliance-image: remove hardwired path

 .../recipes-core/images/build-appliance-image/Yocto_Build_Appliance.vmx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


