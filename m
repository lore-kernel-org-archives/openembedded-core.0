Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id DD5F978AA4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 03:25:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Mar 2018 19:25:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,425,1515484800"; d="scan'208";a="179872358"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga004.jf.intel.com with ESMTP; 04 Mar 2018 19:25:42 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 19:25:14 -0800
Message-Id: <8e511cac675d5a7a6422bea8c41aee308703ee59.1520219828.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1520219828.git.timothy.t.orling@linux.intel.com>
References: <cover.1520219828.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH 2/6] libconvert-asn1-perl: inherit ptest-perl
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
X-List-Received-Date: Mon, 05 Mar 2018 03:25:42 -0000

* Enable ptest using new ptest-perl.bbclass

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
index 170e7ecdea..644d8208ec 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "74a4a78ae0c5e973100ac0a8f203a110f76fb047b79dae4fc1fd7d6814
 
 S = "${WORKDIR}/Convert-ASN1-${PV}"
 
-inherit cpan
+inherit cpan ptest-perl
 
 EXTRA_PERLFLAGS = "-I ${PERLHOSTLIB}"
 
-- 
2.14.3


