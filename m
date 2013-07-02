Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4628D62062
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 14:02:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Jul 2013 07:02:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,980,1363158000"; d="scan'208";a="363530334"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.242])
	by orsmga002.jf.intel.com with ESMTP; 02 Jul 2013 07:02:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2013 15:02:38 +0100
Message-Id: <cover.1372773662.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/3] Fixes for autobuilder failures
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
X-List-Received-Date: Tue, 02 Jul 2013 14:02:57 -0000

Fixes for two build failures showing up on the autobuilder, along with
a resulting improvement for package.bbclass that should let us see the
actual output when debugedit fails if it does so in future.


The following changes since commit ff65497cd9a96d5ab49b16ba1f7e30a216ff4a42:

  classes/insane: remove la2 check which no longer exists from ERROR_QA (2013-06-28 16:33:05 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/fixes2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes2

Paul Eggleton (3):
  rpm: add wrapper for debugedit executable
  classes/package: print command output when commands fail
  ghostscript: fix patch failure with some versions of patch

 meta/classes/package.bbclass                       | 29 +++++++++++-----------
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |  2 +-
 .../ghostscript-9.05-NOT-check-endian.patch        |  4 +--
 3 files changed, 17 insertions(+), 18 deletions(-)

-- 
1.8.1.2


