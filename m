Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AFFAD7C1EF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 00:11:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0I0BYsI024160
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:11:34 -0800 (PST)
Received: from localhost (128.224.163.192) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 17 Jan 2019 16:11:34 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Jan 2019 08:11:31 +0800
Message-ID: <1547770291-6985-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.192]
Subject: [PATCH] parselogs.py: ignore failure messages for beaglebone edgerouter and mpc8315e-rdb
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
X-List-Received-Date: Fri, 18 Jan 2019 00:11:33 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 3d72e20..e3465ea 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -162,7 +162,23 @@ ignore_errors = {
         'The driver is built-in, so to load the firmware you need to',
         ] + x86_common,
     'edgerouter' : [
+        'not creating \'/sys/firmware/fdt\'',
+        'Failed to find cpu0 device node',
         'Fatal server error:',
+        'Server terminated with error',
+        ] + common_errors,
+    'beaglebone-yocto' : [
+        'Direct firmware load for regulatory.db',
+        'failed to load regulatory.db',
+        'l4_wkup_cm',
+        'Failed to load module "glx"',
+        'Failed to make EGL context current',
+        'glamor initialization failed',
+        ] + common_errors,
+    'mpc8315e-rdb' : [
+        'of_irq_parse_pci: failed with',
+        'Fatal server error:',
+        'Server terminated with error',
         ] + common_errors,
 }
 
-- 
2.7.4


