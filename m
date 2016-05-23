Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2001E6072C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 15:39:22 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 23 May 2016 08:39:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,356,1459839600"; d="scan'208";a="982950194"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2016 08:39:22 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id C75466A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 09:26:52 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2016 18:39:56 +0300
Message-Id: <1464017996-18497-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1464017996-18497-1-git-send-email-maxin.john@intel.com>
References: <1464017996-18497-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] sqlite3: update to 3.13.0
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
X-List-Received-Date: Mon, 23 May 2016 15:39:24 -0000

3.12.2 -> 3.13.0

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/sqlite/{sqlite3_3.12.2.bb => sqlite3_3.13.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.12.2.bb => sqlite3_3.13.0.bb} (58%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.12.2.bb b/meta/recipes-support/sqlite/sqlite3_3.13.0.bb
similarity index 58%
rename from meta/recipes-support/sqlite/sqlite3_3.12.2.bb
rename to meta/recipes-support/sqlite/sqlite3_3.13.0.bb
index 9c073b3..883c72d 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.12.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.13.0.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b357
 
 SRC_URI = "http://www.sqlite.org/2016/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 
-SRC_URI[md5sum] = "c552a133aca1ce1d647163d9e43bbcb1"
-SRC_URI[sha256sum] = "fd00770c9afd39db555c78400e52f55e8bd6568c78be23561abb472a22d09abb"
+SRC_URI[md5sum] = "4e83f39fa2ffb610ac5ecd36865da6a2"
+SRC_URI[sha256sum] = "e2797026b3310c9d08bd472f6d430058c6dd139ff9d4e30289884ccd9744086b"
-- 
2.4.0


