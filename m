Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UaMoC-0002iZ-SE
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 11:07:15 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id E0FB2D22DE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2013 10:48:07 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 May 2013 10:48:37 +0200
Message-Id: <1368089317-27254-3-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1368089317-27254-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <518A6122.5060309@linux.intel.com>
	<1368089317-27254-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH v2 3/3] gdb-cross-canadian: set everything in gdb-cross-canadian.inc
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
X-List-Received-Date: Thu, 09 May 2013 09:07:42 -0000

This allows out-of-tree versions to include one file to have all set.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc    | 2 ++
 meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.bb | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 1f60322..f6f515c 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -9,6 +9,8 @@ DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext nativesdk-readlin
 RDEPENDS_${PN} += "nativesdk-python-core nativesdk-python-lang nativesdk-python-re \
                    nativesdk-python-codecs nativesdk-python-netclient"
 
+GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
+
 EXTRA_OECONF_append = "--with-python=${WORKDIR}/python"
 
 do_configure_prepend() {
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.bb
index a2194a1..3864435 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.6.bb
@@ -1,5 +1,3 @@
 require gdb-common.inc
 require gdb-cross-canadian.inc
 require gdb-7.6.inc
-
-GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
-- 
1.8.1.2



