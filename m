Return-Path: <roxana.ciobanu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 44D3270445
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 18:52:19 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Jul 2014 11:52:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,632,1400050800"; d="scan'208";a="455087260"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.57])
	by azsmga001.ch.intel.com with ESMTP; 09 Jul 2014 11:52:19 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jul 2014 21:52:35 +0300
Message-Id: <cover.1404930808.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] Fix for YB6498
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
X-List-Received-Date: Wed, 09 Jul 2014 18:52:23 -0000

The following changes since commit 6879c3c903ec7d08cf0240281c83d85b4a42b6db:

  maintainers.inc: add info for libical (2014-07-08 11:20:14 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib roxana/YB6498
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=roxana/YB6498

Roxana Ciobanu (1):
  latencytop: fix mount error

 .../latencytop-0.5/latencytop-fsync-mount.patch         | 17 +++++++++++++++++
 meta/recipes-kernel/latencytop/latencytop_0.5.bb        |  5 +++--
 2 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync-mount.patch

-- 
1.9.1


