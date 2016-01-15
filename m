Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0D4C160249
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 00:15:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 14 Jan 2016 16:14:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,296,1449561600"; d="scan'208";a="881675459"
Received: from ploh4-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.146.239])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jan 2016 16:14:55 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jan 2016 13:14:11 +1300
Message-Id: <cover.1452811534.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [jethro]PATCH 00/17] devtool/extensible SDK backports for jethro (cover letter only)
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
X-List-Received-Date: Fri, 15 Jan 2016 00:15:14 -0000

The following changes since commit 901af5a00338fd8f1ace939123484ea91c090a7a:

  libaio: don't disable linking to the system libraries (2016-01-14 15:18:16 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/jethro-fixes2-oecore
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/jethro-fixes2-oecore

Ed Bartosh (1):
  devtool: use cp instead of shutil.copytree

Paul Eggleton (16):
  classes/populate_sdk_ext: error out of install if buildtools install
    fails
  devtool: sdk-update: fix traceback without update server set
  recipetool: create: handle https://....git URLs
  recipetool: create: avoid traceback on fetch error
  recipetool: create: fix do_install handling for makefile-only software
  recipetool: create: prevent attempting to unpack entire DL_DIR
  recipetool: create: detect when specified URL returns a web page
  recipetool: create: fix error when extracting source to a specified
    directory
  buildhistory: fix not recording SDK information
  scripts/oe-publish-sdk: add missing call to git update-server-info
  classes/populate_sdk_ext: fix cascading from preparation failure
  classes/populate_sdk_ext: disable signature warnings
  devtool: sdk-update: fix not using updateserver config file option
  devtool: sdk-update: fix metadata update step
  devtool: sdk-update: fix error checking
  devtool: reset: do clean for multiple recipes at once with -a

 meta/classes/buildhistory.bbclass         |  2 +-
 meta/classes/populate_sdk_ext.bbclass     |  6 ++--
 scripts/lib/devtool/sdk.py                | 54 +++++++++++++++----------------
 scripts/lib/devtool/standard.py           | 25 +++++++-------
 scripts/lib/recipetool/create.py          | 28 +++++++++++++---
 scripts/lib/recipetool/create_buildsys.py |  2 +-
 scripts/lib/scriptutils.py                |  4 +++
 scripts/oe-publish-sdk                    |  4 +--
 8 files changed, 74 insertions(+), 51 deletions(-)

-- 
2.5.0


