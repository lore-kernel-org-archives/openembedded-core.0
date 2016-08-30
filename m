Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5699060043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 13:18:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 30 Aug 2016 06:18:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,256,1470726000"; d="scan'208";a="1033147608"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 30 Aug 2016 06:18:30 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 7E1B36A4080
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 06:18:09 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 16:18:00 +0300
Message-Id: <1472563081-14118-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] sqlite3: upgrade to 3.14.1
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
X-List-Received-Date: Tue, 30 Aug 2016 13:18:30 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/sqlite/{sqlite3_3.14.0.bb => sqlite3_3.14.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.14.0.bb => sqlite3_3.14.1.bb} (58%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.14.0.bb b/meta/recipes-support/sqlite/sqlite3_3.14.1.bb
similarity index 58%
rename from meta/recipes-support/sqlite/sqlite3_3.14.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.14.1.bb
index 6b815c8..3af0d2f 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.14.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.14.1.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b357
 
 SRC_URI = "http://www.sqlite.org/2016/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 
-SRC_URI[md5sum] = "1813c764b0ee422adcd1978ea73a3445"
-SRC_URI[sha256sum] = "742db0ebbd9cc91ed6a41857f50aa9795fc859c994a256125135cd07f6cdfd76"
+SRC_URI[md5sum] = "3634a90a3f49541462bcaed3474b2684"
+SRC_URI[sha256sum] = "bc7182476900017becb81565ecea7775d46ab747a97281aa610f4f45881c47a6"
-- 
2.4.0


