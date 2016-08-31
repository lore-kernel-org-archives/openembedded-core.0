Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 663316E668
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 10:34:18 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 31 Aug 2016 03:34:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,261,1470726000"; d="scan'208";a="872940912"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by orsmga003.jf.intel.com with ESMTP; 31 Aug 2016 03:34:18 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Aug 2016 13:32:46 +0300
Message-Id: <20160831103246.26968-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] gtk-doc: do not inherit perlnative and pythonnative
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
X-List-Received-Date: Wed, 31 Aug 2016 10:34:19 -0000

This avoids having the full paths of perl and python written
into gtk-doc scripts, which can trigger build failures and doesn't
work at all on targets.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb
index 0585ca9..79d4e43 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "http://www.gtk.org/gtk-doc/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-inherit gnomebase pythonnative perlnative
-DEPENDS_append = "libxslt xmlto source-highlight-native"
+inherit gnomebase
+DEPENDS_append = " libxslt xmlto source-highlight-native"
 EXTRA_OECONF_append = " --with-highlight=source-highlight"
 EXTRA_OECONF_append_class-native = " --with-xml-catalog=${sysconfdir}/xml/catalog.xml"
 
-- 
2.9.3


