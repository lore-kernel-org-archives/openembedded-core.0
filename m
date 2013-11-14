Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C6CAD6D1F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 16:55:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAEGtU1v013129
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Nov 2013 08:55:30 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 14 Nov 2013 08:55:30 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 14 Nov 2013 11:55:24 -0500
Message-ID: <6bcd8c77705e3e969adfef1ae2f3e877a56573c1.1384447700.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384447700.git.bruce.ashfield@windriver.com>
References: <cover.1384447700.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/3.10: meta: ARM: OMAP3: Add USB PHY driver for Beagleboard
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
X-List-Received-Date: Thu, 14 Nov 2013 16:55:30 -0000
Content-Type: text/plain

Updating the meta branch SRCREV to update the USB configuration:

    The Beagleboard needs the USB PHY drivers in the kernel in order to enable
    USB and Ethernet functionality. This fix ensures that they are built in
    by tweaking the kernel config.

    Tested on Beagleboard xM Rev. C2.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb | 3 +--
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index ab95ad1..ab36e6a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -5,7 +5,7 @@ KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
 SRCREV_machine ?= "97499dfaea61934719b91f1347f468c6f0125b2c"
 SRCREV_machine_qemuppc ?= "54cb4efa033af86301934d58d890a5324cc95a75"
-SRCREV_meta ?= "f1c9080cd27f99700fa59b5375d1ddd0afe625ad"
+SRCREV_meta ?= "c16a2cf7b06c92a0217d61569bd0293233fe6ba7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index c15c311..d503d44 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -10,8 +10,7 @@ LINUX_VERSION ?= "3.10.17"
 KMETA = "meta"
 
 SRCREV_machine ?= "c03195ed6e3066494e3fb4be69154a57066e845b"
-SRCREV_meta ?= "f1c9080cd27f99700fa59b5375d1ddd0afe625ad"
-
+SRCREV_meta ?= "c16a2cf7b06c92a0217d61569bd0293233fe6ba7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index eff245d..383e645 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -10,7 +10,7 @@ SRCREV_machine_qemux86 ?= "c03195ed6e3066494e3fb4be69154a57066e845b"
 SRCREV_machine_qemux86-64 ?= "c03195ed6e3066494e3fb4be69154a57066e845b"
 SRCREV_machine_qemumips64 ?= "8d21f71847640fc052bda1bf1f3792634cae5bb1"
 SRCREV_machine ?= "c03195ed6e3066494e3fb4be69154a57066e845b"
-SRCREV_meta ?= "f1c9080cd27f99700fa59b5375d1ddd0afe625ad"
+SRCREV_meta ?= "c16a2cf7b06c92a0217d61569bd0293233fe6ba7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


