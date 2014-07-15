Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C062F701D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:43:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jul 2014 08:43:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,666,1400050800"; d="scan'208";a="570159065"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO localhost)
	([10.255.13.33])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2014 08:43:37 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 10:43:35 -0500
Message-Id: <cover.1405438752.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/5] wic: Updates to add vfat support and more help topics
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
X-List-Received-Date: Tue, 15 Jul 2014 15:43:57 -0000

This patchset adds vfat support as requested in YOCTO #6513, and also
adds a couple new help topics: a wic overview and the start of a wic
kickstart reference.

It also fixes a couple usability bugs noted along the way.

The following changes since commit 1dcdd877c7946be4c0b1203deb14e2f842f9d0c2:

  bitbake: toasterui: fix build - project identification (2014-07-14 14:10:03 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-vfat-updates
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/wic-vfat-updates

Tom Zanussi (5):
  wic: Error on parted non-zero error code
  wic: Add vfat support
  wic: Add wic overview to help system
  wic: Add kickstart reference to help system
  wic: Error on zero-sized partitions

 scripts/lib/image/canned-wks/directdisk.wks        |   2 +-
 scripts/lib/image/help.py                          | 323 +++++++++++++++++++++
 .../lib/mic/kickstart/custom_commands/partition.py |  76 +++++
 scripts/lib/mic/utils/partitionedfs.py             |   2 +-
 scripts/wic                                        |  24 +-
 5 files changed, 416 insertions(+), 11 deletions(-)

-- 
1.8.3.1


