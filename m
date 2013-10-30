Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 674696D092
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 15:22:41 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Oct 2013 08:22:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="314791902"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Oct 2013 08:22:41 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Oct 2013 17:24:48 +0200
Message-Id: <cover.1383146648.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/4] Various PUs
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
X-List-Received-Date: Wed, 30 Oct 2013 15:22:42 -0000

The following changes since commit 5e427966756700e596740778f16b96d03e8568c8:

  recipes: Remove PR = r0 from all recipes (2013-10-30 14:52:04 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PU3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PU3

Cristian Iorga (4):
  libuser: upgrade to 0.60
  iproute2: upgrade to 3.11.0
  telepathy-mission-control: upgrade to 5.16.0
  telepathy-glib: upgrade to 0.23.0

 .../iproute2/{iproute2_3.10.0.bb => iproute2_3.11.0.bb}              | 4 ++--
 .../telepathy/{telepathy-glib_0.20.4.bb => telepathy-glib_0.23.0.bb} | 5 +++--
 ...mission-control_5.15.0.bb => telepathy-mission-control_5.16.0.bb} | 4 ++--
 meta/recipes-extended/libuser/{libuser_0.59.bb => libuser_0.60.bb}   | 4 ++--
 4 files changed, 9 insertions(+), 8 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.10.0.bb => iproute2_3.11.0.bb} (64%)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.20.4.bb => telepathy-glib_0.23.0.bb} (80%)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.15.0.bb => telepathy-mission-control_5.16.0.bb} (93%)
 rename meta/recipes-extended/libuser/{libuser_0.59.bb => libuser_0.60.bb} (88%)

-- 
1.8.1.2


