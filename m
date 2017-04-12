Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 84A5571C8A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 10:41:33 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Apr 2017 03:41:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,190,1488873600"; d="scan'208";a="247654559"
Received: from lheah-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.133.64])
	by fmsmga004.fm.intel.com with ESMTP; 12 Apr 2017 03:41:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 22:41:25 +1200
Message-Id: <cover.1491993601.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 0/4] devtool / recipetool fixes for node.js modules
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
X-List-Received-Date: Wed, 12 Apr 2017 10:41:35 -0000

This fixes a few regressions in master in handling devtool add on
node.js modules relative to morty.


The following changes since commit 210c518ba8f8d6ec6e9d34e0df8b963a3b2e0593:

  ptest-runner: Upgrade to minor version 2.0.2 (2017-04-11 18:09:21 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/npm-fixes3
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/npm-fixes3

Paul Eggleton (4):
  recipetool: create: fix for regression in npm license handling
  devtool: add: fix node.js/npm handling with recipe specific sysroots
  devtool: add: prevent repeatedly running recipetool
  recipetool: create: hide missing npm error when called from devtool

 scripts/lib/devtool/__init__.py      | 25 ++++++++++++++-----------
 scripts/lib/devtool/standard.py      |  6 +++++-
 scripts/lib/recipetool/create.py     | 32 ++++++++++++++++++++++++++------
 scripts/lib/recipetool/create_npm.py | 23 +++++++++++++----------
 4 files changed, 58 insertions(+), 28 deletions(-)

-- 
2.9.3


