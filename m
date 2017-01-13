Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8995460043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 12:57:02 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 13 Jan 2017 04:57:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,221,1477983600"; d="scan'208";a="212950002"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 13 Jan 2017 04:57:02 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id C896D6A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 04:56:07 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 14:57:08 +0200
Message-Id: <1484312231-28167-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/4] libproxy: update to version 0.4.14
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
X-List-Received-Date: Fri, 13 Jan 2017 12:57:03 -0000

0.4.13 -> 0.4.14

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libproxy/{libproxy_0.4.13.bb => libproxy_0.4.14.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libproxy/{libproxy_0.4.13.bb => libproxy_0.4.14.bb} (88%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.13.bb b/meta/recipes-support/libproxy/libproxy_0.4.14.bb
similarity index 88%
rename from meta/recipes-support/libproxy/libproxy_0.4.13.bb
rename to meta/recipes-support/libproxy/libproxy_0.4.14.bb
index 3940e22..8f56aaf 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.13.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.14.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/archive/${PV}.tar.gz"
 
 UPSTREAM_CHECK_URI = "https://github.com/libproxy/libproxy/releases"
 
-SRC_URI[md5sum] = "de293bb311f185a2ffa3492700a694c2"
-SRC_URI[sha256sum] = "d610bc0ef81a18ba418d759c5f4f87bf7102229a9153fb397d7d490987330ffd"
+SRC_URI[md5sum] = "272dc378efcc3335154cef30d171e84a"
+SRC_URI[sha256sum] = "6220a6cab837a8996116a0568324cadfd09a07ec16b930d2a330e16d5c2e1eb6"
 
 inherit cmake pkgconfig
 
-- 
2.4.0


