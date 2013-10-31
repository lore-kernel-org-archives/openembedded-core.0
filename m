Return-Path: <cristiana.voicu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3C3526A467
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 08:12:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 31 Oct 2013 01:12:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="427521139"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.65])
	by orsmga002.jf.intel.com with ESMTP; 31 Oct 2013 01:12:09 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2013 10:17:06 +0200
Message-Id: <cover.1383207214.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH_V2 0/2] Package upgrades
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
X-List-Received-Date: Thu, 31 Oct 2013 08:12:09 -0000

Hi,

Tests done:
 * build tested on AB running following nightlies: build-appliance, x86, x86_64, ppc, mips, arm;
 * checked with rpm if the packages were installed and their version on a sato image; 
basic functionality for rxvt terminal and lttng for liburcu

Thanks,
Cristiana

The following changes since commit 523f2a9ea970713fb775bc48f84b67420b1106a0:

  cross-canadian: Improve comment (2013-10-30 18:01:34 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib cvoicu/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=cvoicu/work

Cristiana Voicu (2):
  rxvt-unicode: upgrade to 9.19
  liburcu: upgrade to 0.8.0

 .../rxvt.desktop                                   |    0
 .../rxvt.png                                       |  Bin 2847 -> 2847 bytes
 .../xwc.patch                                      |    0
 .../{rxvt-unicode_9.18.bb => rxvt-unicode_9.19.bb} |    4 ++--
 meta/recipes-support/liburcu/files/fixCCflag.patch |   20 ++++++++++++++++++++
 .../liburcu/files/fixsepbuild.patch                |   19 +++++++++++++++++++
 .../liburcu/{liburcu_0.7.7.bb => liburcu_0.8.0.bb} |    8 +++++---
 7 files changed, 46 insertions(+), 5 deletions(-)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.18 => rxvt-unicode-9.19}/rxvt.desktop (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.18 => rxvt-unicode-9.19}/rxvt.png (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.18 => rxvt-unicode-9.19}/xwc.patch (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.18.bb => rxvt-unicode_9.19.bb} (93%)
 create mode 100644 meta/recipes-support/liburcu/files/fixCCflag.patch
 create mode 100644 meta/recipes-support/liburcu/files/fixsepbuild.patch
 rename meta/recipes-support/liburcu/{liburcu_0.7.7.bb => liburcu_0.8.0.bb} (74%)

-- 
1.7.9.5


