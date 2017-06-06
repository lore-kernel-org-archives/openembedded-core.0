Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 881A871DD7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 18:47:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v56IlcsU001266
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Jun 2017 11:47:39 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 6 Jun 2017 11:47:38 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Jun 2017 11:47:38 -0700
Message-ID: <1496774858-14980-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] go: do not try to build for powerpc64
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
X-List-Received-Date: Tue, 06 Jun 2017 18:47:38 -0000
Content-Type: text/plain

Add powerpc64 to the incompatible host list.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-devtools/go/go.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go.inc b/meta/recipes-devtools/go/go.inc
index 25437dd..91d040d 100644
--- a/meta/recipes-devtools/go/go.inc
+++ b/meta/recipes-devtools/go/go.inc
@@ -14,8 +14,9 @@ INHIBIT_SYSROOT_STRIP = "1"
 
 # x32 ABI is not supported on go compiler so far
 COMPATIBLE_HOST_linux-gnux32 = "null"
-# ppc32 is not supported in go compilers
+# ppc is not supported in go compilers
 COMPATIBLE_HOST_powerpc = "null"
+COMPATIBLE_HOST_powerpc64 = "null"
 
 export GOHOSTOS = "${BUILD_GOOS}"
 export GOHOSTARCH = "${BUILD_GOARCH}"
-- 
2.7.4


