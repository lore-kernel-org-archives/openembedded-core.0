Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 876E76078D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 10:59:05 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP; 06 Oct 2016 03:59:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,453,1473145200"; d="scan'208";a="16812031"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 06 Oct 2016 03:59:06 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 044706A4006;
	Thu,  6 Oct 2016 03:58:36 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2016 13:33:34 +0300
Message-Id: <cover.1475749929.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Saul Wold <saul.wold@intel.com>
Subject: [wic][PATCH 0/4] use PARTUUID for MSDOS partitions
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
X-List-Received-Date: Thu, 06 Oct 2016 10:59:05 -0000

Hi,

This is an implementation of PARTUUID support for MSDOS partitions.
Now wic can use 'root=PARTUUID=<uuid> for both types of supported
partition tables - GPT and MSDOS.

This implementation enables usage of mkefidisk as a default wks for genericx86*
machines as most of reference BSPs support EFI.

The following changes since commit f12825d4bf7091576856650123c7d7614b9089af:

  scripts: Rename 'native' to 'oe-run-native' (2016-10-06 07:53:51 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/msdos-partuuid
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/msdos-partuuid

Ed Bartosh (4):
  wic: set PARTUUID only for gpt partition table
  wic: generate PARTUUID for MDOS partitions
  wic: rewrite MBR disk identifier
  mkefidisk.wks: use MSDOS partition table

 scripts/lib/wic/canned-wks/mkefidisk.wks |  2 +-
 scripts/lib/wic/imager/direct.py         | 16 ++++++++++++++--
 scripts/lib/wic/partition.py             |  3 ---
 scripts/lib/wic/utils/partitionedfs.py   | 14 +++++++++++---
 4 files changed, 26 insertions(+), 9 deletions(-)

--
Regards,
Ed

