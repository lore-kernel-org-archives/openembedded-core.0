Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TktJO-00071Q-6j
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 10:18:11 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 16EDFD22E9;
	Tue, 18 Dec 2012 10:03:26 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 10:03:17 +0100
Message-Id: <1355821397-23458-3-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1355821397-23458-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1355821397-23458-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH 3/3] net-tools: disable Token Ring and Strip support - both got removed in 3.7 kernel
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
X-List-Received-Date: Tue, 18 Dec 2012 09:18:12 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.h | 4 ++--
 meta/recipes-extended/net-tools/net-tools_1.60-23.bb                 | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.h b/meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.h
index 92c527a..6d39c2a 100644
--- a/meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.h
+++ b/meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.h
@@ -49,8 +49,8 @@
 #define HAVE_HWSLIP 1
 #define HAVE_HWPPP 1
 #define HAVE_HWTUNNEL 1
-#define HAVE_HWSTRIP 1
-#define HAVE_HWTR 1
+#define HAVE_HWSTRIP 0
+#define HAVE_HWTR 0
 #define HAVE_HWAX25 0
 #define HAVE_HWROSE 0
 #define HAVE_HWNETROM 1
diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb b/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
index 7760877..bc61d21 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "http://bugs.debian.org/net-tools"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://ifconfig.c;beginline=11;endline=15;md5=d1ca372080ad5401e23ca0afc35cf9ba"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/net-tools/net-tools_1.60.orig.tar.gz;name=tarball \
            ${DEBIAN_MIRROR}/main/n/net-tools/${BPN}_${PV}.diff.gz;apply=no;name=patch \
-- 
1.8.0



