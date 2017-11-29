Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 74E8077EFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 07:15:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAT7FMGU005470
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 23:15:22 -0800
Received: from pek-lpgtest5.wrs.com (128.224.153.85) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 28 Nov 2017 23:15:16 -0800
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Nov 2017 14:54:18 +0800
Message-ID: <1511938459-22871-1-git-send-email-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 2.0.1
MIME-Version: 1.0
Subject: [PATCH] gmp: depends on flex-native to fix parallel building issue
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
X-List-Received-Date: Wed, 29 Nov 2017 07:15:21 -0000
Content-Type: text/plain

fix below parallel building issue:
configure:27365: result: flex
configure:27403: flex conftest.l
.../sysroots/x86_64-linux/usr/bin/flex.real: No such file or directory
configure:27407: $? = 127
configure:27409: checking lex output file root
configure:27420: error: cannot find output from flex; giving up

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 meta/recipes-support/gmp/gmp.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
index abac8cf..1b35eaa 100644
--- a/meta/recipes-support/gmp/gmp.inc
+++ b/meta/recipes-support/gmp/gmp.inc
@@ -10,3 +10,5 @@ PACKAGECONFIG[readline] = "--with-readline=yes,--with-readline=no,readline"
 
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
+
+DEPENDS = "flex-native"
-- 
2.0.1


