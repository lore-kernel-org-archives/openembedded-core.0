Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Ua34M-0001ky-6H
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 14:02:02 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id E2CFCD22E8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2013 13:43:29 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2013 13:43:58 +0200
Message-Id: <1368013438-15107-4-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1368013438-15107-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1368013438-15107-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH 4/4] gdb: tabs -> spaces
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
X-List-Received-Date: Wed, 08 May 2013 12:02:18 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-devtools/gdb/gdb.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index a620eca..3321a24 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -4,7 +4,7 @@ inherit gettext
 
 SRC_URI += "file://kill_arm_map_symbols.patch \
             file://gdbserver-cflags-last.diff;striplevel=0 \
-	    file://renesas-sh-native-support.patch \
+            file://renesas-sh-native-support.patch \
            "
 #LDFLAGS_append = " -s"
 #export CFLAGS_append=" -L${STAGING_LIBDIR}"
-- 
1.8.1.2



