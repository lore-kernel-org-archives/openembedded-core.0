Received: from stoexhub01.domain01.net ([83.145.59.142]
	helo=stoexhub02.domain01.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QZ5b6-0002AS-B7
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 20:22:48 +0200
Received: from localhost (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.137.0; Tue, 21 Jun 2011
	20:19:14 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jun 2011 20:18:54 +0200
Message-ID: <8e57843c8775752059dc6acacdbd7751b1ed7082.1308680000.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1308680000.git.anders@chargestorm.se>
References: <cover.1308680000.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [RFC PATCH 2/5] module-init-tools-cross: add provides for depmod-3
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
X-List-Received-Date: Tue, 21 Jun 2011 18:22:48 -0000
Content-Type: text/plain

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 .../module-init-tools-cross_3.12.bb                |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.12.bb b/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.12.bb
index 08bf1a9..9b6ab95 100644
--- a/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.12.bb
+++ b/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.12.bb
@@ -1,7 +1,7 @@
 require module-init-tools.inc
 PR = "r1"
 inherit cross
-PROVIDES += "virtual/${TARGET_PREFIX}depmod virtual/${TARGET_PREFIX}depmod-2.6"
+PROVIDES += "virtual/${TARGET_PREFIX}depmod virtual/${TARGET_PREFIX}depmod-2.6 virtual/${TARGET_PREFIX}depmod-3"
 
 SRC_URI += "file://no-static-binaries.patch"
 
-- 
1.7.4.1



