Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C9F9B7300D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 12:47:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Feb 2017 04:47:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,197,1484035200"; d="scan'208";a="1114611034"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2017 04:47:16 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 7D32E6A4004;
	Thu, 23 Feb 2017 04:47:15 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2017 14:47:13 +0200
Message-Id: <cover.1487853010.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] Upgrades for a few git recipes
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
X-List-Received-Date: Thu, 23 Feb 2017 12:47:15 -0000

Fairly innocent looking git revision upgrades for recipes whose
upstreams do not make releases for one reason or another.

Thanks,
 Jussi

The following changes since commit e436a6398684d2872cb541f1cfb0f67b3618d15a:

  layer.conf: bump version for change in eSDK selftest behaviour (2017-02-19 09:39:03 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/git-upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/git-upgrades

Jussi Kukkonen (3):
  xf86-video-intel: Upgrade to recent git revision
  gst-player: Upgrade to recent git revision
  x264: Upgrade to stable branch head

 .../xorg-driver/xf86-video-intel_git.bb            |  2 +-
 ...ovide-similar-behaviour-for-quit-and-clos.patch | 32 ----------------------
 .../recipes-multimedia/gstreamer/gst-player_git.bb |  3 +-
 meta/recipes-multimedia/x264/x264_git.bb           |  4 +--
 4 files changed, 4 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/0001-gtk-play-provide-similar-behaviour-for-quit-and-clos.patch

-- 
2.1.4


