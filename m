Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=TX2EHSOBE009.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1Rdg6u-0002J9-4k
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 11:42:52 +0100
Received: from mail191-tx2-R.bigfish.com (10.9.14.250) by
	TX2EHSOBE009.bigfish.com (10.9.40.29) with Microsoft SMTP Server id
	14.1.225.23; Thu, 22 Dec 2011 10:20:26 +0000
Received: from mail191-tx2 (localhost [127.0.0.1])	by
	mail191-tx2-R.bigfish.com (Postfix) with ESMTP id BDE232C014D	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 10:21:01 +0000 (UTC)
X-SpamScore: -5
X-BigFish: VS-5(zz1432Nzz1202hzz8275bhz2dh2a8h668h839hb79i61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail191-tx2 (localhost.localdomain [127.0.0.1]) by mail191-tx2
	(MessageSwitch) id 1324549261663159_16399;
	Thu, 22 Dec 2011 10:21:01 +0000 (UTC)
Received: from TX2EHSMHS032.bigfish.com (unknown [10.9.14.235])	by
	mail191-tx2.bigfish.com (Postfix) with ESMTP id 90F71680046	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 10:21:01 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS032.bigfish.com
	(10.9.99.132) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 22 Dec 2011 10:20:25 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.355.3; Thu, 22 Dec 2011 04:20:36 -0600
Received: from localhost.localdomain (bjsimics-desktop.ap.freescale.net
	[10.192.208.197])	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP
	id pBMAKXFp004827;	Thu, 22 Dec 2011 04:20:34 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Dec 2011 18:23:48 +0800
Message-ID: <1324549428-22664-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH oe-core] linux-dtb: add dtb into deploy cache package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Dec 2011 10:42:52 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    > current dtb is not included in the deploy cache package, dtb is missing
      when build kernel from caches

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta/recipes-kernel/linux/linux-dtb.inc |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 7ec7584..f6f5f81 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -25,3 +25,9 @@ do_install_append() {
     fi
 }
 
+do_deploy_append() {
+    install -d ${DEPLOYDIR}
+    install -m 0644 ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.dtb ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.dtb
+    cd ${DEPLOYDIR}
+    ln -sf ${KERNEL_IMAGE_BASE_NAME}.dtb ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
+}
-- 
1.7.0.4




