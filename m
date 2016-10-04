Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 840EF719F9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 07:17:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Oct 2016 00:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,442,1473145200"; d="scan'208";a="1060148183"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 04 Oct 2016 00:17:20 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2016 10:17:12 +0300
Message-Id: <cover.1475565233.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCHv2 0/2] xf86-video-intel: Upgrade to recent git
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Oct 2016 07:17:20 -0000

Changes since v1:
 * Reverted the earlier workaround for gst-player

Original cover letter:

Currently xvideo is broken on skylake because our xf86-video-intel
is way too old (it's the last snapshot but that was 21 months ago).
The problem can be reproduced with gtk-play (select goom visualization
from context menu) or testxvideo from xvideo-tests.

Most distros have moved to a recent git commit already (many have also
started using the modesetting driver instead of xf86-video-intel for
modern intel hardware). Unfortunately we did not do the same earlier
in this release.

I'm not happy to send a change like this at this point of the release
but backporting the xvideo fix alone does not seem feasible. I've done
my usual smoke testing for graphics changes but this of course affects
all Intel graphics hardware, most of which I can't test with.

Thanks,
  Jussi


The following changes since commit 3a73fe0efcb7aeefcca7011bba887caad03d4d03:

  beaglebone.conf: produce wic images for Beaglebone (2016-10-01 21:45:57 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/xf86-video-intel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/xf86-video-intel

Jussi Kukkonen (2):
  xf86-video-intel: Upgrade to recent git
  Revert "gst-player: Disable visualizations"

 .../0001-gen8-Fix-the-YUV-RGB-shader.patch         | 65 --------------------
 ...-call-to-PixmapSyncDirtyHelper-broken-by-.patch | 30 ----------
 .../xf86-video-intel/disable-x11-dri3.patch        |  6 +-
 ...-against-ABI-breakage-in-recent-versions-.patch | 70 ----------------------
 .../xorg-driver/xf86-video-intel/udev-fstat.patch  | 59 ------------------
 ...o-intel_2.99.917.bb => xf86-video-intel_git.bb} | 13 ++--
 .../0001-Disable-visualizations-by-default.patch   | 36 -----------
 .../recipes-multimedia/gstreamer/gst-player_git.bb |  1 -
 8 files changed, 10 insertions(+), 270 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-gen8-Fix-the-YUV-RGB-shader.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-uxa-fix-the-call-to-PixmapSyncDirtyHelper-broken-by-.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/sna-Protect-against-ABI-breakage-in-recent-versions-.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/udev-fstat.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.99.917.bb => xf86-video-intel_git.bb} (81%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/0001-Disable-visualizations-by-default.patch

-- 
2.1.4


