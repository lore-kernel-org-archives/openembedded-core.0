Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 24E1E60089
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 12:58:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t37CwFKc025753
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Apr 2015 05:58:15 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Apr 2015 05:58:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Apr 2015 05:58:14 -0700
Message-ID: <1e79cad917620e082dd3a29a55afda42f77e313b.1428410929.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1428410929.git.liezhi.yang@windriver.com>
References: <cover.1428410929.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [RFC PATCH 1/2] xz: remove xz-dev from PACKAGES
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
X-List-Received-Date: Tue, 07 Apr 2015 12:58:15 -0000
Content-Type: text/plain

There should be only one dev package which is liblzma-dev, so remove
xz-dev.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/xz/xz_5.2.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/xz/xz_5.2.0.bb b/meta/recipes-extended/xz/xz_5.2.0.bb
index 3439ec9..8c3eb13 100644
--- a/meta/recipes-extended/xz/xz_5.2.0.bb
+++ b/meta/recipes-extended/xz/xz_5.2.0.bb
@@ -8,7 +8,6 @@ SECTION = "base"
 # appears to be used for DOS builds. So we're left with GPLv2+ and PD.
 LICENSE = "GPLv2+ & GPLv3+ & LGPLv2.1+ & PD"
 LICENSE_${PN} = "GPLv2+"
-LICENSE_${PN}-dev = "GPLv2+"
 LICENSE_${PN}-staticdev = "GPLv2+"
 LICENSE_${PN}-doc = "GPLv2+"
 LICENSE_${PN}-dbg = "GPLv2+"
@@ -31,6 +30,7 @@ SRC_URI[sha256sum] = "231ef369982240bb20ed7cffa52bb12a4a297ce6871f480ab85e8a7ba9
 inherit autotools gettext
 
 PACKAGES =+ "liblzma liblzma-dev liblzma-staticdev liblzma-dbg"
+PACKAGES_remove = "xz-dev xz-staticdev"
 
 FILES_liblzma = "${libdir}/liblzma*${SOLIBS}"
 FILES_liblzma-dev = "${includedir}/lzma* ${libdir}/liblzma*${SOLIBSDEV} ${libdir}/liblzma.la ${libdir}/pkgconfig/liblzma.pc"
-- 
1.7.9.5


