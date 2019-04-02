Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6EA6D7D03F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 19:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id EE2B318580
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id dACW6Y56fij7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 4DC9E1854D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39B131E072
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E9541E066
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 22C4A2816
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:31:07 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id x32JV6V1026883
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Apr 2019 21:31:06 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id x32JV6gR026882
	for openembedded-core@lists.openembedded.org;
	Tue, 2 Apr 2019 21:31:06 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2019 21:31:00 +0200
Message-Id: <65cd513a44ef0345fbdc94874aec631fde32b87e.1554233389.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1554233389.git.pkj@axis.com>
References: <cover.1554233389.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/6] Revert "arch-armv5-dsp.inc: Check for dsp only to enable 'e' in package arches"
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
X-List-Received-Date: Tue, 02 Apr 2019 19:31:07 -0000

This reverts commit 1d6d5bb30a83f9136b7c33e297d48564ae61b50e.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/conf/machine/include/arm/arch-armv5-dsp.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/arch-armv5-dsp.inc b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
index d117af1520..1f16085fcd 100644
--- a/meta/conf/machine/include/arm/arch-armv5-dsp.inc
+++ b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
@@ -1,4 +1,4 @@
-ARMPKGSFX_DSP = "${@bb.utils.contains('TUNE_FEATURES', [ 'dsp' ], 'e', '', d)}"
+ARMPKGSFX_DSP = "${@bb.utils.contains('TUNE_FEATURES', [ 'armv5', 'dsp' ], 'e', '', d)}"
 TUNEVALID[dsp] = "ARM DSP functionality"
 
 require conf/machine/include/arm/arch-armv5.inc
-- 
2.12.0


