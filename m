Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DF13370600
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 15:42:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jul 2014 08:41:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,710,1400050800"; d="scan'208";a="573675905"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.17])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2014 08:41:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 08:41:56 -0700
Message-Id: <1406043716-27903-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1406043716-27903-1-git-send-email-sgw@linux.intel.com>
References: <1406043716-27903-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2] curl: Upgrade to 7.37.1
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
X-List-Received-Date: Tue, 22 Jul 2014 15:42:28 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/curl/{curl_7.37.0.bb => curl_7.37.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.37.0.bb => curl_7.37.1.bb} (93%)

diff --git a/meta/recipes-support/curl/curl_7.37.0.bb b/meta/recipes-support/curl/curl_7.37.1.bb
similarity index 93%
rename from meta/recipes-support/curl/curl_7.37.0.bb
rename to meta/recipes-support/curl/curl_7.37.1.bb
index f6b05a7..14bdff7 100644
--- a/meta/recipes-support/curl/curl_7.37.0.bb
+++ b/meta/recipes-support/curl/curl_7.37.1.bb
@@ -18,8 +18,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "7dda0cc2e4136f78d5801ac347be696b"
-SRC_URI[sha256sum] = "24502492de3168b0556d8e1a06f14f7589e57b204917d602a572e14239b3e09e"
+SRC_URI[md5sum] = "95c627abcf6494f5abe55effe7cd6a57"
+SRC_URI[sha256sum] = "c3ef3cd148f3778ddbefb344117d7829db60656efe1031f9e3065fc0faa25136"
 
 inherit autotools pkgconfig binconfig multilib_header
 
-- 
1.8.3.1


