Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 93D767C930
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 17:31:54 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id i16so6459486wrs.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 09:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=20goqt+Z0rse72KgnS/YkA88O4svURkt3dDZC9GWwyw=;
	b=Sf9+aLzwFUYfBBN5ZJ7nYYJZMRRbpU3bzBkc1+BYeBunogGe4vvgaxyxu6WHASLyoT
	1/EHbwHHFg+dWm1fvR3yobG7Y5alvl8j1kSbr6SY+4MiKlFn/GjdWWHAX9H5AUMWYNfi
	5+/QXJTve/DI4L4Qaon2QpEZKSX4LsqGKqzxhQRCETU8pkLEiS4tSJ+FfRAojROET/FX
	8g9Av+F4dR/bKNQgJK/kCcy6IZRDcjSGT71ZPLkbTnbz29P777lsh8V+VDECnTR296wz
	rr30o2mzhS6ruaGhgNricKYryVZsixz2PU2wuIp66TYglz19WNIvsJmt14I+6N8yCILa
	3MJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=20goqt+Z0rse72KgnS/YkA88O4svURkt3dDZC9GWwyw=;
	b=PI9KvdMJzFqKQNBQzfV6OSvG0C5pwkd2YuDO0E1QYFZqm20JpeB/FdKmYfThxnh4ve
	+sufzXxp1CwyuOaDVsgwiyS135tCdPoP9bvqIxsl3J+OHQ0CFiryBhQ4EKubUGp615Yf
	kqtgFN8bIEih0SuNF+C2J9dqUGeo81P1D68/CFM1tUIjuVFit7Agz4LoWl1KYZVR0C8y
	iUiywW9MJAFQR/gLe7rUygHARp0O7Roki2exICNv2iU32AnV1+HodCr+cDh8YUQ45RHv
	11aUCg+U54gp14SKRhfGHWs4uPgGX2PrrK+lEKVJ/oaKKQJ1K6RvhfdToJjqjVr/Bkfw
	bv4A==
X-Gm-Message-State: APjAAAVoLIRY47GT7EXiev6NLwqcpNVfHrXUBwdq0frnSn+G3PsB0Vvb
	4zC1wT1qYsXi7tNC64DKdLV1YEgOUdA=
X-Google-Smtp-Source: APXvYqyYQsElobqu4ljCWQGXmWokUw1CFj2Ikeo4qFa9nELEcK3uqZK/94lsD64kyyc6f/peTnNrPg==
X-Received: by 2002:adf:f487:: with SMTP id l7mr12779379wro.86.1551720715080; 
	Mon, 04 Mar 2019 09:31:55 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v67sm10137991wmb.9.2019.03.04.09.31.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 09:31:54 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 17:31:44 +0000
Message-Id: <20190304173144.25675-6-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190304173144.25675-1-ross.burton@intel.com>
References: <20190304173144.25675-1-ross.burton@intel.com>
Subject: [PATCH 6/6] squashfs-tools: add PACKAGECONFIGs for all the tunables
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
X-List-Received-Date: Mon, 04 Mar 2019 17:31:54 -0000

Upstream lets you control what compression algorithms are used, so add
PACKAGECONFIGs for them all.

Instead of bundling a copy of the SevenZIP SDK from 2009 (!), reuse XZ.  This
means we can drop Public Domain from the license list.

Also -e was removed from EXTRA_OEMAKE in 2016 (oe-core aeb653) so the fiddling
to work around that can be removed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../squashfs-tools/squashfs-tools_git.bb           | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 2f412634571..e871f1cbf54 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -2,16 +2,12 @@
 # and I don't think the kernel supports it any more.
 SUMMARY = "Tools for manipulating SquashFS filesystems"
 SECTION = "base"
-LICENSE = "GPL-2 & PD"
-LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://../../7zC.txt;beginline=12;endline=16;md5=2056cd6d919ebc3807602143c7449a7c \
-"
-DEPENDS = "attr zlib xz lzo lz4"
+LICENSE = "GPL-2"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PV = "4.3+gitr${SRCPV}"
 SRCREV = "9c1db6d13a51a2e009f0027ef336ce03624eac0d"
 SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
-           http://downloads.sourceforge.net/sevenzip/lzma465.tar.bz2;name=lzma \
            file://0001-mksquashfs.c-get-inline-functions-work-with-C99.patch;striplevel=2 \
            file://squashfs-tools-4.3-sysmacros.patch;striplevel=2 \
            file://fix-compat.patch \
@@ -23,14 +19,20 @@ SRC_URI[lzma.sha256sum] = "c935fd04dd8e0e8c688a3078f3675d699679a90be81c12686837e
 
 S = "${WORKDIR}/git/squashfs-tools"
 
-# EXTRA_OEMAKE is typically: -e MAKEFLAGS=
-# the -e causes problems as CFLAGS is modified in the Makefile, so
-# we redefine EXTRA_OEMAKE here
-EXTRA_OEMAKE = "MAKEFLAGS= LZMA_SUPPORT=1 LZMA_DIR=../.. XZ_SUPPORT=1 LZO_SUPPORT=1 LZ4_SUPPORT=1"
+EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS}"
+
+PACKAGECONFIG ??= "gzip xz lzo lz4 lzma xattr"
+PACKAGECONFIG[gzip] = "GZIP_SUPPORT=1,GZIP_SUPPORT=0,zlib"
+PACKAGECONFIG[xz] = "XZ_SUPPORT=1,XZ_SUPPORT=0,xz"
+PACKAGECONFIG[lzo] = "LZO_SUPPORT=1,LZO_SUPPORT=0,lzo"
+PACKAGECONFIG[lz4] = "LZ4_SUPPORT=1,LZ4_SUPPORT=0,lz4"
+PACKAGECONFIG[lzma] = "LZMA_XZ_SUPPORT=1,LZMA_XZ_SUPPORT=0,xz"
+PACKAGECONFIG[xattr] = "XATTR_SUPPORT=1,XATTR_SUPPORT=0,attr"
 
 do_compile() {
 	oe_runmake mksquashfs unsquashfs
 }
+
 do_install () {
 	install -d ${D}${sbindir}
 	install -m 0755 mksquashfs ${D}${sbindir}/
-- 
2.11.0


