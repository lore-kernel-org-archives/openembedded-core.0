Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3F43178093
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 10:33:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Aug 2017 03:33:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,377,1498546800"; d="scan'208";a="1162741621"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 15 Aug 2017 03:33:17 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 44AEA58035B;
	Tue, 15 Aug 2017 03:33:16 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 13:33:13 +0300
Message-Id: <cover.1502792828.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/4] Various point upgrades
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
X-List-Received-Date: Tue, 15 Aug 2017 10:33:16 -0000

Small point upgrades but several of them require some recipe changes.

Thanks,
  Jussi


The following changes since commit 034bff2ca431b49b7ca9b1e7b7c214ef94b0eb34:

  bitbake: cooker: Ignore common bitbake files for the parse cache invalidation (2017-08-13 09:28:14 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/updates

Jussi Kukkonen (4):
  cairo: Upgrade 1.14.8 -> 1.14.10
  fontconfig: Upgrade 2.12.1 -> 2.12.4
  glib-2.0: Upgrade 2.52.2 -> 2.52.3
  gdk-pixbuf: Upgrade 2.36.6 -> 2.36.8

 .../{glib-2.0_2.52.2.bb => glib-2.0_2.52.3.bb}     |  4 +-
 .../{gdk-pixbuf_2.36.6.bb => gdk-pixbuf_2.36.8.bb} | 11 ++--
 .../cairo/{cairo_1.14.8.bb => cairo_1.14.10.bb}    |  4 +-
 ...icts-with-integer-width-macros-from-TS-18.patch | 72 ----------------------
 .../{fontconfig_2.12.1.bb => fontconfig_2.12.4.bb} | 14 +++--
 5 files changed, 19 insertions(+), 86 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.52.2.bb => glib-2.0_2.52.3.bb} (85%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.36.6.bb => gdk-pixbuf_2.36.8.bb} (91%)
 rename meta/recipes-graphics/cairo/{cairo_1.14.8.bb => cairo_1.14.10.bb} (92%)
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.12.1.bb => fontconfig_2.12.4.bb} (80%)

-- 
2.1.4


