Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2AA0271A21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490704905; x=1522240905; h=from:to:subject:date:message-id;
	bh=UO8ClGaap7HlcX8vGOmKD+OegNbCVILnQX4YW6er9kI=;
	b=eeXGjrxjyCFRirLm582PrTjBHKtroG3JhndPivpCSvdr+Vm0XttOskT/
	5a5tGs3LVMC2f/mWApFqUrEMhHaO7w==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Mar 2017 05:41:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,236,1486454400"; d="scan'208";a="81463713"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 28 Mar 2017 05:41:42 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 41A166A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 05:41:35 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 15:40:57 +0300
Message-Id: <cover.1490704390.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/9] #10618: Increase oe-selftest coverage of wic codebase (last part)
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
X-List-Received-Date: Tue, 28 Mar 2017 12:41:44 -0000

Hi,

Increased test coverage of the wic codebase to 81%:
 - tested partitions with various fs types(btrfs, squashfs, etc)
 - removed fsimage plugin
 - removed not used code from filemap.py and runner.py
 - tested globbed source spec of image-bootpart plugin

The following changes since commit 415b72ffcbd26e5f3664370d8b2a9b8105fb6342:

  dnf: remove systemd units in nativesdk builds (2017-03-28 10:34:37 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip

Ed Bartosh (9):
  wic-tools: add btrfs-tools squashfs-tools to DEPENDS
  oe-selftest: add wic test case test_fs_types
  filemap: remove FilemapSeek class
  oe-selftest: add kickstart_parser test case
  wic: remove fsimage plugin
  wic: use wic-tools STAGING_DATADIR as bootimg_dir
  wic: remove runner.show API
  wic: remove unused code from runner module
  oe-selftest: add test_image_bootpart_globbed test for wic

 meta/lib/oeqa/selftest/wic.py                    |  41 +++
 meta/recipes-core/meta/wic-tools.bb              |   6 +-
 scripts/lib/wic/filemap.py                       | 309 ++++-------------------
 scripts/lib/wic/partition.py                     |  13 -
 scripts/lib/wic/plugins/source/bootimg-pcbios.py |  48 ++--
 scripts/lib/wic/plugins/source/fsimage.py        |  56 ----
 scripts/lib/wic/utils/misc.py                    |  14 +-
 scripts/lib/wic/utils/runner.py                  |  74 +-----
 8 files changed, 130 insertions(+), 431 deletions(-)
 delete mode 100644 scripts/lib/wic/plugins/source/fsimage.py

-- 
2.1.4


