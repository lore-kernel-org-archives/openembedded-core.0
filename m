Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D5F9460962
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 06:17:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6O6H3U0020626
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 23:17:04 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Thu, 23 Jul 2015 23:16:53 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jul 2015 14:15:05 +0800
Message-ID: <1437718505-21926-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] mklibs-native: Remove dependency on dpkg
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
X-List-Received-Date: Fri, 24 Jul 2015 06:17:05 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

b18618a8[mklibs-native: two fixes] should remove the dependency
on dpkg, but it is missed, so fix it.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb
index d6905ac..59fec29 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.40.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://launchpad.net/mklibs"
 SECTION = "devel"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=98d31037b13d896e33890738ef01af64"
-DEPENDS = "python-native dpkg-native"
+DEPENDS = "python-native"
 
 SRC_URI = "http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.xz \
 	file://ac_init_fix.patch\
-- 
1.9.1


