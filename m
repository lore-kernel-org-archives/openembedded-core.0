Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1Rdc9J-0002w5-RE
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 07:29:06 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Dec 2011 22:21:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="90281168"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by orsmga002.jf.intel.com with ESMTP; 21 Dec 2011 22:21:59 -0800
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2011 14:17:22 +0800
Message-Id: <8e0ebe5a2365875cc442c828c7ae801d30cfc011.1324534102.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1324534102.git.lei.mei@intel.com>
References: <cover.1324534102.git.lei.mei@intel.com>
In-Reply-To: <cover.1324534102.git.lei.mei@intel.com>
References: <cover.1324534102.git.lei.mei@intel.com>
Subject: [PATCH 1/2] curl: Upgrade from 7.22.0 to 7.23.1
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
X-List-Received-Date: Thu, 22 Dec 2011 06:29:06 -0000

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../curl/{curl_7.22.0.bb => curl_7.23.1.bb}        |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.22.0.bb => curl_7.23.1.bb} (92%)

diff --git a/meta/recipes-support/curl/curl_7.22.0.bb b/meta/recipes-support/curl/curl_7.23.1.bb
similarity index 92%
rename from meta/recipes-support/curl/curl_7.22.0.bb
rename to meta/recipes-support/curl/curl_7.23.1.bb
index 9ca450a..9772465 100644
--- a/meta/recipes-support/curl/curl_7.22.0.bb
+++ b/meta/recipes-support/curl/curl_7.23.1.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://noldlibpath.patch \
            file://pkgconfig_fix.patch"
 
-SRC_URI[md5sum] = "bdb5c226d37c4a6082c70e7ef6f63060"
-SRC_URI[sha256sum] = "bda0da862322b122784f5a9d7a65efdd99a6061292cfb8e9357e0c67c03e5112"
+SRC_URI[md5sum] = "0296d3196b4bf82c896a869b38dbc5f2"
+SRC_URI[sha256sum] = "7d8c8cef8f244118245c37853cb175bd95c156ff453730ec2c88189b05a7c06e"
 
 inherit autotools pkgconfig binconfig
 
-- 
1.7.0.4



