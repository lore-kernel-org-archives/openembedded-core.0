Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SqnhP-0006sq-Uq
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 17:59:04 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2012 08:47:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193443332"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2012 08:47:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 08:47:19 -0700
Message-Id: <bbdbb70192e16fe351f9cf8f781110faf839be51.1342453118.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/30] xz: update to 5.1.2alpha
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
X-List-Received-Date: Mon, 16 Jul 2012 15:59:05 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

This contains bugfixes from the 5.0.3 and 5.0.4 releases

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xz/{xz_5.1.1alpha.bb => xz_5.1.2alpha.bb}      |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.1.1alpha.bb => xz_5.1.2alpha.bb} (86%)

diff --git a/meta/recipes-extended/xz/xz_5.1.1alpha.bb b/meta/recipes-extended/xz/xz_5.1.2alpha.bb
similarity index 86%
rename from meta/recipes-extended/xz/xz_5.1.1alpha.bb
rename to meta/recipes-extended/xz/xz_5.1.2alpha.bb
index 7fa7177..9d68720 100644
--- a/meta/recipes-extended/xz/xz_5.1.1alpha.bb
+++ b/meta/recipes-extended/xz/xz_5.1.2alpha.bb
@@ -10,11 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 "
 
 SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "bb24436fa12780808e1c142980484104"
-SRC_URI[sha256sum] = "54e59a83690a4a0ec88a7d7c3bdef90c6b196c892a93463863c71c24fe87951a"
-
-PR = "r0"
+SRC_URI[md5sum] = "9bad1e249537ce69b206815cf28ca87b"
+SRC_URI[sha256sum] = "70e792d2a67cfbb8f2dffd0feab6ca6e5a4a618d65070fb44a367629d1ba94e5"
 
 inherit autotools gettext
 
-- 
1.7.7.6



