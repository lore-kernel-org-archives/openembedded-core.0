Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1U7QQF-0007ji-W4
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 14:06:20 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Feb 2013 04:50:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,687,1355126400"; d="scan'208";a="292587489"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 18 Feb 2013 04:50:08 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2013 14:50:28 +0200
Message-Id: <1361191830-19106-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/2] pulseaudio upgrade to 3.0, with BT support
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
X-List-Received-Date: Mon, 18 Feb 2013 13:06:24 -0000

- pulseaudio upgrade to 3.0
- pulseaudio 3.0 depends on bluez and sbc for Bluetooth support
- new sbc package added

Cristian Iorga (2):
  sbc: SBC audio codec
  pulseaudio: upgrade to 3.0

 meta/recipes-multimedia/pulseaudio/pulseaudio.inc    |    4 +++-
 .../{pulseaudio_2.1.bb => pulseaudio_3.0.bb}         |    9 ++++-----
 meta/recipes-multimedia/sbc/sbc_1.0.bb               |   18 ++++++++++++++++++
 3 files changed, 25 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_2.1.bb => pulseaudio_3.0.bb} (62%)
 create mode 100644 meta/recipes-multimedia/sbc/sbc_1.0.bb

-- 
1.7.10.4



