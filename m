Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 349FC6FFD7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 14:19:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 18 Jan 2016 06:19:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,312,1449561600"; d="scan'208";a="729518278"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 18 Jan 2016 06:19:18 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 233E12C8001
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 07:07:13 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jan 2016 14:22:40 +0200
Message-Id: <cover.1453119482.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH 0/6] wic: kickstart fixes
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
X-List-Received-Date: Mon, 18 Jan 2016 14:19:21 -0000

Hi,

This patchset includes usability fixes and error handling improvements
for new kickstart parser.

The following changes since commit a2f23fa62858b89850aab339ddec16dcf6026b37:

  openssh: CVE-2016-1907 (2016-01-18 11:47:08 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/kickstart-fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/kickstart-fixes

Ed Bartosh (6):
  wic: add custom exception KickStartError
  wic: catch KickStartError
  wic: improve processing of parseing errors
  wic: removed unused imports
  wic: override ArgumentParser.error
  wic: rename kickstarter.py -> ksparser.py

 scripts/lib/wic/conf.py                            |  7 +++++--
 scripts/lib/wic/{kickstart.py => ksparser.py}      | 24 ++++++++++++++++++----
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  2 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  2 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |  2 +-
 .../lib/wic/plugins/source/rootfs_pcbios_ext.py    |  1 -
 6 files changed, 28 insertions(+), 10 deletions(-)
 rename scripts/lib/wic/{kickstart.py => ksparser.py} (82%)

--
Regards,
Ed


