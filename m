Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1607572C55
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Jan 2015 10:47:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0HAlvxd002700
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Jan 2015 02:47:57 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 17 Jan 2015 02:47:57 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 17 Jan 2015 02:47:55 -0800
Message-ID: <310864e33b0b3f51b35fa9eb113be421fe01ddee.1421491635.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421491635.git.liezhi.yang@windriver.com>
References: <cover.1421491635.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] grub-efi: bump the PR
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
X-List-Received-Date: Sat, 17 Jan 2015 10:48:00 -0000
Content-Type: text/plain

Fixed when rebuild:
configure: error: source directory already configured; run "make distclean" there first

grub doesn't need bump since it always uses autotools (not
autotools-brokensep in the past).

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-bsp/grub/grub-efi_2.00.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index a337d3d..7b44eab 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -2,7 +2,7 @@ require grub2.inc
 
 DEPENDS_class-target = "grub-efi-native"
 RDEPENDS_${PN}_class-target = "diffutils freetype"
-PR = "r2"
+PR = "r3"
 
 SRC_URI += " \
            file://cfg \
-- 
1.7.9.5


