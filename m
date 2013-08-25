Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 3D4C060609
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 00:47:05 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Aug 2013 17:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,949,1367996400"; d="scan'208";a="351202352"
Received: from timevans-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.221])
	by azsmga001.ch.intel.com with ESMTP; 24 Aug 2013 17:47:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Aug 2013 01:46:54 +0100
Message-Id: <cover.1377390888.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/1] Support tests in other layers
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
X-List-Received-Date: Sun, 25 Aug 2013 00:47:07 -0000

Completion of an earlier work-in-progress change by Stefan. I had
earlier suggested using a special "tests/runtime" directory in other
layers that wish to add their own tests, but when I looked into it I
figured it was actually a lot simpler if we kept the same structure as
the tests in OE-Core i.e. lib/oeqa/runtime, since sys.path is already
extended in base.bbclass to make that work for all layers; we just
needed to tweak __init__.py in the oeqa/runtime directory to enable
unittest to import units from other layers in that same directory.


The following changes since commit e473e60d5572f36829068f6d3db9ce9ba9633d71:

  mkfontscale: This no longer needs a full libx11, xproto suffices (2013-08-22 18:29:50 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/testimage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/testimage

Stefan Stanacar (1):
  classes/testimage: add support for finding tests in other layers

 meta/classes/testimage.bbclass    | 55 ++++++++++++++++++++++++++++++---------
 meta/lib/oeqa/runtime/__init__.py |  3 +++
 2 files changed, 46 insertions(+), 12 deletions(-)

-- 
1.8.1.2


