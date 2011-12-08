Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RYhbv-0001yL-Il
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 18:18:19 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-145-187.ottawa.windriver.com [128.224.145.187])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB8HBPDl004053;
	Thu, 8 Dec 2011 09:11:26 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  8 Dec 2011 12:11:21 -0500
Message-Id: <404cbfb697c0fed994d119ef9db1fbad31e86648.1323364091.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1323364091.git.bruce.ashfield@windriver.com>
References: <cover.1323364091.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1323364091.git.bruce.ashfield@windriver.com>
References: <cover.1323364091.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 1/3] linux-yocto: v3.0.12 + EFI fixes
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
X-List-Received-Date: Thu, 08 Dec 2011 17:18:20 -0000

Updating SRCREVs to pickup the v3.0.12 -stable updates and to get
three EFI fixes from Darren Hart:

 x86, efi: Convert efi_phys_get_time() args to physical addresses
 x86, efi: Make efi_call_phys_prelog() CONFIG_RELOCATABLE-aware
 x86/rtc: Don't recursively acquire rtc_lock

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 4032567..ee2363c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -10,15 +10,15 @@ KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
 
 KBRANCH = ${KMACHINE}
 
-LINUX_VERSION ?= "3.0.10"
-
-SRCREV_machine_qemuarm ?= "42573a6932e65456471efa94d4863b8df88e48b3"
-SRCREV_machine_qemumips ?= "55d4921f21dea9f07344029c12400bb3ef15d76b"
-SRCREV_machine_qemuppc ?= "d10f26a8325a40610fc8d6a830a9f34dcb794075"
-SRCREV_machine_qemux86 ?= "7814f075ea132cc17da89ecd6d886036e61e2187"
-SRCREV_machine_qemux86-64 ?= "988fcbe64829f0a03ccfcc08d45cedb26cabe9ed"
-SRCREV_machine ?= "ab1de8c21d2b1d084b8488496d75cc54fcd94f02"
-SRCREV_meta ?= "67ce7623909cef63927fd145026aaf371cf4abf1"
+LINUX_VERSION ?= "3.0.12"
+
+SRCREV_machine_qemuarm ?= "b2a7d668b963f1c5f9876f130278dd9fb7df4831"
+SRCREV_machine_qemumips ?= "62bb04e5ba19b5b8aacd9079fdfbcb8284cd9fc8"
+SRCREV_machine_qemuppc ?= "7ecece328c5987112de2959f8f998dfcedaf7210"
+SRCREV_machine_qemux86 ?= "a611ba462ac51b2bfdac1c5c6538dac95ad9b4dd"
+SRCREV_machine_qemux86-64 ?= "b15a9b67089e31ef9780fdbd0481f48ef7facdba"
+SRCREV_machine ?= "f389d310965a56091f688b28ea8be6d9cbb7fbbe"
+SRCREV_meta ?= "a67d091fddd6b72dacc37fb4b07c870aebb1b835"
 
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.4.1



