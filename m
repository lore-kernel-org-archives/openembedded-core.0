Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C78206E660
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 12:19:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 15 Jul 2016 05:19:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,368,1464678000"; d="scan'208";a="1007425018"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga001.fm.intel.com with ESMTP; 15 Jul 2016 05:19:45 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2016 15:19:38 +0300
Message-Id: <cover.1468584725.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/5] Updates to Sato components
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
X-List-Received-Date: Fri, 15 Jul 2016 12:19:47 -0000

Two themes in this patchset:
* xsettings-client removal
* Porting from ScalingImage to ScalingImage2
The latter fixes the issue of mb-panel crashing when battery applet
is loaded, which popped up recently.


Jussi

The following changes since commit 627d01997fcf6a0581d88047735769ffb2592b82:

  useradd-staticids: use map() instead of imap() (2016-07-12 23:12:00 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/sato-scalingimage2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/sato-scalingimage2

Jussi Kukkonen (5):
  matchbox-panel-2: Upgrade 2.10 -> 2.11
  sato-screenshot: Upgrade 0.2 -> 0.3
  matchbox-keyboard: Upgrade to 0.1.1
  libmatchbox: Upgrade 1.11 -> 1.12
  libxsettings-client: Remove as unneeded

 meta/conf/distro/include/distro_alias.inc          |  1 -
 meta/lib/oeqa/selftest/recipetool.py               |  4 +-
 .../libmatchbox/libmatchbox/libpng.patch           | 69 ----------------------
 .../{libmatchbox_1.11.bb => libmatchbox_1.12.bb}   | 16 ++---
 .../libxsettings-client/MIT-style-license          | 22 -------
 .../libxsettings-client/link-x11.patch             | 13 ----
 .../obsolete_automake_macros.patch                 | 14 -----
 .../libxsettings-client_0.10.bb                    | 43 --------------
 ...-keyboard_git.bb => matchbox-keyboard_0.1.1.bb} |  5 +-
 ...ox-panel-2_2.10.bb => matchbox-panel-2_2.11.bb} |  4 +-
 ...to-screenshot_0.2.bb => sato-screenshot_0.3.bb} |  4 +-
 11 files changed, 16 insertions(+), 179 deletions(-)
 delete mode 100644 meta/recipes-graphics/libmatchbox/libmatchbox/libpng.patch
 rename meta/recipes-graphics/libmatchbox/{libmatchbox_1.11.bb => libmatchbox_1.12.bb} (57%)
 delete mode 100644 meta/recipes-graphics/libxsettings-client/libxsettings-client/MIT-style-license
 delete mode 100644 meta/recipes-graphics/libxsettings-client/libxsettings-client/link-x11.patch
 delete mode 100644 meta/recipes-graphics/libxsettings-client/libxsettings-client/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb
 rename meta/recipes-sato/matchbox-keyboard/{matchbox-keyboard_git.bb => matchbox-keyboard_0.1.1.bb} (96%)
 rename meta/recipes-sato/matchbox-panel-2/{matchbox-panel-2_2.10.bb => matchbox-panel-2_2.11.bb} (95%)
 rename meta/recipes-sato/sato-screenshot/{sato-screenshot_0.2.bb => sato-screenshot_0.3.bb} (91%)

-- 
2.1.4


