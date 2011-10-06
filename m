Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RBqge-0008V4-VT
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 18:20:45 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Oct 2011 09:15:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,496,1312182000"; d="scan'208";a="59495932"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.197])
	by azsmga001.ch.intel.com with ESMTP; 06 Oct 2011 09:15:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2011 09:14:50 -0700
Message-Id: <f2acd92a16c6f7d5afb21746054ae7a6d2be05fa.1317917297.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
Subject: [PATCH 11/21] libxml-perl: Add SRC_URI Checksum
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
X-List-Received-Date: Thu, 06 Oct 2011 16:20:45 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/perl/libxml-perl_0.08.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/perl/libxml-perl_0.08.bb b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
index fb637a8..ba5ebd0 100644
--- a/meta/recipes-devtools/perl/libxml-perl_0.08.bb
+++ b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
@@ -5,7 +5,7 @@ XML::Grove and others."
 SUMMARY = "Collection of Perl modules for working with XML."
 SECTION = "libs"
 LICENSE = "Artistic | GPLv1+"
-PR = "r1"
+PR = "r2"
 
 LIC_FILES_CHKSUM = "file://README;beginline=33;endline=35;md5=1705549eef7577a3d6ba71123a1f0ce8"
 
@@ -13,6 +13,9 @@ DEPENDS += "libxml-parser-perl"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/${BPN}-${PV}.tar.gz"
 
+SRC_URI[md5sum] = "0ed5fbdda53d1301ddaed88db10503bb"
+SRC_URI[sha256sum] = "4571059b7b5d48b7ce52b01389e95d798bf5cf2020523c153ff27b498153c9cb"
+
 EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
 
 inherit cpan
-- 
1.7.6.2



