Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TEedI-0007W3-TZ
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 13:09:24 +0200
Received: from puchatek.dom (84-10-244-25.dynamic.chello.pl [84.10.244.25])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 1B8C0D22D6;
	Thu, 20 Sep 2012 12:56:45 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2012 12:56:34 +0200
Message-Id: <1348138594-9425-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] byacc: update config.{sub, guess} before running configure
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
X-List-Received-Date: Thu, 20 Sep 2012 11:09:25 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-extended/byacc/byacc.inc         |    2 ++
 meta/recipes-extended/byacc/byacc_20120526.bb |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/byacc/byacc.inc b/meta/recipes-extended/byacc/byacc.inc
index d1453a8..fae9e25 100644
--- a/meta/recipes-extended/byacc/byacc.inc
+++ b/meta/recipes-extended/byacc/byacc.inc
@@ -13,5 +13,7 @@ BBCLASSEXTEND = "native"
 inherit autotools
 
 do_configure() {
+	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
+	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
 	oe_runconf
 }
diff --git a/meta/recipes-extended/byacc/byacc_20120526.bb b/meta/recipes-extended/byacc/byacc_20120526.bb
index 8721b1c..3e83813 100644
--- a/meta/recipes-extended/byacc/byacc_20120526.bb
+++ b/meta/recipes-extended/byacc/byacc_20120526.bb
@@ -1,4 +1,4 @@
-PR = "r0"
+PR = "r1"
 
 # Sigh. This is one of those places where everyone licenses it differently. Someone
 # even apply UCB to it (Free/Net/OpenBSD). The maintainer states that:
-- 
1.7.10.4



