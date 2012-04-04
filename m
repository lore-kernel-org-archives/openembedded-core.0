Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SFSLZ-0001xI-P9
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 17:42:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Apr 2012 08:32:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127032531"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.20])
	by azsmga001.ch.intel.com with ESMTP; 04 Apr 2012 08:32:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2012 16:32:49 +0100
Message-Id: <cover.1333553396.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/2] Fix for self-hosted-image
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
X-List-Received-Date: Wed, 04 Apr 2012 15:42:10 -0000

Allow additional options when running tune2fs -j on ext3 images and use
that to specify -m 0.5 for self-hosted-image.

Note these patches should be applied on top of Saul's recent
self-hosted-image patch once that is merged.

The following changes since commit 7c794db563cc35f6deaab1dd0fef35015d47e567:

  self-hosted-image: Increase space for build and allow builder user sudo access (2012-04-04 16:16:27 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/self
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/self

Paul Eggleton (2):
  classes/image_types: add IMAGE_TUNE2FS_ext3
  self-hosted-image: decrease reserved space to 0.5%

 meta/classes/image_types.bbclass              |    4 +++-
 meta/recipes-core/images/self-hosted-image.bb |    4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
1.7.5.4



