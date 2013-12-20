Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6719660D83
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 18:47:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Dec 2013 10:47:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,522,1384329600"; d="scan'208";a="453473391"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.132])
	by fmsmga002.fm.intel.com with ESMTP; 20 Dec 2013 10:47:28 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2013 10:47:27 -0800
Message-Id: <1387565248-18457-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1387565248-18457-1-git-send-email-sgw@linux.intel.com>
References: <1387565248-18457-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/3] sqlite: remove unrecognised options: --enable-tempstore
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
X-List-Received-Date: Fri, 20 Dec 2013 18:47:28 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/sqlite/sqlite3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 064d78c..0cd2deb 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -8,7 +8,7 @@ LICENSE = "PD"
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--enable-shared --enable-threadsafe"
-EXTRA_OECONF_class-native = "--enable-shared --enable-threadsafe --disable-readline --enable-tempstore"
+EXTRA_OECONF_class-native = "--enable-shared --enable-threadsafe --disable-readline"
 export config_BUILD_CC = "${BUILD_CC}"
 export config_BUILD_CFLAGS = "${BUILD_CFLAGS}"
 export config_BUILD_LIBS = "${BUILD_LDFLAGS}"
-- 
1.8.3.1


