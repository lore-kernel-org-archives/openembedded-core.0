Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0F6646A4E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 17:57:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Jun 2013 10:54:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,960,1363158000"; d="scan'208";a="361241407"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.97])
	by orsmga002.jf.intel.com with ESMTP; 28 Jun 2013 10:56:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 18:56:48 +0100
Message-Id: <6c4b048ecacef64a1583b1f21250af0fecd86b0d.1372442170.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1372442170.git.paul.eggleton@linux.intel.com>
References: <cover.1372442170.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1372442170.git.paul.eggleton@linux.intel.com>
References: <cover.1372442170.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] linux-firmware: fix ralink license file name
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
X-List-Received-Date: Fri, 28 Jun 2013 17:57:09 -0000

LICENCE not LICENSE and -firmware not _firmware. (Upstream seems totally
inconsistent with these filenames, unfortunately).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 81795f2..ee33f50 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -92,7 +92,7 @@ RDEPENDS_${PN}-ath9k += "${PN}-atheros-license"
 LICENSE_${PN}-ralink = "Firmware-ralink"
 FILES_${PN}-ralink = " \
   /lib/firmware/rt*.bin \
-  /lib/firmware/LICENSE.ralink_firmware.txt \
+  /lib/firmware/LICENCE.ralink-firmware.txt \
 "
 
 LICENSE_${PN}-sd8686 = "Firmware-libertas"
-- 
1.8.1.2


