Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 034C072160
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 16:07:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 Nov 2014 08:07:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,432,1413270000"; 
	d="scan'208,223";a="635966523"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO localhost)
	([10.255.13.176])
	by fmsmga002.fm.intel.com with ESMTP; 21 Nov 2014 08:07:53 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 21 Nov 2014 10:07:49 -0600
Message-Id: <cover.1416585198.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/6][dizzy] some wic bugfixes
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
X-List-Received-Date: Fri, 21 Nov 2014 16:07:57 -0000

From the original posting:

This patchset fixes a couple serious wic bugs:

[YOCTO #6863] - Wic fails to create a working image for a large file system
[YOCTO #6290] - Update WIC for gummiboot

I generated core-image-sdk images for each of the wic image types and
was able to fsck/mount the resulting filesystems.

These should be applied to the next dizzy point release.

The following changes since commit e69653b01dd8ad9fda2355b8112a65c813ce7fd5:

  tzdata: update to 2014j (2014-11-17 08:01:21 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/dizzy-next
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/dizzy-next

Tom Zanussi (6):
  wic: Don't allow mkfs to fail silently in partition command
  wic: Use overhead factor when creating partitions from rootfs
    directories
  wic: Update the help text to include -D (--debug)
  Revert "wic: set bootimg_dir when using image-name artifacts"
  wic: Remove special-case bootimg_dir
  wic: Update bootimg-partition to use bootimg_dir

 scripts/lib/image/engine.py                        | 42 +++++-----------------
 scripts/lib/image/help.py                          | 23 ++++++++----
 scripts/lib/wic/imager/direct.py                   |  5 +--
 .../lib/wic/kickstart/custom_commands/partition.py | 24 +++++++++----
 scripts/lib/wic/plugins/imager/direct_plugin.py    | 20 +++++------
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  5 ++-
 .../lib/wic/plugins/source/bootimg-partition.py    |  9 +++--
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  3 +-
 scripts/lib/wic/utils/oe/misc.py                   |  1 +
 scripts/wic                                        | 13 +++----
 10 files changed, 68 insertions(+), 77 deletions(-)

-- 
1.9.3


