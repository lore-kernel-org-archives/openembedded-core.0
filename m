Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SFWdX-0002qR-7t
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 22:16:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Apr 2012 13:07:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="128736128"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.18])
	by orsmga002.jf.intel.com with ESMTP; 04 Apr 2012 13:07:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2012 21:07:36 +0100
Message-Id: <cover.1333569870.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Fix for self-hosted-image v2
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
X-List-Received-Date: Wed, 04 Apr 2012 20:16:59 -0000

Simplified version of previous patch to decrease reserved space in
ext3 image. It turns out no additional variable really needs to be
introduced into image_types.bbclass, although this does mean running
tune2fs twice.

Note that this patch should be applied on top of Saul's recent
self-hosted-image patch once that is merged.

The following changes since commit 7c794db563cc35f6deaab1dd0fef35015d47e567:

  self-hosted-image: Increase space for build and allow builder user sudo access (2012-04-04 16:16:27 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/self
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/self

Paul Eggleton (1):
  self-hosted-image: decrease reserved space to 0.5%

 meta/recipes-core/images/self-hosted-image.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

-- 
1.7.5.4



