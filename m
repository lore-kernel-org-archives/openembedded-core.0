Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.9089.1629017706875247940
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 01:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:35736 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mFBv2-0004Z3-GZ
	for openembedded-core@lists.openembedded.org; Sun, 15 Aug 2021 04:55:04 -0400
Date: Sun, 15 Aug 2021 04:54:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] image_types_wic.bbclass: alphabetize list of WICVARS
Message-ID: <ccf3866-bd7-20d7-982c-2fe611a05bac@crashcourse.ca>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


It's way easier to scan a list of variables if they're sorted one per
line.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 2f1a0b709c..d561fb2636 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -1,11 +1,35 @@
 # The WICVARS variable is used to define list of bitbake variables used in wic code
 # variables from this list is written to <image>.env file
 WICVARS ?= "\
-           BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD IMAGE_BASENAME IMAGE_EFI_BOOT_FILES IMAGE_BOOT_FILES \
-           IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD INITRD_LIVE ISODIR RECIPE_SYSROOT_NATIVE \
-           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS HOSTTOOLS_DIR \
-           KERNEL_IMAGETYPE MACHINE INITRAMFS_IMAGE INITRAMFS_IMAGE_BUNDLE INITRAMFS_LINK_NAME APPEND \
-           ASSUME_PROVIDED PSEUDO_IGNORE_PATHS"
+	APPEND \
+	ASSUME_PROVIDED \
+	BBLAYERS \
+	DEPLOY_DIR_IMAGE \
+	FAKEROOTCMD \
+	HOSTTOOLS_DIR \
+	IMAGE_BASENAME \
+	IMAGE_BOOT_FILES \
+	IMAGE_EFI_BOOT_FILES \
+	IMAGE_LINK_NAME \
+	IMAGE_ROOTFS \
+	IMGDEPLOYDIR \
+	INITRAMFS_FSTYPES \
+	INITRAMFS_IMAGE \
+	INITRAMFS_IMAGE_BUNDLE \
+	INITRAMFS_LINK_NAME \
+	INITRD \
+	INITRD_LIVE \
+	ISODIR \
+	KERNEL_IMAGETYPE \
+	MACHINE \
+	PSEUDO_IGNORE_PATHS \
+	RECIPE_SYSROOT_NATIVE \
+	ROOTFS_SIZE \
+	STAGING_DATADIR \
+	STAGING_DIR \
+	STAGING_LIBDIR \
+	TARGET_SYS \
+"

 inherit ${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', 'kernel-artifact-names', '', d)}


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
