Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 96E11731FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 02:15:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 12 Sep 2016 19:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,326,1470726000"; d="scan'208";a="878068064"
Received: from wooi-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.156.68])
	by orsmga003.jf.intel.com with ESMTP; 12 Sep 2016 19:15:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2016 14:15:13 +1200
Message-Id: <cover.1473732817.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH 0/1] Optimisation for eSDK tests
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
X-List-Received-Date: Tue, 13 Sep 2016 02:15:26 -0000

This should reduce the time taken to test the extensible SDK by many
minutes. No doubt there are many other optimisations we could make but
this is a start.


The following changes since commit 4d268abc2fc892c5d34449f78c8e9f2b1a9d6bac:

  oeqa.runtime.smart: work around smart race issues (2016-09-09 12:12:17 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdk-test-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdk-test-fix

Paul Eggleton (1):
  oeqa/sdkext/devtool: use a smaller module to test node.js functionality

 meta/lib/oeqa/sdkext/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.5.5


