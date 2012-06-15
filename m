Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SfWDW-0002KJ-V2
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 15:05:35 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Jun 2012 05:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="158041531"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 15 Jun 2012 05:54:53 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2012 15:54:49 +0300
Message-Id: <1339764889-25852-3-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1339764889-25852-1-git-send-email-laurentiu.palcu@intel.com>
References: <1339764889-25852-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 2/2] puzzles: upgrade to r9561
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
X-List-Received-Date: Fri, 15 Jun 2012 13:05:35 -0000

Minor change in LICENCE file:

-This software is copyright (c) 2004-2010 Simon Tatham.
+This software is copyright (c) 2004-2012 Simon Tatham.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../puzzles/{puzzles_r9375.bb => puzzles_r9561.bb} |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-sato/puzzles/{puzzles_r9375.bb => puzzles_r9561.bb} (88%)

diff --git a/meta/recipes-sato/puzzles/puzzles_r9375.bb b/meta/recipes-sato/puzzles/puzzles_r9561.bb
similarity index 88%
rename from meta/recipes-sato/puzzles/puzzles_r9375.bb
rename to meta/recipes-sato/puzzles/puzzles_r9561.bb
index 1867dad..83fabdf 100644
--- a/meta/recipes-sato/puzzles/puzzles_r9375.bb
+++ b/meta/recipes-sato/puzzles/puzzles_r9561.bb
@@ -6,13 +6,13 @@ PR = "r0"
 MOD_PV = "${@d.getVar('PV',1)[1:]}"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=9928b60f3b78be315b7ab699c1b03ff5"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=453de74d749439762ef4814f7bee1fec"
 
 # Upstream updates puzzles.tar.gz for the new release, so checksums seem to be changing regularly right now
 #SRC_URI = "svn://ixion.tartarus.org/main;module=puzzles;rev=${MOD_PV}"
 SRC_URI = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/puzzles-${PV}.tar.gz"
-SRC_URI[md5sum] = "25f2349611cdd8fb35d27b24f5b937a8"
-SRC_URI[sha256sum] = "bddf4e52c328c98b9d95bd7daf6b9098f25e8272a7c1059ba69809eb619124a2"
+SRC_URI[md5sum] = "c86695aebfc95efe1d6241863849101b"
+SRC_URI[sha256sum] = "2c20a45189387e3de8804a58bdb4e47ac4bb0f890001a509dfbdc015b5a84b95"
 
 
 S = "${WORKDIR}/${BPN}-${PV}"
-- 
1.7.9.5



