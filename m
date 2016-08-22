Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63A9C731CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 07:52:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7M7qpfG011083
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 00:52:52 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 22 Aug 2016 00:52:51 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Aug 2016 00:52:40 -0700
Message-ID: <309fb0a89d54831723b560ac94e17bbe26658952.1471850849.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1471850849.git.liezhi.yang@windriver.com>
References: <cover.1471850849.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V4 03/11] qemuarm64.conf: set vars for runqemu
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
X-List-Received-Date: Mon, 22 Aug 2016 07:52:52 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/machine/qemuarm64.conf | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index f59fb15..df76ee6 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -8,3 +8,16 @@ require conf/machine/include/qemu.inc
 KERNEL_IMAGETYPE = "Image"
 
 SERIAL_CONSOLES = "38400;ttyAMA0 38400;hvc0"
+
+# For runqemu
+QB_SYSTEM_NAME = "qemu-system-aarch64"
+QB_MEM = "-m 512"
+QB_MACHINE = "-machine virt"
+QB_CPU = "-cpu cortex-a57"
+QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,38400"
+QB_OPT_APPEND = "-show-cursor"
+QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no -device virtio-net-device,netdev=net0"
+QB_SLIRP_OPT = "-netdev user,id=net0 -device virtio-net-device,netdev=net0"
+QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
+QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
+QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
-- 
2.9.0


