Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SXqIm-0003WZ-TR
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 10:55:17 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 25 May 2012 01:45:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104189494"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.104.69])
	by AZSMGA002.ch.intel.com with ESMTP; 25 May 2012 01:45:02 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2012 11:50:54 +0300
Message-Id: <cover.1337868781.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/3] Package Updates
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
X-List-Received-Date: Fri, 25 May 2012 08:55:17 -0000

This patchset updates dbus, mtd-utils and foomatic-filters.

The following changes since commit 0f795f81fe5ad3ef78c21a177eca90fbc8810f81:

  qemu: disable vnc-jpeg compression (2012-05-24 08:53:40 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rmoisan/updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/updates

Radu Moisan (3):
  foomatic-filters: update to version 4.0.15
  mtd-utils: Update to version 1.5.0
  dbus: Update to version 1.5.12

 .../dbus/{dbus-1.4.16 => dbus-1.5.12}/dbus-1.init  |    0
 .../dbus/{dbus-1.4.16 => dbus-1.5.12}/tmpdir.patch |    0
 meta/recipes-core/dbus/dbus_1.4.16.bb              |    7 -------
 meta/recipes-core/dbus/dbus_1.5.12.bb              |    7 +++++++
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
 .../mtd/{mtd-utils_1.4.9.bb => mtd-utils_1.5.0.bb} |    2 +-
 ...filters_4.0.7.bb => foomatic-filters_4.0.15.bb} |    6 +++---
 7 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-core/dbus/{dbus-1.4.16 => dbus-1.5.12}/dbus-1.init (100%)
 rename meta/recipes-core/dbus/{dbus-1.4.16 => dbus-1.5.12}/tmpdir.patch (100%)
 delete mode 100644 meta/recipes-core/dbus/dbus_1.4.16.bb
 create mode 100644 meta/recipes-core/dbus/dbus_1.5.12.bb
 rename meta/recipes-devtools/mtd/{mtd-utils-1.4.9 => mtd-utils-1.5.0}/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils_1.4.9.bb => mtd-utils_1.5.0.bb} (98%)
 rename meta/recipes-extended/foomatic/{foomatic-filters_4.0.7.bb => foomatic-filters_4.0.15.bb} (90%)

-- 
1.7.9.5



