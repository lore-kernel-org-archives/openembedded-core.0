Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6DD576FFC7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:59:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Mar 2016 12:59:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,332,1455004800"; d="scan'208";a="909365468"
Received: from jschew-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.169.99])
	by orsmga001.jf.intel.com with ESMTP; 13 Mar 2016 12:59:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Mar 2016 08:59:02 +1300
Message-Id: <cover.1457899086.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/1] Fix recipetool issue highlighted by oe-selftest test
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
X-List-Received-Date: Sun, 13 Mar 2016 19:59:30 -0000

The following changes since commit 4be0e15f74cff85edca9de55248939fb438f30ae:

  oeqa/selftest/recipetool: Fix test_recipetool_create_simple (2016-03-13 18:15:41 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/recipetool-selftest-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/recipetool-selftest-fix

Paul Eggleton (1):
  recipetool: create: don't create extra files directory unconditionally

 meta/lib/oeqa/selftest/recipetool.py |  6 ++++--
 scripts/lib/recipetool/create.py     | 15 ++++++++-------
 2 files changed, 12 insertions(+), 9 deletions(-)

-- 
2.5.0


