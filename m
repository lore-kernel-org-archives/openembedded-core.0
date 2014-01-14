Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 997F56E3EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 11:02:26 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id u56so213471wes.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 03:02:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+o+tMnpyqT1UnaCu/sEXwdasgL7kIcwGFyEHzqeg5Z0=;
	b=VR00KFVL8muGHMXIXhxb2JgVXTO+pQskXJ1PsJxEDmz2R82UDb4xxJ2+a+Bqvzk2+c
	nBjCYKJvOdQk63AmvZ29QCHG40Gx3vRYv42M7U/eHsmAjDZHx5cVBU5Pp6mpo+57KXE5
	WzwYuGZBWmh4bdMYXFlhhoBgEvwtCp3pQUJf/rkVZ3IAt+DM87w9WwCgjdNLGqeCfqpA
	LGV9db7HzlBHhAJ+Rq5AJeZ/1Ue6C55BhUGHdXEtf84oQwFMUD6QSod7CFhL24+HQ9P5
	XjXG3sYQ6+eSx7D3DhDOQHQTJuv8sDdT8DAZgDrUCUkKJRJy5K/Q1/DPMufQv335n3ho
	Tw+Q==
X-Gm-Message-State: ALoCoQkEbnmOfqSrpQp481McKNBZhvssCymY1+kVcgaXyovIOT/w2ol0QYetd4XvVMcLn8C/e/SO
X-Received: by 10.180.86.9 with SMTP id l9mr2287579wiz.20.1389697347149;
	Tue, 14 Jan 2014 03:02:27 -0800 (PST)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id bj3sm187681wjb.14.2014.01.14.03.02.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jan 2014 03:02:26 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2014 12:00:49 +0100
Message-Id: <1389697249-4062-5-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1389697249-4062-1-git-send-email-koen.kooi@linaro.org>
References: <1389697249-4062-1-git-send-email-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH 5/5] image_types bbclass: add support for tar.lz4 and cpio.lz4
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
X-List-Received-Date: Tue, 14 Jan 2014 11:02:27 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/classes/image_types.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 54ecb15..48675b8 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -241,17 +241,19 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
-IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs iso hddimg squashfs squashfs-xz ubi ubifs tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz cpio.lzma vmdk elf"
+IMAGE_TYPES = "jffs2 sum.jffs2 cramfs ext2 ext2.gz ext2.bz2 ext3 ext3.gz ext2.lzma btrfs iso hddimg squashfs squashfs-xz ubi ubifs tar tar.gz tar.bz2 tar.xz tar.lz4 cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 vmdk elf"
 
-COMPRESSIONTYPES = "gz bz2 lzma xz"
+COMPRESSIONTYPES = "gz bz2 lzma xz lz4"
 COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
 COMPRESS_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.gz"
 COMPRESS_CMD_bz2 = "bzip2 -f -k ${IMAGE_NAME}.rootfs.${type}"
 COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.xz"
+COMPRESS_CMD_lz4 = "lz4c -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.lz4"
 COMPRESS_DEPENDS_lzma = "xz-native"
 COMPRESS_DEPENDS_gz = ""
 COMPRESS_DEPENDS_bz2 = ""
 COMPRESS_DEPENDS_xz = "xz-native"
+COMPRESS_DEPENDS_lz4 = "lz4-native"
 
 RUNNABLE_IMAGE_TYPES ?= "ext2 ext3"
 RUNNABLE_MACHINE_PATTERNS ?= "qemu"
-- 
1.8.4.2


