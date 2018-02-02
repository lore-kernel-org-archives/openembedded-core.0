Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3751D78821
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 03:22:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w123MtVK020126
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Feb 2018 19:22:55 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 1 Feb 2018 19:22:55 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Feb 2018 11:23:27 +0800
Message-ID: <89c376bf06ab8f188bafa0d7264b2c047d7d98a0.1517541572.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517541572.git.liezhi.yang@windriver.com>
References: <cover.1517541572.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] selftest/cases/runqemu.py: qemuboot.conf -> qemuboot.json
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
X-List-Received-Date: Fri, 02 Feb 2018 03:22:54 -0000
Content-Type: text/plain

[YOCTO #12503]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index 47d41f5..cfeb224 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -117,12 +117,12 @@ SYSLINUX_TIMEOUT = "10"
 
     @OETestID(2010)
     def test_boot_qemu_boot(self):
-        """Test runqemu /path/to/image.qemuboot.conf"""
-        qemuboot_conf = "%s-%s.qemuboot.conf" % (self.recipe, self.machine)
-        qemuboot_conf = os.path.join(self.deploy_dir_image, qemuboot_conf)
-        if not os.path.exists(qemuboot_conf):
-            self.skipTest("%s not found" % qemuboot_conf)
-        cmd = "%s %s" % (self.cmd_common, qemuboot_conf)
+        """Test runqemu /path/to/image.qemuboot.json"""
+        qb_json = "%s-%s.qemuboot.json" % (self.recipe, self.machine)
+        qb_json = os.path.join(self.deploy_dir_image, qb_json)
+        if not os.path.exists(qb_json):
+            self.skipTest("%s not found" % qb_json)
+        cmd = "%s %s" % (self.cmd_common, qb_json)
         with runqemu(self.recipe, ssh=False, launch_cmd=cmd) as qemu:
             self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
 
-- 
2.7.4


