Received: from m15-112.126.com (m15-112.126.com [220.181.15.112])
 by mx.groups.io with SMTP id smtpd.web10.2567.1587630419149574583
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 01:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@126.com header.s=s110527 header.b=eq0pWL8R;
 spf=pass (domain: 126.com, ip: 220.181.15.112, mailfrom: parheliamm@126.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=pKBO545Rlqoes45+p1
	FVGPWehYPsH4mZLs5w8Qv7Kno=; b=eq0pWL8ROt+Jx/Ob1d/QEQjEbCEL2o3N51
	zSSlHwOtYQnRTQxCJfaGf+I1TPeYb53R8xz32vpUMy1mULThxh0KJs+ezWODTAmI
	z40U4QorAnzO6MyZC+5pH+TYmI81Pz1HLbaDKGWUhNnLg6SkKsTRUewtcZZmUqp/
	3eJRLUAt0=
Received: from localhost.localdomain (unknown [106.39.106.50])
	by smtp2 (Coremail) with SMTP id DMmowAB3rgJIUaFer1TiCA--.21046S2;
	Thu, 23 Apr 2020 16:26:53 +0800 (CST)
From: "Chenxi Mao" <parheliamm@126.com>
To: openembedded-core@lists.openembedded.org
Cc: Chenxi Mao <parheliamm@126.com>
Subject: [PATCH] qemu-system-native: Enable usb feature by default.
Date: Thu, 23 Apr 2020 16:26:46 +0800
Message-Id: <20200423082646.4180-1-parheliamm@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: DMmowAB3rgJIUaFer1TiCA--.21046S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF4ftr1xtFW8KF4xGF4kJFb_yoWkJFgEyr
	Z7ZF40vrWFvFWj93WfuF1fGrykJanaqF17Zw1kWr47Wr97Ga15JF1kXrn5u3s0q3WrXr1x
	Xw4kXr9Y9rWSvjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUX4S7UUUUU==
X-Originating-IP: [106.39.106.50]
X-CM-SenderInfo: xsduxv5oldzza6rslhhfrp/1tbikg0PZVpEAVSJVgAAsh

During Risc-V development, USB is a important feature in qemu.
So enable it by default.

Change-Id: I308e7f0f5beea674c735f42fbfac014d96cbc521
Signed-off-by: Chenxi Mao <parheliamm@126.com>
---
 meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb
index d83ee59375..40e4c096db 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "glib-2.0-native zlib-native pixman-native qemu-native bison-native"
 
 EXTRA_OECONF_append = " --target-list=${@get_qemu_system_target_list(d)}"
 
-PACKAGECONFIG ??= "fdt alsa kvm"
+PACKAGECONFIG ??= "fdt alsa kvm libusb"
 
 # Handle distros such as CentOS 5 32-bit that do not have kvm support
 PACKAGECONFIG_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
-- 
2.17.1

