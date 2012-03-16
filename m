Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LHr-0001YA-HU
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:44:55 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:36:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121478527"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 17:35:56 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:20 +0800
Message-Id: <5eb04b29700daf45b7371f393dc03849fc83b4de.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 23/60] curl: upgrade to 7.24.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Mar 2012 00:44:56 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../curl/{curl_7.23.1.bb => curl_7.24.0.bb}        |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/curl/{curl_7.23.1.bb => curl_7.24.0.bb} (92%)

diff --git a/meta/recipes-support/curl/curl_7.23.1.bb b/meta/recipes-support/curl/curl_7.24.0.bb
similarity index 92%
rename from meta/recipes-support/curl/curl_7.23.1.bb
rename to meta/recipes-support/curl/curl_7.24.0.bb
index db1ca81..12e95c9 100644
--- a/meta/recipes-support/curl/curl_7.23.1.bb
+++ b/meta/recipes-support/curl/curl_7.24.0.bb
@@ -8,14 +8,14 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e66
 DEPENDS = "zlib gnutls"
 DEPENDS_virtclass-native = "zlib-native"
 DEPENDS_virtclass-nativesdk = "zlib-nativesdk"
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://noldlibpath.patch \
            file://pkgconfig_fix.patch"
 
-SRC_URI[md5sum] = "0296d3196b4bf82c896a869b38dbc5f2"
-SRC_URI[sha256sum] = "7d8c8cef8f244118245c37853cb175bd95c156ff453730ec2c88189b05a7c06e"
+SRC_URI[md5sum] = "f912221d75eb8d8fe08900eaf011b023"
+SRC_URI[sha256sum] = "ebdb111088ff8b0e05b1d1b075e9f1608285e8105cc51e21caacf33d01812c16"
 
 inherit autotools pkgconfig binconfig
 
-- 
1.7.6



