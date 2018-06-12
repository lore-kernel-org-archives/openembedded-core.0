Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id DC05378D72
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 05:31:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jun 2018 22:31:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,213,1526367600"; d="scan'208";a="48613942"
Received: from chiron.jf.intel.com ([10.54.74.39])
	by orsmga008.jf.intel.com with ESMTP; 11 Jun 2018 22:31:14 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jun 2018 22:31:07 -0700
Message-Id: <20180612053107.52061-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH] liberror-perl: upgrade 0.17025 -> 0.17026
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
X-List-Received-Date: Tue, 12 Jun 2018 05:31:14 -0000

* Upstream release notes:
"
May 23 2018 <shlomif@shlomifish.org> (Shlomi Fish)

  Error.pm #0.17026
  - Convert to Dist-Zilla.
"

* Tested on qemux86: all tests pass

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../perl/{liberror-perl_0.17025.bb => liberror-perl_0.17026.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/perl/{liberror-perl_0.17025.bb => liberror-perl_0.17026.bb} (85%)

diff --git a/meta/recipes-devtools/perl/liberror-perl_0.17025.bb b/meta/recipes-devtools/perl/liberror-perl_0.17026.bb
similarity index 85%
rename from meta/recipes-devtools/perl/liberror-perl_0.17025.bb
rename to meta/recipes-devtools/perl/liberror-perl_0.17026.bb
index f6dc30d077..6f42b47298 100644
--- a/meta/recipes-devtools/perl/liberror-perl_0.17025.bb
+++ b/meta/recipes-devtools/perl/liberror-perl_0.17026.bb
@@ -13,8 +13,8 @@ DEPENDS += "perl"
 
 SRC_URI = "http://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/Error-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "1a2ee7f0dc44f9ee76661a16bbbc0c48"
-SRC_URI[sha256sum] = "6c9f474ad3d4fe0cabff6b6be532cb1dd348245986d4a6b600ad921d5cfdefaf"
+SRC_URI[md5sum] = "0dcd94640f617df02b6d6c1e4e92018c"
+SRC_URI[sha256sum] = "37590a962cd73ae03470e1ff16459a6cbc5273fc57626b8981dab9c2433155d9"
 
 S = "${WORKDIR}/Error-${PV}"
 
-- 
2.14.3


