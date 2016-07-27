Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4FA617319F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 05:51:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6R5ppWP003609
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 22:51:51 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 26 Jul 2016 22:51:50 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2016 13:52:07 +0800
Message-ID: <80d72a61a1aa719b221f0ce3005effd1e9d237e1.1469598081.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1469598081.git.Qi.Chen@windriver.com>
References: <cover.1469598081.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] python3-setuptools: extend to nativesdk
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
X-List-Received-Date: Wed, 27 Jul 2016 05:51:51 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/python/python3-setuptools_22.0.5.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools_22.0.5.bb b/meta/recipes-devtools/python/python3-setuptools_22.0.5.bb
index fb2931c..90c242d 100644
--- a/meta/recipes-devtools/python/python3-setuptools_22.0.5.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_22.0.5.bb
@@ -2,6 +2,7 @@ require python-setuptools.inc
 
 DEPENDS += "python3"
 DEPENDS_class-native += "python3-native"
+DEPENDS_class-nativesdk += "python3-nativesdk"
 
 inherit distutils3
 
@@ -14,11 +15,11 @@ do_install_append() {
     echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
 }
 
-RDEPENDS_${PN} = "\
+RDEPENDS_${PN}_class-native = "\
   python3-distutils \
   python3-compression \
 "
-RDEPENDS_${PN}_class-target = "\
+RDEPENDS_${PN} = "\
   python3-ctypes \
   python3-distutils \
   python3-email \
@@ -34,4 +35,4 @@ RDEPENDS_${PN}_class-target = "\
   python3-unittest \
   python3-xml \
 "
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


