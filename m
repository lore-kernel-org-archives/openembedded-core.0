Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TDtrR-0002tZ-FW
	for Openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 11:12:53 +0200
Received: from puchatek.dom (84-10-244-25.dynamic.chello.pl [84.10.244.25])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 252FED20E0;
	Tue, 18 Sep 2012 11:00:16 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: Openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2012 11:00:07 +0200
Message-Id: <1347958808-20182-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <505837BA.2040305@linaro.org>
References: <505837BA.2040305@linaro.org>
Subject: [PATCH 1/2] ncurses: Update gnu-config files to version used by OE-Core
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
X-List-Received-Date: Tue, 18 Sep 2012 09:12:53 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-core/ncurses/ncurses.inc |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 91b1f34..3ff0914 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -59,6 +59,11 @@ ncurses_configure() {
 	cd ..
 }
 
+# Update gnu-config files to version used by OE-Core
+do_configure_prepend() {
+	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.{guess,sub} ${S}
+}
+
 # Override the function from the autotools class; ncurses requires a
 # patched autoconf213 to generate the configure script. This autoconf
 # is not available so that the shipped script will be used.
-- 
1.7.10.4



