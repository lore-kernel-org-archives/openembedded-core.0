Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T7ODI-0005g7-S3
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 12:12:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7VA0FjU007471
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 03:00:15 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Fri, 31 Aug 2012 03:00:15 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Aug 2012 18:00:11 +0800
Message-ID: <5a9f8349ad7633fa83cb937b4093b020fadb1f70.1346406022.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346406022.git.kai.kang@windriver.com>
References: <cover.1346406022.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 7/8] libi18n-collate-perl: add it
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
X-List-Received-Date: Fri, 31 Aug 2012 10:12:33 -0000
Content-Type: text/plain

This module is deprecated from perl 5.003_06.
But LSB perl test 4.1.6-2 still test it.
So add it.

[Yocto #3031]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../perl/libi18n-collate-perl_1.02.bb              |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/perl/libi18n-collate-perl_1.02.bb

diff --git a/meta/recipes-extended/perl/libi18n-collate-perl_1.02.bb b/meta/recipes-extended/perl/libi18n-collate-perl_1.02.bb
new file mode 100644
index 0000000..2722ec0
--- /dev/null
+++ b/meta/recipes-extended/perl/libi18n-collate-perl_1.02.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Perl module that compare 8-bit scalar data according to the current locale"
+DESCRIPTION = "This module provides you with objects that will collate according to \
+your national character set, provided that the POSIX setlocale() function is supported \
+on your system."
+
+HOMEPAGE = "http://search.cpan.org/~flora/I18N-Collate/"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ff6d629144a6ec1ea8c300f75760184f"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/I18N-Collate-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "72ddb6d1c59cfdf31aa3b04799b86af0"
+SRC_URI[sha256sum] = "9174506bc903eda89690394e3f45558ab7e013114227896d8569d6164648fe37"
+
+S = "${WORKDIR}/I18N-Collate-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.7.5.4



