Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9D56077DB3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 02:20:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5M2KBet003206
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Jun 2017 19:20:12 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 21 Jun 2017 19:20:10 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Jun 2017 22:20:09 -0400
Message-ID: <1498098009-234320-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] grub: fix 0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch missing
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
X-List-Received-Date: Thu, 22 Jun 2017 02:20:12 -0000
Content-Type: text/plain

Since grub upgraded to 2.02, it forgot to aplly
0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch.
...
commit 4f27e4042dfb39caa71c7c6eb0a327de6af4d563
Author: Khem Raj <raj.khem@gmail.com>
Date:   Fri Apr 21 20:36:06 2017 +0000

    grub: Update to 2.02
...

The missing caused grub-mkconfig could not detect kernel bzImage.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-bsp/grub/grub2.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index da6aad2..4a14e6b 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -16,6 +16,7 @@ SRC_URI = "https://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://autogen.sh-exclude-pc.patch \
            file://grub-module-explicitly-keeps-symbole-.module_license.patch \
+           file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
 "
 SRC_URI[md5sum] = "1116d1f60c840e6dbd67abbc99acb45d"
 SRC_URI[sha256sum] = "660ee136fbcee08858516ed4de2ad87068bfe1b6b8b37896ce3529ff054a726d"
-- 
2.8.1


