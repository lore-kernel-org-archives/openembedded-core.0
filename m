Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D02E272F96
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 02:56:47 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r77so4237600wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Aug 2017 19:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=c6B0Fw3gSO0cSPnjhqv6LoBkCpwnrIRrLvgjCgq7gF4=;
	b=onbqGSRNRjzRaMs8dA0JfGvBw6g9k2pbtjZbDa9CAXT50kH9YCncU6fd4R3ST4hg/8
	x1ngWSq8Y6ARXGgDBZIDvocO3nLjps39I4jVBf9P69/XJVZFkJvur5xra61QEjX9dnzM
	UbBznN4d2elxrqQzPaEJ+m5jRkKGRMi1s4XIFHmXGTMj+TmwNy9gMdMDFlNFwOoEF0PU
	d8RHmh8iRscCO+Yxx4sNgth1EUNZP2+g6npCoimB5oFQIVEnEIolUF151KDcO1ZJh4M6
	oVnmPISQtMvkxIRGaR00AyZTxhbcof4CuSAzu8KyKGe61VVrouthNuPMzC1C+pENa9XL
	7hkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=c6B0Fw3gSO0cSPnjhqv6LoBkCpwnrIRrLvgjCgq7gF4=;
	b=Y+F0/EtpLHo07suBAd33FQm7esf/tU8GqyMid2BnUkTERyqnFHLZYuvSKTpfH+hYbs
	Y/Mbii1DdFOrLAdFKQCaFf7Vg5cdmh4jLyNS7kGRHWsouOxpl3jP2ZK0f1vLh1uM3TfX
	E6v82alAXFEhDbyV+BoFcEznEZCUkqODJoOB30ZzB3O+s/teheh8HizfWDd8SjUUOPOV
	3Y5Gp7iG61lzxdJrCMKnL3NjZ6WZaa2FQwhPzEMK7L23F6R2o3CRTBOQ1R/tyTImRlDI
	9K1pPxp7HEgYoM1umstwHmVs5SWRyUYwbiUMUxaVdCIYh0rp+kFIKX1T+8tbehcZa4iw
	Gxmg==
X-Gm-Message-State: AIVw112ebhf8++Hqvf2/5uF9LlAGzwEOGwjuHZzrFaWG88aLonSxgWK0
	xK2ealjq5FAdE7k3
X-Received: by 10.80.139.1 with SMTP id l1mr997995edl.200.1501815408379;
	Thu, 03 Aug 2017 19:56:48 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.201.186]) by smtp.gmail.com with ESMTPSA id
	b10sm1984131edl.74.2017.08.03.19.56.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Aug 2017 19:56:47 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Aug 2017 04:56:28 +0200
Message-Id: <1501815391-8192-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501815391-8192-1-git-send-email-liu.ming50@gmail.com>
References: <1501815391-8192-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V2 1/4] image_types_wic.bbclass: adjust WKS_FILE_DEPENDS_DEFAULT
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
X-List-Received-Date: Fri, 04 Aug 2017 02:56:48 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Let WKS_FILE_DEPENDS_DEFAULT default to include all native recipes
listed in NATIVE_RECIPES of wic, as a temporary solution to avoid
breaking wic image build.

Recommended solution is to use WKS_FILE_DEPENDS in image recipes
together with WKS_FILE to specify dependencies.

Drop do_image_wic depends varflags, it's not needed any more, all
the dependencies will be handled by WKS_FILE_DEPENDS.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/image_types_wic.bbclass | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index b825b47..ad578c4 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -39,9 +39,26 @@ IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
 WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
 do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
-do_image_wic[depends] += "${@' '.join('%s-native:do_populate_sysroot' % r for r in ('parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
 
-WKS_FILE_DEPENDS_DEFAULT = "syslinux-native bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native"
+# Defaults to include all native recipes listed in NATIVE_RECIPES of
+# wic, as a temporary solution to avoid breaking wic image build.
+# Recommended solution is to use WKS_FILE_DEPENDS in image recipes
+# together with WKS_FILE to specify dependencies.
+WKS_FILE_DEPENDS_DEFAULT = "\
+    bmap-tools-native \
+    grub-efi-native \
+    syslinux-native \
+    mtools-native \
+    dosfstools-native \
+    cdrtools-native \
+    btrfs-tools-native \
+    e2fsprogs-native \
+    squashfs-tools-native \
+    util-linux-native \
+    parted-native \
+    gptfdisk-native \
+"
+
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
 WKS_FILE_DEPENDS_BOOTLOADERS_x86 = "syslinux grub-efi systemd-boot"
 WKS_FILE_DEPENDS_BOOTLOADERS_x86-64 = "syslinux grub-efi systemd-boot"
-- 
2.7.4


