Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EA1266D092
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 09:25:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 05 Nov 2013 01:21:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,638,1378882800"; d="scan'208";a="422417457"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2013 01:25:19 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2013 11:25:10 +0200
Message-Id: <cover.1383643350.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/7] Package upgrades
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
X-List-Received-Date: Tue, 05 Nov 2013 09:25:26 -0000

All packages were compiled for all major architectures, individually, and also
build tested on AB. Basic sanity tests were done using a core-image-sato for
qemux86. No issues spotted.

Laurentiu

The following changes since commit 9160f376065752e2e92c8b37ee9a80d0eb86b53b:

  bitbake: toaster: enable required classes in the toaster startup script (2013-11-04 09:36:22 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/upgrades

Laurentiu Palcu (7):
  python-setuptools: upgrade to 1.1.7
  xf86-input-keyboard: upgrade to 1.8.0
  xtrans: upgrade to 1.3.0
  git: upgrade to 1.8.4.2
  xz: upgrade to 5.1.3alpha
  diffstat: upgrade to 1.58
  python-pycurl: upgrade to 7.19.0.2

 .../diffstat/diffstat/aclocal.patch                |   11 +++++----
 .../{diffstat_1.57.bb => diffstat_1.58.bb}         |    4 ++--
 .../git/{git_1.8.3.4.bb => git_1.8.4.2.bb}         |    4 ++--
 .../python/python-pycurl/no-static-link.patch      |   25 ++++++++++----------
 ...-pycurl_7.19.0.bb => python-pycurl_7.19.0.2.bb} |    7 +++---
 ...uptools_1.1.6.bb => python-setuptools_1.1.7.bb} |    4 ++--
 .../xz/{xz_5.1.2alpha.bb => xz_5.1.3alpha.bb}      |    4 ++--
 ...board_1.7.0.bb => xf86-input-keyboard_1.8.0.bb} |    4 ++--
 .../xorg-lib/{xtrans_1.2.7.bb => xtrans_1.3.0.bb}  |    4 ++--
 9 files changed, 33 insertions(+), 34 deletions(-)
 rename meta/recipes-devtools/diffstat/{diffstat_1.57.bb => diffstat_1.58.bb} (84%)
 rename meta/recipes-devtools/git/{git_1.8.3.4.bb => git_1.8.4.2.bb} (67%)
 rename meta/recipes-devtools/python/{python-pycurl_7.19.0.bb => python-pycurl_7.19.0.2.bb} (74%)
 rename meta/recipes-devtools/python/{python-setuptools_1.1.6.bb => python-setuptools_1.1.7.bb} (86%)
 rename meta/recipes-extended/xz/{xz_5.1.2alpha.bb => xz_5.1.3alpha.bb} (87%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-keyboard_1.7.0.bb => xf86-input-keyboard_1.8.0.bb} (73%)
 rename meta/recipes-graphics/xorg-lib/{xtrans_1.2.7.bb => xtrans_1.3.0.bb} (82%)

-- 
1.7.9.5


