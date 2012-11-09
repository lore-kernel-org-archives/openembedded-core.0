Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1TWlbW-0006eT-5O
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Nov 2012 11:14:26 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 09 Nov 2012 02:00:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,744,1344236400"; d="scan'208";a="166314599"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.49])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Nov 2012 02:00:32 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Nov 2012 12:00:42 +0200
Message-Id: <1352455242-5171-2-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1352455242-5171-1-git-send-email-constantinx.musca@intel.com>
References: <1352455242-5171-1-git-send-email-constantinx.musca@intel.com>
MIME-Version: 1.0
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 2/2] puzzles: upgrade to r9660
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
X-List-Received-Date: Fri, 09 Nov 2012 10:14:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

License checksum change due to diff:
4,5c4,5
< K�lker, Dariusz Olszewski, Michael Schierl, Lambros Lambrou and
< Bernd Schmidt.
> K�lker, Dariusz Olszewski, Michael Schierl, Lambros Lambrou, Bernd
> Schmidt and Steffen Bauer.

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-sato/puzzles/{puzzles_r9594.bb => puzzles_r9660.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/puzzles/{puzzles_r9594.bb => puzzles_r9660.bb} (96%)

diff --git a/meta/recipes-sato/puzzles/puzzles_r9594.bb b/meta/recipes-sato/puzzles/puzzles_r9660.bb
similarity index 96%
rename from meta/recipes-sato/puzzles/puzzles_r9594.bb
rename to meta/recipes-sato/puzzles/puzzles_r9660.bb
index 310798d..37536c6 100644
--- a/meta/recipes-sato/puzzles/puzzles_r9594.bb
+++ b/meta/recipes-sato/puzzles/puzzles_r9660.bb
@@ -6,7 +6,7 @@ PR = "r0"
 MOD_PV = "${@d.getVar('PV',1)[1:]}"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=453de74d749439762ef4814f7bee1fec"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=87478fe5bc9ea8f356c5479a5617324a"
 
 # Upstream updates puzzles.tar.gz for the new release, so checksums seem to be changing regularly right now
 SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV};protocol=svn"
-- 
1.7.11.7



