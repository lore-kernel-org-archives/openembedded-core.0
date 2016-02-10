Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F2DCC6FFC8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 12:45:51 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2016 04:45:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,425,1449561600"; d="scan'208";a="45548506"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 10 Feb 2016 04:45:51 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 14:42:38 +0200
Message-Id: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 0/7] Version updates
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
X-List-Received-Date: Wed, 10 Feb 2016 12:45:52 -0000

A few version updates and fixes that have piled up.
The following changes since commit 7d5d8d0cd985edf507c8d00e2e162d1b9fff3589:

  scripts/lib/bsp/engine: trailing whitespace cleanup (2016-02-08 10:54:56 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (7):
  ffmpeg: update to 2.8.6
  gstreamer1.0: fix upstream check for unstable versions from git
  bash-completion: fix upstream version check
  iso-codes: update to 3.65
  libwnck3: update to 3.14.1
  webkitgtk: update to 2.10.7
  pixz: fix upstream version check

 meta/recipes-extended/pixz/pixz_1.0.6.bb                          | 1 +
 .../libwnck/{libwnck3_3.14.0.bb => libwnck3_3.14.1.bb}            | 4 ++--
 .../ffmpeg/{ffmpeg_2.8.5.bb => ffmpeg_2.8.6.bb}                   | 8 ++++----
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb       | 1 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb | 1 +
 .../recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb | 1 +
 .../recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb | 1 +
 .../recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb | 1 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb             | 1 +
 .../webkit/{webkitgtk_2.10.5.bb => webkitgtk_2.10.7.bb}           | 4 ++--
 meta/recipes-support/bash-completion/bash-completion_2.1.bb       | 1 +
 .../iso-codes/{iso-codes_3.64.bb => iso-codes_3.65.bb}            | 4 ++--
 12 files changed, 18 insertions(+), 10 deletions(-)
 rename meta/recipes-gnome/libwnck/{libwnck3_3.14.0.bb => libwnck3_3.14.1.bb} (77%)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_2.8.5.bb => ffmpeg_2.8.6.bb} (94%)
 rename meta/recipes-sato/webkit/{webkitgtk_2.10.5.bb => webkitgtk_2.10.7.bb} (96%)
 rename meta/recipes-support/iso-codes/{iso-codes_3.64.bb => iso-codes_3.65.bb} (76%)

-- 
2.7.0


