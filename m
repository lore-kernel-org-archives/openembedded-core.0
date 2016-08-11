Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DEE9D77253
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 13:55:54 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 11 Aug 2016 06:55:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,505,1464678000"; d="scan'208";a="863720820"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 11 Aug 2016 06:55:42 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 8DB366A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 06:55:27 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 16:56:42 +0300
Message-Id: <1470923804-25804-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/3] sqlite3: update 3.13.0 -> 3.14.0
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
X-List-Received-Date: Thu, 11 Aug 2016 13:55:57 -0000

3.13.0 -> 3.14.0

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/sqlite/{sqlite3_3.13.0.bb => sqlite3_3.14.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.13.0.bb => sqlite3_3.14.0.bb} (58%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.13.0.bb b/meta/recipes-support/sqlite/sqlite3_3.14.0.bb
similarity index 58%
rename from meta/recipes-support/sqlite/sqlite3_3.13.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.14.0.bb
index 883c72d..6b815c8 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.13.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.14.0.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b357
 
 SRC_URI = "http://www.sqlite.org/2016/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 
-SRC_URI[md5sum] = "4e83f39fa2ffb610ac5ecd36865da6a2"
-SRC_URI[sha256sum] = "e2797026b3310c9d08bd472f6d430058c6dd139ff9d4e30289884ccd9744086b"
+SRC_URI[md5sum] = "1813c764b0ee422adcd1978ea73a3445"
+SRC_URI[sha256sum] = "742db0ebbd9cc91ed6a41857f50aa9795fc859c994a256125135cd07f6cdfd76"
-- 
2.4.0


