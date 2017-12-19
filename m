Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5A2AB60851
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 14:34:20 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id t8so4081220wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 06:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=lyXyujkjWPmGfYwoSBVMwKxN85KvHqbfrECSLlMYvRI=;
	b=qy7zSXiYk9t04Lto20aV9CFH20c1uys4bFp2Rgyncx3ZwqJxOelley3ar4HV50zvLU
	UeXt0CAxk5XTyYs6Zd7DVoYMrZkszd9WPU9y2NX+f2yunhjnZBgQIyrzMdrlEr9Qatcr
	x8GPXJ/8X6B+LEJToOwRtg2avhPdMq0KmN8Na261LB9PkTdfCxaDeFOgRghUdhYDhbcs
	wnn/Ns9hhPYS4Hz+nNKMZEEeaUutiEJipndCkLIB6Wqe8v2ORiNvr2Cv8Esximi2PYwJ
	hvlx3mLpSQjUYiiP4Inzadme6eTI1zIz0IxWRXSj4p4YrLcz9mE/hccOlWGwxtMHZgF1
	NnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lyXyujkjWPmGfYwoSBVMwKxN85KvHqbfrECSLlMYvRI=;
	b=Kdh1AQceNaMK07lPaQMJbP61BXnEE42wUb6wD80M/yBivNQeziyvu95rgDop/6h/X2
	Qn48QEU4I/nb+GedCe+Eo9AxV0xGadpS+lV8qQAjiKc0TZieyS78QFWnJtOY33ok29sS
	CBgJr2ha83kVQeD+CJkZQH9Vh9q3yqMZSCE3DWxoNyoTY0jHB/IGW7/JVE5vzjIKe3ap
	Pdp24TM/0H+yQDz80IBiCRHCDKClhfrjyrqjG1op99kIa2Fys7PVlYxBqGdWzKGzjLOD
	bAhuEH+wLGNIyavwzaDoRsC3z0MrPquS+GoZ8NkaUiDsIjSuUvFrDceqvMfnOhZToZkD
	XHsQ==
X-Gm-Message-State: AKGB3mLxF+0HhkCOdaiDX3ffPUToUpBuDJLhmy+1EwcvN/dt9lnW3B+4
	dn0dictGkkNhfxbPmR/LB1mrHUel
X-Google-Smtp-Source: ACJfBou7pOdCRl92njLi4Pe4hmyIJjX6SvYbCap4sx4E+i/CFo+6t5foMmZM4EdSCTR/M+ekxcmlMg==
X-Received: by 10.28.94.75 with SMTP id s72mr4056405wmb.112.1513694061732;
	Tue, 19 Dec 2017 06:34:21 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id l1sm968828wmh.13.2017.12.19.06.34.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Dec 2017 06:34:21 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2017 14:34:18 +0000
Message-Id: <20171219143418.30054-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] machine/include/qemu.inc: update RDEPENDS to match kernel naming
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
X-List-Received-Date: Tue, 19 Dec 2017 14:34:21 -0000

The kernel class now sets RDEPENDS_${KERNEL_PACKAGE_NAME}-base so this include
needs to do the same, otherwise bitbake emits a warning and the kernel isn't
removed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/machine/include/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 25d8ec62164..aa332fecc2c 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -16,7 +16,7 @@ MACHINEOVERRIDES =. "qemuall:"
 IMAGE_FSTYPES += "tar.bz2 ext4"
 
 # Don't include kernels in standard images
-RDEPENDS_kernel-base = ""
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base = ""
 
 # Use a common kernel recipe for all QEMU machines
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
-- 
2.11.0


