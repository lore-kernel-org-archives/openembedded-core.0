Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVpdZ-0000yq-4G
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 20:16:09 +0100
Received: by eaad13 with SMTP id d13so1115144eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 11:09:28 -0800 (PST)
Received: by 10.213.29.20 with SMTP id o20mr54352ebc.71.1322680168346;
	Wed, 30 Nov 2011 11:09:28 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id a60sm9129685eeb.4.2011.11.30.11.09.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 11:09:27 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 20:09:20 +0100
Message-Id: <1322680162-24126-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/3] gdbm 1.10: use lib_package.bbclass to match packaging with 1.8.x
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
X-List-Received-Date: Wed, 30 Nov 2011 19:16:09 -0000

SOVERSION changed from 3 to 4, so PR bump for dependant recipes (perl, pulseaudio) are needed as well)

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-support/gdbm/gdbm_1.10.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gdbm/gdbm_1.10.bb b/meta/recipes-support/gdbm/gdbm_1.10.bb
index 4ed5881..9b2fde4 100644
--- a/meta/recipes-support/gdbm/gdbm_1.10.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.10.bb
@@ -4,13 +4,13 @@ SECTION = "libs"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=241da1b9fe42e642cbb2c24d5e0c4d24"
 
-PR = "r0" 
+PR = "r1" 
 
 SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "88770493c2559dc80b561293e39d3570"
 SRC_URI[sha256sum] = "23f8134c5b94bbfb06d756a6b78f074fba6e6028cf2fe01341d40b26db773441"
 
-inherit autotools gettext
+inherit autotools gettext lib_package
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.2.5



