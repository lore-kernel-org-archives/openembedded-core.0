Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2AE2573307
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 15:00:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 11 Feb 2015 06:55:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,559,1418112000"; d="scan'208";a="664875835"
Received: from jjurski-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.24.180])
	by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2015 07:00:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Feb 2015 14:59:53 +0000
Message-Id: <cover.1423666576.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH v2 0/7] oe-pkgdata-util improvements
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
X-List-Received-Date: Wed, 11 Feb 2015 15:00:16 -0000

Changes since v1:

* Add a fix for read-value not working with values containing colons
* Add a list-pkg-files subcommand
* Split out getting the package list for a recipe to its own function
* Minor fix to help text for glob subcommand


The following changes since commit 6bf5cbbcac80ee818cc932d69227e70e41ce02d3:

  libtool: Fix option parsing performance regression (2015-02-10 22:36:09 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/oe-pkgdata-util
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/oe-pkgdata-util

Paul Eggleton (7):
  oe-pkgdata-util: improve command-line usage
  oe-pkgdata-util: make find-path show a proper error if no package
    found
  oe-pkgdata-util: fix read-value to handle data with colons in the
    value
  oe-pkgdata-util: allow reverse package name lookups
  oe-pkgdata-util: add list-pkgs subcommand
  oe-pkgdata-util: add list-pkg-files subcommand
  oe-pkgdata-util: add some QA tests

 meta/classes/buildhistory.bbclass |   2 +-
 meta/classes/license.bbclass      |   2 +-
 meta/lib/oe/package_manager.py    |   2 +-
 meta/lib/oeqa/runtime/_ptest.py   |   2 +-
 meta/lib/oeqa/selftest/pkgdata.py | 213 ++++++++++++++++++
 scripts/oe-pkgdata-util           | 461 ++++++++++++++++++++++++++------------
 6 files changed, 532 insertions(+), 150 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/pkgdata.py

-- 
1.9.3


