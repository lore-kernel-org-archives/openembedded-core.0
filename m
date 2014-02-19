Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CCB006E79B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 14:12:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 19 Feb 2014 06:12:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,505,1389772800"; d="scan'208";a="477667091"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2014 06:11:52 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 16:14:40 +0200
Message-Id: <cover.1392819236.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/8] Various multimedia PUs
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
X-List-Received-Date: Wed, 19 Feb 2014 14:12:02 -0000

The following changes since commit 54562006c1327c5b99daa4cc05a3ba7e38412da1:

  image_types.bbclass: Fix tar IMAGE_CMD to not change directories (2014-02-18 08:38:52 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (8):
  libvorbis: upgrade to 1.3.4
  gstreamer1.0: upgrade to 1.2.3
  gstreamer1.0-plugins-base: upgrade to 1.2.3
  gstreamer1.0-plugins-good: upgrade to 1.2.3
  gstreamer1.0-plugins-ugly: upgrade to 1.2.3
  gstreamer1.0-plugins-bad: upgrade to 1.2.3
  gstreamer1.0-libav: upgrade to 1.2.3
  gstreamer1.0-plugins-good: removed dependency on gconf

 ...amer1.0-libav_1.2.2.bb => gstreamer1.0-libav_1.2.3.bb} |  5 ++---
 ...ins-bad_1.2.2.bb => gstreamer1.0-plugins-bad_1.2.3.bb} |  6 ++----
 ...s-base_1.2.2.bb => gstreamer1.0-plugins-base_1.2.3.bb} |  4 ++--
 .../gstreamer/gstreamer1.0-plugins-good.inc               |  6 ++----
 ...s-good_1.2.2.bb => gstreamer1.0-plugins-good_1.2.3.bb} |  5 ++---
 ...s-ugly_1.2.2.bb => gstreamer1.0-plugins-ugly_1.2.3.bb} |  6 ++----
 .../{gstreamer1.0_1.2.2.bb => gstreamer1.0_1.2.3.bb}      |  4 ++--
 .../libvorbis-1.3.3/obsolete_automake_macros.patch        | 15 ---------------
 .../libvorbis/{libvorbis_1.3.3.bb => libvorbis_1.3.4.bb}  | 14 +++++---------
 9 files changed, 19 insertions(+), 46 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.2.2.bb => gstreamer1.0-libav_1.2.3.bb} (89%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.2.2.bb => gstreamer1.0-plugins-bad_1.2.3.bb} (75%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.2.2.bb => gstreamer1.0-plugins-base_1.2.3.bb} (72%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.2.2.bb => gstreamer1.0-plugins-good_1.2.3.bb} (73%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.2.2.bb => gstreamer1.0-plugins-ugly_1.2.3.bb} (65%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.2.2.bb => gstreamer1.0_1.2.3.bb} (72%)
 delete mode 100644 meta/recipes-multimedia/libvorbis/libvorbis-1.3.3/obsolete_automake_macros.patch
 rename meta/recipes-multimedia/libvorbis/{libvorbis_1.3.3.bb => libvorbis_1.3.4.bb} (66%)

-- 
1.8.3.2


