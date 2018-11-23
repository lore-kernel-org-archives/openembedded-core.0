Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9AEBE6C5C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 10:51:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wANApjYx026053
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 02:51:46 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Fri, 23 Nov 2018 02:51:45 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Nov 2018 19:08:41 +0800
Message-ID: <85fe4df7c0ce3e3c8017fbf410d98498669f7363.1542971171.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1542971171.git.liezhi.yang@windriver.com>
References: <cover.1542971171.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] uboot-sign.bbclass: Remove tab indentations in python code
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
X-List-Received-Date: Fri, 23 Nov 2018 10:51:44 -0000
Content-Type: text/plain

Use 4 spaces to replace a tab.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/uboot-sign.bbclass | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 0e5e1b1..03100b8 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -93,14 +93,14 @@ do_install_append() {
 }
 
 python () {
-	if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') == d.getVar('UBOOT_PN'):
-		kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel')
+    if d.getVar('UBOOT_SIGN_ENABLE') == '1' and d.getVar('PN') == d.getVar('UBOOT_PN'):
+        kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel')
 
-		# Make "bitbake u-boot -cdeploy" deploys the signed u-boot.dtb
-		d.appendVarFlag('do_deploy', 'depends', ' %s:do_deploy' % kernel_pn)
+        # Make "bitbake u-boot -cdeploy" deploys the signed u-boot.dtb
+        d.appendVarFlag('do_deploy', 'depends', ' %s:do_deploy' % kernel_pn)
 
-		# kernerl's do_deploy is a litle special, so we can't use
-		# do_deploy_append, otherwise it would override
-		# kernel_do_deploy.
-		d.appendVarFlag('do_deploy', 'prefuncs', ' concat_dtb')
+        # kernerl's do_deploy is a litle special, so we can't use
+        # do_deploy_append, otherwise it would override
+        # kernel_do_deploy.
+        d.appendVarFlag('do_deploy', 'prefuncs', ' concat_dtb')
 }
-- 
2.7.4


