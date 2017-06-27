Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6277A7804A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 13:16:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2017 06:16:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,399,1493708400"; d="scan'208";a="104131708"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 27 Jun 2017 06:16:15 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 9D13E580118;
	Tue, 27 Jun 2017 06:16:14 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 16:16:03 +0300
Message-Id: <cover.1498569089.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] Minor Gtk+3 and libepoxy upgrades
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
X-List-Received-Date: Tue, 27 Jun 2017 13:16:14 -0000

Small upgrades and tweak to Gtk upstream version regex

Thanks,
 Jussi


The following changes since commit a5bf271c7c4cf5d3bfdf8d1b05eec70ca43726b8:

  meta: Add/fix missing Upstream-Status to patches (2017-06-27 10:38:43 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/gtk
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/gtk

Jussi Kukkonen (3):
  gtk+3: Update UPSTREAM_CHECK_REGEX
  gtk+3: Upgrade 3.22.15 -> 3.22.16
  libepoxy: Upgrade 1.4.2 -> 1.4.3

 meta/recipes-gnome/gtk+/gtk+3.inc                                | 6 +++++-
 .../gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch    | 4 ++--
 meta/recipes-gnome/gtk+/{gtk+3_3.22.15.bb => gtk+3_3.22.16.bb}   | 4 ++--
 ...-utils-native_3.22.15.bb => gtk-icon-utils-native_3.22.16.bb} | 9 ++++++---
 .../libepoxy/{libepoxy_1.4.2.bb => libepoxy_1.4.3.bb}            | 9 +++++----
 5 files changed, 20 insertions(+), 12 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.15.bb => gtk+3_3.22.16.bb} (84%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.22.15.bb => gtk-icon-utils-native_3.22.16.bb} (86%)
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.4.2.bb => libepoxy_1.4.3.bb} (70%)

-- 
2.1.4


