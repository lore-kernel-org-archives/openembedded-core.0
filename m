Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6152B71A0C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:38:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:38:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945710"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:38:24 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:33:56 +0300
Message-Id: <24aa94c8e6ff13be3087134e039e1411c2c03b58.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/50] glib-networking: update to 2.54.0
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
X-List-Received-Date: Wed, 11 Oct 2017 15:38:23 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{glib-networking_2.50.0.bb => glib-networking_2.54.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.50.0.bb => glib-networking_2.54.0.bb} (88%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.50.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.54.0.bb
similarity index 88%
rename from meta/recipes-core/glib-networking/glib-networking_2.50.0.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.54.0.bb
index 2782bd95c4c..ad096dd8e76 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.50.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.54.0.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "4d06d0224646f274918b1cb6da9a07f6"
-SRC_URI[archive.sha256sum] = "3f1a442f3c2a734946983532ce59ed49120319fdb10c938447c373d5e5286bee"
+SRC_URI[archive.md5sum] = "45d2f8b650412c05e45b08aa78a3f735"
+SRC_URI[archive.sha256sum] = "5961b3779080b72314b373ff5d4790eb7e41b75ca91816ad7a81ef32922f7096"
 
 PACKAGECONFIG ??= "ca-certificates gnutls"
 
-- 
2.14.1


