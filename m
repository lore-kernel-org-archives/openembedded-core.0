Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 828F278568
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 15:10:45 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 41Qj4c2DTQz1qyLW;
	Wed, 11 Jul 2018 17:03:28 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 41Qj4c1d5Gz1qr9H;
	Wed, 11 Jul 2018 17:03:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id OOkykQu50bs4; Wed, 11 Jul 2018 17:03:27 +0200 (CEST)
X-Auth-Info: dvBlhP8HorZYeq3/b5NE2EU8etT7zM7xzd8ieGu350g=
Received: from kurokawa.lan (ip-86-49-107-50.net.upcbroadband.cz
	[86.49.107.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 11 Jul 2018 17:03:27 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2018 17:03:08 +0200
Message-Id: <20180711150308.30275-4-marex@denx.de>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180711150308.30275-1-marex@denx.de>
References: <20180711150308.30275-1-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 4/4] qemux86*: Add U-Boot machine configuration
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
X-List-Received-Date: Wed, 11 Jul 2018 15:10:45 -0000

Add U-Boot machine configuration for the qemux86 and qemux86-64
to allow building U-Boot on those targets. This in turn allows
the auto-updater to update the U-Boot recipe.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
---
 meta/conf/machine/qemux86-64.conf | 2 ++
 meta/conf/machine/qemux86.conf    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 2330c7d86e..fd1f4142e9 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -12,6 +12,8 @@ DEFAULTTUNE ?= "core2-64"
 require conf/machine/include/tune-core2.inc
 require conf/machine/include/qemuboot-x86.inc
 
+UBOOT_MACHINE ?= "qemu-x86_64_defconfig"
+
 KERNEL_IMAGETYPE = "bzImage"
 
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 811e3ef7cf..efcebb2782 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -11,6 +11,8 @@ require conf/machine/include/qemu.inc
 require conf/machine/include/tune-i586.inc
 require conf/machine/include/qemuboot-x86.inc
 
+UBOOT_MACHINE ?= "qemu-x86_defconfig"
+
 KERNEL_IMAGETYPE = "bzImage"
 
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
-- 
2.16.2


