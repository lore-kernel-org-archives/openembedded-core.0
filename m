Return-Path: <max.eliaser@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4F55560169
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 20:14:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Aug 2014 13:09:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,820,1400050800"; d="scan'208";a="555356113"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.63])
	by orsmga001.jf.intel.com with ESMTP; 07 Aug 2014 13:14:49 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Aug 2014 13:12:33 -0700
Message-Id: <cover.1407442264.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/3] Upstream recipe for bootchart2 from WebOS (revised)
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
X-List-Received-Date: Thu, 07 Aug 2014 20:14:52 -0000

Hello list,

This series adds a recipe for the bootchart2 daemon (a fork of the original
bootchart.) It's based on a recipe from Meta-WebOS, but with extensive
modifications.

It is intended that bootchart2 will supersede the other bootchart daemons
kicking around in oe-core/meta-oe. See bug 5893. [1]

Regards,
-Max Eliaser

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=5893
The following changes since commit 5452824960e8e77005a25ac11fd069d927523d3e:

  default-distrovars.inc: Remove unused variable 'LIMIT_BUILT_LOCALES' (2014-06-13 13:08:44 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib meliaser/bootchart2-attempt2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=meliaser/bootchart2-attempt2

Max Eliaser (3):
  python: python-pycairo: add python-pycairo-native
  bootchart2: create recipe for bootchart2
  ubootchart: delete ubootchart recipe

 meta-yocto/conf/distro/include/distro_alias.inc    |   1 -
 meta-yocto/conf/distro/include/maintainers.inc     |   1 -
 meta-yocto/conf/distro/include/recipe_color.inc    |   1 -
 .../conf/distro/include/upstream_tracking.inc      |   2 -
 .../bootchart2/bootchart2/bootchartd_stop.sh       |  18 +++
 meta/recipes-devtools/bootchart2/bootchart2_git.bb | 148 +++++++++++++++++++++
 .../python/python-pycairo_1.10.0.bb                |   2 +
 .../ubootchart/files/sysvinit.patch                |  14 --
 .../ubootchart/files/ubootchart-stop               |   3 -
 .../ubootchart/files/ubootchart.desktop            |   6 -
 meta/recipes-devtools/ubootchart/ubootchart_svn.bb |  39 ------
 11 files changed, 168 insertions(+), 67 deletions(-)
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/bootchartd_stop.sh
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2_git.bb
 delete mode 100644 meta/recipes-devtools/ubootchart/files/sysvinit.patch
 delete mode 100644 meta/recipes-devtools/ubootchart/files/ubootchart-stop
 delete mode 100644 meta/recipes-devtools/ubootchart/files/ubootchart.desktop
 delete mode 100644 meta/recipes-devtools/ubootchart/ubootchart_svn.bb

-- 
1.8.3.2


