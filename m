Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D6B4B6012C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 May 2016 18:18:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 May 2016 11:18:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,583,1455004800"; d="scan'208";a="959702989"
Received: from chang-s2600cp.jf.intel.com ([10.54.77.22])
	by fmsmga001.fm.intel.com with ESMTP; 05 May 2016 11:18:56 -0700
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 May 2016 11:20:36 -0700
Message-Id: <1462472437-78392-1-git-send-email-jianxun.zhang@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] systemd: support systemd-boot as a stand-alone EFI bootloader
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
X-List-Received-Date: Thu, 05 May 2016 18:18:58 -0000

Dear maintainers,

This change is the primary step to enable EFI bootloader in systemd
project. It is actually the gummiboot which has been included in
systemd project. The gummiboot referred in OE recipes is dead. The
intention is to enable it as a stand-alone bootloader without bothering
too much of the existing systemd. Usage is same as other supported EFI
bootloaders.

Considering there are many bits working with systemd in Yocto and we cannot
cover every corner in test prior to this submission, I suggest you have a
close look on the patch before merging it.

If no regerssion or significant bugs show in field, we will provide patches
to replace gummiboot with systemd-boot by:

() Add new oetest for systemd-boot
() Update documents for replacement
() Purge gummiboot in OE (may provide a dev-friendly message in gummiboot stuff
as a reminder in build)

Thanks

Jianxun Zhang (1):
  systemd: support systemd-boot as a stand-alone EFI bootloader

 meta/classes/systemd-boot.bbclass             | 124 ++++++++++++++++++++++++++
 meta/recipes-bsp/systemd-boot/systemd-boot.bb |  35 ++++++++
 meta/recipes-core/systemd/systemd.inc         |  25 ++++++
 meta/recipes-core/systemd/systemd_229.bb      |  26 +-----
 4 files changed, 186 insertions(+), 24 deletions(-)
 create mode 100644 meta/classes/systemd-boot.bbclass
 create mode 100644 meta/recipes-bsp/systemd-boot/systemd-boot.bb
 create mode 100644 meta/recipes-core/systemd/systemd.inc

-- 
1.9.1


