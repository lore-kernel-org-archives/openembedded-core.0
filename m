Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 460E065C60
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 07:14:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6A7ExlL007630
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 00:14:59 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Jul 2015 00:14:59 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jul 2015 00:14:48 -0700
Message-ID: <3d6fded593ee51490a4df020ec695c52e8fcf1f6.1436512030.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436512030.git.liezhi.yang@windriver.com>
References: <cover.1436512030.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/12] opkg: remove do_configure_prepend
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
X-List-Received-Date: Fri, 10 Jul 2015 07:15:02 -0000
Content-Type: text/plain

There is no -Werror in libopkg/Makefile.am any more.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/opkg/opkg_0.2.4.bb |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.2.4.bb b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
index a9ba037..ec0f923 100644
--- a/meta/recipes-devtools/opkg/opkg_0.2.4.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.2.4.bb
@@ -41,11 +41,6 @@ EXTRA_OECONF = "\
   --with-opkglibdir=${OPKGLIBDIR} \
 "
 
-# Werror gives all kinds bounds issuses with gcc 4.3.3
-do_configure_prepend() {
-	sed -i -e s:-Werror::g ${S}/libopkg/Makefile.am
-}
-
 do_install_append () {
 	install -d ${D}${sysconfdir}/opkg
 	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
-- 
1.7.9.5


