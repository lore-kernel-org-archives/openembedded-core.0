Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9A63470F06
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 02:31:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7R2VxQX016638
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 19:31:59 -0700 (PDT)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Tue, 26 Aug 2014 19:31:59 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Aug 2014 10:31:56 +0800
Message-ID: <1409106716-19733-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH] linux-dummy: bundle_initramfs should not be nostamp any more
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
X-List-Received-Date: Wed, 27 Aug 2014 02:32:00 -0000
Content-Type: text/plain

The same change has already been applied to kernel.bbclass in commit 55989cb5:
[ kernel.bbclass: Stop bundle_initramfs thwarting sstate cache and fix race ]

The dummy kernel should comply with it.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-kernel/linux/linux-dummy.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index 5d29f5c..8f25f17 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -45,7 +45,6 @@ do_deploy() {
 	:
 }
 
-do_bundle_initramfs[nostamp] = "1"
-addtask bundle_initramfs after do_compile
+addtask bundle_initramfs after do_install before do_deploy
 addtask deploy after do_install
 
-- 
1.8.4.1


