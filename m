Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 942947C0E0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 08:43:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Dec 2018 00:43:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,376,1539673200"; d="scan'208";a="112046161"
Received: from lwong-mobl2.gar.corp.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.255.137.224])
	by orsmga003.jf.intel.com with ESMTP; 20 Dec 2018 00:43:42 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2018 16:43:35 +0800
Message-Id: <20181220084336.7294-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181220084336.7294-1-anuj.mittal@intel.com>
References: <20181220084336.7294-1-anuj.mittal@intel.com>
Subject: [PATCH 4/5] at-spi2-atk: upgrade 2.26.2 -> 2.30.0
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
X-List-Received-Date: Thu, 20 Dec 2018 08:43:41 -0000

For changes, see:
https://github.com/GNOME/at-spi2-atk/blob/AT_SPI2_ATK_2_30_0/NEWS

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../atk/{at-spi2-atk_2.26.2.bb => at-spi2-atk_2.30.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-atk_2.26.2.bb => at-spi2-atk_2.30.0.bb} (79%)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.26.2.bb b/meta/recipes-support/atk/at-spi2-atk_2.30.0.bb
similarity index 79%
rename from meta/recipes-support/atk/at-spi2-atk_2.26.2.bb
rename to meta/recipes-support/atk/at-spi2-atk_2.30.0.bb
index 16d8e45ee4..eb4be6b6d8 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.26.2.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.30.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 
-SRC_URI[archive.md5sum] = "355c7916a69513490cb83ad34016b169"
-SRC_URI[archive.sha256sum] = "61891f0abae1689f6617a963105a3f1dcdab5970c4a36ded9c79a7a544b16a6e"
+SRC_URI[archive.md5sum] = "1ad754b90bcb14244b73ca4d0c14d274"
+SRC_URI[archive.sha256sum] = "e2e1571004ea7b105c969473ce455a95be4038fb2541471714aeb33a26da8a9a"
 
 DEPENDS = "dbus glib-2.0 glib-2.0-native atk at-spi2-core libxml2"
 
-- 
2.17.1


