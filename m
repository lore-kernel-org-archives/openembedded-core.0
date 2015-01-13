Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C4BBD7162E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 12:23:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Jan 2015 04:23:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,749,1413270000"; d="scan'208";a="650376244"
Received: from ikatz2-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.18.193])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jan 2015 04:23:12 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jan 2015 12:23:03 +0000
Message-Id: <1acf0ee70513d773306010ee78b1e3e91080d43a.1421151750.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1421151750.git.paul.eggleton@linux.intel.com>
References: <cover.1421151750.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1421151750.git.paul.eggleton@linux.intel.com>
References: <cover.1421151750.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] pigz: add Apache-2.0 to LICENSE
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
X-List-Received-Date: Tue, 13 Jan 2015 12:23:19 -0000

As of version 2.3, pigz ships a copy of zopfli, which is Apache-2.0
licensed, so we need to add this to LICENSE.

Thanks to Clemens Lang for reporting this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/pigz/pigz.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pigz/pigz.inc b/meta/recipes-extended/pigz/pigz.inc
index 355fb2a..d313f2f 100644
--- a/meta/recipes-extended/pigz/pigz.inc
+++ b/meta/recipes-extended/pigz/pigz.inc
@@ -5,7 +5,7 @@ multiple cores to the hilt when compressing data. pigz was written by Mark \
 Adler, and uses the zlib and pthread libraries."
 HOMEPAGE = "http://zlib.net/pigz/"
 SECTION = "console/utils"
-LICENSE = "Zlib"
+LICENSE = "Zlib & Apache-2.0"
 
 SRC_URI = "http://zlib.net/pigz/pigz-${PV}.tar.gz"
 
-- 
1.9.3


