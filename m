Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T4w0I-0005Cy-6T
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 17:40:58 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 24 Aug 2012 08:28:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,304,1344236400"; d="scan'208";a="190888386"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2012 08:28:18 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Aug 2012 17:33:05 +0300
Message-Id: <240276421bf9cd271bdd8b5295e1d820f467837a.1345818232.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1345818232.git.constantinx.musca@intel.com>
References: <cover.1345818232.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1345818232.git.constantinx.musca@intel.com>
References: <cover.1345818232.git.constantinx.musca@intel.com>
Subject: [PATCH 2/4] npth: upgrade to 0.91
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
X-List-Received-Date: Fri, 24 Aug 2012 15:40:58 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../npth/{npth_0.90.bb => npth_0.91.bb}            |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/npth/{npth_0.90.bb => npth_0.91.bb} (76%)

diff --git a/meta/recipes-support/npth/npth_0.90.bb b/meta/recipes-support/npth/npth_0.91.bb
similarity index 76%
rename from meta/recipes-support/npth/npth_0.90.bb
rename to meta/recipes-support/npth/npth_0.91.bb
index 7d39ca8..57fe55a 100644
--- a/meta/recipes-support/npth/npth_0.90.bb
+++ b/meta/recipes-support/npth/npth_0.91.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "\
     "
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/npth/npth-${PV}.tar.bz2 \
           "
-SRC_URI[md5sum] = "701665669b371385a92817ff1f9215ca"
-SRC_URI[sha256sum] = "e24e99c9e90e7c2c2272fed3a939647fdcd3a7ee0c9efb2983eed553ab2b4568"
+SRC_URI[md5sum] = "87712f0cee656c390b49773923e26e7f"
+SRC_URI[sha256sum] = "caef86ced4a331e162897818a5b924860c8d6003e52da5bdf76da00e8e0dfae1"
 
 inherit autotools binconfig
 
-- 
1.7.9.5



