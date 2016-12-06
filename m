Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F61B719B0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 08:55:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uB68tSod018462
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 6 Dec 2016 00:55:29 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 6 Dec 2016 00:55:27 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Dec 2016 00:55:21 -0800
Message-ID: <5c2e102fba45a38cc15fed19f479d94be78c2378.1481014270.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1481014270.git.liezhi.yang@windriver.com>
References: <cover.1481014270.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 6/6] qemuboot.bbclass: add blank lines in comments
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
X-List-Received-Date: Tue, 06 Dec 2016 08:55:28 -0000
Content-Type: text/plain

Add blank lines in comments to make it easy for readind and updating.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/qemuboot.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 1b94af9..f953241 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -3,34 +3,52 @@
 # boot by runqemu:
 #
 # QB_SYSTEM_NAME: qemu name, e.g., "qemu-system-i386"
+#
 # QB_OPT_APPEND: options to append to qemu, e.g., "-show-cursor"
+#
 # QB_DEFAULT_KERNEL: default kernel to boot, e.g., "bzImage"
+#
 # QB_DEFAULT_FSTYPE: default FSTYPE to boot, e.g., "ext4"
+#
 # QB_MEM: memory, e.g., "-m 512"
+#
 # QB_MACHINE: qemu machine, e.g., "-machine virt"
+#
 # QB_CPU: qemu cpu, e.g., "-cpu qemu32"
+#
 # QB_CPU_KVM: the similar to QB_CPU, but used when kvm, e.g., '-cpu kvm64',
 #             set it when support kvm.
+#
 # QB_KERNEL_CMDLINE_APPEND: options to append to kernel's -append
 #                           option, e.g., "console=ttyS0 console=tty"
+#
 # QB_DTB: qemu dtb name
+#
 # QB_AUDIO_DRV: qemu audio driver, e.g., "alsa", set it when support audio
+#
 # QB_AUDIO_OPT: qemu audio option, e.g., "-soundhw ac97,es1370", used
 #               when QB_AUDIO_DRV is set.
+#
 # QB_KERNEL_ROOT: kernel's root, e.g., /dev/vda
+#
 # QB_NETWORK_DEVICE: network device, e.g., "-device virtio-net-pci,netdev=net0,mac=@MAC@",
 #                    it needs work with QB_TAP_OPT and QB_SLIRP_OPT.
 #                    Note, runqemu will replace @MAC@ with a predefined mac, you can set
 #                    a custom one, but that may cause conflicts when multiple qemus are
 #                    running on the same host.
+#
 # QB_TAP_OPT: netowrk option for 'tap' mode, e.g.,
 #             "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 #              Note, runqemu will replace "@TAP@" with the one which is used, such as tap0, tap1 ...
+#
 # QB_SLIRP_OPT: network option for SLIRP mode, e.g., -netdev user,id=net0"
+#
 # QB_ROOTFS_OPT: used as rootfs, e.g.,
 #               "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
 #              Note, runqemu will replace "@ROOTFS@" with the one which is used, such as core-image-minimal-qemuarm64.ext4.
+#
 # QB_SERIAL_OPT: serial port, e.g., "-serial mon:stdio"
+#
 # QB_TCPSERIAL_OPT: tcp serial port option, e.g.,
 #                   " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
 #                   Note, runqemu will replace "@PORT@" with the port number which is used.
-- 
2.9.0


