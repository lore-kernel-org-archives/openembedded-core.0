Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzS4-0006Jq-S0
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:57:53 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Apr 2011 23:55:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="629635593"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by orsmga002.jf.intel.com with ESMTP; 15 Apr 2011 23:55:32 -0700
Message-Id: <ae36a6a68ab217457f143a1e3512601f33357af4.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Fri, 15 Apr 2011 13:32:49 +0800
Date: Fri, 15 Apr 2011 23:55:32 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 48/58] libexif: upgrade to 0.6.20
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
X-List-Received-Date: Sat, 16 Apr 2011 06:57:53 -0000

From: Qing He <qing.he@intel.com>

[YOCTO #977]

fixes CVE-2007-6351, CVE-2007-6352, CVE-2009-3895

Signed-off-by: Qing He <qing.he@intel.com>
---
 .../{libexif_0.6.16.bb => libexif_0.6.20.bb}       |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libexif/{libexif_0.6.16.bb => libexif_0.6.20.bb} (61%)

diff --git a/meta/recipes-support/libexif/libexif_0.6.16.bb b/meta/recipes-support/libexif/libexif_0.6.20.bb
similarity index 61%
rename from meta/recipes-support/libexif/libexif_0.6.16.bb
rename to meta/recipes-support/libexif/libexif_0.6.20.bb
index d9d1c5e..f233d3f 100644
--- a/meta/recipes-support/libexif/libexif_0.6.16.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.20.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "Library to read the extended image information (EXIF) from JPEG p
 HOMEPAGE = "http://sourceforge.net/projects/libexif"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0448d3676bc0de00406af227d341a4d1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libexif/libexif-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "deee153b1ded5a944ea05d041d959eca"
-SRC_URI[sha256sum] = "db6885d5e40e3a273ff8bb9708ab739c8ace3c5abdd75509eec8ea31a31aac43"
+SRC_URI[md5sum] = "19844ce6b5d075af16f0d45de1e8a6a3"
+SRC_URI[sha256sum] = "a772d20bd8fb9802d7f0d70fde6ac8872f87d0c66c52b0d14026dafcaa83d715"
 
 inherit autotools gettext
 
-- 
1.7.1.1



