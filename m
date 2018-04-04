Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C01C974C62
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 15:33:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 08:33:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,406,1517904000"; d="scan'208";a="217505725"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 04 Apr 2018 08:33:48 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 4DC825801C0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 08:33:47 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 18:32:25 +0300
Message-Id: <1522855946-8702-9-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
References: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 09/10] sqlite3: upgrade to version 3.23.0
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
X-List-Received-Date: Wed, 04 Apr 2018 15:33:56 -0000

3.22.0 -> 3.23.0

Includes optimizations and fixes for issues detected by OSSFuzz

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/sqlite/{sqlite3_3.22.0.bb => sqlite3_3.23.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.22.0.bb => sqlite3_3.23.0.bb} (59%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.22.0.bb b/meta/recipes-support/sqlite/sqlite3_3.23.0.bb
similarity index 59%
rename from meta/recipes-support/sqlite/sqlite3_3.22.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.23.0.bb
index ef88659..1b7ae9a 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.22.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.23.0.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 SRC_URI = "\
   http://www.sqlite.org/2018/sqlite-autoconf-${SQLITE_PV}.tar.gz \
   "
-SRC_URI[md5sum] = "96b5648d542e8afa6ab7ffb8db8ddc3d"
-SRC_URI[sha256sum] = "2824ab1238b706bc66127320afbdffb096361130e23291f26928a027b885c612"
+SRC_URI[md5sum] = "6a26a122a18bcd1a6a1c18b4bad64498"
+SRC_URI[sha256sum] = "b7711a1800a071674c2bf76898ae8584fc6c9643cfe933cfc1bc54361e3a6e49"
-- 
2.4.0


