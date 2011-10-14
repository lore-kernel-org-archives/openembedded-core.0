Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1REiVP-0006CV-SQ
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 16:13:00 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Oct 2011 07:07:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,346,1315206000"; d="scan'208";a="62611686"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.218])
	by azsmga001.ch.intel.com with ESMTP; 14 Oct 2011 07:07:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Oct 2011 15:07:09 +0100
Message-Id: <cover.1318601142.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/2] A couple of bluetooth improvements
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
X-List-Received-Date: Fri, 14 Oct 2011 14:13:00 -0000

The following changes since commit 362512b83775ad7020e5870a594f0e7ca9ef83ba:

  bitbake.conf Exclude MACHINE from MACHINEOVERRIDE variable dependencies (2011-10-14 13:51:14 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/bluetooth
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/bluetooth

Paul Eggleton (2):
  pulseaudio: make bluetooth support conditional upon DISTRO_FEATURES
  bluez4: disable hidd, pand & dund

 meta/recipes-connectivity/bluez/bluez4.inc         |    6 +++---
 meta/recipes-connectivity/bluez/bluez4_4.96.bb     |    2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    5 +++--
 .../pulseaudio/pulseaudio_0.9.22.bb                |    2 +-
 .../pulseaudio/pulseaudio_0.9.23.bb                |    2 +-
 5 files changed, 9 insertions(+), 8 deletions(-)

-- 
1.7.4.1



