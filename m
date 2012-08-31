Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T7ODF-0005fb-UU
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 12:12:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7VA0CcP016464
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 03:00:13 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Fri, 31 Aug 2012 03:00:12 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Aug 2012 18:00:09 +0800
Message-ID: <0c731e1db781d15e97b36f8f57dfc8a2acac72be.1346406022.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346406022.git.kai.kang@windriver.com>
References: <cover.1346406022.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 5/8] libenv-perl: add it
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
X-List-Received-Date: Fri, 31 Aug 2012 10:12:30 -0000
Content-Type: text/plain

Just add it for LSB 4.1 perl tests.

[Yocto #3031]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/perl/libenv-perl_1.03.bb |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/perl/libenv-perl_1.03.bb

diff --git a/meta/recipes-extended/perl/libenv-perl_1.03.bb b/meta/recipes-extended/perl/libenv-perl_1.03.bb
new file mode 100644
index 0000000..6cc4ed4
--- /dev/null
+++ b/meta/recipes-extended/perl/libenv-perl_1.03.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Perl module that imports environment variables as scalars or arrays."
+DESCRIPTION = "Perl maintains environment variables in a special hash named %ENV. \
+For when this access method is inconvenient, the Perl module Env allows environment \
+variables to be treated as scalar or array variables."
+
+HOMEPAGE = "http://search.cpan.org/~flora/Env/"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=421c6c0cda752f4977b8287ecebf6061"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Env-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "471070589ae99415d8956e042c2f12da"
+SRC_URI[sha256sum] = "de4134ed0c4485e64e7f0fe3e65bab81917cb400cc0d316979df8322d0bdaecc"
+
+S = "${WORKDIR}/Env-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.7.5.4



