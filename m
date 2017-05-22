Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id BC3B177F80
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 05:01:11 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id f27so17306464pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 May 2017 22:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lQYMiEWnecITkdmN1fJyTrPTtv6mZd04neZwzJ/BD8Q=;
	b=E2K2CUEBskfoBldurO6BZShqEOlEZ+7bNKd2y6qFxIFMhFMSNPcKvg1tR9pf5gBC6r
	FKAuRyKX5HSO/LKHpkLt/3NukG4CTaZ8u6S1qSKKvBk7JO/+oOendoA4sCe9GtKPxW0Y
	aHIq2cRYhd3QC2aQ8jyiOYLDIBQaDwj7NqmOC80QWuIFKGo/oc9Ps0hCJQWGob6vV3D8
	Xmn9iq1GfwT6fM26R6MjP1QGFJTv8pYB9djwfLpCTdTPtf6G/IgotF2jo8SCmDyc/uSJ
	cb4/n2cgPCbzongm9ZcOvuvF+q1DuA834NIci8Jkgbfc1qB0zbPynaE6Lho4c3dK37za
	yaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lQYMiEWnecITkdmN1fJyTrPTtv6mZd04neZwzJ/BD8Q=;
	b=HaEVZkle4rwMSgoe75PfEVnAW5GLm5fZuYnCDAslpel0L4Z21vBegKeXYJYfw2jy8V
	k7AhTajIJuA2EpwDz4ylFNBU+X4HYM21xCG2KGssiEhHgGm5IMhb8i19oi3L47CQMTZD
	BYAnklW0zgPYQ16fg8HEruyrPbCm2LatBzK3YbuecfedJ8RlZZQjwylswGajKmqAl0/H
	B0InCTUY1mdTuMRBKVAT2NwOsUUWPy4/GXmNmZoIqysQQivKYoCZ9KiTXeaCLUxZVvP+
	o4KA3I7UXfTX8Q2GPcThYLVcl3l2PyxiiOGL0t7V1lylFCPEwu6EVVP8QpFaoPMwrt6D
	SQGw==
X-Gm-Message-State: AODbwcAvLRRDzQnk+BNpVisra8f/N/7f226xdocJ0/fHh73dO34trCeT
	VszrDT/SdeTkDQ==
X-Received: by 10.98.149.154 with SMTP id c26mr23687690pfk.37.1495429273395;
	Sun, 21 May 2017 22:01:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id
	t13sm28839596pfa.126.2017.05.21.22.01.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 May 2017 22:01:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 May 2017 22:00:38 -0700
Message-Id: <20170522050042.42403-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170522050042.42403-1-raj.khem@gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
Subject: [PATCH 11/15] linux-yocto: Enable drm by default
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
X-List-Received-Date: Mon, 22 May 2017 05:01:11 -0000

Helps in running XFCE on virtualbox with HD

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto/drm.cfg | 10 ++++++++++
 meta/recipes-kernel/linux/linux-yocto_4.9.bb  |  2 ++
 2 files changed, 12 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto/drm.cfg

diff --git a/meta/recipes-kernel/linux/linux-yocto/drm.cfg b/meta/recipes-kernel/linux/linux-yocto/drm.cfg
new file mode 100644
index 0000000000..5c694ccc57
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto/drm.cfg
@@ -0,0 +1,10 @@
+CONFIG_DRM=y
+CONFIG_DRM_TTM=y
+CONFIG_DRM_VMWGFX=y
+CONFIG_DRM_VMWGFX_FBCON=y
+CONFIG_FB=y
+CONFIG_FB_CFB_FILLRECT=y
+CONFIG_FB_CFB_COPYAREA=y
+CONFIG_FB_CFB_IMAGEBLIT=y
+CONFIG_FB_DEFERRED_IO=y
+CONFIG_FB_MODE_HELPERS=y
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index 309d4a7a4f..011ba3bbe6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -26,6 +26,8 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${
 
 LINUX_VERSION ?= "4.9.27"
 
+SRC_URI += "file://drm.cfg"
+
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "kernel-meta"
-- 
2.13.0


