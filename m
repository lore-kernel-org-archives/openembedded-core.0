Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D4209731D7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 13:23:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jan 2016 05:23:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,557,1444719600"; d="scan'208";a="888877470"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 12 Jan 2016 05:23:16 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jan 2016 15:20:25 +0200
Message-Id: <798d49adc0749b1763192551c967241126f789d6.1452604534.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1452604534.git.alexander.kanavin@linux.intel.com>
References: <cover.1452604534.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1452604534.git.alexander.kanavin@linux.intel.com>
References: <cover.1452604534.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/5] lighttpd: upgrade to 1.4.39
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
X-List-Received-Date: Tue, 12 Jan 2016 13:23:16 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../lighttpd/{lighttpd_1.4.38.bb => lighttpd_1.4.39.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.38.bb => lighttpd_1.4.39.bb} (94%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.38.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.39.bb
similarity index 94%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.38.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.39.bb
index 7cfc141..a407d03 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.38.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.39.bb
@@ -24,8 +24,8 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://0001-mod_cgi-buffers-data-without-bound.patch \
         "
 
-SRC_URI[md5sum] = "7adc12323f37ed24ecf026c7547b577d"
-SRC_URI[sha256sum] = "4912568b7befcf3f552ca4668bd7f38cd85f42a22944359d00816ec27eb1e504"
+SRC_URI[md5sum] = "63c7563be1c7a7a9819a51f07f1af8b2"
+SRC_URI[sha256sum] = "7eb9a1853c3d6dd5851682b0733a729ba4158d6bdff80974d5ef5f1f6887365b"
 
 PACKAGECONFIG ??= "openssl"
 PACKAGECONFIG[openssl] = "--with-openssl, --without-openssl, openssl"
-- 
2.6.4


