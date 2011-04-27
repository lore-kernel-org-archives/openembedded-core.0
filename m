Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEC-0005Kz-LN
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Apr 2011 00:29:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="739028341"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by orsmga001.jf.intel.com with ESMTP; 27 Apr 2011 00:29:32 -0700
Message-Id: <5646a6fb559a718ed30d29bf0d4bfba62ae0cf6c.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Tue, 19 Apr 2011 16:32:05 +0800
Date: Wed, 27 Apr 2011  0:29:32 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 12/52] gupnp-av: upgrade to version 0.8.0
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:04 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../gupnp/{gupnp-av_0.7.0.bb => gupnp-av_0.8.0.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/gupnp/{gupnp-av_0.7.0.bb => gupnp-av_0.8.0.bb} (77%)

diff --git a/meta/recipes-connectivity/gupnp/gupnp-av_0.7.0.bb b/meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb
similarity index 77%
rename from meta/recipes-connectivity/gupnp/gupnp-av_0.7.0.bb
rename to meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb
index fef907e..ce9ca30 100644
--- a/meta/recipes-connectivity/gupnp/gupnp-av_0.7.0.bb
+++ b/meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb
@@ -11,5 +11,5 @@ PR = "r0"
 
 inherit autotools pkgconfig
 
-SRC_URI[md5sum] = "6eace748e9869cddb27daab46eb50635"
-SRC_URI[sha256sum] = "e13018d24abec9fafd75ef59c365adbb2ea3712fe5e69fff8c7284dc3f13cdeb"
+SRC_URI[md5sum] = "8a41a3bb60b50fceb5ece71c0dc4dcfb"
+SRC_URI[sha256sum] = "e6aa032377488cedc4e347519bd30701c583780b7c54f00bab083f2316a93dc9"
-- 
1.7.1.1



