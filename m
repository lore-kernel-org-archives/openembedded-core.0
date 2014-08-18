Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E4CDC65DB1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 14:21:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Aug 2014 07:22:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,886,1400050800"; d="scan'208";a="560045326"
Received: from sdoherty-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.63])
	by orsmga001.jf.intel.com with ESMTP; 18 Aug 2014 07:21:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Aug 2014 15:21:53 +0100
Message-Id: <cover.1408371675.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/1] sstate task dependency fix
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
X-List-Received-Date: Mon, 18 Aug 2014 14:22:00 -0000

The following change since commit 0300a46a8350cc58b40cfc5887ab04f0b0f5435e:

  site/common-darwin: Really fix common-darwin typo (2014-08-18 10:00:14 +0100)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/sstate
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/sstate

Paul Eggleton (1):
  classes/sstate: ensure do_package_qa_setscene doesn't pull in
    do_package_setscene

 meta/classes/sstate.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
1.9.3


