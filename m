Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UbloV-0001jr-Ey
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 08:00:50 +0200
Received: by mail-pa0-f50.google.com with SMTP id fb10so4284035pad.23
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2013 22:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=NOD3XhGsC7jp8fqPEfa15L5lOYyXUqghMI2KIeD7H7Y=;
	b=AqpFZLXCA46iwcjMuAJ78O8/cmh92mLUhOTNCVMFxDsDYgFZvG/swREkz/CZh4KmU3
	LFM9PN6iP3/L+9zTvvgpGwbK6RRkYvE3MPwnUPiVGAhssg5ANAHRGKowuFo7rLb+VPh0
	w6XXnjWpRsZL3brD0KGE+kkGMQeBu23vj8aJy/fA/SBHZTysAJpmsGAIR2Utb/1FWQUg
	tl73ZKPdB/6ip/b2OcOigNMOiJCWI3PR0Hj/Rf4Qu1pa5kngOq/Q9DnFEqh6388WWcRF
	g+nuGZ9CQPJGRE42/nchavxquawhUpSRMG/aQzpxJPMtWfk2gHBIxJ+bw6V6cg338wdy
	s2pQ==
X-Received: by 10.66.155.102 with SMTP id vv6mr28265084pab.64.1368423757612;
	Sun, 12 May 2013 22:42:37 -0700 (PDT)
Received: from norse.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	aj6sm12620928pbd.14.2013.05.12.22.42.36 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 12 May 2013 22:42:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 May 2013 22:42:23 -0700
Message-Id: <e4d9bfb01c5657a7f30597d83829375520d64627.1368423406.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <a5c9cc4750706a0a84751170a0f10ce9e4f07f0d.1368423406.git.raj.khem@gmail.com>
References: <a5c9cc4750706a0a84751170a0f10ce9e4f07f0d.1368423406.git.raj.khem@gmail.com>
In-Reply-To: <cover.1368423406.git.raj.khem@gmail.com>
References: <cover.1368423406.git.raj.khem@gmail.com>
Subject: [PATCH 2/4] linux-yocto: add qemumips64 compatibility
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 06:01:25 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

The 3.8 and linux-yocto-dev kernel trees carry qemumips64 support. Adding
the board to the compatibility directly in the recipes is the first step
to adding mips64 support to the broader set of packages.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.8.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index fdea085..598c82c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -38,7 +38,7 @@ LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
+COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64)"
 
 # Functionality flags
 KERNEL_FEATURES_append = " features/netfilter/netfilter.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index 2fcaddd..b79fa4e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -20,7 +20,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "meta"
 
-COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
+COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-- 
1.8.2.1



