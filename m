Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 52ACC731CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 13:35:40 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2016 05:35:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,373,1477983600"; d="scan'208";a="44181033"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 19 Dec 2016 05:35:42 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 525686A4080;
	Mon, 19 Dec 2016 05:34:53 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 15:35:32 +0200
Message-Id: <cover.1482154012.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/8] Small upgrades around the GNOME stack
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
X-List-Received-Date: Mon, 19 Dec 2016 13:35:41 -0000


The following changes since commit d0d260b0b85790ceb136dd6b0445e8e33d038f5e:

  u-boot/beaglebone: Select Beaglebone Black target specifically. (2016-12-17 09:57:37 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/gtk-etc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/gtk-etc

Jussi Kukkonen (8):
  gtk+3: Upgrade 3.22.1 -> 3.22.5
  gsettings-desktop-schemas: Upgrade 3.20.0 -> 3.22.0
  glib-2.0: Upgrade 2.50.1 -> 2.50.2
  gdk-pixbuf: Upgrade 2.36.0 -> 2.36.1
  cairo: Upgrade 1.14.6 -> 1.14.8
  clutter-gst-3.0: Upgrade 3.0.20 -> 3.0.22
  cogl-1.0: Upgrade 1.22.0 -> 1.22.2
  mirrors.bbclass: Fix gnutls mirror directory

 meta/classes/mirrors.bbclass                       |  2 +-
 .../{glib-2.0_2.50.1.bb => glib-2.0_2.50.2.bb}     |  4 +--
 .../{gdk-pixbuf_2.36.0.bb => gdk-pixbuf_2.36.1.bb} |  8 ++++--
 ...20.0.bb => gsettings-desktop-schemas_3.22.0.bb} |  4 +--
 .../gtk+/{gtk+3_3.22.1.bb => gtk+3_3.22.5.bb}      |  4 +--
 ...e_3.22.1.bb => gtk-icon-utils-native_3.22.5.bb} |  4 +--
 .../cairo/{cairo_1.14.6.bb => cairo_1.14.8.bb}     |  4 +--
 ...gst-3.0_3.0.20.bb => clutter-gst-3.0_3.0.22.bb} |  4 +--
 ...Fix-an-incorrect-preprocessor-conditional.patch | 32 ++++++++++++++++++++++
 meta/recipes-graphics/cogl/cogl-1.0_1.22.0.bb      |  7 -----
 meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb      |  8 ++++++
 11 files changed, 58 insertions(+), 23 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.50.1.bb => glib-2.0_2.50.2.bb} (86%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.36.0.bb => gdk-pixbuf_2.36.1.bb} (92%)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_3.20.0.bb => gsettings-desktop-schemas_3.22.0.bb} (70%)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.1.bb => gtk+3_3.22.5.bb} (84%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.22.1.bb => gtk-icon-utils-native_3.22.5.bb} (93%)
 rename meta/recipes-graphics/cairo/{cairo_1.14.6.bb => cairo_1.14.8.bb} (92%)
 rename meta/recipes-graphics/clutter/{clutter-gst-3.0_3.0.20.bb => clutter-gst-3.0_3.0.22.bb} (58%)
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0/0001-Fix-an-incorrect-preprocessor-conditional.patch
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.22.0.bb
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.22.2.bb

-- 
2.1.4


