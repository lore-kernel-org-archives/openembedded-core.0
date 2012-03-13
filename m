Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7Mlr-0000Hr-06
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 09:07:51 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Mar 2012 00:59:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128321834"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.137])
	by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2012 00:59:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 00:58:55 -0700
Message-Id: <0afbc25d67009ba4e62a8a64eb3b4cd6632ac4e8.1331589797.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331589797.git.sgw@linux.intel.com>
References: <cover.1331589797.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331589797.git.sgw@linux.intel.com>
References: <cover.1331589797.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 21/23] python: depend on bzip2
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
X-List-Received-Date: Tue, 13 Mar 2012 08:07:51 -0000

From: Andreas Oberritter <obi@opendreambox.org>

* Python auto-detects libbz2 and there's no way to
  force-disable it, so just enable it.
* Adds bz2 support to python-compression.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/python/python_2.7.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index 0a8e534..b14b82e 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,5 +1,5 @@
 require python.inc
-DEPENDS = "python-native db gdbm openssl readline sqlite3 zlib"
+DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
 PR = "${INC_PR}.7"
 
-- 
1.7.7.6



