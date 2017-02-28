Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 98D7E72F9E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 13:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C7C0E18305
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:24 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id qHRaif34qLtT
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:20 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id DBC8818334
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:20 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB91E1E146
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:20 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFE161E144
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:20 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:20 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id B446E4B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:20 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v1SDZKIF019110
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 14:35:20 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v1SDZKgJ019109
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2017 14:35:20 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2017 14:35:16 +0100
Message-Id: <508caa8483f91108f6a36fa5da255f9290c59bbd.1488288835.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1488288835.git.pkj@axis.com>
References: <cover.1488288835.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 1/4] linux-libc-headers: Add inherit of pkgconfig
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
X-List-Received-Date: Tue, 28 Feb 2017 13:35:23 -0000

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


