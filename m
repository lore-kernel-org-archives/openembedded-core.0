Return-Path: <Kexin.Hao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5C8B61330
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 12:01:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01FC187o024020
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Sat, 15 Feb 2020 04:01:18 -0800
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Sat, 15 Feb 2020 04:00:57 -0800
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 15 Feb 2020 19:41:44 +0800
Message-ID: <20200215114144.14715-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.25.0.389.gbfdd66e72fff
MIME-Version: 1.0
Subject: [PATCH] selftest: wic: Add APPEND to the optional variables list
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
X-List-Received-Date: Sat, 15 Feb 2020 12:01:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The APPEND is an optional variable, so add it to the optional variables
list to make the wic selftest happy.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 46cd98b1934d..626a217e69fa 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -537,7 +537,8 @@ class Wic2(WicTestCase):
         # filter out optional variables
         wicvars = wicvars.difference(('DEPLOY_DIR_IMAGE', 'IMAGE_BOOT_FILES',
                                       'INITRD', 'INITRD_LIVE', 'ISODIR','INITRAMFS_IMAGE',
-                                      'INITRAMFS_IMAGE_BUNDLE', 'INITRAMFS_LINK_NAME'))
+                                      'INITRAMFS_IMAGE_BUNDLE', 'INITRAMFS_LINK_NAME',
+                                      'APPEND'))
         with open(path) as envfile:
             content = dict(line.split("=", 1) for line in envfile)
             # test if variables used by wic present in the .env file
-- 
2.25.0.389.gbfdd66e72fff


