Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qgd5d-0005J3-Kf
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 15:33:29 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jul 2011 06:29:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,521,1304319600"; d="scan'208";a="26940098"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.183])
	by fmsmga002.fm.intel.com with ESMTP; 12 Jul 2011 06:29:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 14:29:27 +0100
Message-Id: <cover.1310477287.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] kernel module QA warning fixes
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
X-List-Received-Date: Tue, 12 Jul 2011 13:33:29 -0000

The following change since commit e66c2999afa2b3efbce8bb46c89f9db5e15f35c7:

  libx11: ensure nativesdk uses correct DEPENDS and XCB flags (2011-07-10 09:49:06 +0100)

is available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/kernel-insane
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/kernel-insane

Paul Eggleton (1):
  insane.bbclass: skip rdepends QA checks for kernel / modules

 meta/classes/insane.bbclass |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

-- 
1.7.4.1



