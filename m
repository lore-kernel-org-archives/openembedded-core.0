Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1R4NVM-0001VS-CL
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 03:46:12 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Sep 2011 18:40:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="48985369"
Received: from unknown (HELO [10.255.14.162]) ([10.255.14.162])
	by orsmga002.jf.intel.com with ESMTP; 15 Sep 2011 18:40:58 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2011 20:40:48 -0500
Message-ID: <1316137248.2384.69.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: [PATCH 0/5] Some RDEPENDS fixes
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
X-List-Received-Date: Fri, 16 Sep 2011 01:46:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In the new grub recipe, I had inadvertently left out the PN
for RDEPENDS.  A search of the rest of the tree showed some
others, which are also updated by this patchset.

Tom Zanussi (5):
  initramfs-live-install: add PN to RDEPENDS
  liberation-fonts_1.04: add PN to RDEPENDS
  liberation-fonts_1.06: add PN to RDEPENDS
  ttf-bitstream-vera_1.10: add PN to RDEPENDS
  grub_1.99: add PN to RDEPENDS

 meta/recipes-bsp/grub/grub_1.99.bb                 |    2 +-
 .../initrdscripts/initramfs-live-install_1.0.bb    |    2 +-
 .../ttf-fonts/liberation-fonts_1.04.bb             |    2 +-
 .../ttf-fonts/liberation-fonts_1.06.bb             |    2 +-
 .../ttf-fonts/ttf-bitstream-vera_1.10.bb           |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)





