Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QbHjB-0001c4-1Y
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 21:44:13 +0200
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.137.0; Mon, 27 Jun 2011
	21:40:33 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jun 2011 21:40:22 +0200
Message-ID: <b82cf833e89ad72f524277088db279d9facbf851.1309203545.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1309203545.git.anders@chargestorm.se>
References: <cover.1309203545.git.anders@chargestorm.se>
MIME-Version: 1.0
Subject: [RFC v2 PATCH 4/9] module-init-tools-cross: do not install depmod as depmod-2.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Jun 2011 19:44:13 -0000
Content-Type: text/plain

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 .../module-init-tools-cross_3.16.bb                |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb b/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb
index da7b30c..8b3458b 100644
--- a/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb
+++ b/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb
@@ -6,7 +6,3 @@ PROVIDES += "virtual/${TARGET_PREFIX}depmod"
 SRC_URI += "file://no-static-binaries.patch"
 
 EXTRA_OECONF_append = " --program-prefix=${TARGET_PREFIX}"
-
-do_install_append () {
-        mv ${D}${bindir}/${TARGET_PREFIX}depmod ${D}${bindir}/${TARGET_PREFIX}depmod-2.6
-}
-- 
1.7.4.1



