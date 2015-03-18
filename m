Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5816760034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 20:22:29 +0000 (UTC)
Received: by igcqo1 with SMTP id qo1so55701342igc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 13:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ozjcwv80m5NovvYI/C9u0Y5UeHTz5OtNWw84zjpU3pM=;
	b=rShh/WvZStMmxbUwx9ZaGy0xVKFOtu1qKCiDosALbTFpKzfigJW9K2JybgL34xpQmt
	ljvUfV5dn0aK3rNOwt5FVqc3WAHDTdZ6PwTQQN4/A2GcdlHHCRciuaqDibQ8Mvmavg0R
	Ztpn8k05Y+KkZ1v4xSrTGk1tMT/iI/dWyumAozHLEWxC+CkpXuFXZdH9M66d6RYfTfXh
	tU8coWvg/BzOs3HQ0slkkA6RQYIdAXXbeiHJAyXVI6J5NArerhlPByx2FB8kNBTO0FUE
	Hrpc5WptCt1uVs4T6NQpH/9DNLv7fRbLTBDB6X1pCgIyXGgbZlGNzItQH6qZnB77iYm+
	myLQ==
X-Received: by 10.107.168.146 with SMTP id e18mr119628931ioj.32.1426710150791; 
	Wed, 18 Mar 2015 13:22:30 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id 5sm2425393igr.17.2015.03.18.13.22.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Mar 2015 13:22:30 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2015 13:22:03 -0700
Message-Id: <1426710123-12122-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] mtd-utils: minor recipe formatting cleanup
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
X-List-Received-Date: Wed, 18 Mar 2015 20:22:33 -0000

Remove obsolete comment describing SRCREV and re-order
SECTION, DEPENDS and PV lines. No functional changes.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index f934b17..12daffe 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -1,20 +1,20 @@
 SUMMARY = "Tools for managing memory technology devices"
-SECTION = "base"
-DEPENDS = "zlib lzo e2fsprogs util-linux"
 HOMEPAGE = "http://www.linux-mtd.infradead.org/"
+SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
-# Use the latest version at 26 Oct, 2013
+DEPENDS = "zlib lzo e2fsprogs util-linux"
+
+PV = "1.5.1+git${SRCPV}"
+
 SRCREV = "9f107132a6a073cce37434ca9cda6917dd8d866b"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
-		file://add-exclusion-to-mkfs-jffs2-git-2.patch \
-		file://fix-armv7-neon-alignment.patch \
+           file://add-exclusion-to-mkfs-jffs2-git-2.patch \
+           file://fix-armv7-neon-alignment.patch \
 "
 
-PV = "1.5.1+git${SRCPV}"
-
 S = "${WORKDIR}/git/"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
-- 
1.9.1


