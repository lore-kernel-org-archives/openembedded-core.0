Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4245B72374
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:24:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 12 Feb 2015 05:19:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,565,1418112000"; d="scan'208";a="453678309"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Feb 2015 05:04:52 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Feb 2015 15:19:28 +0200
Message-Id: <847e3cb8494456bbc791c6bb49939d4686656e93.1423747110.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1423747110.git.cristian.iorga@intel.com>
References: <cover.1423747110.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1423747110.git.cristian.iorga@intel.com>
References: <cover.1423747110.git.cristian.iorga@intel.com>
Subject: [PATCH 2/2] ofono: upgrade to 1.16
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
X-List-Received-Date: Thu, 12 Feb 2015 13:24:55 -0000

- Fix issue with PIN retry handling;
- Fix issue with HFP and multiple calls;
- Add support for Distracted Driving Reduction;
- Add support for available technologies property;
- Add support for Telit location reporting driver;
- Add support for u-blox SARA-U270 modems;
- Add support for Quectel UC15 modems.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/ofono/{ofono_1.15.bb => ofono_1.16.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_1.15.bb => ofono_1.16.bb} (59%)

diff --git a/meta/recipes-connectivity/ofono/ofono_1.15.bb b/meta/recipes-connectivity/ofono/ofono_1.16.bb
similarity index 59%
rename from meta/recipes-connectivity/ofono/ofono_1.15.bb
rename to meta/recipes-connectivity/ofono/ofono_1.16.bb
index bee2b47..712fc5c 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.15.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.16.bb
@@ -5,8 +5,7 @@ SRC_URI  = "\
   file://ofono \
   file://Revert-test-Convert-to-Python-3.patch \
 "
-
-SRC_URI[md5sum] = "4d03de85239d8100dc7721bf0dad2bd2"
-SRC_URI[sha256sum] = "978807a05e8904eb4e57d6533ed71e75676a55fa3819a39fe2c878f45dbf7af6"
+SRC_URI[md5sum] = "c31b5b55a1d68354bff771d3edf02829"
+SRC_URI[sha256sum] = "403b98dadece8bc804c0bd16b96d3db5a3bb0f84af64b3d67924da2d1a754b07"
 
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
2.1.0


