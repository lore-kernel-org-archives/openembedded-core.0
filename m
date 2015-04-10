Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D15DB73D31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 09:30:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3A9UA0T002965
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 02:30:10 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 02:30:09 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Apr 2015 02:29:58 -0700
Message-ID: <b835d586570a449c4fd0b5c23f8b5ec6e8566159.1428656126.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1428656126.git.liezhi.yang@windriver.com>
References: <cover.1428656126.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/15] augeas: remove extra dev and dbg from PACKAGES
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
X-List-Received-Date: Fri, 10 Apr 2015 09:30:09 -0000
Content-Type: text/plain

There should be only one dev and dbg package.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/augeas/augeas.inc |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-extended/augeas/augeas.inc b/meta/recipes-extended/augeas/augeas.inc
index ac25326..004c998 100644
--- a/meta/recipes-extended/augeas/augeas.inc
+++ b/meta/recipes-extended/augeas/augeas.inc
@@ -14,13 +14,10 @@ DEPENDS = "readline libxml2"
 
 inherit autotools pkgconfig
 
-PACKAGES =+ "${PN}-lenses lib${BPN} lib${BPN}-dev lib${BPN}-staticdev lib${BPN}-dbg"
+PACKAGES =+ "${PN}-lenses lib${BPN}"
 
 FILES_${PN}-lenses = "${datadir}/augeas/lenses"
 FILES_lib${BPN} = "${libdir}/lib*${SOLIBS}"
-FILES_lib${BPN}-dev = "${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la ${includedir} ${libdir}/pkgconfig"
-FILES_lib${BPN}-staticdev = "${libdir}/*.a"
-FILES_lib${BPN}-dbg = "${libdir}/.debug"
 
 RDEPENDS_lib${BPN} += "${PN}-lenses"
 RRECOMMENDS_lib${BPN} += "${PN}"
-- 
1.7.9.5


