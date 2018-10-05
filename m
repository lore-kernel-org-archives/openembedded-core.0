Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 854E2745F2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 20:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 4AF4F183C3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 22:45:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id JWV6oCMRZJGZ
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 22:45:56 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id DCE2718490
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 22:45:56 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA5BB1A093
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 22:45:56 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BEE821A096
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 22:45:56 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 22:45:56 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id B2E572988
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 22:45:56 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w95KjvZG003733
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Oct 2018 22:45:57 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w95Kjvrc003732
	for openembedded-core@lists.openembedded.org;
	Fri, 5 Oct 2018 22:45:57 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2018 22:45:54 +0200
Message-Id: <20181005204556.3678-2-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20181005204556.3678-1-pkj@axis.com>
References: <20181005204556.3678-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/4] bzip2: Include the complete license information
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
X-List-Received-Date: Fri, 05 Oct 2018 20:45:57 -0000

For some reason, the copyright part was left out of the license
information included in LIC_FILES_CHKSUM, preventing it from being
used in, e.g., documentation to satisfy the requirements of the
license.

License-Update: Include the complete license information
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index 6cafe26180..025f45c472 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -5,7 +5,7 @@ LZ77/LZ78-based compressors, and approaches the performance of the PPM family of
 HOMEPAGE = "https://sourceware.org/bzip2/"
 SECTION = "console/utils"
 LICENSE = "bzip2"
-LIC_FILES_CHKSUM = "file://LICENSE;beginline=8;endline=37;md5=40d9d1eb05736d1bfc86cfdd9106e6b2"
+LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=39406315f540c69bd05b1531daedd2ae"
 PR = "r5"
 
 SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz \
-- 
2.12.0


