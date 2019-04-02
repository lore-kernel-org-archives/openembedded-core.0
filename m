Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id BEAA77D256
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 19:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 6E06118522
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:10 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id erKH-5eUPEUH
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:08 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 8F5541857A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 767761A075
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B47E1A072
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 5F68A27A0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id x32JV7rU026901
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Apr 2019 21:31:07 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id x32JV7aF026900
	for openembedded-core@lists.openembedded.org;
	Tue, 2 Apr 2019 21:31:07 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2019 21:31:03 +0200
Message-Id: <2da317556f3411f5562ef7e71c35e0a40725fbe5.1554233389.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1554233389.git.pkj@axis.com>
References: <cover.1554233389.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 5/6] arch-arm64.inc: Lower the priority of aarch64 in MACHINEOVERRIDES
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
X-List-Received-Date: Tue, 02 Apr 2019 19:31:10 -0000

This makes sure, e.g., ${SOC_FAMILY} and ${MACHINE} have higher
priorities than aarch64.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/conf/machine/include/arm/arch-arm64.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
index 5f90763f7f..53f4566815 100644
--- a/meta/conf/machine/include/arm/arch-arm64.inc
+++ b/meta/conf/machine/include/arm/arch-arm64.inc
@@ -4,7 +4,7 @@ require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[aarch64] = "Enable instructions for aarch64"
 
-MACHINEOVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', ':aarch64', '' ,d)}"
+MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'aarch64:', '' ,d)}"
 
 # Little Endian base configs
 AVAILTUNES += "aarch64 aarch64_be"
-- 
2.12.0


