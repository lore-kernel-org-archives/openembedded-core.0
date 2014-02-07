Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 508BC6E903
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2014 22:19:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2014 14:19:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,803,1384329600"; d="scan'208";a="477834069"
Received: from unknown (HELO localhost) ([10.255.13.139])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2014 14:19:27 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2014 16:19:25 -0600
Message-Id: <cover.1391811371.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/1] wic update - honor --source --size
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
X-List-Received-Date: Fri, 07 Feb 2014 22:19:28 -0000

This patch allows --size to work for --source partitions i.e. a
partition created from e.g. rootfs/ can now be any size you want, not
just the size of the rootfs.

The following changes since commit 3a590e85808c6fae32f8a40aa003d373d097de9d:

  build-appliance-image: Update to poky commit b37dd451a52622d5b570183a81583cc34c2ff555 (2014-02-06 15:36:50 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-source-size-update
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/wic-source-size-update

Tom Zanussi (1):
  wic: Honor --size for --source partititions

 .../lib/mic/kickstart/custom_commands/partition.py | 57 +++++++++++++++++++---
 scripts/lib/mic/plugins/source/bootimg-efi.py      | 10 +++-
 scripts/lib/mic/plugins/source/bootimg-pcbios.py   | 10 +++-
 scripts/lib/mic/utils/oe/misc.py                   |  1 +
 4 files changed, 68 insertions(+), 10 deletions(-)

-- 
1.8.3.1


