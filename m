Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TYVob-0003ND-Vz
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 06:47:10 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2012 21:32:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,248,1352102400"; d="scan'208";a="246693798"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.71])
	by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2012 21:32:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 21:32:50 -0800
Message-Id: <4ccf95a0983379ca7b87f9d7affdba2b824f9a09.1352871028.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1352871028.git.sgw@linux.intel.com>
References: <cover.1352871028.git.sgw@linux.intel.com>
In-Reply-To: <cover.1352871028.git.sgw@linux.intel.com>
References: <cover.1352871028.git.sgw@linux.intel.com>
Subject: [PATCH 8/9] sqlite3: Update to 3.7.14.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 05:47:10 -0000

[YOCTO #3283]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{sqlite3_3.7.13.bb => sqlite3_3.7.14.1.bb}     |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.7.13.bb => sqlite3_3.7.14.1.bb} (58%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.13.bb b/meta/recipes-support/sqlite/sqlite3_3.7.14.1.bb
similarity index 58%
rename from meta/recipes-support/sqlite/sqlite3_3.7.13.bb
rename to meta/recipes-support/sqlite/sqlite3_3.7.14.1.bb
index 48b50ac..00a3081 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.7.13.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.7.14.1.bb
@@ -2,10 +2,7 @@ require sqlite3.inc
 
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3071300.tar.gz"
 S = "${WORKDIR}/sqlite-autoconf-3071300"
-
-SRC_URI[md5sum] = "c97df403e8a3d5b67bb408fcd6aabd8e"
-SRC_URI[sha256sum] = "ac566819f82ec4cc2ff6c5cc90987ca38e589efbd79ff263838bbc62356ab119"
-- 
1.7.7.6



