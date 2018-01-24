Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EC0017874E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 05:26:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2018 21:26:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,405,1511856000"; d="scan'208";a="21871088"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by orsmga003.jf.intel.com with ESMTP; 23 Jan 2018 21:26:55 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jan 2018 21:26:43 -0800
Message-Id: <20180124052643.17027-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] liburi-perl: upgrade 1.72 -> 1.73
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
X-List-Received-Date: Wed, 24 Jan 2018 05:26:54 -0000

Changes:
1.73      2018-01-09 06:42:51Z
    - Update documentation for URI::_punycode (GH Issue #45)

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../perl/{liburi-perl_1.72.bb => liburi-perl_1.73.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/perl/{liburi-perl_1.72.bb => liburi-perl_1.73.bb} (85%)

diff --git a/meta/recipes-devtools/perl/liburi-perl_1.72.bb b/meta/recipes-devtools/perl/liburi-perl_1.73.bb
similarity index 85%
rename from meta/recipes-devtools/perl/liburi-perl_1.72.bb
rename to meta/recipes-devtools/perl/liburi-perl_1.73.bb
index a399c10b5ca..7cdf6dc61dc 100644
--- a/meta/recipes-devtools/perl/liburi-perl_1.72.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_1.73.bb
@@ -13,8 +13,8 @@ DEPENDS += "perl"
 
 SRC_URI = "http://www.cpan.org/authors/id/E/ET/ETHER/URI-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "cd56d81ed429efaa97e7f3ff08851b48"
-SRC_URI[sha256sum] = "35f14431d4b300de4be1163b0b5332de2d7fbda4f05ff1ed198a8e9330d40a32"
+SRC_URI[md5sum] = "37d44a08e599aa945b32a9434ffe00a5"
+SRC_URI[sha256sum] = "cca7ab4a6f63f3ccaacae0f2e1337e8edf84137e73f18548ec7d659f23efe413"
 
 S = "${WORKDIR}/URI-${PV}"
 
-- 
2.13.6


