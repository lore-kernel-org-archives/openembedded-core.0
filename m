Return-Path: <Paul_Woegerer@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 6BCF76D6EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 12:34:42 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Vgw8C-0006i9-Kx from Paul_Woegerer@mentor.com ;
	Thu, 14 Nov 2013 04:34:44 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 14 Nov 2013 04:34:44 -0800
Received: from atv-pwoegere-l3.atv.mentorg.com ([172.30.72.59]) by
	NA1-MAIL.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 14 Nov 2013 04:34:43 -0800
From: Paul Woegerer <paul_woegerer@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Nov 2013 13:34:32 +0100
Message-Id: <1384432474-20764-2-git-send-email-paul_woegerer@mentor.com>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1384432474-20764-1-git-send-email-paul_woegerer@mentor.com>
References: <1384432474-20764-1-git-send-email-paul_woegerer@mentor.com>
X-OriginalArrivalTime: 14 Nov 2013 12:34:44.0091 (UTC)
	FILETIME=[E58AACB0:01CEE135]
Cc: otavio@ossystems.com.br
Subject: [PATCH 1/3] liburcu: Update to version 0.7.9
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
X-List-Received-Date: Thu, 14 Nov 2013 12:34:42 -0000

Signed-off-by: Paul Woegerer <paul_woegerer@mentor.com>
---
 meta/recipes-support/liburcu/{liburcu_0.7.7.bb => liburcu_0.7.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/liburcu/{liburcu_0.7.7.bb => liburcu_0.7.9.bb} (81%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.7.7.bb b/meta/recipes-support/liburcu/liburcu_0.7.9.bb
similarity index 81%
rename from meta/recipes-support/liburcu/liburcu_0.7.7.bb
rename to meta/recipes-support/liburcu/liburcu_0.7.9.bb
index a75e92e..c8c4802 100644
--- a/meta/recipes-support/liburcu/liburcu_0.7.7.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.7.9.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0f060c30a27922ce9c0d557a639b4fa3 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "d14de3ff32eb1ab9424b258599c8a6f3"
-SRC_URI[sha256sum] = "8ab8a7d8fea47c09ceac24c9277f00da626bbd9426c973eb325b1baf33b4bdfb"
+SRC_URI[md5sum] = "a625266e17437f91111ab4e736c5056f"
+SRC_URI[sha256sum] = "a7e1f781773c953d5cc456aa92a3c6d2385c5f984d8d576dccfaf93dd14f1405"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
1.8.4.2


