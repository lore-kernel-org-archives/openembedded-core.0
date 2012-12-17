Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Tka6R-000879-O7
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 13:47:29 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Dec 2012 04:31:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,300,1355126400"; d="scan'208";a="235056369"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 17 Dec 2012 04:32:45 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 14:32:41 +0200
Message-Id: <1355747563-17504-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] add native wrappers for gconftool-2 and gtk-update-icon-cache
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
X-List-Received-Date: Mon, 17 Dec 2012 12:47:29 -0000

Hi,

This patchset will fix do_rootfs errors/warnings when gtk+-native and gconf-native
packages are fetched from an sstate cache located on a remote build machine. In
this case, gconf backend directory and gdk-pixbuf loaders.cache file will still
have a path pointing to the STAGING_DIR_NATIVE of the remote machine.

Thanks,
Laurentiu

Laurentiu Palcu (2):
  gconf: add gconftool-2 native wrapper
  gtk+-native: add gtk-update-icon-cache wrapper

 meta/classes/gconf.bbclass              |    1 -
 meta/recipes-gnome/gnome/gconf_3.2.3.bb |    7 ++++++-
 meta/recipes-gnome/gtk+/gtk+_2.24.13.bb |    5 +++++
 3 files changed, 11 insertions(+), 2 deletions(-)

-- 
1.7.9.5



