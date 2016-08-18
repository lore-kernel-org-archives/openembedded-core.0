Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0197675CF1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 06:15:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7I6FnPs016300
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 23:15:49 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 17 Aug 2016 23:15:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Aug 2016 23:15:41 -0700
Message-ID: <310ea7712f82cdc9a5f16cba91c05f25627f904f.1471500427.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1471500427.git.liezhi.yang@windriver.com>
References: <cover.1471500427.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] arch-mips.inc: set vars for runqemu
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
X-List-Received-Date: Thu, 18 Aug 2016 06:15:49 -0000
Content-Type: text/plain

Both qemumips and qemumips64 can use these info to boot, so set these
info in arch-mips.inc.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/machine/include/mips/arch-mips.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index 89d17e7..387f9ef 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -100,3 +100,9 @@ TUNE_FEATURES_tune-mips64el-nf = "n64"
 BASE_LIB_tune-mips64el-nf = "lib64"
 MIPSPKGSFX_VARIANT_tune-mips64el-nf = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS_tune-mips64el-nf = "mips64el-nf"
+
+QB_MEM = "-m 256"
+QB_MACHINE = "-machine malta"
+QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
+QB_OPT_APPEND = "-vga cirrus -show-cursor -usb -usbdevice tablet"
+QB_SYSTEM_NAME = "qemu-system-${TUNE_ARCH}"
-- 
2.9.0


