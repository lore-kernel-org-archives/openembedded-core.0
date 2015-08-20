Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 45F3D73E20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 18:11:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 20 Aug 2015 11:11:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,715,1432623600"; d="scan'208";a="752372068"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.254.61.80])
	by orsmga001.jf.intel.com with ESMTP; 20 Aug 2015 11:11:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, akuster808@gmail.com
Date: Thu, 20 Aug 2015 11:11:54 -0700
Message-Id: <1440094314-22940-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH][Dizzy] grub-efi: Add trailing \ missed in last patch
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
X-List-Received-Date: Thu, 20 Aug 2015 18:11:56 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-bsp/grub/grub-efi_2.00.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index 91b0cb6..7674255 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -29,7 +29,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://grub-efi-allow-a-compilation-without-mcmodel-large.patch \
            file://grub-2.00-add-oe-kernel.patch \
            file://grub-efi-fix-with-glibc-2.20.patch \
-           file://0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch
+           file://0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch \
           "
 SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
 SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
-- 
2.1.0


