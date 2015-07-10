Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CF850607BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 13:56:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 10 Jul 2015 06:56:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,446,1432623600"; d="scan'208";a="726451501"
Received: from dawalker-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.7.62])
	by orsmga001.jf.intel.com with ESMTP; 10 Jul 2015 06:56:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jul 2015 14:56:02 +0100
Message-Id: <cover.1436536403.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Shell message function support (OE-Core side)
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
X-List-Received-Date: Fri, 10 Jul 2015 13:56:08 -0000

I'm finally sending out the patches to support the output of bbwarn, 
bberror etc. actually going to the console. This is the OE-Core side
of the changes to implement it (changes are also required to BitBake,
the patch for which has been sent to the bitbake-devel list).


The following changes since commit 18cc6d2ec4dc289bb0333dddc96df5a645ea53d0:

  wic: Set default set of bitbake variables (2015-07-10 13:34:50 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/oecore-shell-logging
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/oecore-shell-logging

Paul Eggleton (1):
  classes/logging: make shell message functions output to the console

 meta/classes/logging.bbclass | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

-- 
2.1.0


