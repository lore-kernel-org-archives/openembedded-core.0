Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F16F260721
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 05:02:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6R527rr003485
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 22:02:07 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 26 Jul 2016 22:02:06 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2016 01:02:02 -0400
Message-ID: <ca348367ce951e066d14aaed4323e9cd36e8827a.1469595557.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1469595557.git.dengke.du@windriver.com>
References: <cover.1469595557.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] Asciidoc: add it
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
X-List-Received-Date: Wed, 27 Jul 2016 05:02:07 -0000
Content-Type: text/plain

In order to enable perf man pages for basic 'help' functionality,
it needs to produce man pages for perf, which depends on the xmlto
and asciidoc tools.
So add the asciidoc recipe to help produce man pages for perf and
other commands.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb

diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
new file mode 100644
index 0000000..1500b0a
--- /dev/null
+++ b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Tool for creating HTML, PDF, EPUB, man pages"
+DESCRIPTION = "AsciiDoc is a text document format for writing short documents, \
+articles, books and UNIX man pages."
+
+HOMEPAGE = "http://asciidoc.org/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
+                    file://COPYRIGHT;md5=029ad5428ba5efa20176b396222d4069"
+
+SRC_URI = "http://downloads.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz"
+SRC_URI[md5sum] = "c59018f105be8d022714b826b0be130a"
+SRC_URI[sha256sum] = "78db9d0567c8ab6570a6eff7ffdf84eadd91f2dfc0a92a2d0105d323cab4e1f0"
+
+
+inherit distutils autotools-brokensep
+
+export DESTDIR = "${D}"
+RDEPENDS_${PN} += "python" 
+BBCLASSEXTEND = "native"
-- 
2.8.1


