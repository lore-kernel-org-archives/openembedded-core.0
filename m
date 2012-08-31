Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T7ODE-0005fJ-I2
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 12:12:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7VA0ATv007465
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 03:00:10 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Fri, 31 Aug 2012 03:00:11 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Aug 2012 18:00:08 +0800
Message-ID: <2b3e7beffed41a1147ec3ccaa524347abbac69c7.1346406022.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346406022.git.kai.kang@windriver.com>
References: <cover.1346406022.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 4/8] libdumpvalue-perl: add it
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Aug 2012 10:12:29 -0000
Content-Type: text/plain

LSB perl test 4.1.6-2 case all/tst_perlModPresent.pl 1 fails with:
test 44 'use Dumpvalue;' failed

So add libdumpvalue-perl to fix it.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../perl/libdumpvalue-perl_1.16.bb                 |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/perl/libdumpvalue-perl_1.16.bb

diff --git a/meta/recipes-extended/perl/libdumpvalue-perl_1.16.bb b/meta/recipes-extended/perl/libdumpvalue-perl_1.16.bb
new file mode 100644
index 0000000..8476b94
--- /dev/null
+++ b/meta/recipes-extended/perl/libdumpvalue-perl_1.16.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Perl module for provides screen dump of Perl data."
+DESCRIPTION = "Perl module for provides screen dump of Perl data."
+
+HOMEPAGE = "http://search.cpan.org/~flora/Dumpvalue/"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=31013c0a67276e1ca20f358868cf99ab"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Dumpvalue-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "bef29bf25717db250929bf2b065c4183"
+SRC_URI[sha256sum] = "8204ea8f95dc6b137e225702e9bacaa23646ffa8c1c9eef45fa06a7f19f338f2"
+
+S = "${WORKDIR}/Dumpvalue-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.7.5.4



