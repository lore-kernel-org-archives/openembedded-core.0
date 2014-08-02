Return-Path: <pab@pabigot.com>
X-Greylist: delayed 435 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 02 Aug 2014 13:00:07 UTC
Received: from p3plsmtpa09-02.prod.phx3.secureserver.net
	(p3plsmtpa09-02.prod.phx3.secureserver.net [173.201.193.231])
	by mail.openembedded.org (Postfix) with ESMTP id 6795960065
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Aug 2014 13:00:07 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa09-02.prod.phx3.secureserver.net with 
	id Zosq1o00F1mTNtu01osrKH; Sat, 02 Aug 2014 05:52:53 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Aug 2014 07:52:49 -0500
Message-Id: <1406983969-3935-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
Cc: "Peter A. Bigot" <pab@pabigot.com>
Subject: [PATCH] cups: regen configure so cups-no-gcrypt.patch has an effect
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
X-List-Received-Date: Sat, 02 Aug 2014 13:00:12 -0000

The existing patch backports a change to the m4 source file, but without
a forced autoconf before configure it has no effect.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-extended/cups/cups.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 6d04a2b..adf21eb 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -39,6 +39,7 @@ EXTRA_OECONF = " \
 do_configure() {
 	gnu-configize
 	libtoolize --force
+	autoconf --force
 	DSOFLAGS="${LDFLAGS}" SERVERBIN="${libdir}/cups" oe_runconf
 }
 
-- 
1.8.5.5


