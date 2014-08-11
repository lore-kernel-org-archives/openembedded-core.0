Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B3B4165D5E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 14:10:08 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XGqIa-0000eS-PG from Yasir_Khan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Aug 2014 07:10:08 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 11 Aug 2014 07:10:08 -0700
From: Yasir Khan <yasir_khan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Aug 2014 19:09:30 +0500
Message-Id: <1407766170-39252-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 11 Aug 2014 14:10:08.0636 (UTC)
	FILETIME=[F52B6BC0:01CFB56D]
Subject: [PATCH] lttng-ust: update to version 2.5.0
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
X-List-Received-Date: Mon, 11 Aug 2014 14:10:17 -0000

From: Yasir-Khan <yasir_khan@mentor.com>

update to latest stable-2.5 revision

Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 .../{lttng-ust_2.4.0.bb => lttng-ust_2.5.0.bb}     |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.4.0.bb => lttng-ust_2.5.0.bb} (87%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb
similarity index 87%
rename from meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb
index 1629554..1595627 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.4.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.5.0.bb
@@ -17,11 +17,11 @@ RPROVIDES_${PN} = "lttng2-ust"
 RREPLACES_${PN} = "lttng2-ust"
 RCONFLICTS_${PN} = "lttng2-ust"
 
-SRCREV = "5ba5bf7fba804d2de773ae1c71106a8ed856c56a"
-PV = "2.4.0"
+SRCREV = "ce59a997afdb7dc8af02b464430bb7e35549fa66"
+PV = "2.5.0"
 PE = "2"
 
-SRC_URI = "git://git.lttng.org/lttng-ust.git;branch=stable-2.4 \
+SRC_URI = "git://git.lttng.org/lttng-ust.git;branch=stable-2.5 \
            file://lttng-ust-doc-examples-disable.patch \
 	   "
 
-- 
1.7.9.5


