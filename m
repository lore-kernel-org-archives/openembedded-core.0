Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AC2986B590
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 09:01:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7891wC3007393
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Aug 2013 02:01:58 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 8 Aug 2013 02:01:55 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Aug 2013 17:01:51 +0800
Message-ID: <2b606315902d9e502bd3dd2e6c7610bc3995301b.1375952210.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1375952210.git.hongxu.jia@windriver.com>
References: <cover.1375952210.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] libdbi-perl: add version 1.628
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
X-List-Received-Date: Thu, 08 Aug 2013 09:01:55 -0000
Content-Type: text/plain

The DBI is a database access module for the Perl programming language.
It defines a set of methods, variables, and conventions that provide
a consistent database interface, independent of the actual database
being used.
             |<- Scope of DBI ->|
                  .-.   .--------------.   .-------------.
  .-------.       | |---| XYZ Driver   |---| XYZ Engine  |
  | Perl  |       | |   `--------------'   `-------------'
  | script|  |A|  |D|   .--------------.   .-------------.
  | using |--|P|--|B|---|Oracle Driver |---|Oracle Engine|
  | DBI   |  |I|  |I|   `--------------'   `-------------'
  | API   |       | |...
  |methods|       | |... Other drivers
  `-------'       | |...
                  `-'

[YOCTO #4128]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/perl/libdbi-perl_1.628.bb | 27 +++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta/recipes-extended/perl/libdbi-perl_1.628.bb

diff --git a/meta/recipes-extended/perl/libdbi-perl_1.628.bb b/meta/recipes-extended/perl/libdbi-perl_1.628.bb
new file mode 100644
index 0000000..c115fac
--- /dev/null
+++ b/meta/recipes-extended/perl/libdbi-perl_1.628.bb
@@ -0,0 +1,27 @@
+SUMMARY = "The Perl Database Interface"
+DESCRIPTION = "DBI is a database access Application Programming Interface \
+(API) for the Perl Language. The DBI API Specification defines a set \
+of functions, variables and conventions that provide a consistent \
+database interface independent of the actual database being used. \
+"
+HOMEPAGE = "http://search.cpan.org/dist/DBI/"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+RDEPENDS_${PN} = " perl-module-carp \
+                   perl-module-exporter \
+                   perl-module-exporter-heavy \
+                   perl-module-dynaloader \
+"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://DBI.pm;beginline=8147;endline=8151;md5=7d9e154a9ca3c093d2422f7c692d5861"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz"
+SRC_URI[md5sum] = "4273f8cc6ee3979ce448c7eb3f8a6a5a"
+SRC_URI[sha256sum] = "46c834f4ba1b28c8d8a2db8095835a67fc69a9585761523aea3a74437a969b52"
+
+S = "${WORKDIR}/DBI-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.8.1.2


