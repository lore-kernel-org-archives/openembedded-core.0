Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 7F2556B46D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 15:38:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 02 Aug 2013 08:38:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,802,1367996400"; d="scan'208";a="375219333"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 02 Aug 2013 08:38:18 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2013 18:39:49 +0300
Message-Id: <cover.1375457906.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/7] PUs for telepathy and gstreamer1.0
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
X-List-Received-Date: Fri, 02 Aug 2013 15:38:18 -0000

Upgrade for telepathy stack and gstreamer1.0 stack

The following changes since commit 9de0ad47462c13ac4a2d73e12e92be6c1b4e0415:

  genericx86: ship all the driver firmware by default (2013-07-31 07:00:00 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/work

Cristian Iorga (7):
  telepathy-mission-control: upgrade to v5.15.0
  telepathy-idle: upgrade to v0.1.16
  gstreamer1.0: upgrade to v1.0.9
  gstreamer1.0-plugins-base: upgrade to v1.0.9
  gstreamer1.0-plugins-good: upgrade to v1.0.9
  gstreamer1.0-libav: upgrade to v1.0.9
  gstreamer1.0-plugins-bad: upgrade to v1.0.9

 .../fix-svc-gtk-doc.h-target.patch                                   | 0
 .../telepathy/{telepathy-idle_0.1.14.bb => telepathy-idle_0.1.16.bb} | 5 ++---
 ...mission-control_5.14.0.bb => telepathy-mission-control_5.15.0.bb} | 5 ++---
 .../{gstreamer1.0-libav_1.0.7.bb => gstreamer1.0-libav_1.0.9.bb}     | 5 ++---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc       | 2 --
 ...mer1.0-plugins-bad_1.0.7.bb => gstreamer1.0-plugins-bad_1.0.9.bb} | 4 ++--
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc      | 2 --
 ...r1.0-plugins-base_1.0.7.bb => gstreamer1.0-plugins-base_1.0.9.bb} | 5 ++---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc      | 2 --
 ...r1.0-plugins-good_1.0.7.bb => gstreamer1.0-plugins-good_1.0.9.bb} | 4 ++--
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc                   | 2 --
 .../gstreamer/{gstreamer1.0_1.0.7.bb => gstreamer1.0_1.0.9.bb}       | 4 ++--
 12 files changed, 14 insertions(+), 26 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-idle-0.1.14 => telepathy-idle-0.1.16}/fix-svc-gtk-doc.h-target.patch (100%)
 rename meta/recipes-connectivity/telepathy/{telepathy-idle_0.1.14.bb => telepathy-idle_0.1.16.bb} (82%)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.14.0.bb => telepathy-mission-control_5.15.0.bb} (92%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.0.7.bb => gstreamer1.0-libav_1.0.9.bb} (89%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.0.7.bb => gstreamer1.0-plugins-bad_1.0.9.bb} (75%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.0.7.bb => gstreamer1.0-plugins-base_1.0.9.bb} (72%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.0.7.bb => gstreamer1.0-plugins-good_1.0.9.bb} (73%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.0.7.bb => gstreamer1.0_1.0.9.bb} (72%)

-- 
1.8.1.2


