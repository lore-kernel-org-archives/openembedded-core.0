Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RRPIT-00028T-07
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 15:20:05 +0100
Received: by wwp14 with SMTP id 14so4350057wwp.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 06:13:39 -0800 (PST)
Received: by 10.216.139.133 with SMTP id c5mr410906wej.25.1321625618673;
	Fri, 18 Nov 2011 06:13:38 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id co5sm435295wib.8.2011.11.18.06.13.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Nov 2011 06:13:37 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Nov 2011 15:13:33 +0100
Message-Id: <1321625613-30146-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] shared-mime-info: fix ordering of PACKAGES
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
X-List-Received-Date: Fri, 18 Nov 2011 14:20:05 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../shared-mime-info/shared-mime-info.inc          |    2 +-
 .../shared-mime-info/shared-mime-info_0.91.bb      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info.inc b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
index 57e829c..d7fa67c 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
@@ -19,7 +19,7 @@ FILES_${PN}-dev += "${datadir}/pkgconfig/shared-mime-info.pc"
 
 # freedesktop.org.xml is only required when updating the mime database,
 # package it separately
-PACKAGES += "shared-mime-info-data"
+PACKAGES =+ "shared-mime-info-data"
 FILES_shared-mime-info-data = "${datadir}/mime/packages/freedesktop.org.xml"
 RDEPENDS_shared-mime-info-data = "shared-mime-info"
 
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
index bc4a8f7..7ae6e10 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
@@ -1,5 +1,5 @@
 require shared-mime-info.inc
-PR = "r2"
+PR = "r3"
 
 SRC_URI[md5sum] = "982a211560ba4c47dc791ccff34e8fbc"
 SRC_URI[sha256sum] = "98cfebe1d809afb24934e634373821e2a1dfa86fc6462cab230589a1c80988bd"
-- 
1.7.2.5



