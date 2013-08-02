Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 4B9496B0D8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 15:27:46 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Aug 2013 08:27:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,802,1367996400"; d="scan'208";a="276851358"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Aug 2013 08:27:45 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2013 18:29:18 +0300
Message-Id: <1375457365-19847-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/7] Upgrades for telepathy stack and GStreamer 1.0 stack
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
X-List-Received-Date: Fri, 02 Aug 2013 15:27:46 -0000

Upgrades for telepathy stack and GStreamer 1.0 stack

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


