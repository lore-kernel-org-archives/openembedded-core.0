Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id D803E78AAE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 03:25:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Mar 2018 19:25:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,425,1515484800"; d="scan'208";a="179872377"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga004.jf.intel.com with ESMTP; 04 Mar 2018 19:25:48 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 19:25:16 -0800
Message-Id: <3de1cd83b03267112d9b4f9297c8f5676c0ac264.1520219828.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1520219828.git.timothy.t.orling@linux.intel.com>
References: <cover.1520219828.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH 4/6] libxml-sax-base-perl: inherit ptest-perl
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
X-List-Received-Date: Mon, 05 Mar 2018 03:25:47 -0000

* Enable ptest by inheriting new ptest-perl.bbclass

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb b/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
index cd3a5806bb..b3e01e9ace 100644
--- a/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
+++ b/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
@@ -19,6 +19,6 @@ SRC_URI[sha256sum] = "66cb355ba4ef47c10ca738bd35999723644386ac853abbeb5132841f5e
 
 S = "${WORKDIR}/XML-SAX-Base-${PV}"
 
-inherit cpan
+inherit cpan ptest-perl
 
 BBCLASSEXTEND = "native"
-- 
2.14.3


