Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1R3uX3-0000OL-GZ
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 20:50:01 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 Sep 2011 11:44:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,382,1312182000"; d="scan'208";a="51387534"
Received: from unknown (HELO [10.255.14.200]) ([10.255.14.200])
	by fmsmga001.fm.intel.com with ESMTP; 14 Sep 2011 11:44:33 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 Sep 2011 13:44:24 -0500
Message-ID: <1316025864.26879.2583.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: [PATCH 0/2] Add new recipes for grub2 [v4]
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
X-List-Received-Date: Wed, 14 Sep 2011 18:50:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This patchset adds a new recipe for grub2 and an accompanying
changes to initramfs-live-install.

It's been preliminarily boot-tested with the meta-intel BSPs emenlow,
and the legacy version (grub-0.97) was also tested with emenlow.

v4 changes:

Suggestions from Otavio Salvador and Saul Wold to add more info to
the patch header.

v3 changes:

Suggestions from Otavio Salvador to update copyright and add a patch
header.

v2 changes:

Suggestions from Otavio Salvador to remove any distro-specific text
and avoid duplicate scripts.


Tom Zanussi (2):
  grub2: new recipe
  initramfs-live-install: add support for grub2

 meta/recipes-bsp/grub/grub-1.99/40_custom          |    9 ++++
 .../grub/grub-1.99/grub-install.in.patch           |   20 +++++++++
 meta/recipes-bsp/grub/grub_1.99.bb                 |   44 ++++++++++++++++++++
 .../initrdscripts/files/init-install.sh            |   31 +++++++++++---
 .../initrdscripts/initramfs-live-install_1.0.bb    |    8 +--
 5 files changed, 101 insertions(+), 11 deletions(-)
 create mode 100755 meta/recipes-bsp/grub/grub-1.99/40_custom
 create mode 100644 meta/recipes-bsp/grub/grub-1.99/grub-install.in.patch
 create mode 100644 meta/recipes-bsp/grub/grub_1.99.bb





