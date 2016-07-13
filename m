Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0DE1D6067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 12:54:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 13 Jul 2016 05:53:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,357,1464678000"; d="scan'208";a="1020860126"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jul 2016 05:53:49 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2016 15:53:42 +0300
Message-Id: <cover.1468414126.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/7] Minor version upgrades
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
X-List-Received-Date: Wed, 13 Jul 2016 12:54:17 -0000

Some smaller version upgrades (the freetype uprade is a bigger one
but the new hinting mode is not on by default) and a cairo recipe fix.

Jussi

The following changes since commit 627d01997fcf6a0581d88047735769ffb2592b82:

  useradd-staticids: use map() instead of imap() (2016-07-12 23:12:00 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/updates

Jussi Kukkonen (7):
  expat: Upgrade 2.1.1 -> 2.2.0
  cairo: Remove unnecessary UPSTREAM_CHECK_REGEX
  fontconfig: Upgrade 2.11.95 -> 2.12.0
  freetype: Upgrade 2.6.3 -> 2.6.5
  libgpg-error: Upgrade 1.22 -> 1.23
  librsvg: Upgrade 2.40.15 -> 2.40.16
  libevdev: Upgrade 1.5.1 -> 1.5.2

 meta/recipes-core/expat/expat.inc                  |   1 -
 meta/recipes-core/expat/expat/CVE-2016-0718.patch  | 760 ---------------------
 meta/recipes-core/expat/expat_2.1.1.bb             |   5 -
 meta/recipes-core/expat/expat_2.2.0.bb             |   5 +
 .../{librsvg_2.40.15.bb => librsvg_2.40.16.bb}     |   4 +-
 meta/recipes-graphics/cairo/cairo_1.14.6.bb        |   2 -
 ...{fontconfig_2.11.95.bb => fontconfig_2.12.0.bb} |   6 +-
 .../{freetype_2.6.3.bb => freetype_2.6.5.bb}       |   6 +-
 .../{libevdev_1.5.1.bb => libevdev_1.5.2.bb}       |   4 +-
 .../{libgpg-error_1.22.bb => libgpg-error_1.23.bb} |   4 +-
 10 files changed, 17 insertions(+), 780 deletions(-)
 delete mode 100644 meta/recipes-core/expat/expat/CVE-2016-0718.patch
 delete mode 100644 meta/recipes-core/expat/expat_2.1.1.bb
 create mode 100644 meta/recipes-core/expat/expat_2.2.0.bb
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.15.bb => librsvg_2.40.16.bb} (91%)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.11.95.bb => fontconfig_2.12.0.bb} (87%)
 rename meta/recipes-graphics/freetype/{freetype_2.6.3.bb => freetype_2.6.5.bb} (89%)
 rename meta/recipes-support/libevdev/{libevdev_1.5.1.bb => libevdev_1.5.2.bb} (74%)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.22.bb => libgpg-error_1.23.bb} (92%)

-- 
2.1.4


