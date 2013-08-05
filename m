Return-Path: <cristiana.voicu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id DFBAC6B457
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 08:25:28 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Aug 2013 01:25:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,817,1367996400"; d="scan'208";a="277761193"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.72])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Aug 2013 01:25:20 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2013 11:28:02 +0300
Message-Id: <cover.1375441054.git.cristiana.voicu@intel.com>
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
X-List-Received-Date: Mon, 05 Aug 2013 08:25:29 -0000

Hi,

Tests done:
 * build tested on AB running following nightlies: x86, x86_64, ppc, mips, arm;
 * checked with rpm if the packages were installed; basic functionality for
curl, lttng (which is depending on liburcu) and tzdata

Thanks,
Cristiana

The following changes since commit 9de0ad47462c13ac4a2d73e12e92be6c1b4e0415:

  genericx86: ship all the driver firmware by default (2013-07-31 07:00:00 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib cvoicu/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=cvoicu/work

Cristiana Voicu (3):
  tzdata: upgrade to 2013d
  liburcu: upgrade to 0.7.7
  curl: upgrade to 7.31.0

 .../recipes-extended/tzcode/tzcode-native_2013d.bb |    4 ++--
 .../tzdata/{tzdata_2013b.bb => tzdata_2013d.bb}    |    4 ++--
 .../curl/{curl_7.30.0.bb => curl_7.31.0.bb}        |    5 ++---
 .../liburcu/{liburcu_0.7.6.bb => liburcu_0.7.7.bb} |    6 ++----
 4 files changed, 8 insertions(+), 11 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2013b.bb => tzdata_2013d.bb} (98%)
 rename meta/recipes-support/curl/{curl_7.30.0.bb => curl_7.31.0.bb} (92%)
 rename meta/recipes-support/liburcu/{liburcu_0.7.6.bb => liburcu_0.7.7.bb} (80%)

-- 
1.7.9.5


