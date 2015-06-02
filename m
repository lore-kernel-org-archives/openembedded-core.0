Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0D816756CB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 15:55:44 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 02 Jun 2015 08:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,540,1427785200"; d="scan'208";a="719405846"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2015 08:55:46 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 132D76A4005;
	Tue,  2 Jun 2015 08:55:11 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jun 2015 17:01:58 +0300
Message-Id: <1433253725-14089-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH 0/7] wic: Fixed support of GPT partition table
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
X-List-Received-Date: Tue, 02 Jun 2015 15:55:47 -0000

Hi,

This is a set of fixes for GPT partition table support in wic.
Added new canned .wks and correspondent testcase were added to the codebase.

Result direct-gpt core-minimal image was successfully booted on NUC.

Ed Bartosh (7):
  wic: set legacy_boot flag for gpt partitions
  wic: check if part_type is set only for msdos partition table
  wic: Add gpt to the list of supported partition table formats
  wic: Use gptmbr.bin MBR for gpt partitions
  wic: Make _ptable_format public
  wic: create directdisk-gpt.wks
  wic: Test creation of directdisk image with GPT table

 meta/lib/oeqa/selftest/wic.py                       |  6 ++++++
 scripts/lib/image/canned-wks/directdisk-gpt.wks     | 10 ++++++++++
 scripts/lib/wic/imager/direct.py                    |  6 +++---
 scripts/lib/wic/plugins/source/bootimg-efi.py       |  4 ++--
 scripts/lib/wic/plugins/source/bootimg-pcbios.py    |  8 ++++++--
 scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py | 12 ++++++++++--
 scripts/lib/wic/utils/partitionedfs.py              |  4 ++--
 7 files changed, 39 insertions(+), 11 deletions(-)
 create mode 100644 scripts/lib/image/canned-wks/directdisk-gpt.wks

--
Regards,
Ed


