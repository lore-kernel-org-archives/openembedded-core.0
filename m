Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A2969784D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 14:57:53 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 06:57:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; d="scan'208";a="173402196"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 14 Nov 2017 06:57:54 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 16:57:36 +0200
Message-Id: <20171114145754.9643-9-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/27] glib-networking: update to 2.54.1
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
X-List-Received-Date: Tue, 14 Nov 2017 14:57:54 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{glib-networking_2.50.0.bb => glib-networking_2.54.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.50.0.bb => glib-networking_2.54.1.bb} (88%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.50.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.54.1.bb
similarity index 88%
rename from meta/recipes-core/glib-networking/glib-networking_2.50.0.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.54.1.bb
index 2782bd95c4c..2a6f8af2b46 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.50.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.54.1.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "4d06d0224646f274918b1cb6da9a07f6"
-SRC_URI[archive.sha256sum] = "3f1a442f3c2a734946983532ce59ed49120319fdb10c938447c373d5e5286bee"
+SRC_URI[archive.md5sum] = "99867463f182c2767bce0c74bc9cc981"
+SRC_URI[archive.sha256sum] = "eaa787b653015a0de31c928e9a17eb57b4ce23c8cf6f277afaec0d685335012f"
 
 PACKAGECONFIG ??= "ca-certificates gnutls"
 
-- 
2.15.0


