Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8U8J-0004vF-Mb
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:43:56 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2012 03:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217497219"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 03:31:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 11:30:36 +0100
Message-Id: <a2f8c44dad561ab9421626ddc4371db598183b59.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 16/28] packagegroup-core-gtk-directfb: remove dropbear
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
X-List-Received-Date: Mon, 03 Sep 2012 10:43:57 -0000

This is unrelated and does not belong in this package group.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../packagegroup-core-gtk-directfb.bb              |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
index 2f35b34..19eea99 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
@@ -17,6 +17,5 @@ RDEPENDS_${PN} = " \
 		fontconfig \
 		gtk+ \
 		gtk-demo \
-		dropbear \
 		${TOUCH} \
 "
-- 
1.7.9.5



