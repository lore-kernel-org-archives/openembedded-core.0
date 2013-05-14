Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UcAbT-0003Zj-QV
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 10:29:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 May 2013 01:10:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,667,1363158000"; d="scan'208";a="302127691"
Received: from sorvi.fi.intel.com ([10.237.72.154])
	by azsmga001.ch.intel.com with ESMTP; 14 May 2013 01:10:46 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2013 11:10:40 +0300
Message-Id: <1368519045-8266-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH v3 0/5] Enable VPN support in ConnMan
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
X-List-Received-Date: Tue, 14 May 2013 08:29:42 -0000
X-List-Received-Date: Tue, 14 May 2013 08:29:42 -0000

Hi,

This v3 fixes following issues noticed by Phil Blundell.
Thanks for comments Phil!

v3:
- removed do_install_append_${PN}-vpn() as it is useless here
- refactored populate_packages_prepend(), now the RDEPENDS are
  created in lambda function
- added INSANE_SKIP_<pkg> setting in populate_packages_prepend()
- patch no longer touches FILES_${PN}

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

 meta/recipes-connectivity/connman/connman.inc | 88 ++++++++++++++++++++++++---
 1 file changed, 78 insertions(+), 10 deletions(-)

-- 
1.7.11.7



