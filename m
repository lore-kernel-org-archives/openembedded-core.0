Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R4O7x-0002ur-Th
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 04:26:06 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Sep 2011 19:20:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,391,1312182000"; d="scan'208";a="54273821"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.252])
	by fmsmga002.fm.intel.com with ESMTP; 15 Sep 2011 19:20:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2011 19:20:44 -0700
Message-Id: <cover.1316139554.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [RC2 FIXES 0/6] Some fixes for RC2
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
X-List-Received-Date: Fri, 16 Sep 2011 02:26:06 -0000

Richard,

This request has some fixes from the team for issues found
today, alone with a distro-tracking update.

Thanks
	Sau!

The following changes since commit f7f129b60d33e2758a3a9cc66a98251e1325664d:

  liboil-0.3.17: add upstream Fix-enable-vfp-flag patch (2011-09-15 23:09:26 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sgw/oe-rc2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgw/oe-rc2

Dexuan Cui (1):
  distro-tracking: Update package alias

Saul Wold (1):
  web: Fix SRVREV due to lost commit in web-sato

Tom Zanussi (4):
  liberation-fonts_1.04: add PN to RDEPENDS
  liberation-fonts_1.06: add PN to RDEPENDS
  ttf-bitstream-vera_1.10: add PN to RDEPENDS
  grub_1.99: add PN to RDEPENDS

 .../conf/distro/include/distro_tracking_fields.inc |   11 ++++++++++-
 meta/recipes-bsp/grub/grub_1.99.bb                 |    2 +-
 .../ttf-fonts/liberation-fonts_1.04.bb             |    2 +-
 .../ttf-fonts/liberation-fonts_1.06.bb             |    2 +-
 .../ttf-fonts/ttf-bitstream-vera_1.10.bb           |    2 +-
 meta/recipes-sato/web/web_git.bb                   |    2 +-
 6 files changed, 15 insertions(+), 6 deletions(-)

-- 
1.7.6



