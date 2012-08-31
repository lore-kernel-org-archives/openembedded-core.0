Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T7ODD-0005fB-AK
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 12:12:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7VA0AJj016410
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 03:00:10 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Fri, 31 Aug 2012 03:00:09 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Aug 2012 18:00:07 +0800
Message-ID: <8b5f22f0a557f3ee80e065be01d5ab965a3feb75.1346406022.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346406022.git.kai.kang@windriver.com>
References: <cover.1346406022.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 3/8] libpod-plainer-perl: add it
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
X-List-Received-Date: Fri, 31 Aug 2012 10:12:28 -0000
Content-Type: text/plain

LSB perl test 4.1.6-2 case all/tst_perlModPresent.pl 1 fails with:
test 190 'use Pod::Plainer;' failed

Add libpod-plainer-perl to fix it.

[Yocto #3031]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../perl/libpod-plainer-perl_1.03.bb               |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/perl/libpod-plainer-perl_1.03.bb

diff --git a/meta/recipes-extended/perl/libpod-plainer-perl_1.03.bb b/meta/recipes-extended/perl/libpod-plainer-perl_1.03.bb
new file mode 100644
index 0000000..809c740
--- /dev/null
+++ b/meta/recipes-extended/perl/libpod-plainer-perl_1.03.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Perl extension for converting Pod to old-style Pod."
+DESCRIPTION = "Pod::Plainer uses Pod::Parser which takes Pod with the (new) 'C<< .. >>' \
+constructs and returns the old(er) style with just 'C<>'; '<' and '>' are replaced by \
+'E<lt>' and 'E<gt>'. \
+\
+This can be used to pre-process Pod before using tools which do not recognise the new style Pods."
+
+HOMEPAGE = "http://search.cpan.org/dist/Pod-Plainer/"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://README;beginline=27;md5=80b4a99d477135bfcd1d0a44a041c63c"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RM/RMBARKER/Pod-Plainer-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "15d42071d6bd861cb72daa8cc3111cd3"
+SRC_URI[sha256sum] = "9d153b1d8609606a3424f07a7f4ce955af32131d484cb9602812122bb1ee745b"
+
+S = "${WORKDIR}/Pod-Plainer-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.7.5.4



