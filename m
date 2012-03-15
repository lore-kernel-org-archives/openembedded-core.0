Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1S8Axp-0004OG-78
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 14:43:33 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2FDYkKt017153
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 06:34:46 -0700 (PDT)
Received: from build-PowerEdge-T100.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 15 Mar 2012 06:34:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Mar 2012 21:34:21 +0800
Message-ID: <a09f3df17483a2d144a07966c71b6f27a71d28d9.1331818182.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1331818182.git.liezhi.yang@windriver.com>
References: <cover.1331818182.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] upgrade logrotate: update the recipe
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
X-List-Received-Date: Thu, 15 Mar 2012 13:43:33 -0000
Content-Type: text/plain

update the recipe:
ogrotate_3.7.9.bb -> logrotate_3.8.1.bb

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{logrotate_3.7.9.bb => logrotate_3.8.1.bb}     |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/logrotate/{logrotate_3.7.9.bb => logrotate_3.8.1.bb} (72%)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.7.9.bb b/meta/recipes-extended/logrotate/logrotate_3.8.1.bb
similarity index 72%
rename from meta/recipes-extended/logrotate/logrotate_3.7.9.bb
rename to meta/recipes-extended/logrotate/logrotate_3.8.1.bb
index 40d1a38..5a8156b 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.7.9.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.8.1.bb
@@ -2,17 +2,20 @@ DESCRIPTION = "Rotates, compresses, removes and mails system log files"
 SECTION = "console/utils"
 HOMEPAGE = "https://fedorahosted.org/releases/l/o/logrotate"
 LICENSE = "GPLv2"
-PR = "r2"
+PR = "r0"
 
 DEPENDS="coreutils popt"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
 SRC_URI = "https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz \
-           file://allow-across-different-filesystems.patch"
+           file://act-as-mv-when-rotate.patch \
+           file://disable-check-different-filesystems.patch \
+           file://update-the-manual.patch \
+            "
 
-SRC_URI[md5sum] = "eeba9dbca62a9210236f4b83195e4ea5"
-SRC_URI[sha256sum] = "080caf904e70e04da16b8dfa95a5a787ec7d722ee1af18ccea437d3ffdd6fec0"
+SRC_URI[md5sum] = "bd2e20d8dc644291b08f9215397d28a5"
+SRC_URI[sha256sum] = "c12471e70ae8bc923bd5c4f25e8fd6483b68c6301f3cd79f7cfe37bc5b370169"
 
 
 EXTRA_OEMAKE = "CC='${CC}'"
-- 
1.7.4.1



