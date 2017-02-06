Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8F0FF6093C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 20:45:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 06 Feb 2017 12:45:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="817761497"
Received: from mmurr6x-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.252.199.82])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Feb 2017 12:45:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2017 09:45:39 +1300
Message-Id: <cover.1486413875.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 0/4] devtool/recipetool fixes
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
X-List-Received-Date: Mon, 06 Feb 2017 20:45:49 -0000

Some fixes for devtool/recipetool, plus one related fix to the npm
class.


The following changes since commit b3a74335e1f9701ce2d6217080800baf3a61acb4:

  Revert "yocto-bsps: add 4.9 bbappend" (2017-02-06 14:45:48 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool25
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool25

Paul Eggleton (4):
  classes/npm: set HOME during do_install
  recipetool: create: properly handle npm optional dependencies
  recipetool: create: do not treat numbers in SCM URLs as versions
  devtool: improve parse failure handling

 meta/classes/npm.bbclass             |  3 ++
 scripts/create-pull-request          |  1 +
 scripts/lib/devtool/__init__.py      |  7 ++++-
 scripts/lib/devtool/standard.py      | 11 ++++++-
 scripts/lib/recipetool/create.py     |  3 +-
 scripts/lib/recipetool/create_npm.py | 56 +++++++++++++++++++++++++++++++-----
 6 files changed, 70 insertions(+), 11 deletions(-)

-- 
2.9.3


