Return-Path: <radek.dostal@streamunlimited.com>
X-Greylist: delayed 4135 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 10 Nov 2017 12:11:35 UTC
Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
	by mail.openembedded.org (Postfix) with ESMTP id E570B785D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 12:11:35 +0000 (UTC)
Received: from rdostal-desktop.sue.net (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 3yYJmS0XD2z5tlD;
	Fri, 10 Nov 2017 13:11:35 +0100 (CET)
From: =?UTF-8?q?Radek=20Dost=C3=A1l?= <radek.dostal@streamunlimited.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Nov 2017 13:11:04 +0100
Message-Id: <1510315865-8486-1-git-send-email-radek.dostal@streamunlimited.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: =?UTF-8?q?Radek=20Dost=C3=A1l?= <radek.dostal@streamunlimited.com>
Subject: [PATCH 1/2] sbc: move examples to their own package
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
X-List-Received-Date: Fri, 10 Nov 2017 12:11:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Suggested-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Radek Dostál <radek.dostal@streamunlimited.com>
---
 meta/recipes-multimedia/sbc/sbc_1.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/sbc/sbc_1.3.bb b/meta/recipes-multimedia/sbc/sbc_1.3.bb
index 2d7f31b..f6a7f8b 100644
--- a/meta/recipes-multimedia/sbc/sbc_1.3.bb
+++ b/meta/recipes-multimedia/sbc/sbc_1.3.bb
@@ -14,3 +14,6 @@ SRC_URI[md5sum] = "2d8b7841f2c11ab287718d562f2b981c"
 SRC_URI[sha256sum] = "e61022cf576f14190241e7071753fdacdce5d1dea89ffd704110fc50be689309"
 
 inherit autotools pkgconfig
+
+PACKAGES =+ "${PN}-examples"
+FILES_${PN}-examples += "${bindir}/*"
-- 
2.7.4


