Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8D4F773174
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 17:35:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 19 Jan 2016 09:35:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,318,1449561600"; d="scan'208";a="884868652"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jan 2016 09:35:34 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 55A012C8001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 10:23:30 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 17:38:52 +0200
Message-Id: <cover.1453217537.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/8] wic: implement 'include' command
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
X-List-Received-Date: Tue, 19 Jan 2016 17:35:34 -0000

Hi,

Please review the implementation of 'include' command in
wks parser.

This patchset depends on my previous patchset 'wic: kickstart fixes' which
is in toaster-next, so I rebased this one on top of toaster-next.

The following changes since commit 429137c9d785be79816029b987d6102978e936e0:

  classes/populate_sdk_ext: fix task dependency regression (2016-01-18 15:06:01 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/kickstart-include-8848
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/kickstart-include-8848

Ed Bartosh (8):
  wic: move wks parsing code to KickStart._parse
  wic: use unique partition number
  wic: do not remove build dir in source plugins
  wic: ksparser: add support for include
  wic: refactor get_boot_config
  wic: implement search of includes
  wic: move parts of canned .wks into common.wks.inc
  wic: add help for 'include' command

 scripts/lib/wic/canned-wks/common.wks.inc          |  3 +++
 .../canned-wks/directdisk-bootloader-config.wks    |  4 +---
 scripts/lib/wic/canned-wks/directdisk.wks          |  4 +---
 scripts/lib/wic/canned-wks/qemux86-directdisk.wks  |  4 +---
 scripts/lib/wic/help.py                            | 14 ++++++++++++
 scripts/lib/wic/imager/direct.py                   |  3 +++
 scripts/lib/wic/ksparser.py                        | 26 ++++++++++++++++++++--
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  2 --
 .../lib/wic/plugins/source/bootimg-partition.py    |  3 ---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  2 --
 scripts/lib/wic/utils/misc.py                      | 16 ++++++-------
 11 files changed, 54 insertions(+), 27 deletions(-)
 create mode 100644 scripts/lib/wic/canned-wks/common.wks.inc

--
Regards,
Ed


