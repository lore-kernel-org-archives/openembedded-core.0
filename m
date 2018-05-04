Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 446D474926
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 12:38:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2018 05:38:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,362,1520924400"; d="scan'208";a="39254285"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 04 May 2018 05:38:47 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 15:32:39 +0300
Message-Id: <20180504123244.43049-9-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/14] libwebp: update to 1.0.0
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
X-List-Received-Date: Fri, 04 May 2018 12:38:47 -0000

--disable-experimental has been removed upstream.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/webp/{libwebp_0.6.1.bb => libwebp_1.0.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/webp/{libwebp_0.6.1.bb => libwebp_1.0.0.bb} (92%)

diff --git a/meta/recipes-multimedia/webp/libwebp_0.6.1.bb b/meta/recipes-multimedia/webp/libwebp_1.0.0.bb
similarity index 92%
rename from meta/recipes-multimedia/webp/libwebp_0.6.1.bb
rename to meta/recipes-multimedia/webp/libwebp_1.0.0.bb
index e9d4d783041..1a9679f9dc8 100644
--- a/meta/recipes-multimedia/webp/libwebp_0.6.1.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.0.0.bb
@@ -14,13 +14,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[md5sum] = "b49ce9c3e3e9acae4d91bca44bb85a72"
-SRC_URI[sha256sum] = "06503c782d9f151baa325591c3579c68ed700ffc62d4f5a32feead0ff017d8ab"
+SRC_URI[md5sum] = "967b8f087cb392e6cc94d5e116a120c0"
+SRC_URI[sha256sum] = "84259c4388f18637af3c5a6361536d754a5394492f91be1abc2e981d4983225b"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
 EXTRA_OECONF = " \
-    --disable-experimental \
     --disable-wic \
     --enable-libwebpmux \
     --enable-libwebpdemux \
-- 
2.16.1


