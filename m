Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TwAfD-0002Ks-RN
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 13:03:25 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Jan 2013 03:47:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,491,1355126400"; d="scan'208";a="245575063"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 18 Jan 2013 03:47:49 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2013 13:48:28 +0200
Message-Id: <cover.1358509450.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH 0/4] Remove gtk-directfb
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
X-List-Received-Date: Fri, 18 Jan 2013 12:03:35 -0000

DirectFB is no longer supported by GTK 3 and even in 2 the backend hasn't worked since 2.18.
This patchset removes gtk-directfb and it creates a simple directfb packagegroup/image.
The following changes since commit 3db277b18b8923daca545aa53bcfbbe9d43d3baa:

  update-rc.d: fix failure on target (2013-01-17 20:16:46 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib cmuscax/gtk-directfb
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=cmuscax/gtk-directfb

Constantin Musca (4):
  packagegroup-core-gtk-directfb: rename to packagegroup-core-directfb
  core-image-gtk-directfb: rename to core-image-directfb
  gtk+: remove directfb support
  cairo: use directfb instead of gtk-directfb

 meta/recipes-gnome/gtk+/gtk+.inc                              |  7 +------
 meta/recipes-gnome/gtk+/gtk+_2.24.14.bb                       |  2 +-
 meta/recipes-graphics/cairo/cairo.inc                         |  4 ++--
 meta/recipes-graphics/cairo/cairo_1.12.8.bb                   |  2 +-
 .../{core-image-gtk-directfb.bb => core-image-directfb.bb}    |  7 +++----
 ...oup-core-gtk-directfb.bb => packagegroup-core-directfb.bb} | 11 ++---------
 6 files changed, 10 insertions(+), 23 deletions(-)
 rename meta/recipes-graphics/images/{core-image-gtk-directfb.bb => core-image-directfb.bb} (78%)
 rename meta/recipes-graphics/packagegroups/{packagegroup-core-gtk-directfb.bb => packagegroup-core-directfb.bb} (49%)

-- 
1.7.11.7



