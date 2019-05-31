Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B56E27E5DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 18:33:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 May 2019 11:32:57 -0700
X-ExtLoop1: 1
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga004.jf.intel.com with ESMTP; 31 May 2019 11:32:57 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 11:32:25 -0700
Message-Id: <20190531183225.7597-3-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190531183225.7597-1-timothy.t.orling@linux.intel.com>
References: <20190531183225.7597-1-timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] libxml-parser-perl: fix ptest dependencies
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
X-List-Received-Date: Fri, 31 May 2019 18:33:03 -0000
Content-Transfer-Encoding: 8bit

The ptests have additional dependency on:
* perl-module-filehandle
* perl-module-if
* perl-module-test

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
index 4cfd28a9dad..7c9b7696a7a 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
@@ -50,6 +50,6 @@ do_install_ptest() {
 	chown -R root:root ${D}${PTEST_PATH}/samples
 }
 
-RDEPENDS_${PN}-ptest += "perl-module-test-more"
+RDEPENDS_${PN}-ptest += "perl-module-filehandle perl-module-if perl-module-test perl-module-test-more"
 
 BBCLASSEXTEND="native nativesdk"
-- 
2.20.1


