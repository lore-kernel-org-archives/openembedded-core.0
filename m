Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0AECD7D32D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Jun 2019 07:01:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2019 00:01:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,541,1549958400"; d="scan'208";a="180822225"
Received: from chiron.jf.intel.com ([10.54.74.38])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jun 2019 00:01:13 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Jun 2019 00:01:01 -0700
Message-Id: <20190602070101.43061-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] perl-rdepends.txt: fix perl-module-data-dumper dependencies
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
X-List-Received-Date: Sun, 02 Jun 2019 07:01:13 -0000
Content-Transfer-Encoding: 8bit

Data::Dumper depends on bytes

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt b/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
index 08722ad74c3..8d3e513ec5c 100644
--- a/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
+++ b/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
@@ -242,6 +242,7 @@ RDEPENDS_perl-module-cwd += "perl-module-errno"
 RDEPENDS_perl-module-cwd += "perl-module-exporter"
 RDEPENDS_perl-module-cwd += "perl-module-strict"
 RDEPENDS_perl-module-cwd += "perl-module-xsloader"
+RDEPENDS_perl-module-data-dumper += "perl-module-bytes"
 RDEPENDS_perl-module-data-dumper += "perl-module-config"
 RDEPENDS_perl-module-data-dumper += "perl-module-constant"
 RDEPENDS_perl-module-data-dumper += "perl-module-exporter"
-- 
2.20.1


