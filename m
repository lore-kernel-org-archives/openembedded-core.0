Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9624D6012B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 13:24:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jan 2015 05:24:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,486,1418112000"; d="scan'208";a="658602312"
Received: from jamiewei-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.23.125])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jan 2015 05:24:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Jan 2015 13:24:08 +0000
Message-Id: <cover.1422537804.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/1] Fix for race condition building binutils-crosssdk
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
X-List-Received-Date: Thu, 29 Jan 2015 13:24:26 -0000

The following change since commit 2a775ebbb175dd70fc7228607c306d4ccb9e4ba4:

  net-tools: Fix rerunning of do_patch task (2015-01-23 14:32:40 +0000)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/sednative
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/sednative

Paul Eggleton (1):
  sed-native: drop

 meta/classes/populate_sdk_base.bbclass | 2 +-
 meta/recipes-extended/sed/sed_4.1.2.bb | 1 -
 meta/recipes-extended/sed/sed_4.2.2.bb | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

-- 
1.9.3


