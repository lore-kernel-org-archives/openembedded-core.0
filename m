Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrA-0004Vr-S2
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:21 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:20:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752166"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:51 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:15 -0800
Message-Id: <0585b1c042403e42474e05c634074b63efbcc772.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 029/113] minicom: upgrade to 2.5
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:23 -0000
X-List-Received-Date: Tue, 03 Jan 2012 06:28:23 -0000

From: Shane Wang <shane.wang@intel.com>

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
1.7.6.4



