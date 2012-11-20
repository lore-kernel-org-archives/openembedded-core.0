Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tact2-0005Xs-0H
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 02:44:29 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Nov 2012 17:30:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,282,1352102400"; d="scan'208";a="244596717"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.202])
	by orsmga002.jf.intel.com with ESMTP; 19 Nov 2012 17:30:22 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2012 17:30:09 -0800
Message-Id: <ac9e9b05b16249bb49ae3f86374bf80fb44d8cee.1353374801.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1353374801.git.sgw@linux.intel.com>
References: <cover.1353374801.git.sgw@linux.intel.com>
In-Reply-To: <cover.1353374801.git.sgw@linux.intel.com>
References: <cover.1353374801.git.sgw@linux.intel.com>
Subject: [PATCH 01/13] libtasn1: Update to 2.14
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
X-List-Received-Date: Tue, 20 Nov 2012 01:44:29 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gnutls/{libtasn1_2.13.bb => libtasn1_2.14.bb}  |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{libtasn1_2.13.bb => libtasn1_2.14.bb} (81%)

diff --git a/meta/recipes-support/gnutls/libtasn1_2.13.bb b/meta/recipes-support/gnutls/libtasn1_2.14.bb
similarity index 81%
rename from meta/recipes-support/gnutls/libtasn1_2.13.bb
rename to meta/recipes-support/gnutls/libtasn1_2.14.bb
index 891c5b6..3f49bfa 100644
--- a/meta/recipes-support/gnutls/libtasn1_2.13.bb
+++ b/meta/recipes-support/gnutls/libtasn1_2.14.bb
@@ -14,8 +14,8 @@ SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://libtasn1_fix_for_automake_1.12.patch \
            "
 
-SRC_URI[md5sum] = "df27eaddcc46172377e6b907e33ddc83"
-SRC_URI[sha256sum] = "a56e46483d1d42fe44ba58c9758620844042468d7c2d75f6318cdf3222745a91"
+SRC_URI[md5sum] = "a08c5936f9672da9b05691785499bcc3"
+SRC_URI[sha256sum] = "bc2936cd20267859278145e563427c274d27aaae30ecdf50a04cdd4ec0153d54"
 
 inherit autotools binconfig lib_package
 
-- 
1.7.7.6



