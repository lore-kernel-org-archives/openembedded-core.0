Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA79F7BDFD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jan 2019 06:58:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x046w5LY029936
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Jan 2019 22:58:05 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Thu, 3 Jan 2019 22:58:04 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Jan 2019 15:15:44 +0800
Message-ID: <27ff0a7a72fb16f8abb9cc384f9bf5733d399680.1546585931.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1546585931.git.liezhi.yang@windriver.com>
References: <cover.1546585931.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/3] oeqa/manual/bsp-qemu.json: Update for QEMU_USE_KVM
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
X-List-Received-Date: Fri, 04 Jan 2019 06:58:04 -0000
Content-Type: text/plain

Now QEMU_USE_KVM can only be boolean, can not contain MACHINE any more.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/manual/bsp-qemu.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-qemu.json b/meta/lib/oeqa/manual/bsp-qemu.json
index 1260af4..cf51b6a 100644
--- a/meta/lib/oeqa/manual/bsp-qemu.json
+++ b/meta/lib/oeqa/manual/bsp-qemu.json
@@ -10,7 +10,7 @@
       ],
       "execution": {
         "1": {
-          "action": "Build a kernel with KVM enabled  \n\nIn Local.conf add  \n\nQEMU_USE_KVM = \"${@ 'intel-corei7-64 intel-core2-32 qemux86 qemux86-64' if os.access('/dev/kvm', os.R_OK|os.W_OK) else '' }\"  \n\n ",
+          "action": "Build a kernel with KVM enabled  \n\nIn Local.conf add  \n\nQEMU_USE_KVM = \"${@ '1' if os.access('/dev/kvm', os.R_OK|os.W_OK) else '0' }\"  \n\n ",
           "expected_results": ""
         },
         "2": {
@@ -219,4 +219,4 @@
       "summary": "check_bash_in_image"
     }
   }
-]
\ No newline at end of file
+]
-- 
2.7.4


