Return-Path: <roxana.ciobanu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id CF6E2705A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 13:20:33 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Jul 2014 06:20:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,685,1400050800"; d="scan'208";a="458603176"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.57])
	by azsmga001.ch.intel.com with ESMTP; 18 Jul 2014 06:20:32 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jul 2014 16:20:51 +0300
Message-Id: <cover.1405689624.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] Fix for YB6502
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
X-List-Received-Date: Fri, 18 Jul 2014 13:20:41 -0000

The following changes since commit 0662aa801237ac716e35c7930d857f98249db1cf:

  bdwgc: Add PACKAGECONFIG for libatomic-ops (2014-07-17 15:04:10 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib roxana/YB6502
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=roxana/YB6502

Roxana Ciobanu (1):
  image.bbclass/rootfs.py: add variables to rootfs[vardeps]

 meta/classes/image.bbclass | 17 ++++++++++++++++-
 meta/lib/oe/rootfs.py      | 21 +++++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)

-- 
1.9.1


