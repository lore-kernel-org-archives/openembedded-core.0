Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7E62F786C9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 01:50:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Feb 2018 17:50:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,395,1515484800"; d="scan'208";a="206908168"
Received: from cthanang-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.39])
	by fmsmga005.fm.intel.com with ESMTP; 25 Feb 2018 17:50:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 14:49:53 +1300
Message-Id: <cover.1519609613.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH v2 0/8] devtool fixes
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
X-List-Received-Date: Mon, 26 Feb 2018 01:50:35 -0000

This incorporates several of the fixes from my previous series and adds
a few others - I've excluded the multi-source changes from the previous
series as they may not be ready yet and it's too late in the release
cycle now. These have all passed through oe-selftest locally.

Changes since v1:
* Rename is_path_under() -> is_path_parent(), and change it to accept
  paths to test as unlimited arguments to the function and return False
  if there are no paths specified, as suggested by Ola x Nilsson.



The following changes since commit b30153a15715a83c0f9a7d7d1883a15404992a19:

  buildhistory-diff: honour report_all flag (2018-02-24 10:33:12 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool33-oe
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool33-oe

Paul Eggleton (8):
  lib/oe/path: implement is_path_parent()
  devtool: fix poor handling of upgraded BBCLASSEXTENDed recipes
  devtool: reset: delete bbappend file if _check_preserve() doesn't
  devtool: finish: fix erroneously creating bbappend for relative paths
  devtool: deploy-target: don't specify ssh/scp port unless user does
  lib/oe/recipeutils: add .txz extension to archive list
  devtool: search: also look in recipe cache
  devtool: search: tweak help text

 meta/lib/oe/path.py             |  22 +++++++++
 meta/lib/oe/recipeutils.py      |   2 +-
 scripts/devtool                 |   5 +-
 scripts/lib/devtool/deploy.py   |  12 ++---
 scripts/lib/devtool/search.py   | 100 ++++++++++++++++++++++++++--------------
 scripts/lib/devtool/standard.py |  17 +++++--
 6 files changed, 108 insertions(+), 50 deletions(-)

-- 
2.14.3


