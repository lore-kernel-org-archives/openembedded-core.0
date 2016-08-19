Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 98881770C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 06:55:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7J6tZuN015550
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 23:55:35 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 18 Aug 2016 23:55:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Aug 2016 23:55:27 -0700
Message-ID: <db16605bd34665d74c3c365fbc83f177cd5c0edc.1471589537.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1471589537.git.liezhi.yang@windriver.com>
References: <cover.1471589537.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 6/8] qemuppc.conf: set vars for runqemu
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
X-List-Received-Date: Fri, 19 Aug 2016 06:55:34 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/machine/qemuppc.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
index bf0038d..dbadf5a 100644
--- a/meta/conf/machine/qemuppc.conf
+++ b/meta/conf/machine/qemuppc.conf
@@ -11,3 +11,9 @@ KERNEL_IMAGETYPE = "vmlinux"
 
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
 
+# For runqemu
+QB_SYSTEM_NAME = "qemu-system-ppc"
+QB_MACHINE = "-machine mac99"
+QB_CPU = "-cpu G4"
+QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
+QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet"
-- 
2.9.0


