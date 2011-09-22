Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1R6oQK-0003Bf-MS
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 20:55:04 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Sep 2011 11:49:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="54117801"
Received: from unknown (HELO localhost) ([10.7.199.57])
	by orsmga002.jf.intel.com with ESMTP; 22 Sep 2011 11:49:42 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	sgw@linux.intel.com
Date: Thu, 22 Sep 2011 11:49:41 -0700
Message-Id: <4b97e6b25906806eef1131e851abc9526d81d0db.1316717234.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1316717234.git.dvhart@linux.intel.com>
References: <cover.1316717234.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/1] shared-mime-info: add libxml-parser-perl to DEPENDS
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
X-List-Received-Date: Thu, 22 Sep 2011 18:55:04 -0000

Fixes [YOCTO #1514]

Building core-image-minimal on qemuppc (and likely others) can fail in
the shared-mime-info configure step with the following error:

checking for XML::Parser... configure: error: XML::Parser perl module is
required for intltool

Adding libxml-parser-perl to DEPENDS allows share-mime-info-native to build
successfully.

Testing: build tested the native version on qemuppc. I run into tool chain
build failures before I can get to building the target version.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Joshua Lock <josh@linux.intel.com>
---
 .../shared-mime-info/shared-mime-info.inc          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info.inc b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
index 64eef9d..e206305 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
@@ -5,8 +5,8 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-DEPENDS = "libxml2 intltool-native glib-2.0 shared-mime-info-native"
-DEPENDS_virtclass-native = "libxml2-native intltool-native glib-2.0-native"
+DEPENDS = "libxml2 intltool-native glib-2.0 shared-mime-info-native libxml-parser-perl"
+DEPENDS_virtclass-native = "libxml2-native intltool-native glib-2.0-native libxml-parser-perl-native"
 
 SRC_URI = "http://freedesktop.org/~hadess/shared-mime-info-${PV}.tar.bz2"
 
-- 
1.7.6.2



