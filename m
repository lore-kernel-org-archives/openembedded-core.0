Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8A81F60C19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 01:35:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Aug 2014 18:35:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,846,1400050800"; d="scan'208";a="586753761"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO localhost)
	([10.255.12.45])
	by orsmga002.jf.intel.com with ESMTP; 11 Aug 2014 18:35:40 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Aug 2014 20:35:38 -0500
Message-Id: <cover.1407806939.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/7] wic: Add gummiboot support
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
X-List-Received-Date: Tue, 12 Aug 2014 01:35:41 -0000

This add gummiboot support to wic.  It also adds a new --sourceparams
variable to the partition command, allowing plugins to be
parameterized.  The BootImgEFIPlugin makes use of it to support
multiple loaders.

The following changes since commit 0f24d9c569db733b4f63803ee4a9c12ec1789791:

  SIGGEN_EXCLUDERECIPES_ABISAFE: add initscripts (2014-08-11 17:44:12 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-gummiboot-v1
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/wic-gummiboot-v1

Tom Zanussi (7):
  wic: Add '--sourceparams' partition option
  wic: Add utility function for parsing sourceparams
  wic: Add sourceparam param to partition plugin methods
  wic: Parse and pass sourceparams to partition plugin methods
  wic: Add gummiboot support to bootimg-efi
  wic: Add sourceparams to mkefidisk.wks
  wic: Add mkgummidisk kickstart file

 scripts/lib/image/canned-wks/mkefidisk.wks         |   2 +-
 scripts/lib/image/canned-wks/mkgummidisk.wks       |  11 ++
 .../lib/wic/kickstart/custom_commands/partition.py |  20 +++-
 scripts/lib/wic/pluginbase.py                      |  15 +--
 scripts/lib/wic/plugins/source/bootimg-efi.py      | 117 +++++++++++++++++----
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  10 +-
 scripts/lib/wic/plugins/source/rootfs.py           |   5 +-
 scripts/lib/wic/utils/oe/misc.py                   |  23 ++++
 8 files changed, 164 insertions(+), 39 deletions(-)
 create mode 100644 scripts/lib/image/canned-wks/mkgummidisk.wks

-- 
1.8.3.1


