Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 83F3275794
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 13:04:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 27 Aug 2015 06:04:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="756484336"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga001.jf.intel.com with ESMTP; 27 Aug 2015 06:04:14 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 16:05:58 +0300
Message-Id: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440680489.git.jussi.kukkonen@intel.com>
References: <cover.1440680489.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/6] nettle: Fix binary license to LGPLv2.1+
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
X-List-Received-Date: Thu, 27 Aug 2015 13:04:32 -0000

* Set the nettle binary package license to LGPLv2.1+:
  There are GPL files in the sources but none of these are used
  to produce the files we ship.
* Remove the useless package specific licenses: none of the named
  packages are actually produced and the licenses do not affect
  the overall license of either the sources or the binary package.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-support/nettle/nettle_2.7.1.bb | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_2.7.1.bb
index f9d331f..7823df9 100644
--- a/meta/recipes-support/nettle/nettle_2.7.1.bb
+++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
@@ -2,14 +2,7 @@ SUMMARY = "A low level cryptographic library"
 HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
 SECTION = "libs"
 LICENSE = "LGPLv2.1 & GPLv2"
-
-LICENSE_${PN}-cast = "CC0"
-LICENSE_${PN}-gosthash = "MIT"
-
-# both public and GPL license listed
-LICENSE_${PN}-md2 = "CC0 & LGPLv2.1+"
-LICENSE_${PN}-md4 = "CC0 & LGPLv2.1+"
-
+LICENSE_${PN} = "LGPLv2.1+"
 
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://serpent-decrypt.c;beginline=53;endline=67;md5=bcfd4745d53ca57f82907089898e390d \
-- 
2.1.4


