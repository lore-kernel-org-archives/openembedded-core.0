Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SK8FN-00024a-85
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 15:15:05 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2012 15:05:23 +0200
Message-Id: <1334667923-13908-6-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1334667923-13908-1-git-send-email-obi@opendreambox.org>
References: <1334667923-13908-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 5/5] wpa-supplicant: move wpa_passphrase to bindir
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
X-List-Received-Date: Tue, 17 Apr 2012 13:15:05 -0000

* wpa_passphrase doesn't require special privileges.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../wpa-supplicant/wpa-supplicant-0.7.inc          |    4 +++-
 .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
index d92acac..aabb3df 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
@@ -36,9 +36,11 @@ do_compile () {
 do_install () {
 	install -d ${D}${sbindir}
 	install -m 755 wpa_supplicant ${D}${sbindir}
-	install -m 755 wpa_passphrase ${D}${sbindir}
 	install -m 755 wpa_cli        ${D}${sbindir}
 
+	install -d ${D}${bindir}
+	install -m 755 wpa_passphrase ${D}${bindir}
+
 	install -d ${D}${docdir}/wpa_supplicant
 	install -m 644 README ${WORKDIR}/wpa_supplicant.conf ${D}${docdir}/wpa_supplicant
 
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
index 94c88ba..dc2eb6c 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
@@ -1,6 +1,6 @@
 require wpa-supplicant-0.7.inc
 
-PR = "r8"
+PR = "r9"
 
 SRC_URI[md5sum] = "f516f191384a9a546e3f5145c08addda"
 SRC_URI[sha256sum] = "d0cd50caa85346ccc376dcda5ed3c258eef19a93b3cade39d25760118ad59443"
-- 
1.7.5.4



