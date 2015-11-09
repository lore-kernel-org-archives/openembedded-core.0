Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E8BA977150
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 12:41:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 09 Nov 2015 04:41:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,265,1444719600"; d="scan'208";a="846055480"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 09 Nov 2015 04:40:46 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 14:43:56 +0200
Message-Id: <cover.1447072488.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCHv2 0/8] Upgrades: GLib & friends
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
X-List-Received-Date: Mon, 09 Nov 2015 12:41:12 -0000

Changes since V1:
* Backport Qemu patch to remove custom memory allocation functions
  (feature was removed from GLib and results in ugly warning)
* Add a patch to enable more glib tests: Upstream disables some tests
  while cross-compiling but we can keep them enabled

I'm not sure if the last one is worth the trouble: it's in a commit of its
own so you can drop that if it doesn't look good.

 - Jussi



The following changes since commit fc45deac89ef63ca1c44e763c38ced7dfd72cbe1:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:03:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/glib-et-al
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/glib-et-al

Jussi Kukkonen (8):
  qemu: Backport malloc-trace disabling
  glib-2.0: Upgrade 2.44.1 -> 2.46.1
  glib-2.0: Enable more tests while cross-compiling
  glib-networking: Upgrade 2.44.0 -> 2.46.1
  atk: Upgrade 2.16.0 -> 2.18.0
  atk-spi2-core: Upgrade 2.16.0 -> 2.18.1
  at-spi2-atk: Upgrade 2.16.0 -> 2.18.1
  libsoup-2.4: Upgrade 2.50.0 -> 2.52.1

 ...on-t-depend-on-a-data-file-that-s-not-bui.patch | 38 +++++++++
 .../Enable-more-tests-while-cross-compiling.patch  | 79 ++++++++++++++++++
 .../{glib-2.0_2.44.1.bb => glib-2.0_2.46.1.bb}     |  6 +-
 ...working_2.44.0.bb => glib-networking_2.46.1.bb} |  4 +-
 .../qemu/qemu/trace-remove-malloc-tracing.patch    | 97 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb           |  1 +
 ...at-spi2-atk_2.16.0.bb => at-spi2-atk_2.18.1.bb} |  4 +-
 ...-spi2-core_2.16.0.bb => at-spi2-core_2.18.1.bb} |  4 +-
 .../atk/{atk_2.16.0.bb => atk_2.18.0.bb}           |  4 +-
 ...libsoup-2.4_2.50.0.bb => libsoup-2.4_2.52.1.bb} |  6 +-
 10 files changed, 231 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-Don-t-depend-on-a-data-file-that-s-not-bui.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.44.1.bb => glib-2.0_2.46.1.bb} (73%)
 rename meta/recipes-core/glib-networking/{glib-networking_2.44.0.bb => glib-networking_2.46.1.bb} (88%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/trace-remove-malloc-tracing.patch
 rename meta/recipes-support/atk/{at-spi2-atk_2.16.0.bb => at-spi2-atk_2.18.1.bb} (82%)
 rename meta/recipes-support/atk/{at-spi2-core_2.16.0.bb => at-spi2-core_2.18.1.bb} (84%)
 rename meta/recipes-support/atk/{atk_2.16.0.bb => atk_2.18.0.bb} (78%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.50.0.bb => libsoup-2.4_2.52.1.bb} (82%)

-- 
2.1.4


