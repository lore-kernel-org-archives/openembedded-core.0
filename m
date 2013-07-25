Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id E49CD6AF56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 17:10:01 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2013 10:10:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,744,1367996400"; d="scan'208";a="336772841"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.176])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2013 10:09:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2013 18:09:01 +0100
Message-Id: <cover.1374772012.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/4] Smart/RPM related fixes
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
X-List-Received-Date: Thu, 25 Jul 2013 17:10:02 -0000

Note: there is one patch in here that affects BAD_RECOMMENDATIONS
behaviour for ipk.


The following changes since commit ac5d20f4adac69ea1702694fb50849c9e465b443:

  systemd: Remove systemd_unitdir if systemd is not in distro features (2013-07-23 07:49:54 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/smart
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/smart

Paul Eggleton (4):
  python-smartpm: fix sometimes reporting no provider instead of conflict
  python-smartpm: add ignore-recommends package flag
  classes/image: ensure BAD_RECOMMENDATIONS supports pre-renamed package names
  classes/rootfs_rpm: implement BAD_RECOMMENDATIONS for RPM

 meta/classes/image.bbclass                         |   1 +
 meta/classes/package_rpm.bbclass                   |  11 +-
 meta/classes/rootfs_ipk.bbclass                    |   2 -
 meta/classes/rootfs_rpm.bbclass                    |   3 +-
 meta/conf/bitbake.conf                             |   2 +
 .../python-smartpm/smart-conflict-provider.patch   | 196 +++++++++++++++++++++
 .../smart-flag-ignore-recommends.patch             |  60 +++++++
 .../python/python-smartpm_1.4.1.bb                 |   2 +
 8 files changed, 271 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-conflict-provider.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-flag-ignore-recommends.patch

-- 
1.8.1.2


