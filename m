Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 015C374CE8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 12:38:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2018 05:38:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,362,1520924400"; d="scan'208";a="39254283"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 04 May 2018 05:38:46 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 15:32:38 +0300
Message-Id: <20180504123244.43049-8-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/14] gnome-desktop3: update to 3.28.1
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
X-List-Received-Date: Fri, 04 May 2018 12:38:46 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{gnome-desktop3_3.28.0.bb => gnome-desktop3_3.28.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gnome-desktop/{gnome-desktop3_3.28.0.bb => gnome-desktop3_3.28.1.bb} (86%)

diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.28.0.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.28.1.bb
similarity index 86%
rename from meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.28.0.bb
rename to meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.28.1.bb
index e23c0305775..39b3491fdb1 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.28.0.bb
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.28.1.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 BPN = "gnome-desktop"
 
 inherit gnome pkgconfig upstream-version-is-even gobject-introspection
-SRC_URI[archive.md5sum] = "3e7b67578307220a21688f28307b6789"
-SRC_URI[archive.sha256sum] = "f1df71c39e32147f6d58f53a9c05b964b00b7c98fbca090419355437c72fd59d"
+SRC_URI[archive.md5sum] = "bcbf906d94eb08060c60a7364384d678"
+SRC_URI[archive.sha256sum] = "78a397a2be47586e6dc075d6a7fc5659aae3d10713d76994ce1b46086e7ecb9a"
 
 SRC_URI += " \
            file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
-- 
2.16.1


