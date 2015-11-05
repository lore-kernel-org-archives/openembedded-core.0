Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DFF2D60125
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 13:25:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 05 Nov 2015 05:25:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,247,1444719600"; d="scan'208";a="827937547"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2015 05:25:50 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Nov 2015 15:27:11 +0200
Message-Id: <cover.1446729162.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/6] Upgrades: GLib & friends
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
X-List-Received-Date: Thu, 05 Nov 2015 13:25:54 -0000

GLib 2.46 made custem memory allocation functions no-ops: This leads to
a warning "custom memory allocation vtable not supported" on Qemu
startup. This should be a cosmetic issue (as custom allocators didn't
really work before either) and is already fixed in upstream Qemu.


The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/glib-et-al
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/glib-et-al

Jussi Kukkonen (6):
  glib-2.0: Upgrade 2.44.1 -> 2.46.1
  glib-networking: Upgrade 2.44.0 -> 2.46.1
  atk: Upgrade 2.16.0 -> 2.18.0
  atk-spi2-core: Upgrade 2.16.0 -> 2.18.1
  at-spi2-atk: Upgrade 2.16.0 -> 2.18.1
  libsoup-2.4: Upgrade 2.50.0 -> 2.52.1

 ...on-t-depend-on-a-data-file-that-s-not-bui.patch | 38 ++++++++++++++++++++++
 .../{glib-2.0_2.44.1.bb => glib-2.0_2.46.1.bb}     |  5 +--
 ...working_2.44.0.bb => glib-networking_2.46.1.bb} |  4 +--
 ...at-spi2-atk_2.16.0.bb => at-spi2-atk_2.18.1.bb} |  4 +--
 ...-spi2-core_2.16.0.bb => at-spi2-core_2.18.1.bb} |  4 +--
 .../atk/{atk_2.16.0.bb => atk_2.18.0.bb}           |  4 +--
 ...libsoup-2.4_2.50.0.bb => libsoup-2.4_2.52.1.bb} |  6 ++--
 7 files changed, 53 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-Don-t-depend-on-a-data-file-that-s-not-bui.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.44.1.bb => glib-2.0_2.46.1.bb} (78%)
 rename meta/recipes-core/glib-networking/{glib-networking_2.44.0.bb => glib-networking_2.46.1.bb} (88%)
 rename meta/recipes-support/atk/{at-spi2-atk_2.16.0.bb => at-spi2-atk_2.18.1.bb} (82%)
 rename meta/recipes-support/atk/{at-spi2-core_2.16.0.bb => at-spi2-core_2.18.1.bb} (84%)
 rename meta/recipes-support/atk/{atk_2.16.0.bb => atk_2.18.0.bb} (78%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.50.0.bb => libsoup-2.4_2.52.1.bb} (82%)

-- 
2.1.4


