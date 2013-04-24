Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UV7ed-0007Ug-OE
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 23:55:08 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2013 14:37:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,546,1363158000"; d="scan'208";a="300916408"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.85])
	by orsmga001.jf.intel.com with ESMTP; 24 Apr 2013 14:37:15 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 14:36:57 -0700
Message-Id: <c95fc6c5d42de9da73dec966ae3f92f2b1593d7f.1366827512.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
Subject: [PATCH 04/18] sqlite: Update to 3071602
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
X-List-Received-Date: Wed, 24 Apr 2013 21:55:22 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../sqlite/{sqlite3_3071502.bb => sqlite3_3071602.bb}            | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3071502.bb => sqlite3_3071602.bb} (41%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3071502.bb b/meta/recipes-support/sqlite/sqlite3_3071602.bb
similarity index 41%
rename from meta/recipes-support/sqlite/sqlite3_3071502.bb
rename to meta/recipes-support/sqlite/sqlite3_3071602.bb
index ad81214..09f54f6 100644
--- a/meta/recipes-support/sqlite/sqlite3_3071502.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3071602.bb
@@ -2,10 +2,9 @@ require sqlite3.inc
 
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
 
-PR = "r0"
+SRC_URI = "http://www.sqlite.org/2013/sqlite-autoconf-${PV}.tar.gz"
 
-SRC_URI = "http://www.sqlite.org/sqlite-autoconf-${PV}.tar.gz"
-S = "${WORKDIR}/sqlite-autoconf-${PV}"
+SRC_URI[md5sum] = "ce7d2bc0d9b8dd18995b888c6b0b220f"
+SRC_URI[sha256sum] = "1d7e6937c19fc5de1c0cdb392638296e4a6d8b158001dbb421e257dfb6f088db"
 
-SRC_URI[md5sum] = "bcb0ab0b5b30116b2531cfeef3c861b4"
-SRC_URI[sha256sum] = "782d16b797f6ca879f6f679ba3fb6ceb54bcb0cab65feef332058bf04b36ba8c"
+S = "${WORKDIR}/sqlite-autoconf-${PV}"
-- 
1.8.0.2



