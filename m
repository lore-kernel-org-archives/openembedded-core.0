Return-Path: <Paul_Woegerer@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A8F8361618
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 09:01:03 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1VHVR3-0004lO-T0 from Paul_Woegerer@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Sep 2013 02:01:05 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 5 Sep 2013 02:01:05 -0700
Received: from atv-pwoegere-l3.atv.mentorg.com.com ([172.30.72.2]) by
	NA1-MAIL.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 5 Sep 2013 02:01:04 -0700
From: Paul Woegerer <paul_woegerer@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2013 11:00:58 +0200
Message-Id: <1378371660-5061-2-git-send-email-paul_woegerer@mentor.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <1378371660-5061-1-git-send-email-paul_woegerer@mentor.com>
References: <1378371660-5061-1-git-send-email-paul_woegerer@mentor.com>
X-OriginalArrivalTime: 05 Sep 2013 09:01:05.0242 (UTC)
	FILETIME=[73FF0BA0:01CEAA16]
Subject: [PATCH 1/3] lttng-ust: Update to version 2.3.0
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
X-List-Received-Date: Thu, 05 Sep 2013 09:01:04 -0000

Signed-off-by: Paul Woegerer <paul_woegerer@mentor.com>
---
 meta/recipes-kernel/lttng/{lttng-ust_2.2.1.bb => lttng-ust_2.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.2.1.bb => lttng-ust_2.3.0.bb} (93%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.2.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb
similarity index 93%
rename from meta/recipes-kernel/lttng/lttng-ust_2.2.1.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb
index 103264b..a3b1920 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.2.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb
@@ -17,8 +17,8 @@ RPROVIDES_${PN} = "lttng2-ust"
 RREPLACES_${PN} = "lttng2-ust"
 RCONFLICTS_${PN} = "lttng2-ust"
 
-SRCREV = "481d245409b1caef7fc29790e53584eeb7d1d25d"
-PV = "2.2.1"
+SRCREV = "9f00ce32b103eed13524c876757b6611c5922382"
+PV = "2.3.0"
 PE = "2"
 
 SRC_URI = "git://git.lttng.org/lttng-ust.git \
-- 
1.8.4


