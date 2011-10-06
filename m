Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RBqgb-0008V4-9D
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 18:20:41 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Oct 2011 09:15:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,496,1312182000"; d="scan'208";a="59495890"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.197])
	by azsmga001.ch.intel.com with ESMTP; 06 Oct 2011 09:15:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2011 09:14:41 -0700
Message-Id: <e80e2f9ac41b2832164ba0de2a24313ff760e42d.1317917297.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
Subject: [PATCH 02/21] dosfstools: Add SRC_URI Checksum
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
X-List-Received-Date: Thu, 06 Oct 2011 16:20:41 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-devtools/dosfstools/dosfstools_2.10.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.10.bb b/meta/recipes-devtools/dosfstools/dosfstools_2.10.bb
index 1beb5dd..c23c02d 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_2.10.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_2.10.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "DOS FAT Filesystem Utilities"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mkdosfs/COPYING;md5=cbe67f08d6883bff587f615f0cc81aa8"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools/dosfstools-${PV}.src.tar.gz \
 	   file://alignment_hack.patch \
@@ -15,6 +15,9 @@ SRC_URI = "ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools/dosfstools-${PV}
            file://msdos_fat12_undefined.patch \
 	   file://include-linux-types.patch"
 
+SRC_URI[md5sum] = "59a02f311a891af8787c4c9e28c6b89b"
+SRC_URI[sha256sum] = "55a7b2f5ea4506bde935ee3145573e1773427fc72283a36796c7c2cf861dd064"
+
 do_install () {
 	oe_runmake "PREFIX=${D}" "SBINDIR=${D}${sbindir}" \
 		   "MANDIR=${D}${mandir}/man8" install
-- 
1.7.6.2



