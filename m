Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D8C57606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 12:16:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 09 Apr 2015 05:16:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,549,1422950400"; d="scan'208";a="706186950"
Received: from heimdall.fi.intel.com ([10.237.72.168])
	by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2015 05:16:25 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 15:15:21 +0300
Message-Id: <cover.1428577515.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/7] Upgrade GTK+3 and dependencies
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
X-List-Received-Date: Thu, 09 Apr 2015 12:16:29 -0000

These upgrades depend on the GLib upgrade (2.44.0) sent earlier by
Robert Yang (in git.openembedded.org/openembedded-core-contrib rbt/PU).

The patchset includes many 'firsts' for me so feedback is welcome.
Things of note:
* virtual/mesa is used as dependency when gtk+3 needs wayland-egl -- is
  this correct?
* The libepoxy recipe is new. Patching the dependency out of GTK+ might
  be possible but epoxy is quite small so I assumed adding a recipe is
  ok.


The following changes since commit 7fb6a6e907e5803597b2e12ba7047c46e57dba26:

  upstream_tracking.inc: Add no-update reason for gdk-pixbuf (2015-04-09 10:01:48 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/update-gtk3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/update-gtk3

Jussi Kukkonen (7):
  glib-networking: Upgrade to 2.44.0
  cairo: Upgrade to 1.14.2
  atk: Upgrade to 2.16.0
  at-spi2-core: Upgrade to 2.16.0
  at-spi2-atk: Upgrade to 2.16.0
  libepoxy: Add as GTK+ 3.16 requirement
  gtk+3: Upgrade to 3.16.0

 .../conf/distro/include/upstream_tracking.inc      |  1 -
 ...working_2.38.0.bb => glib-networking_2.44.0.bb} |  4 +--
 meta/recipes-gnome/gtk+/gtk+3.inc                  | 14 ++++-----
 ...ve-includedir-poisoning-from-configure.ac.patch | 34 ++++++++++++++++++++++
 .../gtk+/gtk+3/fix-flags-for-native.patch          | 33 ---------------------
 .../gtk+/{gtk+3_3.12.2.bb => gtk+3_3.16.0.bb}      |  6 ++--
 .../cairo/{cairo_1.12.18.bb => cairo_1.14.2.bb}    |  4 +--
 meta/recipes-graphics/libepoxy/libepoxy_1.2.bb     | 16 ++++++++++
 ...at-spi2-atk_2.14.1.bb => at-spi2-atk_2.16.0.bb} |  4 +--
 ...-spi2-core_2.14.1.bb => at-spi2-core_2.16.0.bb} |  7 +++--
 .../atk/{atk_2.14.0.bb => atk_2.16.0.bb}           |  4 +--
 11 files changed, 72 insertions(+), 55 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.38.0.bb => glib-networking_2.44.0.bb} (88%)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/Remove-includedir-poisoning-from-configure.ac.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/fix-flags-for-native.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.12.2.bb => gtk+3_3.16.0.bb} (73%)
 rename meta/recipes-graphics/cairo/{cairo_1.12.18.bb => cairo_1.14.2.bb} (92%)
 create mode 100644 meta/recipes-graphics/libepoxy/libepoxy_1.2.bb
 rename meta/recipes-support/atk/{at-spi2-atk_2.14.1.bb => at-spi2-atk_2.16.0.bb} (79%)
 rename meta/recipes-support/atk/{at-spi2-core_2.14.1.bb => at-spi2-core_2.16.0.bb} (68%)
 rename meta/recipes-support/atk/{atk_2.14.0.bb => atk_2.16.0.bb} (79%)

-- 
2.1.4


