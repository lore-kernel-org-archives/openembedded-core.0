Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id D59567D718
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 11:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 426301839F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 13:25:53 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id koRSNNdARo6O
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 13:25:51 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id A0D5E1836F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 13:25:51 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9021C1A069
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 13:25:51 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8568D1A067
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 13:25:51 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 13:25:51 +0200 (CEST)
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by thoth.se.axis.com (Postfix) with ESMTP id 79BB02DB6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 13:25:51 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.15.2/8.15.2) with ESMTPS id x6FBPpeR031976
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 13:25:51 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.15.2/8.15.2/Submit) id x6FBPpOc031975
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Jul 2019 13:25:51 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2019 13:25:49 +0200
Message-Id: <20190715112549.31924-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190715112549.31924-1-pkj@axis.com>
References: <20190715112549.31924-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH 2/2] nativesdk-meson: Remove some unused variables
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
X-List-Received-Date: Mon, 15 Jul 2019 11:25:53 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/meson/nativesdk-meson_0.50.1.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.50.1.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.50.1.bb
index 1549357a55..1756f342ce 100644
--- a/meta/recipes-devtools/meson/nativesdk-meson_0.50.1.bb
+++ b/meta/recipes-devtools/meson/nativesdk-meson_0.50.1.bb
@@ -16,11 +16,6 @@ def meson_endian(prefix, d):
     else:
         bb.fatal("Cannot determine endianism for %s-%s" % (arch, os))
 
-MESON_TOOLCHAIN_ARGS = "${BUILDSDK_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-MESON_C_ARGS = "${MESON_TOOLCHAIN_ARGS} ${BUILDSDK_CFLAGS}"
-MESON_CPP_ARGS = "${MESON_TOOLCHAIN_ARGS} ${BUILDSDK_CXXFLAGS}"
-MESON_LINK_ARGS = "${MESON_TOOLCHAIN_ARGS} ${BUILDSDK_LDFLAGS}"
-
 # The cross file logic is similar but not identical to that in meson.bbclass,
 # since it's generating for an SDK rather than a cross-compile. Important
 # differences are:
-- 
2.21.0


