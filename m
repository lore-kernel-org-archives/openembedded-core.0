Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5909571AC5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 09:35:29 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 May 2017 02:35:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,318,1491289200"; d="scan'208";a="85649698"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 10 May 2017 02:35:30 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 12:35:24 +0300
Message-Id: <20170510093529.6651-6-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170510093529.6651-1-alexander.kanavin@linux.intel.com>
References: <20170510093529.6651-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/11] gnome-desktop3: update to 3.24.2
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
X-List-Received-Date: Wed, 10 May 2017 09:35:29 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{gnome-desktop3_3.22.2.bb => gnome-desktop3_3.24.2.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gnome-desktop/{gnome-desktop3_3.22.2.bb => gnome-desktop3_3.24.2.bb} (85%)

diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.22.2.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.24.2.bb
similarity index 85%
rename from meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.22.2.bb
rename to meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.24.2.bb
index e72c6ce42d2..24d23bad0e2 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.22.2.bb
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.24.2.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 BPN = "gnome-desktop"
 
 inherit gnome pkgconfig upstream-version-is-even gobject-introspection
-SRC_URI[archive.md5sum] = "3d7222d5305f3db022eca31d8108e02d"
-SRC_URI[archive.sha256sum] = "51d7ebf7a6c359be14c3dd7a022213e931484653815eb10b0131bef4c8979e1c"
+SRC_URI[archive.md5sum] = "af7c6a243df7a335a010bdc05b34ca93"
+SRC_URI[archive.sha256sum] = "8fa1de66a6a75963bffc79b01a60434c71237d44c51beca09c0f714a032d785e"
 
 SRC_URI += "file://gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch"
 
-- 
2.11.0


