Return-Path: <max.eliaser@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CED7065C7C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 18:09:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Jul 2014 11:09:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,758,1400050800"; d="scan'208";a="580767783"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.64])
	by orsmga002.jf.intel.com with ESMTP; 29 Jul 2014 11:09:10 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jul 2014 11:07:05 -0700
Message-Id: <cover.1406657048.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/2] Upstream recipe for bootchart2 from WebOS
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
X-List-Received-Date: Tue, 29 Jul 2014 18:09:11 -0000

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

  git://git.yoctoproject.org/poky-contrib meliaser/bootchart2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=meliaser/bootchart2

Max Eliaser (2):
  python: python-pycairo: add python-pycairo-native
  bootchart2: create recipe for bootchart2

 .../bootchart2/bootchart2/bootchartd_stop.sh       |  18 +++
 meta/recipes-devtools/bootchart2/bootchart2_git.bb | 135 +++++++++++++++++++++
 .../python/python-pycairo_1.10.0.bb                |   2 +
 3 files changed, 155 insertions(+)
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/bootchartd_stop.sh
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2_git.bb

-- 
1.8.3.2


