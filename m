Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1Qdc38-0006g8-UV
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 07:50:27 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jul 2011 22:46:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,471,1304319600"; d="scan'208";a="23450275"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2011 22:46:39 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2011 14:01:51 +0800
Message-Id: <f58ae9b94e913e8f44a39c9b3cca9d34fcec15c3.1309759108.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <cover.1309759108.git.lei.mei@intel.com>
References: <cover.1309759108.git.lei.mei@intel.com>
In-Reply-To: <cover.1309759108.git.lei.mei@intel.com>
References: <cover.1309759108.git.lei.mei@intel.com>
Subject: [PATCH 1/1] curl: Upgrade from 7.21.6 to 7.21.7
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
X-List-Received-Date: Mon, 04 Jul 2011 05:50:27 -0000

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../curl/{curl_7.21.6.bb => curl_7.21.7.bb}        |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.21.6.bb => curl_7.21.7.bb} (92%)

diff --git a/meta/recipes-support/curl/curl_7.21.6.bb b/meta/recipes-support/curl/curl_7.21.7.bb
similarity index 92%
rename from meta/recipes-support/curl/curl_7.21.6.bb
rename to meta/recipes-support/curl/curl_7.21.7.bb
index 51e14f9..28344e2 100644
--- a/meta/recipes-support/curl/curl_7.21.6.bb
+++ b/meta/recipes-support/curl/curl_7.21.7.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://noldlibpath.patch \
            file://pkgconfig_fix.patch"
 
-SRC_URI[md5sum] = "6611989a81ebd7b03a35adc3001ddee0"
-SRC_URI[sha256sum] = "d9a3d3593796147ad9ca994c9e6834a42b49756420a10e996dbf849495d3d955"
+SRC_URI[md5sum] = "5f6d50c4d4ee38c57fe37e3cff75adbd"
+SRC_URI[sha256sum] = "1a50dd17400c042090203eef347e946f29c342c32b6c4843c740c80975e8215a"
 
 inherit autotools pkgconfig binconfig
 
-- 
1.6.3.3



