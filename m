Return-Path: <timothy.t.orling@linux.intel.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 20 Feb 2020 21:30:32 UTC
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5570760B1A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 21:30:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2020 13:23:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,465,1574150400"; d="scan'208";a="224997063"
Received: from wrath.jf.intel.com ([10.54.31.24])
	by orsmga007.jf.intel.com with ESMTP; 20 Feb 2020 13:23:27 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2020 13:23:15 -0800
Message-Id: <20200220212315.23951-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] liberror-perl: upgrade 0.17028 -> 0.17029
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Feb 2020 21:30:32 -0000
Content-Transfer-Encoding: 8bit

Upstream release notes:
"
0.17029         2020-01-28
    - Rebuild for order of 'NAME' and 'VERSION' sections in the generated
    POD documentation (see 0.001004 in
    https://metacpan.org/changes/distribution/Pod-Weaver-PluginBundle-SHLOMIF
    ).
        - VERSION used to appear before NAME.
"

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../{liberror-perl_0.17028.bb => liberror-perl_0.17029.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/perl/{liberror-perl_0.17028.bb => liberror-perl_0.17029.bb} (89%)

diff --git a/meta/recipes-devtools/perl/liberror-perl_0.17028.bb b/meta/recipes-devtools/perl/liberror-perl_0.17029.bb
similarity index 89%
rename from meta/recipes-devtools/perl/liberror-perl_0.17028.bb
rename to meta/recipes-devtools/perl/liberror-perl_0.17029.bb
index 8c6bbcba94..038808f0cd 100644
--- a/meta/recipes-devtools/perl/liberror-perl_0.17028.bb
+++ b/meta/recipes-devtools/perl/liberror-perl_0.17029.bb
@@ -32,8 +32,8 @@ RDEPENDS_${PN}-ptest += " \
 
 SRC_URI = "http://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/Error-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "ec3522c60a43a368f19c0f89e2205cb1"
-SRC_URI[sha256sum] = "3ad85c5e58b31c8903006298424a51bba39f1840e324f5ae612eabc8b935e960"
+SRC_URI[md5sum] = "6732b1c6207e4a9a3e2987c88368039a"
+SRC_URI[sha256sum] = "1a23f7913032aed6d4b68321373a3899ca66590f4727391a091ec19c95bf7adc"
 
 S = "${WORKDIR}/Error-${PV}"
 
-- 
2.24.0


