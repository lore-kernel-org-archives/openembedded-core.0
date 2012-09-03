Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8U8J-0004vj-01
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:43:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Sep 2012 03:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217497250"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 03:31:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 11:30:45 +0100
Message-Id: <5c3f0852606c2ca5fec324f3119b3a9fd39d6f97.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 25/28] packagegroup-core-basic: tidy up
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
X-List-Received-Date: Mon, 03 Sep 2012 10:43:55 -0000

* Remove packagegroup-core-basic-rpm - we already have a mechanism for
  ensuring that packaging tools are installed on the target if desired;
  we don't need a package group to bring them in as well (especially if
  packagegroup-core-basic is used with other packaging systems).
* Remove the poorly-named packagegroup-core-base-utils: we already get
  busybox via packagegroup-core-boot.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../packagegroups/packagegroup-core-basic.bb       |   14 --------------
 1 file changed, 14 deletions(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
index b2489fe..4e4bcf5 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
@@ -10,34 +10,26 @@ inherit packagegroup
 
 PACKAGES = "\
     packagegroup-core-basic \
-    packagegroup-core-base-utils \
     packagegroup-core-basic-libs \
     packagegroup-core-basic-utils \
     packagegroup-core-basic-extended \
     packagegroup-core-dev-utils \
     packagegroup-core-multiuser \
     packagegroup-core-initscripts \
-    packagegroup-core-rpm \
     packagegroup-core-sys-services \
     "
 
 
 RDEPENDS_packagegroup-core-basic = "\
-    packagegroup-core-base-utils \
     packagegroup-core-basic-libs \
     packagegroup-core-basic-utils \
     packagegroup-core-basic-extended \
     packagegroup-core-dev-utils \
     packagegroup-core-multiuser \
     packagegroup-core-initscripts \
-    packagegroup-core-rpm \
     packagegroup-core-sys-services \
     "
 
-RDEPENDS_packagegroup-core-base-utils = "\
-    busybox \
-    "
-
 RDEPENDS_packagegroup-core-basic-libs = "\
     glib-2.0 \
     "
@@ -106,12 +98,6 @@ RDEPENDS_packagegroup-core-multiuser = "\
     sudo \
     "
 
-RDEPENDS_packagegroup-core-rpm = "\
-    beecrypt \
-    rpm \
-    zypper \
-    "
-
 RDEPENDS_packagegroup-core-sys-services = "\
     at \
     bzip2 \
-- 
1.7.9.5



