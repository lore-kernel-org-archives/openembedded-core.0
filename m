Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id C76326AE18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 13:40:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 23 Aug 2013 06:40:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="385466281"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2013 06:40:31 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 16:42:15 +0300
Message-Id: <cover.1377264698.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH v3 0/4] YB2370: Build Appliance integrates a filemanager
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
X-List-Received-Date: Fri, 23 Aug 2013 13:40:49 -0000

A filemanager has been integrated into BA in order to
manage file and folders resulted from distro building.

V3 patch set corrects the following mistakes:
* add the correct component names in commit messages;
* add sato theme, but also keep hicolor-icon-theme;
  hicolor-icon-theme provides the skeleton structure for icons;
* fix the wrong user in recipes-graphics/builder shell script,
  (regression introduced in a previous commit: 851163a7c672b5fb051fc0e7938ebd585bb33bf0);

The following changes since commit 199b1a8c7d7109d9b59d67bf4dcfeb03be07587a:

  mkfontscale: This no longer needs a full libx11, xproto suffices (2013-08-22 18:30:06 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB2370
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB2370

Cristian Iorga (4):
  xdg-utils: add runtime dependency on xprop
  packagegroup-self-hosted: pcmanfm and xdg-utils integration
  packagegroup-self-hosted: changing the icon theme to sato
  recipes-graphics/builder: fix wrong user name

 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 4 ++++
 meta/recipes-extended/xdg-utils/xdg-utils_1.1.0-rc1.bb      | 1 +
 meta/recipes-graphics/builder/files/builder_hob_start.sh    | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

-- 
1.8.1.2


