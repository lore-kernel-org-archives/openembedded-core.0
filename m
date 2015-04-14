Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1315C6ABF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 09:04:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3E94kAC009749
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 02:04:46 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 02:04:51 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Apr 2015 02:04:41 -0700
Message-ID: <ad1574b6fd186ac34630f35f40a5c04ebccc64f6.1429002178.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429002178.git.liezhi.yang@windriver.com>
References: <cover.1429002178.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] xz: remove liblzma-dev and liblzma-dbg from PACKAGES
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
X-List-Received-Date: Tue, 14 Apr 2015 09:04:46 -0000
Content-Type: text/plain

There should be only one dev and dbg package.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/xz/xz_5.2.1.bb |    8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-extended/xz/xz_5.2.1.bb b/meta/recipes-extended/xz/xz_5.2.1.bb
index a197f91..e0ae48f 100644
--- a/meta/recipes-extended/xz/xz_5.2.1.bb
+++ b/meta/recipes-extended/xz/xz_5.2.1.bb
@@ -14,9 +14,6 @@ LICENSE_${PN}-doc = "GPLv2+"
 LICENSE_${PN}-dbg = "GPLv2+"
 LICENSE_${PN}-locale = "GPLv2+"
 LICENSE_liblzma = "PD"
-LICENSE_liblzma-dev = "PD"
-LICENSE_liblzma-staticdev = "PD"
-LICENSE_liblzma-dbg = "PD"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
                     file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
@@ -30,12 +27,9 @@ SRC_URI[sha256sum] = "b918b6648076e74f8d7ae19db5ee663df800049e187259faf5eb997a7b
 
 inherit autotools gettext
 
-PACKAGES =+ "liblzma liblzma-dev liblzma-staticdev liblzma-dbg"
+PACKAGES =+ "liblzma"
 
 FILES_liblzma = "${libdir}/liblzma*${SOLIBS}"
-FILES_liblzma-dev = "${includedir}/lzma* ${libdir}/liblzma*${SOLIBSDEV} ${libdir}/liblzma.la ${libdir}/pkgconfig/liblzma.pc"
-FILES_liblzma-staticdev = "${libdir}/liblzma.a"
-FILES_liblzma-dbg = "${libdir}/.debug/liblzma*"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.7.9.5


