Return-Path: <niko.mauno@vaisala.com>
X-Greylist: delayed 588 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 29 Jan 2018 14:29:56 UTC
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
	[193.143.230.17])
	by mail.openembedded.org (Postfix) with ESMTP id 3010778815
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 14:29:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.46,431,1511820000"; d="scan'208";a="79103043"
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 16:19:20 +0200
Message-Id: <20180129141920.16224-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.11.0
X-OriginalArrivalTime: 29 Jan 2018 14:20:08.0870 (UTC)
	FILETIME=[44511C60:01D3990C]
Cc: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH] u-boot: Add coreutils-native to DEPENDS
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
X-List-Received-Date: Mon, 29 Jan 2018 14:29:57 -0000

Coreutils provides 'comm' command which is called during do_compile()
from scripts/check-config.sh. This fixes following issues which are
otherwise quietly ignored:

  .../scripts/check-config.sh: line 33: comm: command not found
  .../scripts/check-config.sh: line 38: comm: command not found

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-bsp/u-boot/u-boot_2017.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot_2017.01.bb
index 37c21dcaa3..8b00a8d294 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2017.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2017.01.bb
@@ -1,4 +1,4 @@
 require u-boot-common_${PV}.inc
 require u-boot.inc
 
-DEPENDS += "bc-native dtc-native"
+DEPENDS += "bc-native coreutils-native dtc-native"
-- 
2.11.0


