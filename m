Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C10777F90
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 15:00:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9GF10TG010145
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 08:01:00 -0700
Received: from fidler.wrs.com (172.25.44.7) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 16 Oct 2017 08:00:58 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Oct 2017 11:00:44 -0400
Message-ID: <20171016150045.25323-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 1/2] README.qemu: qemuppc64 is not supported
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
X-List-Received-Date: Mon, 16 Oct 2017 15:00:59 -0000
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


