Return-Path: <cristiana.voicu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1FB0165FB5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 08:34:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 May 2014 01:24:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,995,1389772800"; d="scan'208";a="535335954"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.143])
	by orsmga002.jf.intel.com with ESMTP; 06 May 2014 01:24:41 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 May 2014 11:26:14 +0300
Message-Id: <cover.1399364698.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Package upgrades
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
X-List-Received-Date: Tue, 06 May 2014 08:34:53 -0000

The packages has been succesfully compiled for all major architectures.
Tested locally on a core-image-sato image.

The following changes since commit 7b78c364b7de901f97cd8dbe56d5e02f545bf3d3:

  cleanup-workdir: Fix crosssdk reference after addition of PN (2014-05-05 09:05:42 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib cvoicu/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=cvoicu/work

Cristiana Voicu (2):
  babeltrace: upgrade to 1.2.1
  rxvt-unicode: upgrade to 9.20

 ...-Support-out-of-tree-builds-in-babeltrace.patch |   17 +++++++++++++++++
 .../{babeltrace_1.1.1.bb => babeltrace_1.2.1.bb}   |    7 ++++---
 .../rxvt.desktop                                   |    0
 .../{rxvt-unicode-9.19 => rxvt-unicode}/rxvt.png   |  Bin 2847 -> 2847 bytes
 .../{rxvt-unicode-9.19 => rxvt-unicode}/xwc.patch  |    0
 .../{rxvt-unicode_9.19.bb => rxvt-unicode_9.20.bb} |    4 ++--
 6 files changed, 23 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace/0001-Fix-Support-out-of-tree-builds-in-babeltrace.patch
 rename meta/recipes-kernel/lttng/{babeltrace_1.1.1.bb => babeltrace_1.2.1.bb} (72%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.19 => rxvt-unicode}/rxvt.desktop (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.19 => rxvt-unicode}/rxvt.png (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.19 => rxvt-unicode}/xwc.patch (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.19.bb => rxvt-unicode_9.20.bb} (93%)

-- 
1.7.9.5


