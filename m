Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8858F726AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Dec 2014 08:22:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBP8MPDO004298
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 25 Dec 2014 00:22:26 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 25 Dec 2014 00:22:25 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <paul.eggleton@linux.intel.com>
Date: Thu, 25 Dec 2014 16:19:33 +0800
Message-ID: <1419495573-23856-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] runqemu-internal: increase memory for qemuarm64
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
X-List-Received-Date: Thu, 25 Dec 2014 08:22:27 -0000
Content-Type: text/plain

Increase memory to 512M for qemuarm64. The original size 126M can't make
task testimage pass, neither 256M.

[YOCTO #7102]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 scripts/runqemu-internal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index f6274e2..5711bd3 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -51,7 +51,7 @@ else
             mem_size=128
             ;;
         "qemuarm64")
-            mem_size=128
+            mem_size=512
             ;;
         "qemumicroblaze")
             mem_size=64
-- 
1.9.1


