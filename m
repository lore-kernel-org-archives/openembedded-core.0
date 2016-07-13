Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 006AC6067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 21:04:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 13 Jul 2016 14:04:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,359,1464678000"; d="scan'208";a="733801366"
Received: from apbalanx-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.177.79])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Jul 2016 14:04:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 09:04:18 +1200
Message-Id: <cover.1468443702.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/7] New devtool finish subcommand
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
X-List-Received-Date: Wed, 13 Jul 2016 21:04:51 -0000

This patchset adds "devtool finish" that provides a way to easily finish
and save your changes to a real layer. Along the way I also fixed some
annoyances and bugs in the way "devtool update-recipe" works, since
devtool finish makes use of that code.


The following changes since commit da7a2c7b00b40a8759dbe9f4ab6df3e337e3d6b6:

  useradd-staticids: use map() instead of imap() (2016-07-12 23:11:57 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool19-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool19-oe

Paul Eggleton (7):
  devtool: update-recipe: find and use existing files directories
  devtool: update-recipe: don't copy local files that haven't changed
  lib/oe/recipeutils: fix a few issues in find_layerdir()
  devtool: reset: refactor to allow calling separately
  devtool: update-recipe: refactor to allow calling separately
  devtool: upgrade: record original recipe files
  devtool: add finish subcommand

 meta/lib/oe/recipeutils.py        |  67 ++++++++++-
 meta/lib/oeqa/selftest/devtool.py | 157 +++++++++++++++++++++++++-
 scripts/lib/devtool/standard.py   | 231 +++++++++++++++++++++++++++++---------
 scripts/lib/devtool/upgrade.py    |  16 ++-
 4 files changed, 410 insertions(+), 61 deletions(-)

-- 
2.5.5


