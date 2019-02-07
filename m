Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 10B2E7C22A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 05:57:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Feb 2019 21:57:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,342,1544515200"; d="scan'208";a="131709103"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.100])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Feb 2019 21:57:17 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Feb 2019 13:57:13 +0800
Message-Id: <20190207055714.25880-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190207055714.25880-1-anuj.mittal@intel.com>
References: <20190207055714.25880-1-anuj.mittal@intel.com>
Subject: [PATCH 2/3] wayland-protocols: upgrade 1.16 -> 1.17
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
X-List-Received-Date: Thu, 07 Feb 2019 05:57:17 -0000

For changes, see:

https://lists.freedesktop.org/archives/wayland-devel/2018-November/039662.html

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{wayland-protocols_1.16.bb => wayland-protocols_1.17.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.16.bb => wayland-protocols_1.17.bb} (86%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.16.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.17.bb
similarity index 86%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.16.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.17.bb
index fc4b711172..ca8f06c551 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.16.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.17.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "e0b523ff162e30bab46be1d65d527683"
-SRC_URI[sha256sum] = "6b1485951fdcd36a960c870c46f28b03a3e5121fb46246916333ed07f78c98c5"
+SRC_URI[md5sum] = "55ddd5fdb02b73b9de9559aaec267315"
+SRC_URI[sha256sum] = "df1319cf9705643aea9fd16f9056f4e5b2471bd10c0cc3713d4a4cdc23d6812f"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.17.1


