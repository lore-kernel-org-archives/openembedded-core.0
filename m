Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U38Ec-00050a-Gh
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 17:52:36 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 06 Feb 2013 08:36:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,616,1355126400"; d="scan'208";a="253404648"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 06 Feb 2013 08:36:38 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Feb 2013 18:36:25 +0200
Message-Id: <cover.1360166922.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/6] Yet another patchset with postinstall fixes
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
X-List-Received-Date: Wed, 06 Feb 2013 16:52:43 -0000
X-List-Received-Date: Wed, 06 Feb 2013 16:52:43 -0000

Hi all,

This patchset contains postinstall fixes for:
 * gtk+ immodules packages
 * librsvg
 * gnome-keyring

Thanks,
Laurentiu

The following changes since commit 2180cc32b9a6d434c319292c1a636fb8e4d23899:

  initiscripts: Fix populate-volatiles.sh whitespace (2013-02-06 14:44:49 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/postinst_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/postinst_fixes

Laurentiu Palcu (6):
  Add pixbufcache class
  gdk-pixbuf: use the new pixbufcache class
  librsvg: use the new pixbufcache class
  gtk-immodules-cache: add weak asignment for GTKIMMODULES_PACKAGES
  gtk+: use gtk-immodules-cache class
  gnome-keyring: compile schemas on host

 meta/classes/gtk-immodules-cache.bbclass           |    2 +
 meta/classes/pixbufcache.bbclass                   |   57 ++++++++++++++++++++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb |   48 ++---------------
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |   12 +----
 meta/recipes-gnome/gtk+/gtk+.inc                   |    8 +--
 meta/recipes-gnome/gtk+/gtk+3_3.4.4.bb             |   12 +----
 meta/recipes-gnome/gtk+/gtk+_2.24.14.bb            |    4 +-
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |   21 ++------
 8 files changed, 72 insertions(+), 92 deletions(-)
 create mode 100644 meta/classes/pixbufcache.bbclass

-- 
1.7.9.5



