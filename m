Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QeWbN-0008VA-QA
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 20:13:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 06 Jul 2011 10:53:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,488,1304319600"; d="scan'208";a="23378464"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.240])
	by azsmga001.ch.intel.com with ESMTP; 06 Jul 2011 10:53:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jul 2011 10:53:26 -0700
Message-Id: <cover.1309974665.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/1] Add uboot 2011.06
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
X-List-Received-Date: Wed, 06 Jul 2011 18:13:34 -0000

This adds the 2011.06 version of uboot 

thanks
	Sau!

The following changes since commit f05b7ee7716d1e5cc1ba0bbab57e91c3a0569e9e:

  x-load: Update to 1.5.0 (2011-07-05 14:16:33 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (1):
  uboot: Add 2011.06 Version

 ...Drop-config.h-include-in-tools-imximage.h.patch |   39 +++++++++
 ...ove-LDSCRIPT-processing-to-the-top-level-.patch |   82 ++++++++++++++++++++
 meta/recipes-bsp/uboot/u-boot-mkimage_2011.06.bb   |   29 +++++++
 meta/recipes-bsp/uboot/u-boot_2011.06.bb           |   26 ++++++
 4 files changed, 176 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch
 create mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
 create mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage_2011.06.bb
 create mode 100644 meta/recipes-bsp/uboot/u-boot_2011.06.bb

-- 
1.7.3.4



