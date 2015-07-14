Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EDCE775F1C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 21:56:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 14 Jul 2015 14:56:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,475,1432623600"; d="scan'208";a="606232583"
Received: from fgalanel-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.60])
	by orsmga003.jf.intel.com with ESMTP; 14 Jul 2015 14:56:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 22:55:59 +0100
Message-Id: <cover.1436910107.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Fix for recipetool appendfile
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
X-List-Received-Date: Tue, 14 Jul 2015 21:56:12 -0000

The following changes since commit 6be698b7270f73f40d38713ecf13f12aec0ced61:

  dpkg: Fix for Fedora22 and new versions of tar (2015-07-13 13:46:45 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/recipetool-selftest-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/recipetool-selftest-fix

Paul Eggleton (1):
  lib/oe/recipeutils: fix replace_dir_vars to return the correct
    variables

 meta/lib/oe/recipeutils.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.1.0


