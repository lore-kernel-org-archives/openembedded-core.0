Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 03AAF712B1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 01:59:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s891xuTL001837
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Sep 2014 18:59:56 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 18:59:56 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Sep 2014 09:54:00 +0800
Message-ID: <531346b6d028b51ddeef4fb834a62915f32d1676.1410227568.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410227568.git.Chong.Lu@windriver.com>
References: <cover.1410227568.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] i2c-tools: create i2c-tools-misc package for perl scripts
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
X-List-Received-Date: Tue, 09 Sep 2014 01:59:56 -0000
Content-Type: text/plain

The patch is to split those perl scripts from the main package.
Add perl to RDEPENDS_i2c-tools-misc.

Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb
index 4605414..71c98a4 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_3.1.1.bb
@@ -3,8 +3,6 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-RDEPENDS_${PN} += "perl"
-
 SRC_URI = "http://dl.lm-sensors.org/i2c-tools/releases/${BP}.tar.bz2 \
            file://Module.mk \
 "
@@ -24,3 +22,13 @@ do_install_append() {
     install -m 0644 include/linux/i2c-dev.h ${D}${includedir}/linux/i2c-dev-user.h
     rm -f ${D}${includedir}/linux/i2c-dev.h
 }
+
+PACKAGES =+ "${PN}-misc"
+FILES_${PN}-misc = "${sbindir}/i2c-stub-from-dump \
+                        ${bindir}/ddcmon \
+                        ${bindir}/decode-edid \
+                        ${bindir}/decode-dimms \
+                        ${bindir}/decode-vaio \
+                       "
+RDEPENDS_${PN} += "${PN}-misc"
+RDEPENDS_${PN}-misc += "perl"
-- 
1.9.1


