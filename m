Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BFA8372C6D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 06:52:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0S6qUk0001042
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 22:52:30 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 27 Jan 2015 22:52:30 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Jan 2015 22:52:22 -0800
Message-ID: <75a2e036b765125506b99631faec029da631a61b.1422427700.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422427700.git.liezhi.yang@windriver.com>
References: <cover.1422427700.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/12] cwautomacros: fix SRC_URI and HOMEPAGE
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
X-List-Received-Date: Wed, 28 Jan 2015 06:52:29 -0000
Content-Type: text/plain

Fixed:
WARNING: Failed to fetch URL http://download.berlios.de/cwautomacros/cwautomacros-20110201.tar.bz2, attempting MIRRORS if available

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../cwautomacros/cwautomacros_20110201.bb          |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
index 4e12169..43ea3ce 100644
--- a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
+++ b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Collection of autoconf m4 macros"
 SECTION = "base"
-HOMEPAGE = "http://cwautomacros.berlios.de/"
+HOMEPAGE = "http://sourceforge.net/projects/cwautomacros.berlios/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
 
-SRC_URI = "http://download.berlios.de/cwautomacros/cwautomacros-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}.berlios/${BP}.tar.bz2"
 SRC_URI[md5sum] = "074afcb50d0a8bff10786a2954b2b02d"
 SRC_URI[sha256sum] = "3115603b891f3a163c0bbb5fea2f3742113a183fa6745ee5e89e5f6d0e9f6121"
 
-- 
1.7.9.5


