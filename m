Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B3C877319F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 15:11:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Dec 2015 07:11:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,441,1444719600"; d="scan'208";a="875739965"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2015 07:11:30 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 17:08:48 +0200
Message-Id: <cfcc65312abffda36d3ac2547012aeb5a6e587dc.1450364672.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/17] lighttpd: update to 1.4.38
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
X-List-Received-Date: Thu, 17 Dec 2015 15:11:30 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../lighttpd/{lighttpd_1.4.36.bb => lighttpd_1.4.38.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.36.bb => lighttpd_1.4.38.bb} (94%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.36.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.38.bb
similarity index 94%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.36.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.38.bb
index 67b6e37..7cfc141 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.36.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.38.bb
@@ -24,8 +24,8 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://0001-mod_cgi-buffers-data-without-bound.patch \
         "
 
-SRC_URI[md5sum] = "1843daffcb018aa528f6d15d43544654"
-SRC_URI[sha256sum] = "897ab6b1cc7bd51671f8af759e7846245fbbca0685c30017e93a5882a9ac1a53"
+SRC_URI[md5sum] = "7adc12323f37ed24ecf026c7547b577d"
+SRC_URI[sha256sum] = "4912568b7befcf3f552ca4668bd7f38cd85f42a22944359d00816ec27eb1e504"
 
 PACKAGECONFIG ??= "openssl"
 PACKAGECONFIG[openssl] = "--with-openssl, --without-openssl, openssl"
-- 
2.6.2


