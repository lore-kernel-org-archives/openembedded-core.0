Return-Path: <cristiana.voicu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 05CBE60B60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 12:34:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Nov 2013 04:34:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,774,1378882800"; d="scan'208";a="434308251"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.65])
	by fmsmga001.fm.intel.com with ESMTP; 26 Nov 2013 04:34:03 -0800
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2013 14:39:44 +0200
Message-Id: <cover.1385469411.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/3] Package upgrades
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
X-List-Received-Date: Tue, 26 Nov 2013 12:34:07 -0000

Hi,

Tests done:
 * build tested on AB running following nightlies: build-appliance, x86, x86_64, ppc, mips, arm;
 * checked with dpkg if the packages were installed and their version on a sato image;
test --version functionality

Thanks,
Cristiana


The following changes since commit 6ddb9bf0976169fde7eee16d70a83210aa354416:

  bitbake: perforce: Fix path subdirectory issues (2013-11-24 12:25:37 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib cvoicu/work
  http://git.yoctoproject.org/cgit.cgi//log/?h=cvoicu/work

Cristiana Voicu (3):
  apr: upgrade to 1.5.0
  apr-util: upgrade to 1.5.3
  systemtap: upgrade to 2.4

 meta/recipes-kernel/systemtap/systemtap_git.inc    |    4 ++--
 .../apr/{apr-util_1.5.2.bb => apr-util_1.5.3.bb}   |    4 ++--
 .../apr/{apr_1.4.8.bb => apr_1.5.0.bb}             |    6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-support/apr/{apr-util_1.5.2.bb => apr-util_1.5.3.bb} (92%)
 rename meta/recipes-support/apr/{apr_1.4.8.bb => apr_1.5.0.bb} (89%)

-- 
1.7.9.5


