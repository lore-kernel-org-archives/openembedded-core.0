Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9FCD570F06
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 18:54:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Aug 2014 11:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,425,1406617200"; d="scan'208";a="595239738"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga002.jf.intel.com with ESMTP; 29 Aug 2014 11:53:58 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 21:53:42 +0300
Message-Id: <cover.1409338378.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/7] gstreamer1.0 upgrades
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
X-List-Received-Date: Fri, 29 Aug 2014 18:54:55 -0000

The following changes since commit fe2e53ba30ba679c038bd5b48b9a91a41af4c49e:

  bitbake: toaster: create Build methods for calculating progress and ETA (2014-08-29 13:56:50 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/gstreamer1.0_upg
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/gstreamer1.0_upg

Cristian Iorga (7):
  gstreamer1.0: upgrade to 1.4.1
  gstreamer1.0-libav: upgrade to 1.4.1
  gstreamer1.0-plugins-base: upgrade to 1.4.1
  gstreamer1.0-plugins-good: upgrade to 1.4.1
  gstreamer1.0-plugins-bad: upgrade to 1.4.1
  gstreamer1.0-rtsp-server: upgrade to 1.4.1
  gstreamer1.0-plugins-ugly: upgrade to 1.4.1

 .../{gstreamer1.0-libav_1.4.0.bb => gstreamer1.0-libav_1.4.1.bb}     | 4 ++--
 ...mer1.0-plugins-bad_1.4.0.bb => gstreamer1.0-plugins-bad_1.4.1.bb} | 4 ++--
 ...r1.0-plugins-base_1.4.0.bb => gstreamer1.0-plugins-base_1.4.1.bb} | 4 ++--
 ...r1.0-plugins-good_1.4.0.bb => gstreamer1.0-plugins-good_1.4.1.bb} | 5 ++---
 ...r1.0-plugins-ugly_1.4.0.bb => gstreamer1.0-plugins-ugly_1.4.1.bb} | 4 ++--
 ...mer1.0-rtsp-server_1.4.0.bb => gstreamer1.0-rtsp-server_1.4.1.bb} | 4 ++--
 .../gstreamer/{gstreamer1.0_1.4.0.bb => gstreamer1.0_1.4.1.bb}       | 5 ++---
 7 files changed, 14 insertions(+), 16 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.4.0.bb => gstreamer1.0-libav_1.4.1.bb} (89%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.4.0.bb => gstreamer1.0-plugins-bad_1.4.1.bb} (78%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.4.0.bb => gstreamer1.0-plugins-base_1.4.1.bb} (78%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.4.0.bb => gstreamer1.0-plugins-good_1.4.1.bb} (77%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.4.0.bb => gstreamer1.0-plugins-ugly_1.4.1.bb} (66%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.4.0.bb => gstreamer1.0-rtsp-server_1.4.1.bb} (44%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.4.0.bb => gstreamer1.0_1.4.1.bb} (72%)

-- 
1.9.1


