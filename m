Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Ua34L-0001kw-9u
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 14:02:02 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 4616AD22DE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2013 13:43:29 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2013 13:43:57 +0200
Message-Id: <1368013438-15107-3-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1368013438-15107-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1368013438-15107-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [PATCH 3/4] gdb: move checksums to versioned include
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
 meta/recipes-devtools/gdb/gdb-common.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 6f42dff..deb3841 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -23,9 +23,6 @@ inherit autotools
 
 SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
           "
-SRC_URI[md5sum] = "b1519bf899890d21d4774845a6e602fe"
-SRC_URI[sha256sum] = "f99f26e2c1127f12ba14ece0947a9a9948be45e96b69ef363131e469a698636e"
-
 export CC_FOR_BUILD = "${BUILD_CC}"
 export CXX_FOR_BUILD = "${BUILD_CXX}"
 export CPP_FOR_BUILD = "${BUILD_CPP}"
-- 
1.8.1.2



