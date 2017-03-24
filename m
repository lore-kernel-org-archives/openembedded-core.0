Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ACC3272F4F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 08:55:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2O8tbHk005535
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 01:55:37 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Mar 2017 01:55:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Mar 2017 01:55:31 -0700
Message-ID: <4c64e79054f397fa0c6347c188cc929ed1cd494e.1490345691.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1490345691.git.liezhi.yang@windriver.com>
References: <cover.1490345691.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] runtime-test.py: fix typo
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
X-List-Received-Date: Fri, 24 Mar 2017 08:55:36 -0000
Content-Type: text/plain

roofs -> rootfs.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/selftest/runtime-test.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/runtime-test.py b/meta/lib/oeqa/selftest/runtime-test.py
index 171a373..ea31c18 100644
--- a/meta/lib/oeqa/selftest/runtime-test.py
+++ b/meta/lib/oeqa/selftest/runtime-test.py
@@ -181,10 +181,10 @@ postinst-delayed-t \
                         break
 
     @testcase(1545)
-    def test_postinst_roofs_and_boot(self):
+    def test_postinst_rootfs_and_boot(self):
         """
         Summary:        The purpose of this test case is to verify Post-installation
-                        scripts are called when roofs is created and also test
+                        scripts are called when rootfs is created and also test
                         that script can be delayed to run at first boot.
         Dependencies:   NA
         Steps:          1. Add proper configuration to local.conf file
-- 
2.9.0


