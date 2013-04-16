Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1USBjR-0005Al-Cf
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 21:39:58 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2013 21:22:23 +0200
Message-Id: <1366140144-30458-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] separatebuilddir.inc: disable libmusicbrainz
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2013 19:40:01 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/conf/distro/include/seperatebuilddir.inc |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
index a9ca240..48d98f4 100644
--- a/meta/conf/distro/include/seperatebuilddir.inc
+++ b/meta/conf/distro/include/seperatebuilddir.inc
@@ -305,7 +305,8 @@ B_pn-libmad = "${SEPB}"
 B_pn-libmatchbox = "${SEPB}"
 B_pn-libmpc = "${SEPB}"
 B_pn-libmpc-native = "${SEPB}"
-B_pn-libmusicbrainz = "${SEPB}"
+# CMake Error: The source directory "[...]libmusicbrainz-5.0.1[...]/build" does not appear to contain CMakeLists.txt.
+#B_pn-libmusicbrainz = "${SEPB}"
 # Not automake and no support for out of tree
 #B_pn-libnewt = "${SEPB}"
 B_pn-libnfsidmap = "${SEPB}"
-- 
1.7.10.4



