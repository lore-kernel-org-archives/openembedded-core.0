Return-Path: <roxana.ciobanu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 77C8A6ACD4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 09:15:05 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 Jul 2014 02:15:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,699,1400050800"; d="scan'208";a="459416647"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.53])
	by azsmga001.ch.intel.com with ESMTP; 21 Jul 2014 02:14:54 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jul 2014 12:15:15 +0300
Message-Id: <cover.1405934076.git.roxana.ciobanu@intel.com>
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
X-List-Received-Date: Mon, 21 Jul 2014 09:15:13 -0000

The following changes since commit 4d2ac6f6df2b3ef98699dd4f7afadb2d994222bb:

  rootfs: Remove the extraneous install directory (2014-07-19 00:18:21 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib roxana/YB6502
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=roxana/YB6502

Roxana Ciobanu (1):
  image.bbclass/rootfs.py: add variables to rootfs[vardeps]

 meta/classes/image.bbclass | 21 ++++++++++++++++++++-
 meta/lib/oe/rootfs.py      | 21 +++++++++++++++++++++
 2 files changed, 41 insertions(+), 1 deletion(-)

-- 
1.9.1


