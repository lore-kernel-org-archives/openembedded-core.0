Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1UGSry-0007Z2-8t
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Mar 2013 12:32:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2F847dw008694
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2013 01:04:07 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 15 Mar 2013 01:04:07 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Mar 2013 16:04:00 +0800
Message-ID: <1c60cdbe6b143f3712212a725a53e97169fc0f3e.1363333753.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1363333753.git.jackie.huang@windriver.com>
References: <cover.1363333753.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com, Jackie.Huang@windriver.com
Subject: [PATCH 1/4] python-imaging: fix PN -> BPN in do_install for multilibs
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
X-List-Received-Date: Fri, 15 Mar 2013 11:32:31 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../python/python-imaging_1.1.7.bb                 |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python-imaging_1.1.7.bb b/meta/recipes-devtools/python/python-imaging_1.1.7.bb
index a36c344..de0e975 100644
--- a/meta/recipes-devtools/python/python-imaging_1.1.7.bb
+++ b/meta/recipes-devtools/python/python-imaging_1.1.7.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://README;beginline=92;endline=120;md5=c4371af4579f1e489cf881c1443dd4ec"
 DEPENDS = "freetype jpeg tiff"
 SRCNAME = "Imaging"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://effbot.org/downloads/Imaging-${PV}.tar.gz \
            file://0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch"
@@ -25,9 +25,9 @@ do_install() {
     export STAGING_LIBDIR=${STAGING_LIBDIR}
     export STAGING_INCDIR=${STAGING_INCDIR}
     distutils_do_install
-    install -d ${D}${datadir}/doc/${PN}/html/
-    install -m 0644 ${S}/README ${D}${datadir}/doc/${PN}/
-    install -m 0644 ${S}/Docs/* ${D}${datadir}/doc/${PN}/html/
+    install -d ${D}${datadir}/doc/${BPN}/html/
+    install -m 0644 ${S}/README ${D}${datadir}/doc/${BPN}/
+    install -m 0644 ${S}/Docs/* ${D}${datadir}/doc/${BPN}/html/
 
     # get rid of #!/usr/local/bin/python
     sed -i -e 's:/usr/local/bin/:${bindir}/env :g' ${D}${bindir}/*
-- 
1.7.4.1



