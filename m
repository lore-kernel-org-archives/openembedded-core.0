Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S0ATY-00048m-2R
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 12:35:12 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2012 12:26:44 +0100
Message-Id: <1329910007-8441-3-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1329910007-8441-1-git-send-email-obi@opendreambox.org>
References: <1329910007-8441-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 2/5] libproxy: don't depend on gconf unless x11 is defined
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
X-List-Received-Date: Wed, 22 Feb 2012 11:35:12 -0000

* Drop dependency on GNOME if x11 is disabled.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-support/libproxy/libproxy_0.4.7.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
index f31b701..659100d 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.7.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
@@ -6,9 +6,9 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7d7044444a7b1b116e8783edcdb44ff4 \
                     file://utils/proxy.c;beginline=1;endline=18;md5=55152a1006d7dafbef32baf9c30a99c0"
 
-DEPENDS = "gconf"
+DEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', 'gconf', '', d)}"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz"
 
-- 
1.7.5.4



