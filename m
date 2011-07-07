Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QesVI-0000bn-Vq
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 19:36:45 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Jul 2011 10:32:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,494,1304319600"; d="scan'208";a="23980064"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.202])
	by azsmga001.ch.intel.com with ESMTP; 07 Jul 2011 10:32:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 18:32:45 +0100
Message-Id: <cover.1310059749.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/3] QA warning fixes
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
X-List-Received-Date: Thu, 07 Jul 2011 17:36:45 -0000

I found a couple of issues with the recent insane.bbclass changes. The
following patches fix them as well as add a warning fix for something I
noticed when building a kernel with LIRC support.

The following changes since commit f1fc6d084b079dea21ff1a30b815496452042490:

  pulseaudio: add 0.9.23 (2011-07-07 13:44:36 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/qa-dev-deps
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qa-dev-deps

Paul Eggleton (3):
  insane.bbclass: allow dev-deps to be skipped via INSANE_SKIP
  insane.bbclass: fix error/warning status being inverted
  kernel.bbclass: prevent QA warning about kernel-module-lirc-dev

 meta/classes/insane.bbclass |    6 +++---
 meta/classes/kernel.bbclass |    4 ++++
 2 files changed, 7 insertions(+), 3 deletions(-)

-- 
1.7.4.1



