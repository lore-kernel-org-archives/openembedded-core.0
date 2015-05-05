Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 31C0B6AC56
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 11:12:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 05 May 2015 04:12:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,372,1427785200"; d="scan'208";a="720893582"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga002.fm.intel.com with ESMTP; 05 May 2015 04:12:48 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 May 2015 14:12:24 +0300
Message-Id: <cover.1430824114.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/4] Minor upgrades to xorg-app/*
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
X-List-Received-Date: Tue, 05 May 2015 11:12:50 -0000

The following changes since commit 7a8f37daa7b42905233c31366915b897886a957a:

  dev-manual: Updates to add Luna support for Eclipse (2015-05-03 11:49:35 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/xorg-app
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/xorg-app

Jussi Kukkonen (4):
  xev: Upgrade 1.2.1 -> 1.2.2
  xmodmap: Upgrade 1.0.8 -> 1.0.9
  xhost: Upgrade 1.0.6 -> 1.0.7
  x11perf: Upgrade 1.5.4 -> 1.6.0

 .../recipes-graphics/xorg-app/{x11perf_1.5.4.bb => x11perf_1.6.0.bb} | 5 ++---
 meta/recipes-graphics/xorg-app/{xev_1.2.1.bb => xev_1.2.2.bb}        | 4 ++--
 meta/recipes-graphics/xorg-app/{xhost_1.0.6.bb => xhost_1.0.7.bb}    | 4 ++--
 .../recipes-graphics/xorg-app/{xmodmap_1.0.8.bb => xmodmap_1.0.9.bb} | 4 ++--
 4 files changed, 8 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/xorg-app/{x11perf_1.5.4.bb => x11perf_1.6.0.bb} (75%)
 rename meta/recipes-graphics/xorg-app/{xev_1.2.1.bb => xev_1.2.2.bb} (77%)
 rename meta/recipes-graphics/xorg-app/{xhost_1.0.6.bb => xhost_1.0.7.bb} (81%)
 rename meta/recipes-graphics/xorg-app/{xmodmap_1.0.8.bb => xmodmap_1.0.9.bb} (78%)

-- 
2.1.4


