Return-Path: <Paul_Woegerer@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 279626D159
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 12:34:45 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Vgw8F-0006iQ-C2 from Paul_Woegerer@mentor.com ;
	Thu, 14 Nov 2013 04:34:47 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 14 Nov 2013 04:34:47 -0800
Received: from atv-pwoegere-l3.atv.mentorg.com ([172.30.72.59]) by
	NA1-MAIL.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 14 Nov 2013 04:34:46 -0800
From: Paul Woegerer <paul_woegerer@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Nov 2013 13:34:34 +0100
Message-Id: <1384432474-20764-4-git-send-email-paul_woegerer@mentor.com>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1384432474-20764-1-git-send-email-paul_woegerer@mentor.com>
References: <1384432474-20764-1-git-send-email-paul_woegerer@mentor.com>
X-OriginalArrivalTime: 14 Nov 2013 12:34:46.0810 (UTC)
	FILETIME=[E7298FA0:01CEE135]
Cc: otavio@ossystems.com.br
Subject: [PATCH 3/3] lttng-tools: Update to version 2.3.1
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
X-List-Received-Date: Thu, 14 Nov 2013 12:34:45 -0000

Signed-off-by: Paul Woegerer <paul_woegerer@mentor.com>
---
 .../lttng/{lttng-tools_2.3.0.bb => lttng-tools_2.3.1.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.3.0.bb => lttng-tools_2.3.1.bb} (96%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
similarity index 96%
rename from meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
index f2a43b4..3bddd12 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.3.1.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
 DEPENDS = "liburcu popt lttng-ust"
 RDEPENDS_${PN}-ptest += "make"
 
-SRCREV = "c9dc1289e040c542f96fbfd558267786816d5703"
-PV = "v2.3.0"
+SRCREV = "5d985544a7ad54afa0514ea7f522a89d8d844860"
+PV = "v2.3.1"
 
 SRC_URI = "git://git.lttng.org/lttng-tools.git \
            file://runtest.patch \
-- 
1.8.4.2


