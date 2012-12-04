Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tfosv-000802-9V
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 10:33:49 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Dec 2012 01:18:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,214,1355126400"; d="scan'208";a="228661882"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 04 Dec 2012 01:18:25 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 11:19:05 +0200
Message-Id: <17449685449d3969ebb6d46afe78e5b69cdb446d.1354611254.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1354611254.git.constantinx.musca@intel.com>
References: <cover.1354611254.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1354611254.git.constantinx.musca@intel.com>
References: <cover.1354611254.git.constantinx.musca@intel.com>
Subject: [PATCH 5/5] puzzles: upgrade to r9712
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
X-List-Received-Date: Tue, 04 Dec 2012 09:33:49 -0000

License checksum change due to:
< Schmidt and Steffen Bauer.
> Schmidt, Steffen Bauer and Lennard Sprong.

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-sato/puzzles/{puzzles_r9660.bb => puzzles_r9712.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/puzzles/{puzzles_r9660.bb => puzzles_r9712.bb} (96%)

diff --git a/meta/recipes-sato/puzzles/puzzles_r9660.bb b/meta/recipes-sato/puzzles/puzzles_r9712.bb
similarity index 96%
rename from meta/recipes-sato/puzzles/puzzles_r9660.bb
rename to meta/recipes-sato/puzzles/puzzles_r9712.bb
index 37536c6..5ab3161 100644
--- a/meta/recipes-sato/puzzles/puzzles_r9660.bb
+++ b/meta/recipes-sato/puzzles/puzzles_r9712.bb
@@ -6,7 +6,7 @@ PR = "r0"
 MOD_PV = "${@d.getVar('PV',1)[1:]}"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=87478fe5bc9ea8f356c5479a5617324a"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=31790deb1e1aac4626e7d1bc04587eb0"
 
 # Upstream updates puzzles.tar.gz for the new release, so checksums seem to be changing regularly right now
 SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV};protocol=svn"
-- 
1.7.11.7



