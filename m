Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 45B4265CFD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 08:51:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2014 01:51:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,949,1389772800"; d="scan'208";a="531450487"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2014 01:51:12 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 11:54:21 +0300
Message-Id: <cover.1398761629.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/7] Various comms and multimedia PUs
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
X-List-Received-Date: Tue, 29 Apr 2014 08:51:12 -0000

The following changes since commit 183dac4036cb73ad6cc620002b0044d3484a398d:

  bitbake: Revert "fetch2: Cleanup file checksum generation" (2014-04-28 12:54:06 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (7):
  telepathy-glib: upgrade to 0.24.0
  gstreamer1.0: upgrade to 1.2.4
  gstreamer1.0-libav: upgrade to 1.2.4
  gstreamer1.0-plugins-base: upgrade to 1.2.4
  gstreamer1.0-plugins-good: upgrade to 1.2.4
  gstreamer1.0-plugins-bad: upgrade to 1.2.4
  gstreamer1.0-plugins-ugly: upgrade to 1.2.4

 .../telepathy/{telepathy-glib_0.23.2.bb => telepathy-glib_0.24.0.bb}  | 4 ++--
 .../{gstreamer1.0-libav_1.2.3.bb => gstreamer1.0-libav_1.2.4.bb}      | 4 ++--
 ...amer1.0-plugins-bad_1.2.3.bb => gstreamer1.0-plugins-bad_1.2.4.bb} | 4 ++--
 ...er1.0-plugins-base_1.2.3.bb => gstreamer1.0-plugins-base_1.2.4.bb} | 4 ++--
 ...er1.0-plugins-good_1.2.3.bb => gstreamer1.0-plugins-good_1.2.4.bb} | 4 ++--
 ...er1.0-plugins-ugly_1.2.3.bb => gstreamer1.0-plugins-ugly_1.2.4.bb} | 4 ++--
 .../gstreamer/{gstreamer1.0_1.2.3.bb => gstreamer1.0_1.2.4.bb}        | 4 ++--
 7 files changed, 14 insertions(+), 14 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.23.2.bb => telepathy-glib_0.24.0.bb} (80%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.2.3.bb => gstreamer1.0-libav_1.2.4.bb} (89%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.2.3.bb => gstreamer1.0-plugins-bad_1.2.4.bb} (75%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.2.3.bb => gstreamer1.0-plugins-base_1.2.4.bb} (72%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.2.3.bb => gstreamer1.0-plugins-good_1.2.4.bb} (73%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.2.3.bb => gstreamer1.0-plugins-ugly_1.2.4.bb} (66%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.2.3.bb => gstreamer1.0_1.2.4.bb} (72%)

-- 
1.9.1


