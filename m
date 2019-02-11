Return-Path: <silvio.fricke@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 90ABC6B463
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 06:02:52 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q21so14506729wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Feb 2019 22:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=asRXBI1W0+5KaNjyx+Tco5/hHQevo+zOetlS9yjHZ3M=;
	b=V7MSbfwatDmGS83voYkr6qiz/Xj0z/2d4y7Hy2L0qZ4bsql5Jz3qw9z7IReIFBG4c5
	cuLvUJ+sj2gtABD/pX2Secti68IpRkGcR4YIpH2fTDHfU6KuGGO4oU+bGc1nESdAzebi
	oyqGEkZeLibU1LWx5FovZO/Dlzsmv0djJ8IbebbDPr+y6X/PgJ+F6BDhKtWpv0K6R+pc
	23QU5r0eHqVr2B+72bVKHEK65yJevGph7WY6kWIRPR3e20eZa/hXTjQVxyCV5bFcuygW
	haTGZyTS3vPvcs+TTQ1XeEum/964JfLevjGnYSQIw9x9tP/vKWxKsdSKazf4XIB27cOF
	4uCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=asRXBI1W0+5KaNjyx+Tco5/hHQevo+zOetlS9yjHZ3M=;
	b=UozxS/6ZgTAc8KnwtnsIYXUKVRMiM5D8102QWwG/Ao8SnD95K+hHRFhvFXeHTriyva
	N2KPYaFN6T/NQneq+tOTLXK0PGL6bm0cwexoGhq4EAcsoU5VsujatUmKInMIi6cTdpOC
	+1Zpry7P/1A0CXe8Kya2SryNHIbquoS9yDCPi8m64geUnqjJOhHRsF5HNjt1rJ1oj5bh
	tMMKdr/mq7L/Z4PGUXeNOHkN6xOrS56gqsI6KeruC/wyZ5GI6PO8qxawu0b/NXb3Su9j
	B2/RKtpSD/qPdHUaaxs95nqkjFO/id7owIBON5DuhO2TecmmPPduYimqoh7zJ93bnjzx
	hRiA==
X-Gm-Message-State: AHQUAua0gvTi+IrZxnuQhn7lNtP2nOuKOfW0PzoJXhMMn+E2qSdJVwOF
	sf8o4K1pRv4R6BmHmpssQtyQqlIr
X-Google-Smtp-Source: AHgI3IahYjWAgtUx0VjuyNdx/pgeOX+ZmVazNAkLkIGibX68Y7gT4rrJtCfkrA9bKNYyiYmN/Hogtg==
X-Received: by 2002:adf:c704:: with SMTP id k4mr3360881wrg.142.1549864973082; 
	Sun, 10 Feb 2019 22:02:53 -0800 (PST)
Received: from localhost.localdomain
	([2a02:8070:89b1:6700:be5f:f4ff:fe36:3eb6])
	by smtp.gmail.com with ESMTPSA id
	u134sm4702022wmf.21.2019.02.10.22.02.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Feb 2019 22:02:52 -0800 (PST)
From: Silvio Fricke <silvio.fricke@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2019 07:02:48 +0100
Message-Id: <4c3dabb9814914747119a28172f38e2a32c0bd36.1549821635.git.silvio.fricke@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1549821635.git.silvio.fricke@gmail.com>
References: <cover.1549821635.git.silvio.fricke@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v1 1/1] image_types: add base64 conversion
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
X-List-Received-Date: Mon, 11 Feb 2019 06:02:52 -0000
Content-Transfer-Encoding: 8bit

Sometimes it is useful to have a base64 representation of an image.

Signed-off-by: Silvio Fricke <silvio.fricke@gmail.com>
---
 meta/classes/image_types.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 70bd315306..ddca5b624e 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -280,7 +280,7 @@ IMAGE_TYPES = " \
 # CONVERSION_CMD/DEPENDS.
 COMPRESSIONTYPES ?= ""
 
-CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 ${COMPRESSIONTYPES}"
+CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 base64 ${COMPRESSIONTYPES}"
 CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD_gz = "pigz -f -9 -n -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
 CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
@@ -300,6 +300,7 @@ CONVERSION_CMD_u-boot = "mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C none -n
 CONVERSION_CMD_vmdk = "qemu-img convert -O vmdk ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vmdk"
 CONVERSION_CMD_vdi = "qemu-img convert -O vdi ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vdi"
 CONVERSION_CMD_qcow2 = "qemu-img convert -O qcow2 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.qcow2"
+CONVERSION_CMD_base64 = "base64 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.base64"
 CONVERSION_DEPENDS_lzma = "xz-native"
 CONVERSION_DEPENDS_gz = "pigz-native"
 CONVERSION_DEPENDS_bz2 = "pbzip2-native"
@@ -313,6 +314,7 @@ CONVERSION_DEPENDS_u-boot = "u-boot-tools-native"
 CONVERSION_DEPENDS_vmdk = "qemu-native"
 CONVERSION_DEPENDS_vdi = "qemu-native"
 CONVERSION_DEPENDS_qcow2 = "qemu-native"
+CONVERSION_DEPENDS_base64 = "coreutils-native"
 
 RUNNABLE_IMAGE_TYPES ?= "ext2 ext3 ext4"
 RUNNABLE_MACHINE_PATTERNS ?= "qemu"
-- 
2.20.1


