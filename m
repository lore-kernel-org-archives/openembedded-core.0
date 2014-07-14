Return-Path: <roxana.ciobanu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B0C53701C0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 10:58:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 14 Jul 2014 03:52:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,657,1400050800"; d="scan'208";a="561450615"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.57])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jul 2014 03:58:15 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jul 2014 13:58:33 +0300
Message-Id: <cover.1405335436.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v3 0/1] Fix for YB6498
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
X-List-Received-Date: Mon, 14 Jul 2014 10:58:16 -0000

The following changes since commit 9e99bcffec594cb5b4c3533200e8eb56d32e6a77:

  insane: Ensure do_package_qa happens after do_packagedata (2014-07-11 23:20:04 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib roxana/YB6498
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=roxana/YB6498

Roxana Ciobanu (1):
  latencytop: fix mount error

 .../latencytop-0.5/latencytop-fsync-mount.patch    | 37 ++++++++++++++++++++++
 meta/recipes-kernel/latencytop/latencytop_0.5.bb   |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync-mount.patch

-- 
1.9.1


