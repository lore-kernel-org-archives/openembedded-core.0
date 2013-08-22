Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 15F8960842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 17:21:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2013 10:21:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,935,1367996400"; d="scan'208";a="385034890"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2013 10:21:25 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 20:23:05 +0300
Message-Id: <cover.1377191890.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH v2 0/4] YB2370: Build Appliance integrates a filemanager
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
X-List-Received-Date: Thu, 22 Aug 2013 17:21:25 -0000

PCManFM filemanager is integrated in Build Appliance;
It will handle folders and files navigation from within Hob.

The following changes since commit 02521a40d36d06d269ec14ce9000f2941d6980af:

  busybox.inc: Avoid error when SYSLOG is not enabled (2013-08-22 15:11:13 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB2370
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB2370

Cristian Iorga (4):
  xdg-utils: add runtime dependency on xprop
  Build Appliance: pcmanfm integration
  build-appliance-image: changing the icon theme to sato
  builder: register directories with pcmanfm

 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 5 ++++-
 meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb      | 1 +
 meta/recipes-graphics/builder/files/builder_hob_start.sh    | 9 +++++++++
 3 files changed, 14 insertions(+), 1 deletion(-)

-- 
1.8.1.2


