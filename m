Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 79E847BD9A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 08:43:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45TwMT5L6rz1n
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 10:43:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561020213;
	bh=5aFI2LPFTrErSBv3QkwzvfrEH5B5UVlx7ip9qnl+HwQ=;
	h=From:To:Subject:Date:From;
	b=CmJrQBCxuTX1yQL8mXVDDanTJxNesQbsATIv/J/P9lrUgL2bR4lom5sp02GQChXjp
	Jw/PVGaKM6I/aVv5KCMNowbiCprHTVV9wQHFvxzG3Xjir9rqizH0kzNtPz0IrtvRea
	T2XgUcq8v6UxBoqNohzwNkmbXIor5wS7fpz1fKvVMeKZ3XKbU9H1626FkLReGS+jv2
	bHiX2BvccjsyoYk7Nc0NpxvOwvr1x+EOHx/svSs6TvivrYnZXPp2QdLN3OnUcWYwYy
	M9vDw8uX0L6gFVbGc2Dk4jq/7PXr8SNce7gd9vpRH1zchDlSppV3wrEGJaC2Ju4B46
	5xcDWHyjTe8EL1I1KUSu8TwJvkZdhQ/hVWFturO4vonaH5X6ikDVDGDXpnzTU/l2hE
	+MuFQ+gJXV6gtv/Jln0y+1Ij0E/xqju8WBW+YylLpnwAW2bKfgQ/NQPOpf8CtNx8a3
	cUC1thiUzTrTUBjK71dmYBFlFD5Zi9o34rt1S7JYXyKdyGuwg2dtWjKMQ9Wi6bZg0C
	bdKnOPsgcBsvrppZMmDUnJKv6vuSpMyND0o/QWxUq3DBGSOq61W3xzqO9nFMhKLq5s
	rF0t1u/d+3hcxpyzHbH1RAu5aeuNPuZVNjYcMSWenT4zaG6bkXLiL8IiMqha0+rpb2
	D9ubPRUdbrXoEvULXGDVYnHU=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2019 11:43:32 +0300
Message-Id: <20190620084332.31285-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] go: Upgrade 1.12.5 -> 1.12.6
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
X-List-Received-Date: Thu, 20 Jun 2019 08:43:33 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/go/go-1.12.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
index 7c4cac1fc2..3f23f06f09 100644
--- a/meta/recipes-devtools/go/go-1.12.inc
+++ b/meta/recipes-devtools/go/go-1.12.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.12"
-GO_MINOR = ".5"
+GO_MINOR = ".6"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -19,5 +19,5 @@ SRC_URI += "\
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
-SRC_URI[main.md5sum] = "cb6f594d22dd79af4fff9779607b1b47"
-SRC_URI[main.sha256sum] = "2aa5f088cbb332e73fc3def546800616b38d3bfe6b8713b8a6404060f22503e8"
+SRC_URI[main.md5sum] = "48a4141fc718dd742d106431294f08bf"
+SRC_URI[main.sha256sum] = "c96c5ccc7455638ae1a8b7498a030fe653731c8391c5f8e79590bce72f92b4ca"
-- 
2.17.1


