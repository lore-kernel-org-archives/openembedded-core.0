Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 36F6D60107
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 09:50:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6V9oBA1029848
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 02:50:12 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 31 Jul 2017 02:50:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 31 Jul 2017 02:50:01 -0700
Message-ID: <2e63bf95e8a5288464d90567260047217a3617d0.1501494496.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1501494496.git.liezhi.yang@windriver.com>
References: <cover.1501494496.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/10] oeqa/targetcontrol.py: simplify checking for qemu_use_kvm
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
X-List-Received-Date: Mon, 31 Jul 2017 09:50:11 -0000
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


