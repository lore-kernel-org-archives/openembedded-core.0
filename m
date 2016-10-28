Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 3522E71D75
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 15:15:08 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 28 Oct 2016 08:15:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,410,1473145200"; d="scan'208";a="24878697"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 28 Oct 2016 08:15:09 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2016 18:12:14 +0300
Message-Id: <36a2f7dea458b7587f70b6b33acb9cc0a8bf9751.1477667287.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 11/26] libsecret: enable optional building of manpages
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
X-List-Received-Date: Fri, 28 Oct 2016 15:15:08 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/libsecret/libsecret_0.18.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.5.bb b/meta/recipes-gnome/libsecret/libsecret_0.18.5.bb
index bcb3046..77b9fd5 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.18.5.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.18.5.bb
@@ -2,11 +2,11 @@ SUMMARY = "libsecret is a library for storing and retrieving passwords and other
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
 
-inherit gnomebase gtk-doc vala gobject-introspection
+inherit gnomebase gtk-doc vala gobject-introspection manpages
 
 DEPENDS += "glib-2.0 libgcrypt gettext-native intltool-native"
 
-EXTRA_OECONF += "--disable-manpages"
+PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
 
 SRC_URI[archive.md5sum] = "2d688825921313da8731313b0a7f394c"
 SRC_URI[archive.sha256sum] = "9ce7bd8dd5831f2786c935d82638ac428fa085057cc6780aba0e39375887ccb3"
-- 
2.9.3


