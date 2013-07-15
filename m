Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 210426B19F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 18:17:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jul 2013 11:19:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,670,1367996400"; d="scan'208";a="370607294"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.64])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2013 11:17:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2013 19:17:42 +0100
Message-Id: <cover.1373912179.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/2] A couple more fixes for the libdir QA check
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
X-List-Received-Date: Mon, 15 Jul 2013 18:17:52 -0000


The following changes since commit 43c28375f97161e618fa54349c65be2058c33c53:

  distrodata.bbaclass: change in git and svn package reporting (2013-07-12 10:12:13 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/libdir2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/libdir2

Paul Eggleton (2):
  classes/insane: fix regression in libdir QA regex
  classes/insane: allow libdir QA check to be skipped using INSANE_SKIP

 meta/classes/insane.bbclass | 40 +++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

-- 
1.8.1.2


