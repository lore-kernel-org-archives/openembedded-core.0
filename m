Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D3C26783C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 12:07:32 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Aug 2017 05:07:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,373,1498546800"; d="scan'208";a="139972617"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 14 Aug 2017 05:07:32 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 2B83758035B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 05:07:30 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Aug 2017 15:09:04 +0300
Message-Id: <1502712547-30760-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 0/3] libva: upgrade to 1.8.3
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
X-List-Received-Date: Mon, 14 Aug 2017 12:07:33 -0000

Upgrade libva to version 1.8.3. Utilities and tests in the libva
was spun-off as libva-utils during 1.8.0 release.

After this upgrade, we can remove the workaround patch in gst-player.

This series should be applied after the gstreamer upgrade to 1.12.2
series.

Maxin B. John (3):
  libva-utils: add recipe
  libva: upgrade to 1.8.3
  gst-player: remove workaround which disable visualizations

 ...-configure.ac-Use-wayland-scanner-in-PATH.patch |  37 ---
 ...and-Don-t-commit-and-ship-generated-files.patch | 339 ---------------------
 meta/recipes-graphics/libva/libva-utils_1.8.3.bb   |  30 ++
 .../libva/{libva_1.7.3.bb => libva_1.8.3.bb}       |   8 +-
 .../0001-gtk-play-Disable-visualizations.patch     |  59 ----
 ...error-signal-emission-for-missing-plugins.patch | 252 ---------------
 .../gstreamer/gst-player/Fix-pause-play.patch      | 107 -------
 .../gstreamer/gst-player/filechooser.patch         |  54 ----
 .../recipes-multimedia/gstreamer/gst-player_git.bb |   4 -
 9 files changed, 33 insertions(+), 857 deletions(-)
 delete mode 100644 meta/recipes-graphics/libva/files/0001-configure.ac-Use-wayland-scanner-in-PATH.patch
 delete mode 100644 meta/recipes-graphics/libva/files/0001-wayland-Don-t-commit-and-ship-generated-files.patch
 create mode 100644 meta/recipes-graphics/libva/libva-utils_1.8.3.bb
 rename meta/recipes-graphics/libva/{libva_1.7.3.bb => libva_1.8.3.bb} (88%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/0001-gtk-play-Disable-visualizations.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/Add-error-signal-emission-for-missing-plugins.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/Fix-pause-play.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/filechooser.patch

-- 
2.4.0


