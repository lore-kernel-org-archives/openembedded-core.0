Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DFD9176AE2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 13:19:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 21 Oct 2015 06:19:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,712,1437462000"; d="scan'208";a="799108405"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.252.27.125])
	by orsmga001.jf.intel.com with ESMTP; 21 Oct 2015 06:18:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Oct 2015 14:18:49 +0100
Message-Id: <cover.1445433416.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Fix poorly-named invalid-pkgconfig QA check
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
X-List-Received-Date: Wed, 21 Oct 2015 13:19:06 -0000

Late as it is in the release I really think we ought to rename this
now before people start using it in their configuration/recipes.


The following changes since commit 80e2dfbfef2d40c3ab074142deac73317f89e3a2:

  libc-package: Fix localedef multilib dependency issues (2015-10-20 10:11:44 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/invalid-packageconfig
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/invalid-packageconfig

Paul Eggleton (1):
  classes/insane: rename invalid-pkgconfig QA check to
    invalid-packageconfig

 meta/classes/insane.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.1.0


