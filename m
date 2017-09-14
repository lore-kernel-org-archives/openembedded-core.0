Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E296F78568
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 13:57:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8EDvbvV030963
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 06:57:38 -0700
Received: from fidler.wrs.com (172.25.44.7) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 14 Sep 2017 06:57:36 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Sep 2017 09:57:32 -0400
Message-ID: <20170914135732.24830-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] README.qemu: qemuppc64 is not supported
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
X-List-Received-Date: Thu, 14 Sep 2017 13:57:37 -0000
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 README.qemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.qemu b/README.qemu
index fca04b1..9f56b7d 100644
--- a/README.qemu
+++ b/README.qemu
@@ -7,7 +7,7 @@ are currently supported in 32 and 64 bit variants:
 
   * ARM (qemuarm + qemuarm64)
   * x86 (qemux86 + qemux86-64)
-  * PowerPC (qemuppc + qemuppc64)
+  * PowerPC (qemuppc only)
   * MIPS (qemumips + qemumips64)
 
 Use of the QEMU images is covered in the Yocto Project Reference Manual.
-- 
2.9.3


