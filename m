Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2C06C6ECD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 15:24:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 Feb 2014 07:23:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,839,1384329600"; d="scan'208";a="480937136"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 13 Feb 2014 07:23:56 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2014 17:26:50 +0200
Message-Id: <cover.1392305041.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/1] Fix for YB5817
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
X-List-Received-Date: Thu, 13 Feb 2014 15:24:16 -0000

The following changes since commit ee151ed6bc16312733c67b91bbf65959309b640d:

  lib/oe/rootfs.py: fix RPM multilib issue (2014-02-13 12:06:01 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB5817
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB5817

Cristian Iorga (1):
  runqemu: enforce right CPU type for qemux86/x86-64

 scripts/runqemu          |  9 +++------
 scripts/runqemu-internal | 13 +++++++++++--
 2 files changed, 14 insertions(+), 8 deletions(-)

-- 
1.8.3.2


