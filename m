Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 37913781F2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 08:16:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6J8GFu4023367
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 19 Jul 2017 01:16:17 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 19 Jul 2017 01:16:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <paul.eggleton@linux.intel.com>, 
	<ross.burton@intel.com>
Date: Wed, 19 Jul 2017 01:16:05 -0700
Message-ID: <0b66c3ab46530306b4a353372695fa19e972c521.1500450690.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1500450690.git.liezhi.yang@windriver.com>
References: <cover.1500450690.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [RFC PATCH 1/5] oeqa/targetcontrol.py: simplify checking for qemu_use_kvm
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
X-List-Received-Date: Wed, 19 Jul 2017 08:16:19 -0000
Content-Type: text/plain

The "if qemu_use_kvm" is not needed.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/targetcontrol.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 3255e3a5c63..11e6c820e85 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -132,9 +132,8 @@ class QemuTarget(BaseTarget):
         dump_host_cmds = d.getVar("testimage_dump_host")
         dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
         qemu_use_kvm = d.getVar("QEMU_USE_KVM")
-        if qemu_use_kvm and \
-           (qemu_use_kvm == "True" and "x86" in d.getVar("MACHINE") or \
-            d.getVar("MACHINE") in qemu_use_kvm.split()):
+        if qemu_use_kvm == "True" and "x86" in d.getVar("MACHINE") or \
+            d.getVar("MACHINE") in qemu_use_kvm.split():
             use_kvm = True
         else:
             use_kvm = False
-- 
2.11.0


