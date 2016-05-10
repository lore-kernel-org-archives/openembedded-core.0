Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EC01F73285
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 08:14:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4A8EBIj022801
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 01:14:11 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 10 May 2016 01:14:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2016 01:14:02 -0700
Message-ID: <84b7517f3aea5349c2bdc7b04be446cc9bfd9883.1462867278.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1462867278.git.liezhi.yang@windriver.com>
References: <cover.1462867278.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [RFC PATCH 4/8] arch-arm64.inc: set vars for runqemu
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
X-List-Received-Date: Tue, 10 May 2016 08:14:12 -0000
Content-Type: text/plain

These vars will be used when QEMU_BOOT_SUPPORTED = "1", and has no
impact when "0".

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/machine/include/arm/arch-arm64.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
index 9440698..7355087 100644
--- a/meta/conf/machine/include/arm/arch-arm64.inc
+++ b/meta/conf/machine/include/arm/arch-arm64.inc
@@ -34,3 +34,10 @@ TUNE_ARCH = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_ARCH_64}',
 TUNE_PKGARCH = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TUNE_PKGARCH_64}', '${TUNE_PKGARCH_32}' ,d)}"
 ABIEXTENSION = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${ABIEXTENSION_64}', '${ABIEXTENSION_32}' ,d)}"
 TARGET_FPU = "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', '${TARGET_FPU_64}', '${TARGET_FPU_32}' ,d)}"
+
+QEMU_MEM = "-m 512"
+QEMU_MAHINE_SUBTYPE = "-machine virt"
+QEMU_CPU_SUBTYPE = "-cpu cortex-a57"
+QEMU_SECOND_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
+QEMU_KERNEL_OPTIONS = "console=ttyAMA0,38400"
+QEMU_UI_OPTIONS = ""
-- 
2.7.4


