Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 6A26E60670
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 21:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 105602E511
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:39:06 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id sDf98+kfaj9j
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:39:05 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 6746E2E35B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:39:05 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 549EB1A066
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:39:05 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 490CC1A05D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:39:05 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:39:05 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 3DA5E2E7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 22:39:05 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v23Ld5qH028203
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Mar 2017 22:39:05 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v23Ld5cD028201
	for openembedded-core@lists.openembedded.org;
	Fri, 3 Mar 2017 22:39:05 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Mar 2017 22:38:59 +0100
Message-Id: <c15d9302e2650b3bb4eb31b6113f956304e68a91.1488577082.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1488577082.git.pkj@axis.com>
References: <cover.1488577082.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCHv4 2/6] linux-libc-headers: Add inherit of pkgconfig
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
X-List-Received-Date: Fri, 03 Mar 2017 21:39:05 -0000

pkg-config is used by the kernel build system when creating the
configuration tools.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 30d2243..653a470 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -42,7 +42,7 @@ python __anonymous () {
         d.setVar("HEADER_FETCH_VER", "2.6")
 }
 
-inherit kernel-arch
+inherit kernel-arch pkgconfig
 
 KORG_ARCHIVE_COMPRESSION ?= "xz"
 
-- 
2.9.0


