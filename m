Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7F36F7E52D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 13:17:28 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id 7so7183629ljw.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 06:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=z+/ZhsAle/KgnwbbkarGw4vGCrgyKEdsQc0dv4Vufm8=;
	b=n/AmWoiPxfMMNgTZP4xzHsMT9DLfk9ab2CJzw4rJKq752t3uMCVwAJ28pLVhJdI6XG
	EyHf9sYzqN2s8Sqtc41Mj2qwB5oFAwgz5Y2Ad9+9KsWqJSVepC2Ln6VB5R3JmcgxVDf7
	g2sjiCQ2iPt1qbPeNW+UoNGeT8eaWDb8V4akCNoAX30XRAGHypvhS/7NN3h4rYgCqeG9
	850dUGRdGjgg4GFKAFl7A755Ionkq0nlwv3qQKxbgUjpOImBKw6pOVWciP77q1Qg+KZM
	L2BmvB6gH+G9XMM2is+84UE49b4S4MNQeWphNmAR/KXsy4tT7Bdfv/WzrjfwNzuubWCR
	pykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=z+/ZhsAle/KgnwbbkarGw4vGCrgyKEdsQc0dv4Vufm8=;
	b=q9EwKrje/O8sYvnoqE4/cGPUmHQYxPue4sEroOM9cNun2aAT2QEnE6pciIDe4X1OgT
	lIu7hBUrwgsf0D2vY+VhC/TzqpfD8HtuiFocxiJ+QyUu6LYr2OfevbOe08599d6GMFPA
	Oe8hwHZ2Xel7Ap+jcT8R6Mvuao3/1MBKkO5d/u0psyxUgeRXt5S5Vc8WEe/Qt4XZMDhu
	u5Dv85AHVujtSl01NuAiSUxzsqXkmM7Vh0t+/LdwqnKGD4c2ppXX7Sq26jxRVIrDEzTO
	w0wWy40H00bw4OCXC97AOpdWnoKqYgxbp5h37J9tX0JcPVbKMQON+YO9NTv/H4DxTiO5
	qxSQ==
X-Gm-Message-State: APjAAAWCAJfg8DKlrze8IdWKG1IHLQRWiGHDDUIp8HHUvkwHRKt0L6le
	AP9Zv1TQAEaASapVyaEtDacjoEMS
X-Google-Smtp-Source: APXvYqwHZ3AWkCHeGM4ErBEPO1DAwB20pysgaFYNKxcinU2yKX+HsyhEVOO/ftC7QqlRAgitXNilww==
X-Received: by 2002:a2e:9890:: with SMTP id b16mr2174423ljj.189.1568812648321; 
	Wed, 18 Sep 2019 06:17:28 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.37])
	by smtp.gmail.com with ESMTPSA id u10sm999466lfk.34.2019.09.18.06.17.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 06:17:27 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2019 16:12:41 +0300
Message-Id: <20190918131247.26488-1-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v3 1/7] image-uefi.conf: add config file holding configuration for UEFI images
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
X-List-Received-Date: Wed, 18 Sep 2019 13:17:28 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Create new config file defining common variables for all UEFI-related
packages (bootloaders, test applications, etc).

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/conf/image-uefi.conf | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/conf/image-uefi.conf

diff --git a/meta/conf/image-uefi.conf b/meta/conf/image-uefi.conf
new file mode 100644
index 000000000000..aaeff12ccb80
--- /dev/null
+++ b/meta/conf/image-uefi.conf
@@ -0,0 +1,16 @@
+# Location of EFI files inside EFI System Partition
+EFIDIR ?= "/EFI/BOOT"
+
+# Prefix where ESP is mounted inside rootfs. Set to empty if package is going
+# to be installed to ESP directly
+EFI_PREFIX ?= "/boot"
+
+# Location inside rootfs.
+EFI_FILES_PATH = "${EFI_PREFIX}${EFIDIR}"
+
+# Determine name of bootloader image
+EFI_BOOT_IMAGE ?= "bootINVALID.efi"
+EFI_BOOT_IMAGE_x86-64 = "bootx64.efi"
+EFI_BOOT_IMAGE_x86 = "bootia32.efi"
+EFI_BOOT_IMAGE_aarch64 = "bootaa64.efi"
+EFI_BOOT_IMAGE_arm = "bootarm.efi"
-- 
2.23.0


