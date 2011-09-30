Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1R9YMj-0007IC-Rm
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 10:22:42 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Sep 2011 01:16:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,465,1312182000"; d="scan'208";a="57288670"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by azsmga001.ch.intel.com with ESMTP; 30 Sep 2011 01:16:07 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 16:16:05 +0800
Message-Id: <b53e13b48897472197f3ab2cb28c85cab089e4a5.1317370299.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1317370299.git.lei.mei@intel.com>
References: <cover.1317370299.git.lei.mei@intel.com>
In-Reply-To: <cover.1317370299.git.lei.mei@intel.com>
References: <cover.1317370299.git.lei.mei@intel.com>
Subject: [PATCH 1/4] curl: Upgrade from 7.21.7 to 7.22.0
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
X-List-Received-Date: Fri, 30 Sep 2011 08:22:42 -0000

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../curl/{curl_7.21.7.bb => curl_7.22.0.bb}        |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.21.7.bb => curl_7.22.0.bb} (92%)

diff --git a/meta/recipes-support/curl/curl_7.21.7.bb b/meta/recipes-support/curl/curl_7.22.0.bb
similarity index 92%
rename from meta/recipes-support/curl/curl_7.21.7.bb
rename to meta/recipes-support/curl/curl_7.22.0.bb
index 2ec4402..d6924be 100644
--- a/meta/recipes-support/curl/curl_7.21.7.bb
+++ b/meta/recipes-support/curl/curl_7.22.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://noldlibpath.patch \
            file://pkgconfig_fix.patch"
 
-SRC_URI[md5sum] = "5f6d50c4d4ee38c57fe37e3cff75adbd"
-SRC_URI[sha256sum] = "1a50dd17400c042090203eef347e946f29c342c32b6c4843c740c80975e8215a"
+SRC_URI[md5sum] = "bde820eac53fa3a8d8696667418557ad"
+SRC_URI[sha256sum] = "bda0da862322b122784f5a9d7a65efdd99a6061292cfb8e9357e0c67c03e5112"
 
 inherit autotools pkgconfig binconfig
 
-- 
1.7.0.4



