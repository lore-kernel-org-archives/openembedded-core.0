Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.5115.1618551494748023636
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 22:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.197, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 173.197.191.182
Received: from localhost.localdomain (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 40CA31C0007;
	Fri, 16 Apr 2021 05:38:11 +0000 (UTC)
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH 1/3] btrfs-tools: Update to 5.11.1
Date: Thu, 15 Apr 2021 22:37:27 -0700
Message-Id: <20210416053729.1021506-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update licensing, as libtrfsutil is under LGPLv3+. Note that libtrfsutil
is in the process of being relicensed to LGPLv2.1+:
	https://github.com/kdave/btrfs-progs/issues/323

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../{btrfs-tools_5.10.1.bb => btrfs-tools_5.11.1.bb}     | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.10.1.bb => btrfs-tools_5.11.1.bb} (88%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
similarity index 88%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
index fca010d4ae..2ab476a88e 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
@@ -7,14 +7,17 @@ btrfs and an utility (btrfs-convert) to make a btrfs filesystem from an ext3."
 
 HOMEPAGE = "https://btrfs.wiki.kernel.org"
 
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
+LICENSE = "GPLv2 & LGPLv3+"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067 \
+    file://libbtrfsutil/COPYING.LESSER;md5=3000208d539ec061b899bce1d9ce9404 \
+"
 SECTION = "base"
 DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "f2ffce38b9c1477a7350bfe165f0e34b9bde40f5"
+SRCREV = "8d5051f279f7994fb80536ef8f846f06d121d898"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-- 
2.26.3

