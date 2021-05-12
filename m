Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.4081.1620808568509855065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 01:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: iuNIOLhD8HUMczMwkL2o4/noRt50ArKtejLD2RO8HF/sMJmFhvCMIdOsd9w4sQyZEECm/m/9N4
 9qb6xM2B/OuA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179917834"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="179917834"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:22 -0700
IronPort-SDR: uwOrwhzw5htl1CUpdPMn2TxF7iRtXYtI9RRN5Z7Q3P0xoPsn5IKRj5k0dKQSMYkvdRNL+TP6s0
 rDuED+S/zkdw==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="430645843"
Received: from tmustofa-mobl1.amr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.122])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:21 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 14/15] linux-firmware: include all relevant files in -bcm4356
Date: Wed, 12 May 2021 16:35:46 +0800
Message-Id: <68647eccaf817287df17d5a247b3caf7df9f6840.1620808329.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620808329.git.anuj.mittal@intel.com>
References: <cover.1620808329.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

This currently catches the .clb_blob and .vamrs,rock960.txt, and other
.txt files may come in future upstream releases.

Signed-off-by: Yann Dirson <yann@blade-group.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e332738a8aae0914c58b40faae8b9d7a82fd6a95)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb
index eb4ef51a3a..bd1f177209 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210315.bb
@@ -645,8 +645,8 @@ FILES_${PN}-bcm43455 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.
 "
 FILES_${PN}-bcm4350c2 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4350c2-pcie.bin"
 FILES_${PN}-bcm4350 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4350-pcie.bin"
-FILES_${PN}-bcm4356 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-sdio.bin \
-  ${nonarch_base_libdir}/firmware/cypress/cyfmac4356-sdio.bin \
+FILES_${PN}-bcm4356 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac4356-sdio.* \
+  ${nonarch_base_libdir}/firmware/cypress/cyfmac4356-sdio.* \
 "
 FILES_${PN}-bcm43569 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43569.bin"
 FILES_${PN}-bcm43570 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43570-pcie.bin \
-- 
2.31.1

