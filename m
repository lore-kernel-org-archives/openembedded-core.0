Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1696072E1A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 15:44:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Feb 2015 07:39:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,529,1418112000"; d="scan'208";a="682025834"
Received: from kamaher-mobl6.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.37])
	by orsmga002.jf.intel.com with ESMTP; 06 Feb 2015 07:44:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Feb 2015 15:44:30 +0000
Message-Id: <cover.1423237365.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/5] oe-pkgdata-util improvements
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
X-List-Received-Date: Fri, 06 Feb 2015 15:44:46 -0000

Some fairly significant improvements to oe-pkgdata-util that make it
much easier to use for querying built package information, plus some
QA tests to make sure it doesn't break in future.


The following changes since commit eb9d896db2fc67bac8efd258744d06fbbee87f06:

  libtool: avoid running automake/autoconf --version (2015-02-05 09:45:49 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/oe-pkgdata-util
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/oe-pkgdata-util

Paul Eggleton (5):
  oe-pkgdata-util: improve command-line usage
  oe-pkgdata-util: allow reverse package name lookups
  oe-pkgdata-util: make find-path show a proper error if no package
    found
  oe-pkgdata-util: add list-pkgs subcommand
  oe-pkgdata-util: add some QA tests

 meta/classes/buildhistory.bbclass |   2 +-
 meta/classes/license.bbclass      |   2 +-
 meta/lib/oe/package_manager.py    |   2 +-
 meta/lib/oeqa/runtime/_ptest.py   |   2 +-
 meta/lib/oeqa/selftest/pkgdata.py | 125 ++++++++++++
 scripts/oe-pkgdata-util           | 389 ++++++++++++++++++++++++--------------
 6 files changed, 372 insertions(+), 150 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/pkgdata.py

-- 
1.9.3


