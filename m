Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 31780781FF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 12:25:38 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jul 2017 05:25:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,359,1496127600"; d="scan'208";a="126670698"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2017 05:25:39 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id EF7405807D9;
	Fri, 14 Jul 2017 05:25:38 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jul 2017 15:25:26 +0300
Message-Id: <f17494905ca8f897927aa60ebe88f29f3e97bbfd.1500034432.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1500034432.git.jussi.kukkonen@intel.com>
References: <cover.1500034432.git.jussi.kukkonen@intel.com>
Subject: [PATCH 4/4] gnome-common: Remove as deprecated
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
X-List-Received-Date: Fri, 14 Jul 2017 12:25:42 -0000

Nothing in oe-core requires gnome-common and it is also deprecated
upstream: Remove it.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/gnome/gnome-common_3.18.0.bb | 20 --------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/gnome-common_3.18.0.bb

diff --git a/meta/recipes-gnome/gnome/gnome-common_3.18.0.bb b/meta/recipes-gnome/gnome/gnome-common_3.18.0.bb
deleted file mode 100644
index 06f3bb3..0000000
--- a/meta/recipes-gnome/gnome/gnome-common_3.18.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Common macros for building GNOME applications"
-HOMEPAGE = "http://www.gnome.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-SECTION = "x11/gnome"
-inherit gnomebase allarch
-
-SRC_URI[archive.md5sum] = "933258d9c23e218eb6eec9cc1951b053"
-SRC_URI[archive.sha256sum] = "22569e370ae755e04527b76328befc4c73b62bfd4a572499fde116b8318af8cf"
-
-EXTRA_AUTORECONF = ""
-DEPENDS = ""
-
-FILES_${PN} += "${datadir}/aclocal"
-FILES_${PN}-dev = ""
-
-BBCLASSEXTEND = "native"
-- 
2.1.4


