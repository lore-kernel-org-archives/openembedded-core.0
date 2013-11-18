Return-Path: <cristiana.voicu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EC2426D001
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 14:57:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Nov 2013 06:54:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="437160322"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.65])
	by orsmga002.jf.intel.com with ESMTP; 18 Nov 2013 06:57:45 -0800
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2013 17:03:13 +0200
Message-Id: <cover.1384786750.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Package upgrades
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
X-List-Received-Date: Mon, 18 Nov 2013 14:57:45 -0000

Hi,

Tests done:
 * build tested on local AB running following nightlies: build-appliance, x86, x86_64, ppc, mips, arm;
 * checked with rpm if the packages were installed and their version on a sato image; 
basic functionality for lttng for liburcu; checked /usr/lib/at-spi2-core for at-spi2-core pkg

Thanks,
Cristiana

The following changes since commit b0281b3a190dec6502b4abc6a5b14ae46243f913:

  pybootchartgui: Add option --minutes to show time in minutes (2013-11-18 12:44:56 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib cvoicu/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=cvoicu/work

Cristiana Voicu (2):
  at-spi2-core: upgrade to 2.10.2
  liburcu: upgrade to 0.8.1

 ...-spi2-core_2.10.0.bb => at-spi2-core_2.10.2.bb} |    4 ++--
 meta/recipes-support/liburcu/files/fixCCflag.patch |   20 --------------------
 .../liburcu/{files => liburcu}/fixsepbuild.patch   |    0
 .../liburcu/{liburcu_0.8.0.bb => liburcu_0.8.1.bb} |    7 +++----
 4 files changed, 5 insertions(+), 26 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.10.0.bb => at-spi2-core_2.10.2.bb} (77%)
 delete mode 100644 meta/recipes-support/liburcu/files/fixCCflag.patch
 rename meta/recipes-support/liburcu/{files => liburcu}/fixsepbuild.patch (100%)
 rename meta/recipes-support/liburcu/{liburcu_0.8.0.bb => liburcu_0.8.1.bb} (75%)

-- 
1.7.9.5


