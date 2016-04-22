Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5E308731AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 05:50:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3M5oeWg022001
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 22:50:41 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Apr 2016 22:50:40 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Apr 2016 22:50:36 -0700
Message-ID: <03ed6dc4a7b40b08cc1013db7e33f5b5ededd269.1461304177.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1461304177.git.liezhi.yang@windriver.com>
References: <cover.1461304177.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] gnu-efi: set COMPATIBLE_HOST_armv4 to null
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
X-List-Received-Date: Fri, 22 Apr 2016 05:50:40 -0000
Content-Type: text/plain

It doesn't build with armv4:
lib1funcs.S: Assembler messages:
Assembler messages:
gnu-efi-3.0.3/lib/arm/lib1funcs.S:140: Error: selected processor does not support `clz r3,r1' in ARM mode
gnu-efi-3.0.3/lib/arm/div64.S:95: Error: selected processor does not support `clz r2,r4' in ARM mode
gnu-efi-3.0.3/lib/arm/lib1funcs.S:140: Error: selected processor does not support `clz r2,r0' in ARM mode
[snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb
index eca3459..6b130a2 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb
@@ -25,6 +25,7 @@ SRC_URI[md5sum] = "15a4bcbc18a9a5e8110ed955970622e6"
 SRC_URI[sha256sum] = "c530f21a15fd9c214dd92d29a6caa20fac989289267512020b6da1f5e6f5b4cb"
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
+COMPATIBLE_HOST_armv4 = 'null'
 
 def gnu_efi_arch(d):
     import re
-- 
2.8.0


