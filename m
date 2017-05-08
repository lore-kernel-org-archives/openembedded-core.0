Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C385271DEF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 08:10:48 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2017 01:10:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,308,1491289200"; d="scan'208";a="258229363"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 08 May 2017 01:10:48 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 477EA6A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 01:10:34 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 May 2017 11:11:25 +0300
Message-Id: <1494231086-31827-5-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1494231086-31827-1-git-send-email-maxin.john@intel.com>
References: <1494231086-31827-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/5] sqlite3: upgrade to 3.18.0
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
X-List-Received-Date: Mon, 08 May 2017 08:10:50 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/sqlite/{sqlite3_3.17.0.bb => sqlite3_3.18.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.17.0.bb => sqlite3_3.18.0.bb} (59%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.17.0.bb b/meta/recipes-support/sqlite/sqlite3_3.18.0.bb
similarity index 59%
rename from meta/recipes-support/sqlite/sqlite3_3.17.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.18.0.bb
index 593cb32..352b53f 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.17.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.18.0.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b357
 SRC_URI = "\
   http://www.sqlite.org/2017/sqlite-autoconf-${SQLITE_PV}.tar.gz \
   "
-SRC_URI[md5sum] = "450a95a7bde697c9fe4de9ae2fffdcca"
-SRC_URI[sha256sum] = "a4e485ad3a16e054765baf6371826b5000beed07e626510896069c0bf013874c"
+SRC_URI[md5sum] = "a6687a8ae1f66abc8df739aeadecfd0c"
+SRC_URI[sha256sum] = "3757612463976e7d08c5e9f0af3021613fc24bbcfe1c51197d6776b9ece9ac5c"
-- 
2.4.0


