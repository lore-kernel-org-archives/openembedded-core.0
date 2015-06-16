Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AF14F73BBE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 14:22:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2015 07:22:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,626,1427785200"; d="scan'208";a="509192128"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Jun 2015 07:22:07 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2015 17:22:41 +0300
Message-Id: <cover.1434464336.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v3 0/6] GTK+3 upgrade and related changes
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
X-List-Received-Date: Tue, 16 Jun 2015 14:22:06 -0000

Patch set upgrades GTK+3 and adds adwaita-icon-theme.
Changes since v2:
 * Package Adwaita into
     adwaita-icon-theme
     adwaita-icon-theme-symbolic
     adwaita-icon-theme-cursors
 * Make gtk+3 RRECOMMEND adwaita-icon-theme-symbolic
 * Re-order commits so dependencies and recommendations are logical 
 * Improve commit messages
 * Rebase on master



The following changes since commit 379a030702c985c6e69831173f765a47dfeb8841:

  bitbake: toastergui: prevent contamination of libtoaster context (2015-06-12 00:01:50 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/update-gtk3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/update-gtk3

Jussi Kukkonen (6):
  gtk-update-icon-cache-native: Upgrade, add binary
  adwaita-icon-theme: Add new icon theme for GTK+
  gtk+3: Upgrade to 3.16.3
  matchbox-session-sato: set GTK_CSD env var
  sato-icon-theme: Inherit Adwaita, not gnome-icon-theme
  midori: Depend on Adwaita, not gnome-icon-theme

 .../Create-symlinks-when-installing-cursors.patch  | 178 +++++++++++++++++++++
 .../gnome/adwaita-icon-theme_3.16.2.1.bb           |  35 ++++
 meta/recipes-gnome/gtk+/gtk+3.inc                  |  15 +-
 meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch | 118 ++++++++++++++
 .../gtk+/gtk+3/fix-flags-for-native.patch          |  33 ----
 .../gtk+/{gtk+3_3.12.2.bb => gtk+3_3.16.3.bb}      |   6 +-
 .../gtk+/gtk-update-icon-cache-native_3.16.3.bb    |  63 ++++++++
 .../gtk+/gtk-update-icon-cache-native_3.4.4.bb     |  47 ------
 ...k-dependency-from-gtk-encode-symbolic-svg.patch | 102 ++++++++++++
 .../matchbox-sato/matchbox-session-sato/session    |   4 +
 meta/recipes-sato/midori/midori_0.5.8.bb           |   2 +-
 .../0001-Inherit-the-GNOME-icon-theme.patch        |   2 +-
 12 files changed, 513 insertions(+), 92 deletions(-)
 create mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/Create-symlinks-when-installing-cursors.patch
 create mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme_3.16.2.1.bb
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/fix-flags-for-native.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.12.2.bb => gtk+3_3.16.3.bb} (75%)
 create mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.16.3.bb
 delete mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
 create mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache/Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch

-- 
2.1.4


