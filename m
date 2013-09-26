Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 89DD06B991
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 07:13:35 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Sep 2013 00:13:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,983,1371106800"; d="scan'208";a="365760158"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by azsmga001.ch.intel.com with ESMTP; 26 Sep 2013 00:13:36 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2013 10:15:34 +0300
Message-Id: <cover.1380179531.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/2] Build Appliance: Open build logs in text editor
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
X-List-Received-Date: Thu, 26 Sep 2013 07:13:36 -0000

Opening build logs works in Hob under Build Appliance.
leafpad text editor is integrated in Build Appliance.

The following changes since commit 4d8ab87d25ea6e59dc88375813ef88ee0ac813d0:

  build-appliance: Update SRCREV (2013-09-24 18:09:12 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB4727
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB4727

Cristian Iorga (2):
  packagegroup-self-hosted: add leafpad text editor
  builder: register text files with leafpad

 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 1 +
 meta/recipes-graphics/builder/files/builder_hob_start.sh    | 3 +++
 2 files changed, 4 insertions(+)

-- 
1.8.1.2


