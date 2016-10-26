Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id CC6E86010B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 13:28:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 26 Oct 2016 06:28:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,550,1473145200"; d="scan'208";a="1076033798"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 26 Oct 2016 06:28:14 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id E0A266A4006;
	Wed, 26 Oct 2016 06:27:39 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 16:27:54 +0300
Message-Id: <dbafdace978f21b5b38ccb28cc88d3e1deeabcdf.1477488358.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
References: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477488358.git.jussi.kukkonen@intel.com>
References: <cover.1477488358.git.jussi.kukkonen@intel.com>
Subject: [PATCH 13/14] gtk+: Upgrade 2.24.30 -> 2.24.31
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
X-List-Received-Date: Wed, 26 Oct 2016 13:28:12 -0000

Bug fix release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/gtk+/{gtk+_2.24.30.bb => gtk+_2.24.31.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.30.bb => gtk+_2.24.31.bb} (91%)

diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.30.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.31.bb
similarity index 91%
rename from meta/recipes-gnome/gtk+/gtk+_2.24.30.bb
rename to meta/recipes-gnome/gtk+/gtk+_2.24.31.bb
index 4fe990d..84d0b4d 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.30.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.31.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
            file://strict-prototypes.patch \
 	  "
 
-SRC_URI[md5sum] = "04568ba5c58b75e3c7543e45628ad789"
-SRC_URI[sha256sum] = "0d15cec3b6d55c60eac205b1f3ba81a1ed4eadd9d0f8e7c508bc7065d0c4ca50"
+SRC_URI[md5sum] = "526a1008586094a2cbb4592fd3f9ee10"
+SRC_URI[sha256sum] = "68c1922732c7efc08df4656a5366dcc3afdc8791513400dac276009b40954658"
 
 EXTRA_OECONF = "--enable-xkb --disable-glibtest --disable-cups --disable-xinerama"
 
-- 
2.1.4


