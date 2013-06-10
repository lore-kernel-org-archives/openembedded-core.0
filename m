Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id E83BF6A9E9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 21:45:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 10 Jun 2013 14:45:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,840,1363158000"; d="scan'208";a="347788831"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.247])
	by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2013 14:45:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 14:45:15 -0700
Message-Id: <1370900715-29294-6-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1370900715-29294-1-git-send-email-sgw@linux.intel.com>
References: <1370900715-29294-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 5/5] librsvg: configure needs a native gdk-pixbuf binary
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
X-List-Received-Date: Mon, 10 Jun 2013 21:45:37 -0000

Build failure was seen on the autobuilder, so add gdk-pixbuf-native to depends list

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index 9b1e0ec..4818422 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SECTION = "x11/utils"
 DEPENDS = "cairo glib-2.0 gdk-pixbuf fontconfig freetype libxml2 pango"
+DEPENDS += "gdk-pixbuf-native"
 BBCLASSEXTEND = "native"
 
 PR = "r12"
-- 
1.8.1.4


