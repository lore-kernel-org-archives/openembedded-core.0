Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EA385731D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 19:23:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 31 Aug 2016 12:23:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,263,1470726000"; d="scan'208";a="1049803916"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by fmsmga002.fm.intel.com with ESMTP; 31 Aug 2016 12:23:37 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Aug 2016 22:22:06 +0300
Message-Id: <20160831192207.8403-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 1/2] Revert "gtk-doc: do not inherit perlnative and pythonnative"
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
X-List-Received-Date: Wed, 31 Aug 2016 19:23:39 -0000

gtk-doc requires Perl to be at least 5.18 which is more than some
distros provide (CentOS 7 in particular).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb
index 79d4e43..0585ca9 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "http://www.gtk.org/gtk-doc/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-inherit gnomebase
-DEPENDS_append = " libxslt xmlto source-highlight-native"
+inherit gnomebase pythonnative perlnative
+DEPENDS_append = "libxslt xmlto source-highlight-native"
 EXTRA_OECONF_append = " --with-highlight=source-highlight"
 EXTRA_OECONF_append_class-native = " --with-xml-catalog=${sysconfdir}/xml/catalog.xml"
 
-- 
2.9.3


