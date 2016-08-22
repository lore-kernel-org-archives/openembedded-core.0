Return-Path: <jussi.kukkonen@intel.com>
X-Greylist: delayed 582 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 22 Aug 2016 12:32:48 UTC
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id DA55A7016E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:32:48 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 22 Aug 2016 05:23:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,559,1464678000"; d="scan'208";a="751984491"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Aug 2016 05:23:07 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2016 15:22:58 +0300
Message-Id: <cover.1471868237.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/9] Upgrades
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
X-List-Received-Date: Mon, 22 Aug 2016 12:32:49 -0000

Mostly minor upgrades and a small fix to python module dependencies.

Thanks,
  Jussi


The following changes since commit f078ccf1ac60488169853724c35126cc056f975d:

  bitbake: siggen: Fix file variable typo in compare_sigfiles (2016-08-20 16:11:29 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/upgrades

Jussi Kukkonen (9):
  python-3.5-manifest: Add enum dependency to signal
  fontconfig: Upgrade 2.12.0 -> 2.12.1
  gnome-themes-standard: Upgrade 3.18.0 -> 3.20.2
  gtk+3: Upgrade 3.20.6 -> 3.20.9
  vte: Upgrade 0.44.1 -> 0.44.2
  json-glib: Upgrade 1.2.0 -> 1.2.2
  libinput: Upgrade 1.3.0 -> 1.4.1
  wayland-protocols: 1.5 -> 1.7
  openssh: Upgrade 7.2p2 -> 7.3p1

 .../openssh/openssh/CVE-2015-8325.patch            | 39 ----------------------
 ...h-7.1p1-conditional-compile-des-in-cipher.patch | 30 +++++++++--------
 .../openssh/{openssh_7.2p2.bb => openssh_7.3p1.bb} |  5 ++-
 .../python/python-3.5-manifest.inc                 |  2 +-
 ...d_3.18.0.bb => gnome-themes-standard_3.20.2.bb} |  4 +--
 .../gtk+/{gtk+3_3.20.6.bb => gtk+3_3.20.9.bb}      |  4 +--
 ...e_3.20.6.bb => gtk-icon-utils-native_3.20.9.bb} |  4 +--
 .../{json-glib_1.2.0.bb => json-glib_1.2.2.bb}     |  4 +--
 .../{fontconfig_2.12.0.bb => fontconfig_2.12.1.bb} |  6 ++--
 .../{libinput_1.3.0.bb => libinput_1.4.1.bb}       |  4 +--
 ...d-protocols_1.5.bb => wayland-protocols_1.7.bb} |  4 +--
 .../vte/{vte_0.44.1.bb => vte_0.44.2.bb}           |  4 +--
 scripts/contrib/python/generate-manifest-3.5.py    |  2 +-
 13 files changed, 37 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-8325.patch
 rename meta/recipes-connectivity/openssh/{openssh_7.2p2.bb => openssh_7.3p1.bb} (97%)
 rename meta/recipes-gnome/gnome/{gnome-themes-standard_3.18.0.bb => gnome-themes-standard_3.20.2.bb} (90%)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.20.6.bb => gtk+3_3.20.9.bb} (84%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.20.6.bb => gtk-icon-utils-native_3.20.9.bb} (93%)
 rename meta/recipes-gnome/json-glib/{json-glib_1.2.0.bb => json-glib_1.2.2.bb} (78%)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.12.0.bb => fontconfig_2.12.1.bb} (87%)
 rename meta/recipes-graphics/wayland/{libinput_1.3.0.bb => libinput_1.4.1.bb} (84%)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.5.bb => wayland-protocols_1.7.bb} (85%)
 rename meta/recipes-support/vte/{vte_0.44.1.bb => vte_0.44.2.bb} (86%)

-- 
2.1.4


