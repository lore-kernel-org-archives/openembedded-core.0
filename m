Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E7EE70688
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 10:05:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6PA5cD3016954
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 03:05:38 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 25 Jul 2014 03:05:37 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Jul 2014 06:05:36 -0400
Message-ID: <1406282736-30238-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] alsa-lib: remove non PN based -dev packages
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
X-List-Received-Date: Fri, 25 Jul 2014 10:05:39 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

All dev related items should be packaged in the core
PN-dev package not in seperate packages.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
index cbe0448..9132072 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
@@ -31,14 +31,13 @@ EXTRA_OECONF = "--disable-python"
 
 EXTRA_OECONF_append_libc-uclibc = " --with-versioned=no "
 
-PACKAGES =+ "alsa-server libasound alsa-conf-base alsa-conf alsa-doc alsa-dev"
+PACKAGES =+ "alsa-server libasound alsa-conf-base alsa-conf alsa-doc"
 FILES_${PN} += "${libdir}/${BPN}/smixer/*.so"
 FILES_${PN}-dbg += "${libdir}/${BPN}/smixer/.debug"
 FILES_${PN}-dev += "${libdir}/${BPN}/smixer/*.la"
 FILES_libasound = "${libdir}/libasound.so.*"
 FILES_alsa-server = "${bindir}/*"
 FILES_alsa-conf = "${datadir}/alsa/"
-FILES_alsa-dev += "${libdir}/pkgconfig/ ${includedir}/alsa ${datadir}/aclocal/*"
 FILES_alsa-conf-base = "\
 ${datadir}/alsa/alsa.conf \
 ${datadir}/alsa/cards/aliases.conf \
-- 
2.0.0


