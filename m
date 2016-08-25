Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E22D731E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 14:41:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7PEfDSe002389
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 07:41:14 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 25 Aug 2016 07:41:12 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Aug 2016 07:41:03 -0700
Message-ID: <6b0c8c39a48ff31068df8137646abe456309390e.1472120966.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1472120966.git.liezhi.yang@windriver.com>
References: <cover.1472120966.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V5 06/10] qemuppc.conf: set vars for runqemu
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
X-List-Received-Date: Thu, 25 Aug 2016 14:41:13 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/machine/qemuppc.conf | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
index bf0038d..580bbca 100644
--- a/meta/conf/machine/qemuppc.conf
+++ b/meta/conf/machine/qemuppc.conf
@@ -11,3 +11,10 @@ KERNEL_IMAGETYPE = "vmlinux"
 
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
 
+# For runqemu
+QB_SYSTEM_NAME = "qemu-system-ppc"
+QB_MACHINE = "-machine mac99"
+QB_CPU = "-cpu G4"
+QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
+QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet"
+QB_TAP_OPT = "-net tap,vlan=0,ifname=@TAP@,script=no,downscript=no -net nic,model=pcnet"
-- 
2.9.0


