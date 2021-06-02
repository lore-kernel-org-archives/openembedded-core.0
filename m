Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by mx.groups.io with SMTP id smtpd.web12.827.1622676237720483849
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 16:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=VyuQenVE;
 spf=pass (domain: wdc.com, ip: 216.71.154.42, mailfrom: prvs=780e1cc66=alistair.francis@wdc.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1622676237; x=1654212237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hj2aJhbdu2h0UxBM20Hhy0BkL3KOO3tkT4aibhKRbks=;
  b=VyuQenVEhcQ0lufXwv0cqEfBYD+zFebm/20H+DZc8VjRfjtwEOCXywCX
   T608B8K5JAgD0Eec6pVTUiF8yuTBs8mtAN0aGAV7trxolErdjxalkX+zt
   lqz9pq0ua/k5O7R1LCpVJGFytxOpK3M1iyEcUgEdY6iT5HMSXcyAZZuRi
   /dXzx84sT+FUBokH7zN0BdaxFirJhye401Ls2a3V8jkknERafdhgA8sOA
   kMyQtFYi0qcHZ95LchrZruvO8mUXaIIPQ8YUc1fqCNUbjy3kSGpi7ksw7
   zKKuT6muDgqKkEWVxDzwEFgDGDlMWbuWuStCZgJYAkHCyQzyj7oijNiih
   A==;
IronPort-SDR: 6Wr+s4tSQ7fxZqDLOP9d40HPbShhY8aJ2UGpwJ9v5vi32FyZ+4VXq1o6rMUGi9nJM5xf2Naz+a
 jjyv9uZZlAUazajGyXICGE1TjYrAvhJMLVkEB+llgBdj0ZlWqU7gd6aDtN+wUdWu/kAyEPyQDx
 pPdCdYRibUOvPKhvRB5e4DGZLFr2Crxmn3b8VkIaOmnL3aaFxYW15tH5JM3Jlq0HpOI+bFIFgt
 ABIHTIdOO2j7XNtxiG/pd2NR7tXZKI6nygvCe3ABTviDv4eZWVHF3gOnYs40TH03xx/xyOKcC+
 Mu8=
X-IronPort-AV: E=Sophos;i="5.83,244,1616428800"; 
   d="scan'208";a="169775322"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 03 Jun 2021 07:23:56 +0800
IronPort-SDR: EDLDWE1VfGoawb/9U2+9xE6zqmESIgqnbzv07gr2Kbh55RCXUvBNt4vel35MXkSvXiUBtPvdkp
 H82IPM3m0VqceIta6rVF6T7JCxQKPErxKz9NAHdWjvCrOWQ9TysKQoi2I/eu721PrmN22DczM/
 9o5sURENyTOGMmSBDiwDT0sbw/7VWioWQKPbxCACx4+kq2/sm+yU/RMX3UhcdDNhplzm2urB++
 I9Nm6Nt4SGkxpnsm6nAw5qJH58HR5Da6AZyByxE/UcDk7+U7U1yJG59D7yf8ikcyNWGD3qV1Xz
 FSUOvCPGxjN0bN0kn9PF7agw
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2021 16:03:10 -0700
IronPort-SDR: BNbGmAwO9CZi6H1nPo8beaF2zfnsFTHtNwcMtns5gwmkc4DDC45l2eBwNPYc02G9gQYFGSBMdC
 ySzEhixjBM6Eu+ihc4M6nLDpExMfT/+EJHpujbsED9izfuoyms8oGM4IgzFlWZ3o7QEXmGPH68
 CIi/5jvvfsmjTRwXNltFPkCph0F8wuJTpkwNyyYEqr6mCWUX81kJTaJG5IKwveTOYqA0jvkvmp
 spQ6TJWEuwJm0Y95vvGdNrAj4BTS1ZSPZaQU4GvNnxGUUXQCVS8Z19sD9h6wOLk7FvaW3BgC8C
 6mA=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.72])
  by uls-op-cesaip01.wdc.com with ESMTP; 02 Jun 2021 16:23:55 -0700
From: "Alistair Francis" <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 2/3] recipes-bsp/u-boot: Allow deploying the u-boot DTB
Date: Thu,  3 Jun 2021 09:21:03 +1000
Message-Id: <20210602232104.3490139-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602232104.3490139-1-alistair.francis@wdc.com>
References: <20210602232104.3490139-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/classes/uboot-config.bbclass  | 4 ++++
 meta/recipes-bsp/u-boot/u-boot.inc | 7 ++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index 3bba02828b..6444f58437 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -71,6 +71,10 @@ UBOOT_MKIMAGE_SIGN ?= "${UBOOT_MKIMAGE}"
 UBOOT_MKIMAGE_SIGN_ARGS ?= ""
 SPL_MKIMAGE_SIGN_ARGS ?= ""
 
+# Options to deploy the u-boot device tree
+UBOOT_DTB ?= ""
+UBOOT_DTB_BINARY ?= ""
+
 python () {
     ubootmachine = d.getVar("UBOOT_MACHINE")
     ubootconfigflags = d.getVarFlags('UBOOT_CONFIG')
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 5398c2e621..8ccc532f7e 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -5,7 +5,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS += "kern-tools-native"
 
-inherit uboot-config uboot-extlinux-config uboot-sign deploy cml1 python3native
+inherit uboot-config uboot-extlinux-config uboot-sign deploy cml1 python3native kernel-arch
 
 DEPENDS += "swig-native"
 
@@ -346,6 +346,11 @@ do_deploy () {
         ln -sf ${UBOOT_EXTLINUX_SYMLINK} ${DEPLOYDIR}/${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}
         ln -sf ${UBOOT_EXTLINUX_SYMLINK} ${DEPLOYDIR}/${UBOOT_EXTLINUX_CONF_NAME}
     fi
+
+    if [ -n "${UBOOT_DTB}" ]
+    then
+        install -m 644 ${B}/arch/${UBOOT_ARCH}/dts/${UBOOT_DTB_BINARY} ${DEPLOYDIR}/
+    fi
 }
 
 addtask deploy before do_build after do_compile
-- 
2.31.1

