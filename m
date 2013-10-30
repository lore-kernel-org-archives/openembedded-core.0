Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 190B36B0F9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 15:41:48 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Oct 2013 08:41:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="382310675"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.230])
	by azsmga001.ch.intel.com with ESMTP; 30 Oct 2013 08:41:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Oct 2013 15:41:41 +0000
Message-Id: <cover.1383147565.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/2] A couple of ptest.bbclass fixes
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
X-List-Received-Date: Wed, 30 Oct 2013 15:41:48 -0000

The following changes since commit 58ae94f1b06d0e6234413dbf9869bde85f154c85:

  recipes: Remove PR = r0 from all recipes (2013-10-30 14:51:34 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/ptest
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/ptest

Paul Eggleton (2):
  classes/ptest: do not set EXCLUDE_FROM_WORLD
  classes/ptest: fix quoting

 meta/classes/ptest.bbclass | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

-- 
1.8.1.2


