Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6A82660745
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 18:29:28 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 21 Mar 2016 11:29:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,373,1455004800"; d="scan'208";a="70567411"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 21 Mar 2016 11:29:28 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 20:29:24 +0200
Message-Id: <cover.1458582024.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] Create GIO module cache on postinst/rm
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
X-List-Received-Date: Mon, 21 Mar 2016 18:29:31 -0000

GIO module cache is used by GIO at runtime to avoid opening all modules
just to find out which extension points they implement. The patch
uses gio-querymodules tool to regenerate the cache at postinst/postrm.

So nothing is really broken currently, this is a runtime optimization.

Cheers,
  Jussi

The following changes since commit 068afc5d436c716591a54f7d6e1944d8b6f9a198:

  tzdata: update to 2016b (2016-03-20 23:12:32 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/gio-module-cache
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/gio-module-cache

Jussi Kukkonen (2):
  glib-2.0: Install gio-querymodules in main package
  gio-module-cache: Add class for Gio modules

 meta/classes/gio-module-cache.bbclass              | 36 ++++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc                | 12 +++++---
 .../glib-networking/glib-networking_2.46.1.bb      |  2 +-
 meta/recipes-gnome/gnome/gconf_3.2.6.bb            |  2 +-
 .../postinst-intercepts/update_gio_module_cache    |  7 +++++
 5 files changed, 53 insertions(+), 6 deletions(-)
 create mode 100644 meta/classes/gio-module-cache.bbclass
 create mode 100644 scripts/postinst-intercepts/update_gio_module_cache

-- 
2.1.4


