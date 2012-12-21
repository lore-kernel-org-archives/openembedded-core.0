Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1Tm19M-0007OT-SC
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 12:52:25 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 21 Dec 2012 03:37:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,329,1355126400"; d="scan'208";a="183367111"
Received: from adamian-desktop.rb.intel.com ([10.237.105.141])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Dec 2012 03:37:32 -0800
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id A5D1C560A99; Fri, 21 Dec 2012 13:37:37 +0200 (EET)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: ross.burton@intel.com, martin.jansa@gmail.com,
	richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org, sgw@linux.intel.com
Date: Fri, 21 Dec 2012 13:37:35 +0200
Message-Id: <cover.1356089735.git.alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1356021837.git.alexandru.damian@intel.com>
References: <cover.1356021837.git.alexandru.damian@intel.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH v2 0/3] Initial wayland integration
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
X-List-Received-Date: Fri, 21 Dec 2012 11:52:25 -0000

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

The following changes since commit 90c0eb29f0b41e4ac2d3d17ebad7295c2ebdc02a:

  rootfs_rpm.bbclass: remove debug code (2012-12-19 21:43:55 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib adamian/wayland/upstream.2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=adamian/wayland/upstream.1

Alexandru DAMIAN (3):
  Wayland userspace library initial 1.0.3
  Initial commit for wayland/weston 1.0.3
  Prepare mesa-dri for weston compatibility

 meta/recipes-graphics/mesa/mesa-common.inc     |   13 +++++++---
 meta/recipes-graphics/mesa/mesa-dri.inc        |    1 +
 meta/recipes-graphics/wayland/wayland.inc      |   32 ++++++++++++++++++++++++
 meta/recipes-graphics/wayland/wayland_1.0.3.bb |    7 ++++++
 meta/recipes-graphics/wayland/weston.inc       |   23 +++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.0.3.bb  |    9 +++++++
 6 files changed, 82 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/wayland.inc
 create mode 100644 meta/recipes-graphics/wayland/wayland_1.0.3.bb
 create mode 100644 meta/recipes-graphics/wayland/weston.inc
 create mode 100644 meta/recipes-graphics/wayland/weston_1.0.3.bb

-- 
1.7.10.4



