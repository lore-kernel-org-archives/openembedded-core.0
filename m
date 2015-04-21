Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 52F72605D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 13:49:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 21 Apr 2015 06:49:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,616,1422950400"; d="scan'208";a="683377949"
Received: from heimdall.fi.intel.com ([10.237.72.110])
	by orsmga001.jf.intel.com with ESMTP; 21 Apr 2015 06:49:01 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 16:48:42 +0300
Message-Id: <cover.1429623703.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/4] Upgrade GNOME-related recipes
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
X-List-Received-Date: Tue, 21 Apr 2015 13:49:03 -0000

The following changes since commit fc15878af46c09512fc3cb73480359fcbb22e627:

  init-install-efi.sh: fix gummiboot entry installation (2015-04-21 07:20:27 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/update-gnomeish
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/update-gnomeish

Jussi Kukkonen (4):
  hicolor-icon-theme: Upgrade to 0.15
  json-glib: Upgrade 1.0.2 -> 1.0.4
  librsvg: Upgrade 0.40.6 -> 0.40.9
  libsoup-2.4: Upgrade 2.46.0 -> 2.50.0

 ...on-theme_0.14.bb => hicolor-icon-theme_0.15.bb} |  4 +--
 .../{json-glib_1.0.2.bb => json-glib_1.0.4.bb}     |  4 +--
 .../recipes-gnome/librsvg/librsvg/gtk-option.patch | 30 +++++++++++-----------
 .../{librsvg_2.40.6.bb => librsvg_2.40.9.bb}       |  4 +--
 ...libsoup-2.4_2.46.0.bb => libsoup-2.4_2.50.0.bb} |  5 ++--
 5 files changed, 23 insertions(+), 24 deletions(-)
 rename meta/recipes-gnome/hicolor-icon-theme/{hicolor-icon-theme_0.14.bb => hicolor-icon-theme_0.15.bb} (74%)
 rename meta/recipes-gnome/json-glib/{json-glib_1.0.2.bb => json-glib_1.0.4.bb} (79%)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.6.bb => librsvg_2.40.9.bb} (91%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.46.0.bb => libsoup-2.4_2.50.0.bb} (85%)

-- 
2.1.4


