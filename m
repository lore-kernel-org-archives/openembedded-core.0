Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZREa-0007ky-LT
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 19:29:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MHPP2w026731
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 10:25:25 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 10:25:25 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 12:36:12 -0500
Message-ID: <8cd511d84bd86b911f464b14c84d9cb122f7f6b0.1308763995.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308763995.git.mark.hatle@windriver.com>
References: <cover.1308763995.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 18/40] modutils: Add in missing -dbg package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jun 2011 17:29:01 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-kernel/modutils/modutils_2.4.27.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/modutils/modutils_2.4.27.bb b/meta/recipes-kernel/modutils/modutils_2.4.27.bb
index 1ebc90c..9f2add3 100644
--- a/meta/recipes-kernel/modutils/modutils_2.4.27.bb
+++ b/meta/recipes-kernel/modutils/modutils_2.4.27.bb
@@ -5,7 +5,7 @@ manageable for all users, administrators and distribution maintainers."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "bison-native"
-PR = "r9"
+PR = "r10"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/modutils/v2.4/modutils-${PV}.tar.bz2 \
            file://lex.l.diff;patch=1 \
@@ -86,7 +86,7 @@ pkg_prerm_modutils-modinfo() {
 update-alternatives --remove modinfo /sbin/modinfo.24
 }
 
-PACKAGES = "modutils-depmod modutils-modinfo modutils-doc modutils"
+PACKAGES = "${PN}-dbg modutils-depmod modutils-modinfo modutils-doc modutils"
 
 FILES_modutils-depmod = "sbin/depmod.24"
 FILES_modutils-modinfo = "sbin/modinfo.24"
-- 
1.7.3.4



