Return-Path: <Paul_Woegerer@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B1ABB61863
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 09:01:05 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1VHVR5-0004ld-Tw from Paul_Woegerer@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Sep 2013 02:01:07 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 5 Sep 2013 02:01:08 -0700
Received: from atv-pwoegere-l3.atv.mentorg.com.com ([172.30.72.2]) by
	NA1-MAIL.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 5 Sep 2013 02:01:06 -0700
From: Paul Woegerer <paul_woegerer@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2013 11:01:00 +0200
Message-Id: <1378371660-5061-4-git-send-email-paul_woegerer@mentor.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <1378371660-5061-1-git-send-email-paul_woegerer@mentor.com>
References: <1378371660-5061-1-git-send-email-paul_woegerer@mentor.com>
X-OriginalArrivalTime: 05 Sep 2013 09:01:07.0227 (UTC)
	FILETIME=[752DEEB0:01CEAA16]
Subject: [PATCH 3/3] lttng-modules: Update to version 2.3.0
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
X-List-Received-Date: Thu, 05 Sep 2013 09:01:05 -0000

Signed-off-by: Paul Woegerer <paul_woegerer@mentor.com>
---
 meta/recipes-kernel/lttng/lttng-modules_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_git.bb b/meta/recipes-kernel/lttng/lttng-modules_git.bb
index 9959a74..789b5ec 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_git.bb
@@ -10,8 +10,8 @@ DEPENDS = "virtual/kernel"
 
 inherit module
 
-SRCREV = "10fe4e3f10c9ce1f2963bd118b91895a67e955ee"
-PV = "2.2.1+git${SRCPV}"
+SRCREV = "78c8710bb8e6b7f6301d95afec0305f40fa063ad"
+PV = "2.3.0+git${SRCPV}"
 
 SRC_URI = "git://git.lttng.org/lttng-modules.git \
            file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
-- 
1.8.4


