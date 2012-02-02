Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rt6VU-0002ZN-60
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 00:56:00 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2012 15:48:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113486046"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.238])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2012 15:48:04 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2012 15:47:48 -0800
Message-Id: <260dd6a85d0f3fe64f7c4df5c4b99bb48b4e36ca.1328226197.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
Subject: [PATCH 09/14] file: Update to version 5.10
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Feb 2012 23:56:00 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../file/{file_5.09.bb => file_5.10.bb}            |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/file/{file_5.09.bb => file_5.10.bb} (86%)

diff --git a/meta/recipes-devtools/file/file_5.09.bb b/meta/recipes-devtools/file/file_5.10.bb
similarity index 86%
rename from meta/recipes-devtools/file/file_5.09.bb
rename to meta/recipes-devtools/file/file_5.10.bb
index 9b2f3a4..1bf1b61 100644
--- a/meta/recipes-devtools/file/file_5.09.bb
+++ b/meta/recipes-devtools/file/file_5.10.bb
@@ -17,8 +17,8 @@ SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
            file://dump \
            file://filesystems"
 
-SRC_URI[md5sum] = "6fd7cd6c4281e68fe9ec6644ce0fac6f"
-SRC_URI[sha256sum] = "bde1c9830ee6c234871778faae8277fdcf775fbb16dea63c8251e24b7c2f869c"
+SRC_URI[md5sum] = "4cea34b087b060772511e066e2038196"
+SRC_URI[sha256sum] = "73ae51889006b1ddb95db729237d411eb8d353884dfb149f0b4427d314aff68a"
 
 inherit autotools
 
-- 
1.7.6.5



