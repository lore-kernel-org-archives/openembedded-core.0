Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8F9C07D784
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 13:23:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3FDNQLS009104
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 06:23:42 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 15 Apr 2019 06:23:21 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Apr 2019 09:23:18 -0400
Message-ID: <20190415132318.150124-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH] msmtp: 1.6.6 -> 1.8.3
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
X-List-Received-Date: Mon, 15 Apr 2019 13:23:51 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update HOMEPAGE and SRC_URI.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../msmtp/{msmtp_1.6.6.bb => msmtp_1.8.3.bb}             | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.6.6.bb => msmtp_1.8.3.bb} (71%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.6.6.bb b/meta/recipes-extended/msmtp/msmtp_1.8.3.bb
similarity index 71%
rename from meta/recipes-extended/msmtp/msmtp_1.6.6.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.3.bb
index e1721936cb..d2b75ae5dc 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.6.6.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.3.bb
@@ -1,6 +1,6 @@
 SUMMARY = "msmtp is an SMTP client"
 DESCRIPTION = "A sendmail replacement for use in MTAs like mutt"
-HOMEPAGE = "http://msmtp.sourceforge.net/"
+HOMEPAGE = "https://marlam.de/msmtp/"
 SECTION = "console/network"
 
 LICENSE = "GPLv3"
@@ -9,11 +9,10 @@ DEPENDS = "zlib gnutls"
 #COPYING or Licence
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "http://sourceforge.net/projects/msmtp/files/msmtp/${PV}/${BPN}-${PV}.tar.xz \
-          "
+SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "82b0520b57db4b2cf05333d11fb5974d"
-SRC_URI[sha256sum] = "da15db1f62bd0201fce5310adb89c86188be91cd745b7cb3b62b81a501e7fb5e"
+SRC_URI[md5sum] = "0c0be51e6872e818f78bd6924636327b"
+SRC_URI[sha256sum] = "3cb2eefd33d048f0f82de100ef39a494e44fd1485e376ead31f733d2f36b92b4"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.20.0


