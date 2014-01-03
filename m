Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 575A56BD89
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 14:27:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jan 2014 06:27:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,598,1384329600"; d="scan'208";a="459627822"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jan 2014 06:27:39 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jan 2014 16:30:10 +0200
Message-Id: <28fe928091ad99666b2f82170a8c4720498a91af.1388759244.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1388759244.git.cristian.iorga@intel.com>
References: <cover.1388759244.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1388759244.git.cristian.iorga@intel.com>
References: <cover.1388759244.git.cristian.iorga@intel.com>
Subject: [PATCH 7/8] ofono: upgrade to 1.14
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
X-List-Received-Date: Fri, 03 Jan 2014 14:27:39 -0000

Add support for Apple Siri specific Handsfree commands.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/ofono/{ofono_1.13.bb => ofono_1.14.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_1.13.bb => ofono_1.14.bb} (52%)

diff --git a/meta/recipes-connectivity/ofono/ofono_1.13.bb b/meta/recipes-connectivity/ofono/ofono_1.14.bb
similarity index 52%
rename from meta/recipes-connectivity/ofono/ofono_1.13.bb
rename to meta/recipes-connectivity/ofono/ofono_1.14.bb
index 7a7e65c..f107fe6 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.13.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.14.bb
@@ -5,7 +5,7 @@ SRC_URI  = "\
   file://ofono \
 "
 
-SRC_URI[md5sum] = "78112668d8444bc28d4b3359efd866f6"
-SRC_URI[sha256sum] = "3329c0af1e672777122981dfb9728b2c517f30f9d1b997e08e6177eb0109f0d3"
+SRC_URI[md5sum] = "8bc398d86642408cc71d039f59c61538"
+SRC_URI[sha256sum] = "84d28d37cbc47129628a78bf3e17323af1636dceb2494511dd44caa829fb277f"
 
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
1.8.3.2


