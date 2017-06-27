Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6C0F977DB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 13:30:45 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 27 Jun 2017 06:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,399,1493708400"; d="scan'208";a="101917679"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 27 Jun 2017 06:30:47 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 8F07458069C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 06:30:46 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 16:28:36 +0300
Message-Id: <cover.1498569961.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2 0/5] #11662 - wic should mount /boot
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
X-List-Received-Date: Tue, 27 Jun 2017 13:30:46 -0000

Hi,

This patchset adds /boot to the /etc/fstab of root partition, making
it mounted on boot. It also fixes reporting and testing issues
caused by this change.

The patchset also fixes long standing bug: wic updated fstab
inplace in rootfs directory. This causes other tasks working with
rootfs directory to produce incorrect results or crash. This is
fixed by copying rootfs to the temporary directory before updating
fstab.

Changes in v2: squashed patches by reviewer's request

The following changes since commit be2f804a2ed7bb9b000fae14e75bdef43fd3eae6:

  wic: avoid unnecessary dependencies (2017-06-27 16:24:25 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wip

Ed Bartosh (5):
  wic: copy rootfs directory before changing fstab
  wic: use absolute paths in rootfs plugin
  wic: rootfs: fix rootfs path reporting
  wic: rootfs: make copied rootfs unique
  wic: add /boot mount point to fstab by default

 meta/lib/oeqa/selftest/cases/wic.py      |  2 +-
 scripts/lib/wic/plugins/imager/direct.py | 31 ++++++++++++++++++++-----------
 scripts/lib/wic/plugins/source/rootfs.py | 16 +++++++---------
 3 files changed, 28 insertions(+), 21 deletions(-)

--
Regards,
Ed


