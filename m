Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1C7F96FAD2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 05:45:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s565jXlC023175
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Jun 2014 22:45:33 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Thu, 5 Jun 2014 22:45:32 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jun 2014 13:45:20 +0800
Message-ID: <1402033520-15324-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH] xorg-font-common.inc: remove shell debug option
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
X-List-Received-Date: Fri, 06 Jun 2014 05:45:38 -0000
Content-Type: text/plain

'set -x' is added to package postinstall scripts. It causes trace
information are printed when image first time boots such as core-image-sato.

Remove it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-graphics/xorg-font/xorg-font-common.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-font/xorg-font-common.inc b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
index d93b4ee..55adde3 100644
--- a/meta/recipes-graphics/xorg-font/xorg-font-common.inc
+++ b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
@@ -33,7 +33,6 @@ do_install_append() {
 FILES_${PN} += " ${libdir}/X11/fonts ${datadir}"
 
 pkg_postinst_${PN} () {
-        set -x
         for fontdir in `find $D/usr/lib/X11/fonts -type d`; do
                 mkfontdir $fontdir
                 mkfontscale $fontdir
-- 
1.9.1


