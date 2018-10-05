Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 322B6745F2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 20:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 0B3F118490
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 22:45:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id L4ZQssLDXPcb
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 22:45:57 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 019C11853B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 22:45:57 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E35321E07C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 22:45:56 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D85F91E078
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 22:45:56 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 22:45:56 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id CCBFD2988
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 22:45:56 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w95KjwLk003741
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Oct 2018 22:45:58 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w95KjwSp003740
	for openembedded-core@lists.openembedded.org;
	Fri, 5 Oct 2018 22:45:58 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2018 22:45:56 +0200
Message-Id: <20181005204556.3678-4-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20181005204556.3678-1-pkj@axis.com>
References: <20181005204556.3678-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 4/4] libgcrypt: Add the LICENSES file to LIC_FILES_CHKSUM
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
X-List-Received-Date: Fri, 05 Oct 2018 20:45:58 -0000

The LICENSES file contains references to source files with other
licenses than GPL/LGPL that stipulate that they shall be mentioned in
any documentation accompanying a product including this library.

License-Update: Add missing LICENSES file
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.8.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.3.bb
index 44728a7c20..cefa8365ee 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.3.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.3.bb
@@ -10,7 +10,8 @@ LICENSE_${PN}-dev = "GPLv2+ & LGPLv2.1+"
 LICENSE_dumpsexp-dev = "GPLv3+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff"
+                    file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff \
+                    file://LICENSES;md5=840e3bcb754e5046ffeda7619034cbd8"
 
 DEPENDS = "libgpg-error"
 
-- 
2.12.0


