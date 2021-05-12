Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.2435.1620793073246362707
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 21:17:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.196, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 173.197.191.182
Received: from localhost.localdomain (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id A5B5FE0007;
	Wed, 12 May 2021 04:17:50 +0000 (UTC)
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH v2] btrfs-tools: Update to 5.12
Date: Tue, 11 May 2021 21:17:17 -0700
Message-Id: <20210512041717.320804-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PACKAGECONFIG for zoned block devices. Leave disabled by default, as
this requires a recent kernel.

License-Update: libbtrfsutil was relicensed to LGPLv2.1+: https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/commit/?id=9e30f779e3cbf12a88ebe309ee371851fdfd3aa0

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../{btrfs-tools_5.11.1.bb => btrfs-tools_5.12.bb}         | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.11.1.bb => btrfs-tools_5.12.bb} (92%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb
similarity index 92%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb
index b5e0561c15..8a809427f5 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.bb
@@ -7,10 +7,10 @@ btrfs and an utility (btrfs-convert) to make a btrfs filesystem from an ext3."
 
 HOMEPAGE = "https://btrfs.wiki.kernel.org"
 
-LICENSE = "GPLv2 & LGPLv3+"
+LICENSE = "GPLv2 & LGPLv2.1+"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067 \
-    file://libbtrfsutil/COPYING.LESSER;md5=3000208d539ec061b899bce1d9ce9404 \
+    file://libbtrfsutil/COPYING;md5=4fbd65380cdd255951079008b364516c \
 "
 SECTION = "base"
 DEPENDS = "lzo util-linux zlib"
@@ -19,7 +19,7 @@ DEPENDS_append_class-target = " udev"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "8d5051f279f7994fb80536ef8f846f06d121d898"
+SRCREV = "b16b0a766f06138de2ee32d4d84b7110e469ff49"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
@@ -31,6 +31,7 @@ PACKAGECONFIG ??= " \
 PACKAGECONFIG[manpages] = "--enable-documentation, --disable-documentation, asciidoc-native xmlto-native"
 PACKAGECONFIG[programs] = "--enable-programs,--disable-programs"
 PACKAGECONFIG[convert] = "--enable-convert --with-convert=ext2,--disable-convert --without-convert,e2fsprogs"
+PACKAGECONFIG[zoned] = "--enable-zoned,--disable-zoned"
 PACKAGECONFIG[python] = "--enable-python,--disable-python,python3-setuptools-native"
 PACKAGECONFIG[zstd] = "--enable-zstd,--disable-zstd,zstd"
 
-- 
2.26.3

