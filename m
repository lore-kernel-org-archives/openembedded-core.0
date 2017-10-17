Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED3BE719B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 22:03:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9HM3QaJ023300
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 15:03:26 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 17 Oct 2017 15:03:26 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Oct 2017 15:03:25 -0700
Message-ID: <20171017220325.34485-1-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] goarch: There is no GOARCH defined for mips64-n32
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
X-List-Received-Date: Tue, 17 Oct 2017 22:03:26 -0000
Content-Type: text/plain

Defeat building for mipsarchn32 because there is no corresponding
GOARCH.  Neither "mips" nor "mips64" allows go-runtime to compile.
Existing mips32 code assumes the o32 ABI.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/classes/goarch.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 653f035..663c9ff 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -29,6 +29,7 @@ COMPATIBLE_HOST_linux-gnux32 = "null"
 COMPATIBLE_HOST_linux-muslx32 = "null"
 COMPATIBLE_HOST_powerpc = "null"
 COMPATIBLE_HOST_powerpc64 = "null"
+COMPATIBLE_HOST_mipsarchn32 = "null"
 ARM_INSTRUCTION_SET = "arm"
 TUNE_CCARGS_remove = "-march=mips32r2"
 
-- 
2.7.4


