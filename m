Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UV7eq-0007V9-Nx
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 23:55:22 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2013 14:37:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,546,1363158000"; d="scan'208";a="300916430"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.85])
	by orsmga001.jf.intel.com with ESMTP; 24 Apr 2013 14:37:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 14:37:01 -0700
Message-Id: <6e6b0878f0ede829378925bc5461eef811179065.1366827512.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
In-Reply-To: <cover.1366827512.git.sgw@linux.intel.com>
References: <cover.1366827512.git.sgw@linux.intel.com>
Subject: [PATCH 08/18] file: Update to 5.14
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
 meta/recipes-devtools/file/{file_5.13.bb => file_5.14.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/file/{file_5.13.bb => file_5.14.bb} (86%)

diff --git a/meta/recipes-devtools/file/file_5.13.bb b/meta/recipes-devtools/file/file_5.14.bb
similarity index 86%
rename from meta/recipes-devtools/file/file_5.13.bb
rename to meta/recipes-devtools/file/file_5.14.bb
index c97fed4..4270ff2 100644
--- a/meta/recipes-devtools/file/file_5.13.bb
+++ b/meta/recipes-devtools/file/file_5.14.bb
@@ -17,8 +17,8 @@ SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
            file://dump \
            file://filesystems"
 
-SRC_URI[md5sum] = "d60c1364ba956eff7d21f8250808fc6d"
-SRC_URI[sha256sum] = "f75b7b23ac576b47ed4ba4915e2fb239d9c0d74ac5b4e6a89704b1ed45ee6e2b"
+SRC_URI[md5sum] = "c26625f1d6773ad4bc5a87c0e315632c"
+SRC_URI[sha256sum] = "461ba01dd0900a3b7c2dcd901b04903192c07887a9c1928af0be507572c77fe4"
 
 inherit autotools
 
-- 
1.8.0.2



