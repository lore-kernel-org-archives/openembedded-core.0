Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5CA2D6B7B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 16:04:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Aug 2013 09:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,921,1367996400"; d="scan'208";a="389202964"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2013 09:03:52 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2013 19:05:33 +0300
Message-Id: <cover.1377014441.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/3] YB2370: Build Appliance integrates PCManFM filemanager
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
X-List-Received-Date: Tue, 20 Aug 2013 16:04:34 -0000

PCManFM filemanager is integrated into Build Appliance;
PCManFM is used to display build results from Hob interface.

The following changes since commit fe227a023e30f6651618423ab527cde21a350d1a:

  genext2fs: fix memory corruption on powerpc (2013-08-20 15:31:26 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB2370
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB2370

Cristian Iorga (3):
  Build Appliance: pcmanfm integration
  build-appliance-image: changing the icon theme to sato
  builder: register directories with pcmanfm

 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 6 +++++-
 meta/recipes-graphics/builder/builder_0.1.bb                | 2 +-
 meta/recipes-graphics/builder/files/builder_hob_start.sh    | 9 +++++++++
 3 files changed, 15 insertions(+), 2 deletions(-)

-- 
1.8.1.2


