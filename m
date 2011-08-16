Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtKDs-0002GH-3G
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 16:02:28 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Tue, 16 Aug 2011
	15:57:47 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Aug 2011 15:57:49 +0200
Message-ID: <22db25497f01746ddddb67a126718c7776cdc06f.1313503017.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1313503017.git.anders@chargestorm.se>
References: <cover.1313503017.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [PATCH 2/5] qmake_base: add uclibceabi
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
X-List-Received-Date: Tue, 16 Aug 2011 14:02:28 -0000
Content-Type: text/plain

Partial sync of qmake_base from meta-oe.
* Add a matching rule for *linux-uclibceabi-oe-g++, to make qmake_base.bbclase more
similar to the version in meta-oe.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/classes/qmake_base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/qmake_base.bbclass b/meta/classes/qmake_base.bbclass
index 165d689..b61b84c 100644
--- a/meta/classes/qmake_base.bbclass
+++ b/meta/classes/qmake_base.bbclass
@@ -47,7 +47,7 @@ addtask generate_qt_config_file after do_patch before do_configure
 
 qmake_base_do_configure() {
 	case ${QMAKESPEC} in
-	*linux-oe-g++|*linux-uclibc-oe-g++|*linux-gnueabi-oe-g++)
+	*linux-oe-g++|*linux-uclibc-oe-g++|*linux-gnueabi-oe-g++|*linux-uclibceabi-oe-g++)
 		;;
 	*-oe-g++)
 		die Unsupported target ${TARGET_OS} for oe-g++ qmake spec
-- 
1.7.5.4



