Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0FCCA779CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 13:16:03 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Apr 2017 06:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,244,1488873600"; d="scan'208";a="93097201"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 24 Apr 2017 06:16:04 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Apr 2017 16:15:49 +0300
Message-Id: <20170424131551.2212-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170424131551.2212-1-alexander.kanavin@linux.intel.com>
References: <20170424131551.2212-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/4] libproxy: speed up upstream version check
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
X-List-Received-Date: Mon, 24 Apr 2017 13:16:07 -0000

Something in the fetched webpage made the default regex matching really slow.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/libproxy/libproxy_0.4.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.14.bb b/meta/recipes-support/libproxy/libproxy_0.4.14.bb
index 8f56aafd62f..fcdb82f06cc 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.14.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.14.bb
@@ -11,6 +11,7 @@ DEPENDS = "glib-2.0"
 SRC_URI = "https://github.com/${BPN}/${BPN}/archive/${PV}.tar.gz"
 
 UPSTREAM_CHECK_URI = "https://github.com/libproxy/libproxy/releases"
+UPSTREAM_CHECK_REGEX = "libproxy-(?P<pver>.*)\.tar"
 
 SRC_URI[md5sum] = "272dc378efcc3335154cef30d171e84a"
 SRC_URI[sha256sum] = "6220a6cab837a8996116a0568324cadfd09a07ec16b930d2a330e16d5c2e1eb6"
-- 
2.11.0


