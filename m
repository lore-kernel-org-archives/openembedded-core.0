Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TDtrS-0002tf-Nr
	for Openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 11:12:54 +0200
Received: from puchatek.dom (84-10-244-25.dynamic.chello.pl [84.10.244.25])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id A4B99D22DB;
	Tue, 18 Sep 2012 11:00:18 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: Openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2012 11:00:08 +0200
Message-Id: <1347958808-20182-2-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1347958808-20182-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <505837BA.2040305@linaro.org>
	<1347958808-20182-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH 2/2] db: Update gnu-config files to version used by OE-Core
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
X-List-Received-Date: Tue, 18 Sep 2012 09:12:54 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-support/db/db_5.3.15.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/db/db_5.3.15.bb b/meta/recipes-support/db/db_5.3.15.bb
index 063954a..425be59 100644
--- a/meta/recipes-support/db/db_5.3.15.bb
+++ b/meta/recipes-support/db/db_5.3.15.bb
@@ -71,6 +71,11 @@ MUTEX_arm = "${ARM_MUTEX}"
 MUTEX_armeb = "${ARM_MUTEX}"
 EXTRA_OECONF += "${MUTEX}"
 
+# Update gnu-config files to version used by OE-Core
+do_configure_prepend() {
+	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.{guess,sub} ${S}
+}
+
 # Cancel the site stuff - it's set for db3 and destroys the
 # configure.
 CONFIG_SITE = ""
-- 
1.7.10.4



