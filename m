Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 22B9D65D59
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 22:04:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Oct 2014 15:03:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,280,1413270000"; d="scan'208";a="627922351"
Received: from enewy-mobl1.amr.corp.intel.com (HELO localhost) ([10.254.56.8])
	by orsmga002.jf.intel.com with ESMTP; 29 Oct 2014 15:04:23 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: philip@balister.org, maciej.borzecki@open-rnd.pl,
	openembedded-core@lists.openembedded.org
Date: Wed, 29 Oct 2014 17:04:20 -0500
Message-Id: <cover.1414618765.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/6] some wic bugfixes
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
X-List-Received-Date: Wed, 29 Oct 2014 22:04:25 -0000

This patchset fixes a couple serious wic bugs:

[YOCTO #6863] - Wic fails to create a working image for a large file system
[YOCTO #6290] - Update WIC for gummiboot

I generated core-image-sdk images for each of the wic image types and
was able to fsck/mount the resulting filesystems.

These should be applied to the next dizzy point release.

The following changes since commit cf82c6756bad8f7a5edc92ce513e02816b88efb3:

  bitbake: prserv: don't wait until exit to sync (2014-10-28 15:00:39 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-bugfixes-v1
  http://git.yoctoproject.org/cgit.cgi//log/?h=tzanussi/wic-bugfixes-v1

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


