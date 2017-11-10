Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7554C7864A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 13:23:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAADN2s5018037
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 05:23:02 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Fri, 10 Nov 2017 05:23:01 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Nov 2017 14:27:14 +0800
Message-ID: <138cb05e57f2ae02bcf313545cb34c124e64bc71.1510275834.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510275834.git.liezhi.yang@windriver.com>
References: <cover.1510275834.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 14/23] package_manager.py: remove obsolete MULTILIB_ARCHS
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
X-List-Received-Date: Fri, 10 Nov 2017 13:23:00 -0000
Content-Type: text/plain

It had been removed since 2011:

commit b774bf44ef004276da12a83ebd69715c00b596ac
Author: Lianhao Lu <lianhao.lu@intel.com>
Date:   Tue Aug 16 16:26:49 2011 +0800

    package(_ipk).bbclass: opkg using ALL_MULTILIB_PACKAGE_ARCHS

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 3a33074..4aeeb9b 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -120,7 +120,7 @@ class OpkgIndexer(Indexer):
     def write_index(self):
         arch_vars = ["ALL_MULTILIB_PACKAGE_ARCHS",
                      "SDK_PACKAGE_ARCHS",
-                     "MULTILIB_ARCHS"]
+                     ]
 
         opkg_index_cmd = bb.utils.which(os.getenv('PATH'), "opkg-make-index")
         if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
-- 
2.7.4


