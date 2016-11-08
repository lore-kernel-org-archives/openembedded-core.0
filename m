Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E19C6E64A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 15:37:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA8FbJAO000514
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2016 07:37:19 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 8 Nov 2016 07:37:18 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Nov 2016 07:37:17 -0800
Message-ID: <d3e5156b92d096cf24bef55be245da8428ece6d1.1478619418.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1478619418.git.liezhi.yang@windriver.com>
References: <cover.1478619418.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qemuarm64.conf: make runqemu's graphics work
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
X-List-Received-Date: Tue, 08 Nov 2016 15:37:18 -0000
Content-Type: text/plain

Fixed:
$ runqemu qemuarm64 (without -nographics)
There is no output in qemu console without this fix.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/machine/qemuarm64.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index d075062..df2010c 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -16,7 +16,7 @@ QB_MACHINE = "-machine virt"
 QB_CPU = "-cpu cortex-a57"
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,38400"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
-QB_OPT_APPEND = "-show-cursor -device virtio-rng-pci"
+QB_OPT_APPEND = "-show-cursor -device virtio-rng-pci -monitor null"
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no -device virtio-net-device,netdev=net0,mac=@MAC@"
 QB_SLIRP_OPT = "-netdev user,id=net0 -device virtio-net-device,netdev=net0"
 QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
-- 
2.9.0


