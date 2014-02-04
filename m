Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3FF976162B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 01:16:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Feb 2014 17:17:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,776,1384329600"; d="scan'208";a="449256211"
Received: from unknown (HELO localhost) ([10.255.13.52])
	by orsmga001.jf.intel.com with ESMTP; 03 Feb 2014 17:16:59 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2014 19:16:57 -0600
Message-Id: <cover.1391476329.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/7] wic updates: Initial source plugin implementation
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
X-List-Received-Date: Tue, 04 Feb 2014 01:16:59 -0000

This patchset implements wic 'source plugins', basically a generalization
of the existing --source params to wic .wks commands.

The following changes since commit 358dd840c53e2e69e668a6d5da04eb3da3769ba3:

  sstate-cache-management.sh: don't remove all packagedata sstate archives (2014-02-02 11:30:34 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-plugins-v0
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/wic-plugins-v0

Tom Zanussi (7):
  wic: Move some common items to oe.misc
  wic: Create and use new functions for getting bitbake variables
  wic: Add wic-specific bootloader subclass
  wic: Add SourcePlugin class
  wic: Add BootimgEFIPlugin and BootimgPcbiosPlugin
  wic: Hook up BootimgEFIPlugin and BootimgPcbiosPlugin plugins
  wic: Hook up --debug option

 scripts/lib/image/canned-wks/directdisk.wks        |   2 +-
 scripts/lib/image/canned-wks/mkefidisk.wks         |   2 +-
 scripts/lib/image/engine.py                        |  28 +--
 scripts/lib/mic/imager/direct.py                   | 198 +++++----------------
 scripts/lib/mic/kickstart/__init__.py              |   4 +-
 .../lib/mic/kickstart/custom_commands/partition.py | 155 ++++------------
 .../lib/mic/kickstart/custom_commands/wicboot.py   |  57 ++++++
 scripts/lib/mic/plugin.py                          |  23 ++-
 scripts/lib/mic/pluginbase.py                      |  55 +++++-
 scripts/lib/mic/plugins/source/bootimg-efi.py      | 161 +++++++++++++++++
 scripts/lib/mic/plugins/source/bootimg-pcbios.py   | 187 +++++++++++++++++++
 scripts/lib/mic/utils/oe/misc.py                   |  28 +++
 scripts/wic                                        |  17 +-
 13 files changed, 618 insertions(+), 299 deletions(-)
 create mode 100644 scripts/lib/mic/kickstart/custom_commands/wicboot.py
 create mode 100644 scripts/lib/mic/plugins/source/bootimg-efi.py
 create mode 100644 scripts/lib/mic/plugins/source/bootimg-pcbios.py

-- 
1.8.3.1


