Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 941FB77155
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 14:30:51 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 07:30:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,581,1464678000"; 
   d="scan'208";a="1525630"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by orsmga004.jf.intel.com with ESMTP; 26 Aug 2016 07:30:51 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 17:28:41 +0300
Message-Id: <ec4851b110a53e9fbc80803bce4640af773ed519.1472221205.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 26/28] libsoup-2.4: enable gtk-doc
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
X-List-Received-Date: Fri, 26 Aug 2016 14:30:51 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.54.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.54.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.54.1.bb
index f243cbc..b93a9fd 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.54.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.54.1.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "47b42c232034734d66e5f093025843a5d8cc4b2357c011085a2fd04ef0
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-inherit autotools gettext pkgconfig upstream-version-is-even gobject-introspection
+inherit autotools gettext pkgconfig upstream-version-is-even gobject-introspection gtk-doc
 
 # libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards. Disable by default.
 PACKAGECONFIG ??= ""
-- 
2.9.3


