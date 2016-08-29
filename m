Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D7868600B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 14:31:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 29 Aug 2016 07:31:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,596,1464678000"; d="scan'208";a="1048688644"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2016 07:31:57 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 17:30:08 +0300
Message-Id: <0f283314fc5c33bad623d8fa9a7e8c227fbe8a62.1472480768.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 01/15] libwebp: upgrade to 0.5.1
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
X-List-Received-Date: Mon, 29 Aug 2016 14:31:59 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/webp/{libwebp_0.5.0.bb => libwebp_0.5.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/webp/{libwebp_0.5.0.bb => libwebp_0.5.1.bb} (92%)

diff --git a/meta/recipes-multimedia/webp/libwebp_0.5.0.bb b/meta/recipes-multimedia/webp/libwebp_0.5.1.bb
similarity index 92%
rename from meta/recipes-multimedia/webp/libwebp_0.5.0.bb
rename to meta/recipes-multimedia/webp/libwebp_0.5.1.bb
index c89adac..222bd56 100644
--- a/meta/recipes-multimedia/webp/libwebp_0.5.0.bb
+++ b/meta/recipes-multimedia/webp/libwebp_0.5.1.bb
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[md5sum] = "ba81eb9bf23e3c69a2f5cc8dcdb5938f"
-SRC_URI[sha256sum] = "5cd3bb7b623aff1f4e70bd611dc8dbabbf7688fd5eb225b32e02e09e37dfb274"
+SRC_URI[md5sum] = "3d7db92ebba5b4f679413d25c6040881"
+SRC_URI[sha256sum] = "6ad66c6fcd60a023de20b6856b03da8c7d347269d76b1fd9c3287e8b5e8813df"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-- 
2.9.3


