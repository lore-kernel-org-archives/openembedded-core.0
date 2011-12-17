Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RbvfZ-0006JR-JA
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Dec 2011 15:55:25 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Dec 2011 06:48:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="88495298"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga002.jf.intel.com with ESMTP; 17 Dec 2011 06:48:23 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Dec 2011 23:00:13 +0800
Message-Id: <cover.1324132972.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] Create a script for SUMMARY audit in recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Dec 2011 14:55:25 -0000

Here is the script to check which recipe provides SUMMARY and which doesnot.
For those which do not, maintainer should add or update to a meaningful summary for HOB to display in description.

The following changes since commit b281fd127bac9ba77ab63a5c2b812ddd5d56df37:

  documentation/poky-ref-manual/technical-details.xml: edits per Richard Purdie (2011-12-16 16:58:41 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib shane/summary-audit
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=shane/summary-audit

Shane Wang (1):
  Create a script for SUMMARY audit in recipes

 scripts/contrib/summary-audit.sh |   53 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 53 insertions(+), 0 deletions(-)
 create mode 100755 scripts/contrib/summary-audit.sh

-- 
1.7.6



