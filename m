Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4FF15608B7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 05:14:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 20 Mar 2016 22:14:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,369,1455004800"; d="scan'208";a="938122127"
Received: from edeshpan-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.136.133])
	by orsmga002.jf.intel.com with ESMTP; 20 Mar 2016 22:14:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 18:13:59 +1300
Message-Id: <cover.1458537176.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/9] Extensible SDK fixes
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
X-List-Received-Date: Mon, 21 Mar 2016 05:14:21 -0000

Some improvements for the extensible SDK, including fixes for some issues
within devtool.


The following changes since commit d3ab7005f0c899da9f9f132b22861bd5d4f952ba:

  tzdata: update to 2016b (2016-03-20 22:58:00 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdkfixes9-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdkfixes9-oe

Paul Eggleton (9):
  devtool: sdk-install: add option to allow building from source
  classes/populate_sdk_ext: parse metadata on minimal SDK install
  bitbake.conf: whitelist proxy variables in config hash
  devtool: configure-help: fix error if do_configure not already run
  devtool: add: delete externalsrc files on npm recipe do_install
  devtool: add: create git repository if URL specified as positional argument
  oe-publish-sdk: drop SDK installer file from published output
  oe-publish-sdk: improve help output slightly
  oe-publish-sdk: fix remote publishing

 meta/classes/npm.bbclass              |  6 ++++--
 meta/classes/populate_sdk_ext.bbclass |  2 +-
 meta/conf/bitbake.conf                |  4 +++-
 meta/files/ext-sdk-prepare.py         | 10 +++++++---
 meta/lib/oeqa/selftest/devtool.py     |  2 ++
 scripts/lib/devtool/sdk.py            | 21 ++++++++++++++++++++-
 scripts/lib/devtool/standard.py       | 13 ++++++++++++-
 scripts/lib/devtool/utilcmds.py       |  2 +-
 scripts/oe-publish-sdk                | 34 ++++++++++++++++++++++------------
 9 files changed, 72 insertions(+), 22 deletions(-)

-- 
2.5.5


