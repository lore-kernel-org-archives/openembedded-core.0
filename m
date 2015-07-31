Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 596D57638A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 09:31:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 31 Jul 2015 02:31:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,583,1432623600"; d="scan'208";a="759091788"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.252.23.101])
	by fmsmga001.fm.intel.com with ESMTP; 31 Jul 2015 02:31:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jul 2015 10:31:33 +0100
Message-Id: <cover.1438335038.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/2] A couple of devtool fixes
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
X-List-Received-Date: Fri, 31 Jul 2015 09:31:38 -0000

Fix bitbake.lock handling in devtool (must be applied after the
bitbake.lock patch just sent to the bitbake list) as well as a
warning fix for the devtool oe-selftest tests.


The following changes since commit 27d068d05239c26a3848eb101571acab54635e37:

  harfbuzz: upgrade to 1.0.1 (2015-07-27 23:28:23 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-bblock-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool-bblock-fix

Paul Eggleton (2):
  devtool: use tinfoil shutdown method
  oe-selftest: devtool: fix teardown warning in
    test_devtool_update_recipe_append

 meta/lib/oeqa/selftest/devtool.py | 1 -
 scripts/devtool                   | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

-- 
2.1.0


