Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4F7F877017
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 13:49:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 12 Oct 2015 06:49:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,673,1437462000"; d="scan'208";a="824745376"
Received: from skhizaka-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.208])
	by orsmga002.jf.intel.com with ESMTP; 12 Oct 2015 06:49:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Oct 2015 14:49:08 +0100
Message-Id: <cover.1444657696.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/3] Misc fixes
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
X-List-Received-Date: Mon, 12 Oct 2015 13:49:26 -0000

The following changes since commit e42d8eff9eed7d1454b4f331d96dcee6dea232df:

  bash: Disable custom memory allocator (2015-10-12 14:35:42 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/fixes4
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes4

Paul Eggleton (3):
  common-licenses: use correct GFDL-1.1 license text
  build-compare: drop PATCHTOOL setting
  tzdata: reinstate changes reverted in 2014c upgrade

 meta/files/common-licenses/GFDL-1.1                | 206 ++++++++-------------
 .../build-compare/build-compare_git.bb             |   1 -
 meta/recipes-extended/tzdata/tzdata_2015g.bb       |   5 +-
 3 files changed, 85 insertions(+), 127 deletions(-)

-- 
2.1.0


