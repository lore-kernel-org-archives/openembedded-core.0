Return-Path: <Paul_Woegerer@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B7A9961604
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 09:01:04 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1VHVR4-0004lX-SO from Paul_Woegerer@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Sep 2013 02:01:06 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 5 Sep 2013 02:01:06 -0700
Received: from atv-pwoegere-l3.atv.mentorg.com.com ([172.30.72.2]) by
	NA1-MAIL.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 5 Sep 2013 02:01:05 -0700
From: Paul Woegerer <paul_woegerer@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2013 11:00:59 +0200
Message-Id: <1378371660-5061-3-git-send-email-paul_woegerer@mentor.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <1378371660-5061-1-git-send-email-paul_woegerer@mentor.com>
References: <1378371660-5061-1-git-send-email-paul_woegerer@mentor.com>
X-OriginalArrivalTime: 05 Sep 2013 09:01:06.0211 (UTC)
	FILETIME=[7492E730:01CEAA16]
Subject: [PATCH 2/3] lttng-tools: Update to version 2.3.0
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
 .../lttng/{lttng-tools_2.2.3.bb => lttng-tools_2.3.0.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.2.3.bb => lttng-tools_2.3.0.bb} (93%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.2.3.bb b/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb
similarity index 93%
rename from meta/recipes-kernel/lttng/lttng-tools_2.2.3.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb
index 316f488..2e0ee15 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.2.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.3.0.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
 
 DEPENDS = "liburcu popt lttng-ust"
 
-SRCREV = "b1ebf16ce065a35149c39bc4f56ace3671706860"
-PV = "v2.2.3"
+SRCREV = "c9dc1289e040c542f96fbfd558267786816d5703"
+PV = "v2.3.0"
 
 SRC_URI = "git://git.lttng.org/lttng-tools.git"
 
-- 
1.8.4


