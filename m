Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 16EFD60588
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 11:16:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jan 2016 03:16:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,528,1444719600"; d="scan'208";a="875594228"
Received: from ngochun1-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.179])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2016 03:16:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 00:15:41 +1300
Message-Id: <cover.1452078721.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 00/14] Extensible SDK / devtool / recipetool improvements
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
X-List-Received-Date: Wed, 06 Jan 2016 11:16:31 -0000

A bunch of collected fixes for the extensible SDK, devtool and recipetool.


The following changes since commit 1568f4fa1c8f8abd9b365ecd264841cd4f6b66b1:

  bluez5: include the patch only for 5.36 (2015-12-28 13:02:03 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdk-devtool-1
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdk-devtool-1

Paul Eggleton (14):
  scripts/oe-publish-sdk: add missing call to git update-server-info
  classes/populate_sdk_ext: fix cascading from preparation failure
  classes/populate_sdk_ext: disable signature warnings
  devtool: sdk-update: fix not using updateserver config file option
  devtool: sdk-update: fix metadata update step
  devtool: sdk-update: fix error checking
  devtool: sdk-update: add option to skip preparation step
  recipetool: create: lower case name when determining from filename
  recipetool: create: support creating standalone native/nativesdk recipes
  devtool: reset: do clean for multiple recipes at once with -a
  devtool: add: support adding a native variant
  devtool: refactor code for getting local recipe file
  devtool: reset: support recipes with BBCLASSEXTEND
  devtool: build: support using BBCLASSEXTENDed names

 meta/classes/populate_sdk_ext.bbclass |  4 +--
 scripts/devtool                       | 12 ++++++-
 scripts/lib/devtool/__init__.py       | 50 +++++++++++++++++++++++++---
 scripts/lib/devtool/build.py          |  4 +--
 scripts/lib/devtool/sdk.py            | 61 ++++++++++++++++++-----------------
 scripts/lib/devtool/standard.py       | 58 +++++++++++++++++----------------
 scripts/lib/recipetool/create.py      | 34 +++++++++++++++++--
 scripts/oe-publish-sdk                |  4 +--
 8 files changed, 155 insertions(+), 72 deletions(-)

-- 
2.5.0


