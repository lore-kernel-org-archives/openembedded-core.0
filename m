Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 123567713C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 02:54:28 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 25 Jan 2016 18:54:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,347,1449561600"; d="scan'208";a="36152719"
Received: from wkhoh-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.195])
	by fmsmga004.fm.intel.com with ESMTP; 25 Jan 2016 18:54:26 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2016 15:53:52 +1300
Message-Id: <cover.1453776397.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/5] devtool improvements
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
X-List-Received-Date: Tue, 26 Jan 2016 02:54:31 -0000

I hope people aren't getting too bored with the steady stream of
devtool / extensible SDK patches...


The following changes since commit fc4209baa098caebf9c4cb75f9a6f2e85f43333c:

  Revert "xz: Allow to work with ASSUME_PROVIDED xz-native" (2016-01-25 10:08:25 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool12
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool12

Paul Eggleton (5):
  devtool: move edit-recipe to a separate module
  devtool: add configure-help subcommand
  devtool: build-image: allow specifying packages to add to image
  devtool: add: warn if modified recipe found in attic directory
  devtool: properly handle bb.build.FuncFailed when extracting source

 scripts/lib/devtool/__init__.py    |   9 +-
 scripts/lib/devtool/build-image.py |  11 +-
 scripts/lib/devtool/standard.py    |  44 ++-----
 scripts/lib/devtool/utilcmds.py    | 240 +++++++++++++++++++++++++++++++++++++
 4 files changed, 261 insertions(+), 43 deletions(-)
 create mode 100644 scripts/lib/devtool/utilcmds.py

-- 
2.5.0


