Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RYhbv-0001yM-Rr
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 18:18:20 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-145-187.ottawa.windriver.com [128.224.145.187])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB8HBPDm004053;
	Thu, 8 Dec 2011 09:11:27 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  8 Dec 2011 12:11:22 -0500
Message-Id: <058fb533fc93e1e0626b1a7908502113c4c3b773.1323364091.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1323364091.git.bruce.ashfield@windriver.com>
References: <cover.1323364091.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1323364091.git.bruce.ashfield@windriver.com>
References: <cover.1323364091.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 2/3] linux-yocto: update META SRCREV for EFI changes
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

Adding EFI configuration from the following meta branch commit:

    Add EFI scc and cfg files

    Basic EFI support only requires CONFIG_EFI=y, this is sufficient for
    some boards, and desirable for small configs. This is done with efi.scc.

    Additional support for CONFIG_EFI_VARS, CONFIG_EFI_PARTITION, and CONFIG_FB_EFI
    is provided via efi-ext.scc (extended) as this pulls in the block layer,
    framebuffer support, and virtual terminals.

    I'd like EFI_VARS to be part of the base config, but I have received
    reports of it failing in some situations. Keeping it separate ensures
    basic boot can work with the fragments as defined.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 9833b90..e5af2cc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "bffda9207cdc3b309bfa7b3e23eb7dc838f50223"
 SRCREV_machine_qemuppc ?= "f02dda1ccaf95f10a1e65359184e90484a5fd0d9"
-SRCREV_meta ?= "67ce7623909cef63927fd145026aaf371cf4abf1"
+SRCREV_meta ?= "caa74f86f42f6ecc22c3e9f380176b2695579e18"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index ee2363c..bfecbf1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemuppc ?= "7ecece328c5987112de2959f8f998dfcedaf7210"
 SRCREV_machine_qemux86 ?= "a611ba462ac51b2bfdac1c5c6538dac95ad9b4dd"
 SRCREV_machine_qemux86-64 ?= "b15a9b67089e31ef9780fdbd0481f48ef7facdba"
 SRCREV_machine ?= "f389d310965a56091f688b28ea8be6d9cbb7fbbe"
-SRCREV_meta ?= "a67d091fddd6b72dacc37fb4b07c870aebb1b835"
+SRCREV_meta ?= "caa74f86f42f6ecc22c3e9f380176b2695579e18"
 
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.4.1



