Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3399F65CBC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:32:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 20 Aug 2015 01:32:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="787609097"
Received: from ljegan-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.54])
	by orsmga002.jf.intel.com with ESMTP; 20 Aug 2015 01:32:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 09:31:54 +0100
Message-Id: <cover.1440059460.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/5] Misc fixes
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
X-List-Received-Date: Thu, 20 Aug 2015 08:32:08 -0000

Generally I prefer to avoid lumping a bunch of unrelated fixes together,
but I've been hanging onto these for a couple of weeks now and I'm not
sure when I'll have any related changes to send them with, so here they
are now.


The following changes since commit c38acd720b3f6ffbeb544063692eb471dada8593:

  binconfig-disabled: write an message to stderr to help confused developers (2015-08-19 17:57:58 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/oecore-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/oecore-fixes

Paul Eggleton (5):
  scripts/create-recipe: drop
  classes/insane: fix QA check message referring to nativesdk
  oe-selftest: replace assertTrue(False, ...) with fail(...)
  hello-mod: drop PV and PR
  service: tweak example recipe

 .../recipes-kernel/hello-mod/hello-mod_0.1.bb      |    3 -
 .../recipes-skeleton/service/service_0.1.bb        |    7 +-
 meta/classes/insane.bbclass                        |    2 +-
 meta/lib/oeqa/selftest/devtool.py                  |    2 +-
 meta/lib/oeqa/selftest/recipetool.py               |    4 +-
 scripts/create-recipe                              | 2071 --------------------
 6 files changed, 7 insertions(+), 2082 deletions(-)
 delete mode 100755 scripts/create-recipe

-- 
2.1.0


