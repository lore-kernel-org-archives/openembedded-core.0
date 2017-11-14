Return-Path: <sgw@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B138478504
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 17:05:29 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 09:05:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; d="scan'208";a="149436825"
Received: from swold-mobl2.jf.intel.com ([10.24.11.31])
	by orsmga004.jf.intel.com with ESMTP; 14 Nov 2017 09:05:28 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue, 14 Nov 2017 09:05:28 -0800
Message-Id: <20171114170528.5645-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [PATCH] package.bbclass: Add SRC_URI and HOMEPAGE to manifest
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
X-List-Received-Date: Tue, 14 Nov 2017 17:05:29 -0000

This will allow tools to be developed that create manifest based BOMs
with detailed information.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/package.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2053d46395a..c2410238682 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1387,6 +1387,8 @@ python emit_pkgdata() {
         write_if_exists(sf, pkg, 'LICENSE')
         write_if_exists(sf, pkg, 'DESCRIPTION')
         write_if_exists(sf, pkg, 'SUMMARY')
+        write_if_exists(sf, pkg, 'SRC_URI')
+        write_if_exists(sf, pkg, 'HOMEPAGE')
         write_if_exists(sf, pkg, 'RDEPENDS')
         rprov = write_if_exists(sf, pkg, 'RPROVIDES')
         write_if_exists(sf, pkg, 'RRECOMMENDS')
-- 
2.13.5


