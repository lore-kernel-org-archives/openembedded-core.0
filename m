Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm02.jp.fujitsu.com (unknown [202.219.69.169])
	by mail.openembedded.org (Postfix) with ESMTP id 88D9E60621
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 05:37:14 +0000 (UTC)
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [192.168.231.130]) by
	mgwkm02.jp.fujitsu.com with smtp
	id 5685_0d51_db736ca1_c442_4aa5_84c9_bf26d5a90d3e;
	Mon, 05 Jun 2017 14:37:04 +0900
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
	(g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id 14CD1AC00D4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 14:37:04 +0900 (JST)
Received: from g01jpexchyt37.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	F1FE146E50D for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 14:37:02 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt37.g01.fujitsu.local (10.128.193.67) with Microsoft SMTP
	Server id 14.3.266.1; Mon, 5 Jun 2017 14:37:02 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Jun 2017 14:38:22 +0900
Message-ID: <1496641102-4982-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] libxml-simple-perl: Upgrade to 2.24
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
X-List-Received-Date: Mon, 05 Jun 2017 05:37:16 -0000
Content-Type: text/plain

1. Upgrade libxml-simple-perl from 2.22 to 2.24

2. Update the Licence checksum due to the address of Free Software Foundation changed.
   The content of licence has no change.

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../perl/{libxml-simple-perl_2.22.bb => libxml-simple-perl_2.24.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/perl/{libxml-simple-perl_2.22.bb => libxml-simple-perl_2.24.bb} (78%)

diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.22.bb b/meta/recipes-devtools/perl/libxml-simple-perl_2.24.bb
similarity index 78%
rename from meta/recipes-devtools/perl/libxml-simple-perl_2.22.bb
rename to meta/recipes-devtools/perl/libxml-simple-perl_2.24.bb
index 2243bb2..0cf2eeb 100644
--- a/meta/recipes-devtools/perl/libxml-simple-perl_2.22.bb
+++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.24.bb
@@ -7,13 +7,13 @@ where the original uses plain Perl or SAX parsers."
 HOMEPAGE = "http://search.cpan.org/~markov/XML-LibXML-Simple-0.93/lib/XML/LibXML/Simple.pod"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fa1187fceda00eee10b62961407ea7be"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=23477e18a0d04392cdf44ae70e49b495"
 DEPENDS += "libxml-parser-perl"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Simple-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0914abddfce749453ed89b54029f2643"
-SRC_URI[sha256sum] = "b9450ef22ea9644ae5d6ada086dc4300fa105be050a2030ebd4efd28c198eb49"
+SRC_URI[md5sum] = "1cd2e8e3421160c42277523d5b2f4dd2"
+SRC_URI[sha256sum] = "9a14819fd17c75fbb90adcec0446ceab356cab0ccaff870f2e1659205dc2424f"
 
 S = "${WORKDIR}/XML-Simple-${PV}"
 
-- 
1.9.1


