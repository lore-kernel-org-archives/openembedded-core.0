Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 00DEE726BD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 17:23:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 29 Dec 2014 09:21:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,659,1413270000"; d="scan'208";a="654543772"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.155])
	by fmsmga002.fm.intel.com with ESMTP; 29 Dec 2014 09:23:37 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Dec 2014 11:24:11 -0600
Message-Id: <4125ae66d0682ccbcee29656ca394f1d2a33bbe6.1419873753.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <df47ba5837e1df876d6caad6e4b61a2477dc0ab6.1419873753.git.anibal.limon@linux.intel.com>
References: <df47ba5837e1df876d6caad6e4b61a2477dc0ab6.1419873753.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1419873753.git.anibal.limon@linux.intel.com>
References: <cover.1419873753.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] sqlite3: Upgrade to 3.8.7.4
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
X-List-Received-Date: Mon, 29 Dec 2014 17:23:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../recipes-support/sqlite/{sqlite3_3.8.6.0.bb => sqlite3_3.8.7.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.8.6.0.bb => sqlite3_3.8.7.4.bb} (80%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.8.6.0.bb b/meta/recipes-support/sqlite/sqlite3_3.8.7.4.bb
similarity index 80%
rename from meta/recipes-support/sqlite/sqlite3_3.8.6.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.8.7.4.bb
index 32f60eb..4c73d30 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.8.6.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.8.7.4.bb
@@ -10,8 +10,8 @@ PE = "3"
 SQLITE_PV = "${@sqlite_download_version(d)}"
 SRC_URI = "http://www.sqlite.org/2014/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 
-SRC_URI[md5sum] = "f7e4a156b583abeba349629e2364224b"
-SRC_URI[sha256sum] = "53bab14255bc16c3d73fdbe54b364c1764709d68dda167587f8026c98b9f4e95"
+SRC_URI[md5sum] = "33bb8db0038317ce1b0480ca1185c7ba"
+SRC_URI[sha256sum] = "86370f139405fdfe03334fd618171a74e50f589f17ccbe5933361ed1f58359ec"
 
 S = "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
 
-- 
1.9.1


