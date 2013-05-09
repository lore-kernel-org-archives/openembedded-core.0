Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UaTwi-00052o-Om
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 18:43:57 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 May 2013 09:24:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,641,1363158000"; d="scan'208";a="300003056"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.169])
	by azsmga001.ch.intel.com with ESMTP; 09 May 2013 09:24:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2013 17:24:24 +0100
Message-Id: <cover.1368116511.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/2] Validate IMAGE_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2013 16:43:58 -0000

The following changes since commit 2253e9f12734c6e6aa489942b5e4628eca1fa29d:

  classes/lib: Fix getcmdstatus breakage (2013-05-09 16:05:02 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/imagefeatures
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/imagefeatures

Paul Eggleton (2):
  classes/image: show an error on invalid IMAGE_FEATURES
  classes/core-image: drop apps-console-core IMAGE_FEATURES support

 meta/classes/core-image.bbclass |  8 --------
 meta/classes/image.bbclass      | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 8 deletions(-)

-- 
1.8.1.2



