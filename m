Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1Tn51y-00010G-I5
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 11:13:16 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Dec 2012 01:57:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,346,1355126400"; d="scan'208";a="238429584"
Received: from adamian-desktop.rb.intel.com ([10.237.105.141])
	by orsmga001.jf.intel.com with ESMTP; 24 Dec 2012 01:57:08 -0800
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id 82365560516; Mon, 24 Dec 2012 11:57:21 +0200 (EET)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org, sgw@linux.intel.com,
	richard.purdie@linuxfoundation.org, ross.burton@intel.com
Date: Mon, 24 Dec 2012 11:57:19 +0200
Message-Id: <cover.1356342794.git.alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 0/3] Initial wayland integration
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
X-List-Received-Date: Mon, 24 Dec 2012 10:13:17 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Hi,

This is a set of patches that integrate Wayland/Weston 1.0.3 into mainline.

All library dependencies are satisfied, and Weston works under X11 and DRM.

A user must install separately (no hard dependency) the hardware DRM drivers
to be able to run weston on barebone hardware. Hardware drivers built-in
are the swrast, i915 and i965 (i965 is tested on real hardware).

There is no default integration in any distro, the packages may be installed
through the package manager.

Further improvements will include a wrapper script for weston and integration
in the distro features.

Documentation will be available on wiki, and announced here.

The following changes since commit 90c0eb29f0b41e4ac2d3d17ebad7295c2ebdc02a:

  rootfs_rpm.bbclass: remove debug code (2012-12-19 21:43:55 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib adamian/wayland/upstream.4
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=adamian/wayland/upstream.4

Alexandru DAMIAN (3):
  Wayland userspace library initial 1.0.3
  Prepare mesa-dri for weston compatibility
  Initial commit for wayland/weston 1.0.3

 meta/recipes-graphics/mesa/mesa-common.inc     |   10 +++++++-
 meta/recipes-graphics/mesa/mesa-dri.inc        |    1 +
 meta/recipes-graphics/wayland/wayland.inc      |   32 ++++++++++++++++++++++++
 meta/recipes-graphics/wayland/wayland_1.0.3.bb |    7 ++++++
 meta/recipes-graphics/wayland/weston.inc       |   23 +++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.0.3.bb  |    9 +++++++
 6 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/wayland/wayland.inc
 create mode 100644 meta/recipes-graphics/wayland/wayland_1.0.3.bb
 create mode 100644 meta/recipes-graphics/wayland/weston.inc
 create mode 100644 meta/recipes-graphics/wayland/weston_1.0.3.bb

-- 
1.7.10.4



