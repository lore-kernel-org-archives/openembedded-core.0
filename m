Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A40CF605FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 05:11:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 20 Mar 2016 22:11:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,369,1455004800"; d="scan'208";a="915344751"
Received: from edeshpan-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.136.133])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2016 22:11:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 18:10:55 +1300
Message-Id: <cover.1458537025.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/4] Misc fixes
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
X-List-Received-Date: Mon, 21 Mar 2016 05:11:32 -0000

Fixes for some minor issues I noticed recently.


The following changes since commit d3ab7005f0c899da9f9f132b22861bd5d4f952ba:

  tzdata: update to 2016b (2016-03-20 22:58:00 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/misc-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/misc-fixes

Paul Eggleton (4):
  classes/packagegroup: fix dbg/dev/ptest complementary packages
  classes/packagegroup: drop complementary -ptest if ptest not in DISTRO_FEATURES
  classes/distutils*: don't hide logs when setup script fails
  site.conf.sample: fix reference to oe-git-proxy script

 meta/classes/distutils-tools.bbclass |  8 ++++----
 meta/classes/distutils.bbclass       |  8 ++++----
 meta/classes/distutils3.bbclass      |  8 ++++----
 meta/classes/packagegroup.bbclass    | 12 +++++++++---
 meta/conf/site.conf.sample           |  2 +-
 5 files changed, 22 insertions(+), 16 deletions(-)

-- 
2.5.5


