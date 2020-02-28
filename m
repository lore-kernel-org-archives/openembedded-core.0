Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E1F156197D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 15:24:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2020 07:24:22 -0800
X-IronPort-AV: E=Sophos;i="5.70,496,1574150400"; d="scan'208";a="232272131"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA256;
	28 Feb 2020 07:24:21 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 23:23:39 +0800
Message-Id: <8856aa960ff4c9c833e958082466d19259915d5f.1582902875.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
Subject: [zeus][PATCH 15/22] liberror-perl: upgrade 0.17028 -> 0.17029
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
X-List-Received-Date: Fri, 28 Feb 2020 15:24:21 -0000

From: Tim Orling <timothy.t.orling@linux.intel.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f4a520cc827187d83f2997614d893bba7d74a152)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../perl/{liberror-perl_0.17028.bb => liberror-perl_0.17029.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/perl/{liberror-perl_0.17028.bb => liberror-perl_0.17029.bb} (89%)

diff --git a/meta/recipes-devtools/perl/liberror-perl_0.17028.bb b/meta/recipes-devtools/perl/liberror-perl_0.17029.bb
similarity index 89%
rename from meta/recipes-devtools/perl/liberror-perl_0.17028.bb
rename to meta/recipes-devtools/perl/liberror-perl_0.17029.bb
index 8c6bbcb..038808f 100644
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
2.7.4


