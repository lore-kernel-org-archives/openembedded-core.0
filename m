Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EEE1F782CA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 15:00:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2017 08:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,381,1496127600"; d="scan'208";a="880505141"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Jul 2017 08:00:48 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 6A2F458037A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 08:00:47 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 18:01:24 +0300
Message-Id: <1500476485-20310-5-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1500476485-20310-1-git-send-email-maxin.john@intel.com>
References: <1500476485-20310-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 5/6] sqlite3: upgrade to 3.19.3
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
X-List-Received-Date: Wed, 19 Jul 2017 15:00:48 -0000

3.19.2 -> 3.19.3

Fixes a bug associated with auto_vacuum that can lead to database
corruption.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/sqlite/{sqlite3_3.19.2.bb => sqlite3_3.19.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.19.2.bb => sqlite3_3.19.3.bb} (59%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.19.2.bb b/meta/recipes-support/sqlite/sqlite3_3.19.3.bb
similarity index 59%
rename from meta/recipes-support/sqlite/sqlite3_3.19.2.bb
rename to meta/recipes-support/sqlite/sqlite3_3.19.3.bb
index cf87073..89d4395 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.19.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.19.3.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b357
 SRC_URI = "\
   http://www.sqlite.org/2017/sqlite-autoconf-${SQLITE_PV}.tar.gz \
   "
-SRC_URI[md5sum] = "9f006b16de2cd81f6bae9b40e91daabf"
-SRC_URI[sha256sum] = "ca5361fb01cc3ad63d6fd4eb2cb0b6398e629595896d3558f7e121d37dac2ffc"
+SRC_URI[md5sum] = "c93070d5bf136ce271db23d2dfbc2435"
+SRC_URI[sha256sum] = "06129c03dced9f87733a8cba408871bd60673b8f93b920ba8d815efab0a06301"
-- 
2.4.0


