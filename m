Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 91C90607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 08:47:28 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 25 Jul 2016 01:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,418,1464678000"; d="scan'208";a="739333492"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.139.129])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jul 2016 01:47:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2016 20:47:16 +1200
Message-Id: <cover.1469436396.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/2] A couple of recipetool fixes
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
X-List-Received-Date: Mon, 25 Jul 2016 08:47:32 -0000

One bug fix and one improvement for recipetool.


The following changes since commit 0a2df616a5c3316704742f1dcf37b450920e0280:

  boost: fix CVE-2012-2677 (2016-07-21 07:45:01 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/recipetool-fixes4
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/recipetool-fixes4

Paul Eggleton (2):
  lib/oe/recipeutils: fix patch_recipe*() with empty input
  recipetool: record unknown license files

 meta/lib/oe/recipeutils.py       |  2 +-
 scripts/lib/recipetool/create.py | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.5.5


