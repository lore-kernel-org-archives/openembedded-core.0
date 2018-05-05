Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B040874DC2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 01:36:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2018 18:36:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,364,1520924400"; d="scan'208";a="38814091"
Received: from chiron.jf.intel.com ([10.7.159.63])
	by orsmga008.jf.intel.com with ESMTP; 04 May 2018 18:36:50 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 18:36:30 -0700
Message-Id: <20180505013630.27821-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH] liburi-perl: upgrade 1.73 -> 1.74
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
X-List-Received-Date: Sat, 05 May 2018 01:36:49 -0000

Upstream release notes:

Changes for version 1.74 - 2018-04-22
avoid 'uninitialized' warning in URI::File when host has no domain name set (PR#53, thanks Shoichi Kaji!)

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../perl/{liburi-perl_1.73.bb => liburi-perl_1.74.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/perl/{liburi-perl_1.73.bb => liburi-perl_1.74.bb} (87%)

diff --git a/meta/recipes-devtools/perl/liburi-perl_1.73.bb b/meta/recipes-devtools/perl/liburi-perl_1.74.bb
similarity index 87%
rename from meta/recipes-devtools/perl/liburi-perl_1.73.bb
rename to meta/recipes-devtools/perl/liburi-perl_1.74.bb
index 49238f3df5..a7cfa0fbe3 100644
--- a/meta/recipes-devtools/perl/liburi-perl_1.73.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_1.74.bb
@@ -13,8 +13,8 @@ DEPENDS += "perl"
 
 SRC_URI = "http://www.cpan.org/authors/id/E/ET/ETHER/URI-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "37d44a08e599aa945b32a9434ffe00a5"
-SRC_URI[sha256sum] = "cca7ab4a6f63f3ccaacae0f2e1337e8edf84137e73f18548ec7d659f23efe413"
+SRC_URI[md5sum] = "892f7183b178af40f205ba37128225db"
+SRC_URI[sha256sum] = "a9c254f45f89cb1dd946b689dfe433095404532a4543bdaab0b71ce0fdcdd53d"
 
 S = "${WORKDIR}/URI-${PV}"
 
-- 
2.14.3


