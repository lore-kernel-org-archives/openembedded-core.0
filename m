Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T9S1N-0008PF-Sh
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 04:40:46 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q862SKF5018257
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Sep 2012 19:28:20 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Wed, 5 Sep 2012 19:28:20 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Thu, 6 Sep 2012 10:28:20 +0800
Message-ID: <ced460d87e6b7011929ef9d0d28a27acbe209be4.1346836639.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346836639.git.kai.kang@windriver.com>
References: <cover.1346836639.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] libpod-plainer-perl: add it
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
X-List-Received-Date: Thu, 06 Sep 2012 02:40:46 -0000
Content-Type: text/plain

LSB perl test 4.1.6-2 case all/tst_perlModPresent.pl 1 fails with:
test 190 'use Pod::Plainer;' failed

Add libpod-plainer-perl to fix it, but it will be deprecated in LSB 5.0.

[Yocto #3031]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../perl/libpod-plainer-perl_1.03.bb               |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta-lsb/recipes-devtools/perl/libpod-plainer-perl_1.03.bb

diff --git a/meta-lsb/recipes-devtools/perl/libpod-plainer-perl_1.03.bb b/meta-lsb/recipes-devtools/perl/libpod-plainer-perl_1.03.bb
new file mode 100644
index 0000000..809c740
--- /dev/null
+++ b/meta-lsb/recipes-devtools/perl/libpod-plainer-perl_1.03.bb
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



