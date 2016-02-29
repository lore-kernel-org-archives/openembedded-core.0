Return-Path: <christrobridge@hotmail.com>
X-Greylist: delayed 302 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 29 Feb 2016 22:37:04 UTC
Received: from BLU004-OMC3S18.hotmail.com (blu004-omc3s18.hotmail.com
	[65.55.116.93])
	by mail.openembedded.org (Postfix) with ESMTP id 783166FF56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 22:37:04 +0000 (UTC)
Received: from BLU436-SMTP133 ([65.55.116.74]) by BLU004-OMC3S18.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008);
	Mon, 29 Feb 2016 14:32:03 -0800
X-TMN: [gbCAE+Y7ntaQMAA7imnQzLAYorv5FGJk]
X-Originating-Email: [christrobridge@hotmail.com]
Message-ID: <BLU436-SMTP13341B70B1E43FF04270322DABA0@phx.gbl>
From: Chris Trobridge <christrobridge@hotmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 22:31:47 +0000
X-Mailer: git-send-email 2.4.3
X-OriginalArrivalTime: 29 Feb 2016 22:31:59.0894 (UTC)
	FILETIME=[01190360:01D17341]
MIME-Version: 1.0
Subject: [meta-oe][PATCH] Fix gpsd build by switching to use EXTRA_CONF_PACKAGECONFIG.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Feb 2016 22:37:04 -0000
Content-Type: text/plain

Was using EXTRA_OECONF, leading to:

SCons Error: no such option: --disable-static

Signed-off-by: Chris Trobridge <christrobridge@hotmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
index ff268b3..39d6470 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
@@ -45,7 +45,7 @@ EXTRA_OESCONS = " \
     strip='false' \
     chrpath='yes' \
     systemd='${SYSTEMD_OESCONS}' \
-    ${EXTRA_OECONF} \
+    ${EXTRA_CONF_PACKAGECONFIG} \
 "
 # this cannot be used, because then chrpath is not found and only static lib is built
 # target=${HOST_SYS}
-- 
2.4.3


