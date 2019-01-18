Return-Path: <jdmason@kudzu.us>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id DD0537C293
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 22:17:44 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id g17so1054784yba.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 14:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/NZ9MU7LMM+NQD3fcELAnTmgVPblWklb7k7H//jinUU=;
	b=D7/DZJSxcn4jwTYzUkTuseDHZmzrlxQaQkjLgXCm3lFeRgz9+I7rdCFc+7HZ6Igy53
	qvRxnL71lzKlwcx/GxY1qvbmGh8CfKe4Vgw3gpZKWSGH8A7UZ2/qgj7UuDhTnlXYyepy
	CQ9CTT+la1y6slexnDkgsQLPVH+TGb/FzXI+cOhwYRBbh4qMGI9US9iBEixJupHiIZgz
	v5+/H5E7I2ijCyCM6m5AWNZjh/MEXjGlRgBND4RwmkqOr+ZyB74lALGY4aawNhaluBaU
	oDF97Ztc62kPFMh6dCsaJBJpyFQTmb0Xv/npev4El3XK1P1v6/sGHYfrpGyZwvAs9XOW
	H7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/NZ9MU7LMM+NQD3fcELAnTmgVPblWklb7k7H//jinUU=;
	b=MuJeCm7jAvHP/4+6bKKaLg/+HMCgYvyZbeXCICXZHMjzu9tL4ayjDIIoe2kUsdhC5U
	W0wF1XjZqW117DjupGeZMgwIi2f5vQffEG8QH/9AalznT2cmcGRqIF3UsesWAMZxMQkY
	DfjVq/PZMVu4ENtpzDuSJOXstyaHWWvrcBYENr9Q7hvnQmpZ2QegvfwT1WV6udl3PQF+
	jbtFYtuSKiIlbbmXX+STAqqFuwIOMwJyl7w5fAN+B3GWev6hKyJ3t0phd92KiynGU4hM
	mwJueyrDJRo9Y7FKCrGbSpMy2KLypbhRa7Uqp1RGYPdeApXEcqpzpputukIJ1ECdWLY3
	wZmw==
X-Gm-Message-State: AJcUukc9/4Q7FVapT2h0weDsXjW5N8dEXQKir/mFBI0WE8ZXoqkZw94f
	uxpTuINwipxMUA8yi+RQRi0hjOcxCy04bA==
X-Google-Smtp-Source: ALg8bN5QiNXcL0gd7nc5vhVW5xksPGzghDKu0b8GJ+ePMYto6Bd2xtjUpjtY2JMoECmyb9pxMVmowA==
X-Received: by 2002:a25:be0a:: with SMTP id h10mr8466345ybk.326.1547849865570; 
	Fri, 18 Jan 2019 14:17:45 -0800 (PST)
Received: from graymalkin (76-230-155-4.lightspeed.rlghnc.sbcglobal.net.
	[76.230.155.4])
	by smtp.gmail.com with ESMTPSA id s7sm1979302ywe.20.2019.01.18.14.17.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 18 Jan 2019 14:17:45 -0800 (PST)
Received: by graymalkin (sSMTP sendmail emulation);
	Fri, 18 Jan 2019 17:17:43 -0500
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2019 17:17:37 -0500
Message-Id: <20190118221737.14443-4-jdmason@kudzu.us>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190118221737.14443-1-jdmason@kudzu.us>
References: <20190118221737.14443-1-jdmason@kudzu.us>
Subject: [PATCH 3/3] qemuarm: Rename qemuarma15 to qemuarm
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
X-List-Received-Date: Fri, 18 Jan 2019 22:17:45 -0000

Rename qemuarma15 to qemuarm.  This makes the default QEMU Arm setup to
emulate the more modern ARMv7 Cortex-A.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/{qemuarma15.conf => qemuarm.conf} | 0
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb       | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/conf/machine/{qemuarma15.conf => qemuarm.conf} (100%)

diff --git a/meta/conf/machine/qemuarma15.conf b/meta/conf/machine/qemuarm.conf
similarity index 100%
rename from meta/conf/machine/qemuarma15.conf
rename to meta/conf/machine/qemuarm.conf
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index d518677f42..a0476540e1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -31,7 +31,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarmv5|qemuarma15|qemuarm64|qemuppc|qemumips)"
+COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarmv5|qemuarm|qemuarm64|qemuppc|qemumips)"
 
 KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index a51270f731..caf46a1c09 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -24,7 +24,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
 
-COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarmv5|qemuarma15"
+COMPATIBLE_MACHINE = "qemux86|qemux86-64|qemuarmv5|qemuarm"
 
 # Functionality flags
 KERNEL_FEATURES = ""
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index 69ae644417..505164bced 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -37,7 +37,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
 
-COMPATIBLE_MACHINE = "qemuarmv5|qemuarma15|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
+COMPATIBLE_MACHINE = "qemuarmv5|qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
-- 
2.17.2


