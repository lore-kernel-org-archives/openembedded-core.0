Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4800673EFD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 19:52:57 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Yrtl4-0005wy-Mf from Dmitry_Eremin@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 11 May 2015 12:52:58 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Mon, 11 May 2015 20:52:57 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 May 2015 22:52:54 +0300
Message-ID: <1431373976-20993-1-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [RESEND][PATCH 1/3] meta: add new qemuarma9 machine definition
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
X-List-Received-Date: Mon, 11 May 2015 19:52:57 -0000
Content-Type: text/plain

Currently qemuarm is limited to 256 Mb of RAM. Sometimes this is too
little to run necessary applications. Add a new arm configuration based
on Versatile Express board, Cortex-A9 CPU, allowing up to 1Gb of RAM.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 meta/conf/machine/qemuarma9.conf | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/conf/machine/qemuarma9.conf

diff --git a/meta/conf/machine/qemuarma9.conf b/meta/conf/machine/qemuarma9.conf
new file mode 100644
index 0000000..119d172
--- /dev/null
+++ b/meta/conf/machine/qemuarma9.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: arm_versatile_cortexa9
+#@DESCRIPTION: arm_versatile_cortexa9
+
+require conf/machine/include/qemu.inc
+require conf/machine/include/tune-cortexa9.inc
+
+KERNEL_IMAGETYPE = "zImage"
+KERNEL_DEVICETREE = "vexpress-v2p-ca9.dtb"
+
+SERIAL_CONSOLE = "115200 ttyAMA0"
-- 
2.1.4


