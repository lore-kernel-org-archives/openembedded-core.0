Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 72AFE70030
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 13:29:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 May 2016 06:29:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,364,1459839600"; d="scan'208";a="988474043"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 25 May 2016 06:29:49 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 16:29:36 +0300
Message-Id: <b479b72c0f0a028fece6aa53007bcdeca3120869.1464176988.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ade23f378a1dc2d3153dd71e6a00c65c6c56e8f0.1464176988.git.jussi.kukkonen@intel.com>
References: <ade23f378a1dc2d3153dd71e6a00c65c6c56e8f0.1464176988.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1464176988.git.jussi.kukkonen@intel.com>
References: <cover.1464176988.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/7] gtk+: Upgrade 2.24.29 -> 2.24.30
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
X-List-Received-Date: Wed, 25 May 2016 13:29:48 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/gtk+/{gtk+_2.24.29.bb => gtk+_2.24.30.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.29.bb => gtk+_2.24.30.bb} (91%)

diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.29.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.30.bb
similarity index 91%
rename from meta/recipes-gnome/gtk+/gtk+_2.24.29.bb
rename to meta/recipes-gnome/gtk+/gtk+_2.24.30.bb
index cf55d20..4fe990d 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.29.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.30.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
            file://strict-prototypes.patch \
 	  "
 
-SRC_URI[md5sum] = "1b7a3689f65617387b5b54520f4439e8"
-SRC_URI[sha256sum] = "0741c59600d3d810a223866453dc2bbb18ce4723828681ba24aa6519c37631b8"
+SRC_URI[md5sum] = "04568ba5c58b75e3c7543e45628ad789"
+SRC_URI[sha256sum] = "0d15cec3b6d55c60eac205b1f3ba81a1ed4eadd9d0f8e7c508bc7065d0c4ca50"
 
 EXTRA_OECONF = "--enable-xkb --disable-glibtest --disable-cups --disable-xinerama"
 
-- 
2.1.4


