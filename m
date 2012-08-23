Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T4Wu1-00017q-Dx
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 14:52:49 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 Aug 2012 05:40:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,300,1344236400"; d="scan'208";a="209459750"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2012 05:40:15 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2012 14:45:01 +0300
Message-Id: <1345722302-25467-3-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345722302-25467-1-git-send-email-constantinx.musca@intel.com>
References: <1345722302-25467-1-git-send-email-constantinx.musca@intel.com>
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 2/3] libnfsidmap: upgrade to 0.25
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
X-List-Received-Date: Thu, 23 Aug 2012 12:52:49 -0000

fix-ac-prereq.patch: adapted to the new version

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../nfs-utils/files/fix-ac-prereq.patch            |    6 ++----
 .../{libnfsidmap_0.24.bb => libnfsidmap_0.25.bb}   |    6 +++---
 2 files changed, 5 insertions(+), 7 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{libnfsidmap_0.24.bb => libnfsidmap_0.25.bb} (74%)

diff --git a/meta/recipes-connectivity/nfs-utils/files/fix-ac-prereq.patch b/meta/recipes-connectivity/nfs-utils/files/fix-ac-prereq.patch
index 09c9061..d81c7c5 100644
--- a/meta/recipes-connectivity/nfs-utils/files/fix-ac-prereq.patch
+++ b/meta/recipes-connectivity/nfs-utils/files/fix-ac-prereq.patch
@@ -1,15 +1,13 @@
 Upstream-Status: Inappropriate [configuration]
 
-diff --git a/configure.in b/configure.in
-index f5d54fb..c105988 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -1,7 +1,7 @@
  #                                               -*- Autoconf -*-
  # Process this file with autoconf to produce a configure script.
  
--AC_PREREQ([2.66])
+-AC_PREREQ([2.68])
 +AC_PREREQ([2.65])
- AC_INIT([libnfsidmap],[0.24],[linux-nfs@vger.kernel.org])
+ AC_INIT([libnfsidmap],[0.25],[linux-nfs@vger.kernel.org])
  AC_CONFIG_SRCDIR([nfsidmap.h])
  AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
similarity index 74%
rename from meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
rename to meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
index 3ae0dba..07ca229 100644
--- a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
+++ b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
@@ -5,14 +5,14 @@ SECTION = "libs"
 
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d9c6a2a0ca6017fda7cd905ed2739b37"
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/${BPN}-${PV}.tar.gz \
            file://fix-ac-prereq.patch \
           "
 
-SRC_URI[md5sum] = "d71a1ee9881d5b5814ff3ec41256937d"
-SRC_URI[sha256sum] = "59501432e683336d7a290da13767e92afb5b86f42ea4254041225fe218e8dd47"
+SRC_URI[md5sum] = "2ac4893c92716add1a1447ae01df77ab"
+SRC_URI[sha256sum] = "656d245d84400e1030f8f40a5a27da76370690c4a932baf249110f047fe7efcf"
 
 inherit autotools
 
-- 
1.7.9.5



