Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 887657E339
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 05:32:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4U5WX2v011103
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 22:32:43 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 29 May 2019 22:32:22 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 May 2019 13:32:19 +0800
Message-ID: <1559194340-420777-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559194340-420777-1-git-send-email-changqing.li@windriver.com>
References: <1559194340-420777-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2 V2] tiny-init: add rconflicts
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
X-List-Received-Date: Thu, 30 May 2019 05:32:52 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

add rconflicts since error during do_rootfs:
file /sbin/init conflicts between attempted installs of tiny-init-1.0-r3.i586 and systemd-1:242+0+db2e367bfc-r0.i586

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-poky/recipes-core/tiny-init/tiny-init.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-poky/recipes-core/tiny-init/tiny-init.bb b/meta-poky/recipes-core/tiny-init/tiny-init.bb
index 4d4e34d..44c8e1b 100644
--- a/meta-poky/recipes-core/tiny-init/tiny-init.bb
+++ b/meta-poky/recipes-core/tiny-init/tiny-init.bb
@@ -28,3 +28,4 @@ do_install() {
 }
 
 FILES_${PN} = "/init ${sysconfdir}/rc.local.sample"
+RCONFLICTS_${PN} = "systemd"
-- 
2.7.4


