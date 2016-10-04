Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 387E8719DB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 09:31:41 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 04 Oct 2016 02:31:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,442,1473145200"; d="scan'208";a="768675545"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.185.151])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Oct 2016 02:31:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2016 22:31:13 +1300
Message-Id: <cover.1475573453.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/3] devtool add fixes
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
X-List-Received-Date: Tue, 04 Oct 2016 09:31:42 -0000

The following changes since commit 21cc2a3f63ea260dbf6b50e2fd4dd50cacdd9935:

  machine-sdk: Clear ABIEXTENSION to avoid sstate checksum mismatch issues (2016-10-01 08:16:03 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool21-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool21-oe

Paul Eggleton (3):
  devtool: add: fix error message when only specifying a recipe name
  devtool: add: display a warning for deprecated -f/--fetch option
  devtool: add: build nodejs-native if npm is needed and not available

 scripts/lib/devtool/__init__.py      | 29 +++++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py      | 35 ++++++++++++++++++++++++-----------
 scripts/lib/recipetool/create.py     | 10 ++++++----
 scripts/lib/recipetool/create_npm.py |  4 +++-
 4 files changed, 62 insertions(+), 16 deletions(-)

-- 
2.5.5


