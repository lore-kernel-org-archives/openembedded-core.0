Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A5EB477EA8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 03:15:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0P3FwE9019258
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 19:15:58 -0800
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 24 Jan 2018 19:15:57 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Jan 2018 11:14:03 +0800
Message-ID: <1516850044-30860-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516850044-30860-1-git-send-email-yi.zhao@windriver.com>
References: <1516850044-30860-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [PATCH 1/2] lsb: update to 5.0
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
X-List-Received-Date: Thu, 25 Jan 2018 03:15:57 -0000
Content-Type: text/plain

The LSB test packages had been updated to 5.0 in lsbtest. We also need
to bump to version 5.0 for this recipe.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/lsb/{lsb_4.1.bb => lsb_5.0.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/lsb/{lsb_4.1.bb => lsb_5.0.bb} (96%)

diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_5.0.bb
similarity index 96%
rename from meta/recipes-extended/lsb/lsb_4.1.bb
rename to meta/recipes-extended/lsb/lsb_5.0.bb
index 0785610..df4812e 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_5.0.bb
@@ -2,7 +2,6 @@ SUMMARY = "LSB support for OpenEmbedded"
 SECTION = "console/utils"
 HOMEPAGE = "http://prdownloads.sourceforge.net/lsb"
 LICENSE = "GPLv2+"
-PR = "r2"
 
 LSB_CORE = "lsb-core-${TARGET_ARCH}"
 LSB_CORE_x86 = "lsb-core-ia32"
@@ -43,12 +42,12 @@ do_install() {
 
 	mkdir -p ${D}${base_libdir}
 	mkdir -p ${D}${sysconfdir}/lsb-release.d
-	printf "LSB_VERSION=\"core-4.1-noarch:" > ${D}${sysconfdir}/lsb-release
+	printf "LSB_VERSION=\"core-5.0-noarch:" > ${D}${sysconfdir}/lsb-release
 
 	if [ "${TARGET_ARCH}" = "i586" ] || [ "${TARGET_ARCH}" = "i686" ]; then
-		printf "core-4.1-ia32" >>  ${D}${sysconfdir}/lsb-release
+		printf "core-5.0-ia32" >>  ${D}${sysconfdir}/lsb-release
 	else
-		printf "core-4.1-${TARGET_ARCH}" >>  ${D}${sysconfdir}/lsb-release
+		printf "core-5.0-${TARGET_ARCH}" >>  ${D}${sysconfdir}/lsb-release
 	fi
 	echo "\"" >> ${D}${sysconfdir}/lsb-release
 	echo "DISTRIB_ID=${DISTRO}" >> ${D}${sysconfdir}/lsb-release
-- 
2.7.4


