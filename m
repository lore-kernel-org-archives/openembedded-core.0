Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LHs-0001YA-JV
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:44:56 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:36:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121478571"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 17:36:04 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:25 +0800
Message-Id: <01e4ecf3cf37fcb0859ee65c55864053e1efb5bc.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 28/60] minicom: upgrade to 2.6.1
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
X-List-Received-Date: Fri, 16 Mar 2012 00:44:56 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../gcc4-scope.patch                               |    0
 .../rename-conflicting-functions.patch             |    0
 .../minicom/{minicom_2.5.bb => minicom_2.6.1.bb}   |    6 +++---
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/minicom/{minicom-2.5 => minicom-2.6.1}/gcc4-scope.patch (100%)
 rename meta/recipes-extended/minicom/{minicom-2.5 => minicom-2.6.1}/rename-conflicting-functions.patch (100%)
 rename meta/recipes-extended/minicom/{minicom_2.5.bb => minicom_2.6.1.bb} (75%)

diff --git a/meta/recipes-extended/minicom/minicom-2.5/gcc4-scope.patch b/meta/recipes-extended/minicom/minicom-2.6.1/gcc4-scope.patch
similarity index 100%
rename from meta/recipes-extended/minicom/minicom-2.5/gcc4-scope.patch
rename to meta/recipes-extended/minicom/minicom-2.6.1/gcc4-scope.patch
diff --git a/meta/recipes-extended/minicom/minicom-2.5/rename-conflicting-functions.patch b/meta/recipes-extended/minicom/minicom-2.6.1/rename-conflicting-functions.patch
similarity index 100%
rename from meta/recipes-extended/minicom/minicom-2.5/rename-conflicting-functions.patch
rename to meta/recipes-extended/minicom/minicom-2.6.1/rename-conflicting-functions.patch
diff --git a/meta/recipes-extended/minicom/minicom_2.5.bb b/meta/recipes-extended/minicom/minicom_2.6.1.bb
similarity index 75%
rename from meta/recipes-extended/minicom/minicom_2.5.bb
rename to meta/recipes-extended/minicom/minicom_2.6.1.bb
index 8e93d4d..3a9f934 100644
--- a/meta/recipes-extended/minicom/minicom_2.5.bb
+++ b/meta/recipes-extended/minicom/minicom_2.6.1.bb
@@ -6,13 +6,13 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
                     file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
 
-SRC_URI = "http://alioth.debian.org/frs/download.php/3487/minicom-${PV}.tar.gz \
+SRC_URI = "http://alioth.debian.org/frs/download.php/3700/minicom-${PV}.tar.gz \
 	file://rename-conflicting-functions.patch \
 	"
 #	file://gcc4-scope.patch
 
-SRC_URI[md5sum] = "a5117d4d21e2c9e825edb586ee2fe8d2"
-SRC_URI[sha256sum] = "2aa43f98580d3c9c59b12895f15783695cde85472f6bfc7974bcc0935af0a8fd"
+SRC_URI[md5sum] = "435fb410a5bfa9bb20d4248b3ca53529"
+SRC_URI[sha256sum] = "a6e7bf533c3796f3a67a7d109f328d46497c687ed13885bd1be4ce0548fc4f56"
 
 inherit autotools gettext
 
-- 
1.7.6



