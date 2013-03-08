Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UE6FM-00043c-R3
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Mar 2013 23:58:49 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Mar 2013 23:42:02 +0100
Message-Id: <1362782523-17438-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1362782523-17438-1-git-send-email-obi@opendreambox.org>
References: <1362782523-17438-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 2/3] wpa-supplicant: reorder do_configure
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
X-List-Received-Date: Fri, 08 Mar 2013 22:59:18 -0000

Copy from WORKDIR first, then modify. Improves consistency
between successive invocations of do_configure.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
index 9e4514a..4e15369 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
@@ -30,8 +30,8 @@ FILES_${PN} += "${datadir}/dbus-1/system-services/*"
 CONFFILES_${PN} += "${sysconfdir}/wpa_supplicant.conf"
 
 do_configure () {
-	echo "CFLAGS +=\"-I${STAGING_INCDIR}/libnl3\"" >> ${WORKDIR}/defconfig-gnutls
 	install -m 0755 ${WORKDIR}/defconfig-gnutls wpa_supplicant/.config
+	echo "CFLAGS +=\"-I${STAGING_INCDIR}/libnl3\"" >> wpa_supplicant/.config
 }
 
 export EXTRA_CFLAGS = "${CFLAGS}"
-- 
1.7.10.4



