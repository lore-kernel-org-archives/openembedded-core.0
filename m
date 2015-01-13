Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E09F772ACC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 12:23:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Jan 2015 04:23:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,749,1413270000"; d="scan'208";a="650376250"
Received: from ikatz2-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.18.193])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jan 2015 04:23:13 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jan 2015 12:23:05 +0000
Message-Id: <7070e59762d9f83211c40edc6b229636709d32a7.1421151750.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1421151750.git.paul.eggleton@linux.intel.com>
References: <cover.1421151750.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1421151750.git.paul.eggleton@linux.intel.com>
References: <cover.1421151750.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] libxml-simple-perl: fix LICENSE to be more accurate
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
X-List-Received-Date: Tue, 13 Jan 2015 12:23:19 -0000

XML::Simple is distributed under the same licenses as Perl itself; its
accompanying license statement also explicitly restates Artistic license
or GPL version 1 or (at your option) any later version (i.e. the same as
Perl).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb b/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb
index 1fcb322..b72afc0 100644
--- a/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb
+++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb
@@ -6,7 +6,7 @@ on top of an underlying XML parsing module to maintain XML files \
 where the original uses plain Perl or SAX parsers."
 HOMEPAGE = "http://search.cpan.org/~markov/XML-LibXML-Simple-0.93/lib/XML/LibXML/Simple.pod"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e7dbb3e2241fac8457967053fc1a1ddb"
 DEPENDS += "libxml-parser-perl"
 
-- 
1.9.3


