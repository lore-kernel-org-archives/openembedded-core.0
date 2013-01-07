Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1TsFS9-00062y-CX
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 17:21:33 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jan 2013 08:06:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,424,1355126400"; d="scan'208";a="273837593"
Received: from adamian-desktop.rb.intel.com ([10.237.105.141])
	by fmsmga002.fm.intel.com with ESMTP; 07 Jan 2013 08:06:20 -0800
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id 602DC5605D1; Mon,  7 Jan 2013 18:06:49 +0200 (EET)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org, sgw@linux.intel.com,
	richard.purdie@linuxfoundation.org, ross.burton@intel.com
Date: Mon,  7 Jan 2013 18:06:47 +0200
Message-Id: <cover.1357574641.git.alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH v4 0/3] Initial wayland integration
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
X-List-Received-Date: Mon, 07 Jan 2013 16:21:33 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Hi,

I've rebased the patch on top of the latest master.

I have several changes in the patches, in particular on how to select proper dependency versions.
Please review.

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


The following changes since commit b03c4188c8372ae9156a9e6adc7cf66edc76dd16:

  icu: update to upstream version 50.1.1 (2013-01-07 11:09:44 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib adamian/wayland/upstream.1
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=adamian/wayland/upstream.1

Alexandru DAMIAN (3):
  Wayland userspace library initial 1.0.3
  Prepare mesa-dri for weston compatibility
  Initial commit for wayland/weston 1.0.3

 meta/recipes-graphics/mesa/mesa-common.inc     |   10 +++++++-
 meta/recipes-graphics/mesa/mesa-dri.inc        |    1 +
 meta/recipes-graphics/mesa/mesa-dri_git.bb     |    3 +++
 meta/recipes-graphics/wayland/wayland.inc      |   32 ++++++++++++++++++++++++
 meta/recipes-graphics/wayland/wayland_1.0.3.bb |    7 ++++++
 meta/recipes-graphics/wayland/weston.inc       |   23 +++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.0.3.bb  |    9 +++++++
 7 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/wayland/wayland.inc
 create mode 100644 meta/recipes-graphics/wayland/wayland_1.0.3.bb
 create mode 100644 meta/recipes-graphics/wayland/weston.inc
 create mode 100644 meta/recipes-graphics/wayland/weston_1.0.3.bb

-- 
1.7.10.4



