Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RfE3x-0000wV-Le
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Dec 2011 18:10:15 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Dec 2011 09:02:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="91637869"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga002.jf.intel.com with ESMTP; 26 Dec 2011 09:02:58 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Dec 2011 01:11:59 +0800
Message-Id: <5ab5e0376e0dc327362c29af403b4030227c1fc2.1324918959.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <dab83815d71c52b28747493c70011a39a0004015.1324918959.git.shane.wang@intel.com>
References: <dab83815d71c52b28747493c70011a39a0004015.1324918959.git.shane.wang@intel.com>
In-Reply-To: <cover.1324918958.git.shane.wang@intel.com>
References: <cover.1324918958.git.shane.wang@intel.com>
Subject: [PATCH 2/5] minicom: upgrade to 2.5
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
X-List-Received-Date: Mon, 26 Dec 2011 17:10:15 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{minicom-2.4 => minicom-2.5}/gcc4-scope.patch  |    0
 .../rename-conflicting-functions.patch             |    0
 .../minicom/{minicom_2.4.bb => minicom_2.5.bb}     |    6 +++---
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/minicom/{minicom-2.4 => minicom-2.5}/gcc4-scope.patch (100%)
 rename meta/recipes-extended/minicom/{minicom-2.4 => minicom-2.5}/rename-conflicting-functions.patch (100%)
 rename meta/recipes-extended/minicom/{minicom_2.4.bb => minicom_2.5.bb} (75%)

diff --git a/meta/recipes-extended/minicom/minicom-2.4/gcc4-scope.patch b/meta/recipes-extended/minicom/minicom-2.5/gcc4-scope.patch
similarity index 100%
rename from meta/recipes-extended/minicom/minicom-2.4/gcc4-scope.patch
rename to meta/recipes-extended/minicom/minicom-2.5/gcc4-scope.patch
diff --git a/meta/recipes-extended/minicom/minicom-2.4/rename-conflicting-functions.patch b/meta/recipes-extended/minicom/minicom-2.5/rename-conflicting-functions.patch
similarity index 100%
rename from meta/recipes-extended/minicom/minicom-2.4/rename-conflicting-functions.patch
rename to meta/recipes-extended/minicom/minicom-2.5/rename-conflicting-functions.patch
diff --git a/meta/recipes-extended/minicom/minicom_2.4.bb b/meta/recipes-extended/minicom/minicom_2.5.bb
similarity index 75%
rename from meta/recipes-extended/minicom/minicom_2.4.bb
rename to meta/recipes-extended/minicom/minicom_2.5.bb
index 38b5154..8e93d4d 100644
--- a/meta/recipes-extended/minicom/minicom_2.4.bb
+++ b/meta/recipes-extended/minicom/minicom_2.5.bb
@@ -6,13 +6,13 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
                     file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
 
-SRC_URI = "http://alioth.debian.org/frs/download.php/3195/minicom-${PV}.tar.gz \
+SRC_URI = "http://alioth.debian.org/frs/download.php/3487/minicom-${PV}.tar.gz \
 	file://rename-conflicting-functions.patch \
 	"
 #	file://gcc4-scope.patch
 
-SRC_URI[md5sum] = "700976a3c2dcc8bbd50ab9bb1c08837b"
-SRC_URI[sha256sum] = "6b7af240b073ba847b091fd75aed4bf720eb94d30e188d23bb098d016bf40a48"
+SRC_URI[md5sum] = "a5117d4d21e2c9e825edb586ee2fe8d2"
+SRC_URI[sha256sum] = "2aa43f98580d3c9c59b12895f15783695cde85472f6bfc7974bcc0935af0a8fd"
 
 inherit autotools gettext
 
-- 
1.7.6



