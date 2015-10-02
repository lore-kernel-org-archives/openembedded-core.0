Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7B42C770A3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 13:05:16 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 02 Oct 2015 06:05:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,623,1437462000"; d="scan'208";a="656554841"
Received: from amattock-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.24.105])
	by orsmga003.jf.intel.com with ESMTP; 02 Oct 2015 06:05:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Oct 2015 14:05:06 +0100
Message-Id: <cover.1443791083.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/2] A couple of devtool/recipetool fixes
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
X-List-Received-Date: Fri, 02 Oct 2015 13:05:19 -0000

The following changes since commit 6545e402d6411dbd16eae7049a76d47e9a8f996d:

  build-appliance-image: Update to jethro head revision (2015-10-01 17:55:07 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-fixes7
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool-fixes7

Paul Eggleton (2):
  devtool: update-recipe: avoid updating patches that have not changed
  recipetool: create: fix change in path structure if --extract-to path
    exists

 scripts/lib/devtool/standard.py  | 29 ++++++++++++++++++++++++++---
 scripts/lib/recipetool/create.py |  6 ++++++
 2 files changed, 32 insertions(+), 3 deletions(-)

-- 
2.1.0


