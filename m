Return-Path: <Paul_Woegerer@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 0A3F36DA14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 12:34:44 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Vgw8E-0006iL-5k from Paul_Woegerer@mentor.com ;
	Thu, 14 Nov 2013 04:34:46 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 14 Nov 2013 04:34:46 -0800
Received: from atv-pwoegere-l3.atv.mentorg.com ([172.30.72.59]) by
	NA1-MAIL.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 14 Nov 2013 04:34:45 -0800
From: Paul Woegerer <paul_woegerer@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Nov 2013 13:34:33 +0100
Message-Id: <1384432474-20764-3-git-send-email-paul_woegerer@mentor.com>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1384432474-20764-1-git-send-email-paul_woegerer@mentor.com>
References: <1384432474-20764-1-git-send-email-paul_woegerer@mentor.com>
X-OriginalArrivalTime: 14 Nov 2013 12:34:45.0466 (UTC)
	FILETIME=[E65C7BA0:01CEE135]
Cc: otavio@ossystems.com.br
Subject: [PATCH 2/3] lttng-ust: Update to version 2.3.1
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
X-List-Received-Date: Thu, 14 Nov 2013 12:34:44 -0000

Signed-off-by: Paul Woegerer <paul_woegerer@mentor.com>
---
 .../lttng/{lttng-ust_2.3.0.bb => lttng-ust_2.3.1.bb}              | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.3.0.bb => lttng-ust_2.3.1.bb} (80%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb
similarity index 80%
rename from meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb
index a3b1920..ae52ee8 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.3.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.3.1.bb
@@ -1,5 +1,5 @@
-SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.0"
-DESCRIPTION = "The LTTng UST 2.0 package contains the userspace tracer library to trace userspace codes."
+SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.x"
+DESCRIPTION = "The LTTng UST 2.x package contains the userspace tracer library to trace userspace codes."
 HOMEPAGE = "http://lttng.org/ust"
 BUGTRACKER = "https://bugs.lttng.org/projects/lttng-ust"
 
@@ -17,8 +17,8 @@ RPROVIDES_${PN} = "lttng2-ust"
 RREPLACES_${PN} = "lttng2-ust"
 RCONFLICTS_${PN} = "lttng2-ust"
 
-SRCREV = "9f00ce32b103eed13524c876757b6611c5922382"
-PV = "2.3.0"
+SRCREV = "535d0408caee93577c2b4d8ad3cd672fa97eac1d"
+PV = "2.3.1"
 PE = "2"
 
 SRC_URI = "git://git.lttng.org/lttng-ust.git \
-- 
1.8.4.2


