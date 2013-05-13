Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UbsTR-0002CQ-3K
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 15:07:30 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 May 2013 05:47:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,662,1363158000"; d="scan'208";a="312667941"
Received: from sorvi.fi.intel.com ([10.237.72.154])
	by orsmga001.jf.intel.com with ESMTP; 13 May 2013 05:49:17 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2013 15:49:12 +0300
Message-Id: <1368449357-3191-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH v2 0/5] Enable VPN support in ConnMan
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
X-List-Received-Date: Mon, 13 May 2013 13:07:35 -0000

Hi,

v2:
- removed the DISTRO_FEATURES as suggested by Ross,
  now PACKAGECONFIG is used instead in connman.inc
- all generic vpn files are placed into connman-vpn package
  and vpn plugins rdepend on it

v1:
this patchset enables OpenVPN, vpnc, L2TP and PPTP VPN
technogies in ConnMan and fixes this bug
https://bugzilla.yoctoproject.org/show_bug.cgi?id=4456


Cheers,
Jukka


Jukka Rissanen (5):
  connman: Add VPN support
  connman: Add OpenVPN support
  connman: Add vpnc support
  connman: Add L2TP support
  connman: Add PPTP support

 meta/recipes-connectivity/connman/connman.inc | 88 +++++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 5 deletions(-)

-- 
1.7.11.7



