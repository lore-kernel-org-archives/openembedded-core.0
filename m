Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UV7eo-0007Ug-4O
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 23:55:22 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2013 14:37:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,546,1363158000"; d="scan'208";a="300916423"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.85])
	by orsmga001.jf.intel.com with ESMTP; 24 Apr 2013 14:37:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 14:37:00 -0700
Message-Id: <dae9f656f059671c8dacc8fd2e2322cbcc6c31da.1366827512.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
Subject: [PATCH 07/18] dpkg: Update to 1.16.10
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
X-List-Received-Date: Wed, 24 Apr 2013 21:55:34 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/dpkg/{dpkg_1.16.9.bb => dpkg_1.16.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.16.9.bb => dpkg_1.16.10.bb} (71%)

diff --git a/meta/recipes-devtools/dpkg/dpkg_1.16.9.bb b/meta/recipes-devtools/dpkg/dpkg_1.16.10.bb
similarity index 71%
rename from meta/recipes-devtools/dpkg/dpkg_1.16.9.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.16.10.bb
index 9ae4042..309c17c 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.16.9.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.16.10.bb
@@ -8,7 +8,7 @@ SRC_URI += "file://noman.patch \
             file://fix-timestamps.patch \
             file://remove-tar-no-timestamp.patch"
 
-SRC_URI[md5sum] = "4df9319b2d17e19cdb6fe94dacee44da"
-SRC_URI[sha256sum] = "73cd7fba4e54acddd645346b4bc517030b9c35938e82215d3eeb8b4e7af26b7a"
+SRC_URI[md5sum] = "a20a06a5272717274a8b009368f237da"
+SRC_URI[sha256sum] = "aeaacf0884039940d9463901102194f9a42eb5702157b9e7a23f43e0d9f65cf2"
 
 PR = "${INC_PR}.0"
-- 
1.8.0.2



