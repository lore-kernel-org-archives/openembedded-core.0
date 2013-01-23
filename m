Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TxzOw-0007zw-BZ
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 13:26:00 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 Jan 2013 04:09:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,521,1355126400"; d="scan'208";a="275597164"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.151])
	by orsmga002.jf.intel.com with ESMTP; 23 Jan 2013 04:10:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jan 2013 12:10:13 +0000
Message-Id: <38b9bfcc1543b6920d307f119c91b4c4db1912b8.1358942978.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358942978.git.paul.eggleton@linux.intel.com>
References: <cover.1358942978.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1358942978.git.paul.eggleton@linux.intel.com>
References: <cover.1358942978.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/5] classes/image-swab: remove zypper-related references
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
X-List-Received-Date: Wed, 23 Jan 2013 12:26:14 -0000

Remove references to libzypp, zypper and sat-solver which have been
removed.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image-swab.bbclass |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/image-swab.bbclass b/meta/classes/image-swab.bbclass
index ba30f01..124a090 100644
--- a/meta/classes/image-swab.bbclass
+++ b/meta/classes/image-swab.bbclass
@@ -40,9 +40,6 @@ PARALLEL_MAKE_pn-libgcrypt = ""
 PARALLEL_MAKE_pn-gpgme = ""
 PARALLEL_MAKE_pn-udev = ""
 PARALLEL_MAKE_pn-gnutls = ""
-PARALLEL_MAKE_pn-sat-solver = ""
-PARALLEL_MAKE_pn-libzypp = ""
-PARALLEL_MAKE_pn-zypper = ""
 
 python() {
     # NOTE: It might be useful to detect host infection on native and cross
-- 
1.7.10.4



