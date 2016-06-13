Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0FB49612E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 04:44:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jun 2016 21:44:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,465,1459839600"; d="scan'208";a="996301585"
Received: from ctan5-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.32])
	by orsmga002.jf.intel.com with ESMTP; 12 Jun 2016 21:44:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2016 16:43:38 +1200
Message-Id: <cover.1465791249.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/3] Minor devtool / recipetool fixes
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
X-List-Received-Date: Mon, 13 Jun 2016 04:44:11 -0000

The following changes since commit 2fdd2c1434e7c741b8048145bd460c68bea7ee53:

  systemtap: add build dependency on ncurses (2016-06-12 23:47:00 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool17-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool17-oe

Paul Eggleton (3):
  devtool: tweak README in created workspace layer
  devtool: reset: allow specifying multiple recipes
  scripts: ensure not specifying subcommand shows help text

 scripts/contrib/devtool-stress.py |  1 +
 scripts/devtool                   | 12 ++++++++----
 scripts/lib/devtool/standard.py   |  9 +++++----
 scripts/recipetool                |  1 +
 4 files changed, 15 insertions(+), 8 deletions(-)

-- 
2.5.5


