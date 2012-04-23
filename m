Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SMR4s-0000JZ-VW
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Apr 2012 23:45:47 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Apr 2012 14:36:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="132996176"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.198.56])
	by orsmga001.jf.intel.com with ESMTP; 23 Apr 2012 14:36:12 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Apr 2012 14:36:08 -0700
Message-Id: <cover.1335216873.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 0/2] Allow Hob to run with sanity checks disabled
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
X-List-Received-Date: Mon, 23 Apr 2012 21:45:47 -0000

Currently sanity check failures prevent Hob from launching, however we want
users to be able to change the various sanity failure causing settings - such
as proxy configuration - from the GUI.

This change and a related set of changes to BitBake allow Hob to start with the
sanity checks disabled and enable them once the GUI is in place to a) report
errors and b) affect settings.

In tandem with an BitBake change fixes [YOCTO #2361].

Regards,

Joshua

The following changes since commit b19af63a201933038a044f29570710fe38365f28:

  self-hosted-image: Update poky revision to point at the 1.2 release branch (2012-04-22 16:07:44 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/hob
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/hob

Joshua Lock (2):
  sanity.bbclass: add variable to disable the sanity checks
  scripts/hob: disable sanity checks when launching

 meta/classes/sanity.bbclass |    2 +-
 scripts/hob                 |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
1.7.7.6



