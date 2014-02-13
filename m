Return-Path: <valentin.popa@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D8DB66EB24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 13:45:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Feb 2014 05:45:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,838,1384329600"; d="scan'208";a="480885819"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.47])
	by fmsmga002.fm.intel.com with ESMTP; 13 Feb 2014 05:45:19 -0800
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2014 15:45:18 +0200
Message-Id: <cover.1392298949.git.valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/2] weston and wayland upgrade to 1.4.0
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
X-List-Received-Date: Thu, 13 Feb 2014 13:45:20 -0000


Note: weston upgrade patch depends on wayland upgrade patch.


The following changes since commit b70a10ca3ee4a0add90d387e2c8288e531aaa47c:

  systemd-serialgetty: Update to match version in recent systemd (2014-02-11 22:59:38 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib vpopa/wayland_and_weston
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=vpopa/wayland_and_weston

Valentin Popa (2):
  wayland: upgrade to 1.4.0
  weston: upgrade to 1.4.0

 .../wayland/wayland/just-scanner.patch             | 21 ++++++++++++---
 .../wayland/{wayland_1.3.0.bb => wayland_1.4.0.bb} |  6 ++---
 ...emove-dependence-on-wayland-scanner-flags.patch | 30 ++++++++++++++++++++++
 .../wayland/{weston_1.3.1.bb => weston_1.4.0.bb}   | 12 ++++-----
 4 files changed, 56 insertions(+), 13 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland_1.3.0.bb => wayland_1.4.0.bb} (87%)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-remove-dependence-on-wayland-scanner-flags.patch
 rename meta/recipes-graphics/wayland/{weston_1.3.1.bb => weston_1.4.0.bb} (89%)

-- 
1.8.3.2


