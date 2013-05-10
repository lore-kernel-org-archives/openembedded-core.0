Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UamoH-0004yp-FG
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 14:52:58 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 May 2013 05:33:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,647,1363158000"; d="scan'208";a="331933720"
Received: from sorvi.fi.intel.com ([10.237.72.154])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2013 05:33:19 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 15:33:13 +0300
Message-Id: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH 0/5] Enable VPN support in ConnMan
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
X-List-Received-Date: Fri, 10 May 2013 12:53:02 -0000

Hi,

this patchset enables OpenVPN, vpnc, L2TP and PPTP VPN
technogies in ConnMan and fixes this bug
https://bugzilla.yoctoproject.org/show_bug.cgi?id=4456

The VPN support is activated if DISTRO_FEATURES contains
vpn string.

Cheers,
Jukka


Jukka Rissanen (5):
  connman: Enable VPN support
  connman: Add OpenVPN support
  connman: Add vpnc support
  connman: Add L2TP support
  connman: Add PPTP support

 meta/recipes-connectivity/connman/connman.inc | 42 +++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

-- 
1.7.11.7



