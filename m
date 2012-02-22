Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S0ATX-000486-Bn
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 12:35:11 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2012 12:26:43 +0100
Message-Id: <1329910007-8441-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1329910007-8441-1-git-send-email-obi@opendreambox.org>
References: <1329910007-8441-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 1/5] libsoup-2.4: don't depend on libgnome-keyring unless x11 is defined
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
X-List-Received-Date: Wed, 22 Feb 2012 11:35:11 -0000

* Drop dependency on GNOME if x11 is disabled.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
index 8e6ef26..861a1aa 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
@@ -6,9 +6,9 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 SECTION = "x11/gnome/libs"
-PR = "r1"
+PR = "r2"
 
-DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 libgnome-keyring"
+DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 ${@base_contains('DISTRO_FEATURES', 'x11', 'libgnome-keyring', '', d)}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/2.36/libsoup-${PV}.tar.bz2"
 
-- 
1.7.5.4



