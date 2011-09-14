Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1R3iHG-0003B8-PO
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 07:44:54 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Sep 2011 22:39:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="48135533"
Received: from unknown (HELO [10.255.14.200]) ([10.255.14.200])
	by orsmga002.jf.intel.com with ESMTP; 13 Sep 2011 22:39:31 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 00:39:20 -0500
Message-ID: <1315978760.26879.1858.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: [PATCH 0/2] Add new recipes for grub2
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
X-List-Received-Date: Wed, 14 Sep 2011 05:44:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This patchset adds a new recipe for grub2 and an accompanying
version of initramfs-live-install for use with it.

It's been boot-tested with the meta-intel BSPs crownbay-noemgd and
sugarbay, and the legacy version (grub-0.97) was tested with emenlow.

A future patch will factor out the common parts of init_install_2.0.sh
with init_install 1.0 - this initial patchset essentially just fixes
what's necessary for YOCTO bug #1428 in order to get things working again.

Tom Zanussi (2):
  grub2: new recipe
  initramfs-live-install: add a version for use with grub2

 meta/recipes-bsp/grub/grub-1.99/40_custom          |    9 +
 .../grub/grub-1.99/grub-install.in.patch           |   13 ++
 meta/recipes-bsp/grub/grub_1.99.bb                 |   44 +++++
 .../initrdscripts/files/init-install_2.0.sh        |  178 ++++++++++++++++++++
 .../initrdscripts/initramfs-live-install_2.0.bb    |   22 +++
 5 files changed, 266 insertions(+), 0 deletions(-)
 create mode 100755 meta/recipes-bsp/grub/grub-1.99/40_custom
 create mode 100644 meta/recipes-bsp/grub/grub-1.99/grub-install.in.patch
 create mode 100644 meta/recipes-bsp/grub/grub_1.99.bb
 create mode 100644 meta/recipes-core/initrdscripts/files/init-install_2.0.sh
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-live-install_2.0.bb





