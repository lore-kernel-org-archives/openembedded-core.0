Return-Path: <max.eliaser@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 25F4860C19
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 21:01:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Aug 2014 13:55:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,820,1400050800"; d="scan'208";a="584980712"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.63])
	by orsmga002.jf.intel.com with ESMTP; 07 Aug 2014 14:01:42 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Aug 2014 13:59:20 -0700
Message-Id: <cover.1407445120.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/2] Upstream recipe for bootchart2 from WebOS (revised again)
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
X-List-Received-Date: Thu, 07 Aug 2014 21:01:50 -0000

Hello list,

This series adds a recipe for the bootchart2 daemon (a fork of the original
bootchart.) It's based on a recipe from Meta-WebOS, but with extensive
modifications.

It is intended that bootchart2 will supersede the other bootchart daemons
kicking around in oe-core/meta-oe. See bug 5893. [1]

(Resubmitted this series yet again because I'd mistakenly included Yocto-
specific changes in addition to oe-core ones.)

Regards,
-Max Eliaser

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=5893
The following changes since commit 86afd7eb7c679eb065706137f28f44248f3fbc5a:

  ghostscript: Remove bogus gsfonts reference from DESCRIPTION (2014-08-06 11:14:40 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib meliaser/bootchart2-attempt3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=meliaser/bootchart2-attempt3

Max Eliaser (2):
  bootchart2: create recipe for bootchart2
  ubootchart: delete ubootchart recipe

 .../bootchart2/bootchart2/bootchartd_stop.sh       |  18 +++
 meta/recipes-devtools/bootchart2/bootchart2_git.bb | 148 +++++++++++++++++++++
 .../ubootchart/files/sysvinit.patch                |  14 --
 .../ubootchart/files/ubootchart-stop               |   3 -
 .../ubootchart/files/ubootchart.desktop            |   6 -
 meta/recipes-devtools/ubootchart/ubootchart_svn.bb |  39 ------
 6 files changed, 166 insertions(+), 62 deletions(-)
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/bootchartd_stop.sh
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2_git.bb
 delete mode 100644 meta/recipes-devtools/ubootchart/files/sysvinit.patch
 delete mode 100644 meta/recipes-devtools/ubootchart/files/ubootchart-stop
 delete mode 100644 meta/recipes-devtools/ubootchart/files/ubootchart.desktop
 delete mode 100644 meta/recipes-devtools/ubootchart/ubootchart_svn.bb

-- 
1.8.3.2


