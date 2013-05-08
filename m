Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1UZzj8-00023d-Ci
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 10:28:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4889poU004681
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 May 2013 01:09:51 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 8 May 2013 01:09:51 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 May 2013 04:09:48 -0400
Message-ID: <8732fa034710d25711e38bba35749d5af4cae89c.1368000473.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1368000473.git.wenzong.fan@windriver.com>
References: <cover.1368000473.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libtool-nativesdk: rename to nativesdk-libtool
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
X-List-Received-Date: Wed, 08 May 2013 08:28:39 -0000
X-List-Received-Date: Wed, 08 May 2013 08:28:39 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Rename nativesdk item to prefix vs suffix. Some minor changes for
getting it works after renamed:

    * append patches dir 'libtool/' to FILESEXTRAPATHS
    * update ${S}, append '${datadir}/libtool/*' to FILES_${PN}

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 ...tivesdk_2.4.2.bb => nativesdk-libtool_2.4.2.bb} |    6 ++++++
 1 file changed, 6 insertions(+)
 rename meta/recipes-devtools/libtool/{libtool-nativesdk_2.4.2.bb => nativesdk-libtool_2.4.2.bb} (86%)

diff --git a/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.2.bb b/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.2.bb
similarity index 86%
rename from meta/recipes-devtools/libtool/libtool-nativesdk_2.4.2.bb
rename to meta/recipes-devtools/libtool/nativesdk-libtool_2.4.2.bb
index 03854f2..7b5c97a 100644
--- a/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.2.bb
+++ b/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.2.bb
@@ -1,11 +1,17 @@
 require libtool-${PV}.inc
 
 PR = "${INC_PR}.0"
+
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/libtool:"
+
 SRC_URI += "file://prefix.patch"
 SRC_URI += "file://fixinstall.patch"
 
 inherit nativesdk
 
+S = "${WORKDIR}/libtool-${PV}"
+FILES_${PN} += "${datadir}/libtool/*"
+
 do_configure_prepend () {
 	# Remove any existing libtool m4 since old stale versions would break
 	# any upgrade
-- 
1.7.9.5



