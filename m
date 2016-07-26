Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 69F1860721
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 02:58:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Jul 2016 19:58:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,422,1464678000"; d="scan'208";a="1002452661"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.139.129])
	by orsmga001.jf.intel.com with ESMTP; 25 Jul 2016 19:58:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2016 14:57:48 +1200
Message-Id: <cover.1469501778.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/2] A couple more recipetool fixes
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
X-List-Received-Date: Tue, 26 Jul 2016 02:58:18 -0000

Fix a regression in "recipetool create" introduced by a recent patch of
mine, and add tests to detect if it breaks again in future.

(This is independent of the recipetool patchset I sent yesterday.)


The following changes since commit 0a2df616a5c3316704742f1dcf37b450920e0280:

  boost: fix CVE-2012-2677 (2016-07-21 07:45:01 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/recipetool-fixes5
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/recipetool-fixes5

Paul Eggleton (2):
  recipetool: create: fix greedy regex that broke support for github
    tarballs
  oe-selftest: recipetool: add tests for git URL mangling

 meta/lib/oeqa/selftest/recipetool.py | 43 ++++++++++++++++++++++++++++++++++++
 scripts/lib/recipetool/create.py     |  2 +-
 2 files changed, 44 insertions(+), 1 deletion(-)

-- 
2.5.5


