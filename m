Return-Path: <radek.dostal@streamunlimited.com>
Received: from bsmtp.bon.at (bsmtp.bon.at [213.33.87.14])
	by mail.openembedded.org (Postfix) with ESMTP id A46F4785DB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 12:11:38 +0000 (UTC)
Received: from rdostal-desktop.sue.net (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp.bon.at (Postfix) with ESMTPSA id 3yYJmW2hN5z5tlP;
	Fri, 10 Nov 2017 13:11:39 +0100 (CET)
From: =?UTF-8?q?Radek=20Dost=C3=A1l?= <radek.dostal@streamunlimited.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Nov 2017 13:11:05 +0100
Message-Id: <1510315865-8486-2-git-send-email-radek.dostal@streamunlimited.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510315865-8486-1-git-send-email-radek.dostal@streamunlimited.com>
References: <1510315865-8486-1-git-send-email-radek.dostal@streamunlimited.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Radek=20Dost=C3=A1l?= <radek.dostal@streamunlimited.com>
Subject: [PATCH v2 2/2] sbc: fix license
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
X-List-Received-Date: Fri, 10 Nov 2017 12:11:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sbc library itself is licensed under LGPLv2.1 or higher as mentioned in
sbc/sbc.h or any other file in sbc directory.

sbc test applications are licensed under GPLv2 or higher as mentioned in
src/sbcenc.c or any other file in src directory

Reported-by: Vladimir Koutny <vladimir.koutny@streamunlimited.com>
Signed-off-by: Radek Dostál <radek.dostal@streamunlimited.com>
---
 meta/recipes-multimedia/sbc/sbc_1.3.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/sbc/sbc_1.3.bb b/meta/recipes-multimedia/sbc/sbc_1.3.bb
index f6a7f8b..2bb895d 100644
--- a/meta/recipes-multimedia/sbc/sbc_1.3.bb
+++ b/meta/recipes-multimedia/sbc/sbc_1.3.bb
@@ -2,8 +2,12 @@ SUMMARY = "SBC Audio Codec"
 DESCRIPTION = "Bluetooth low-complexity, subband codec (SBC) library."
 HOMEPAGE = "https://www.bluez.org"
 SECTION = "libs"
-LICENSE = "GPLv2"
+LICENSE = "GPLv2+ & LGPLv2.1+"
+LICENSE_${PN} = "LGPLv2.1+"
+LICENSE_${PN}-examples = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
+                    file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
+                    file://src/sbcenc.c;beginline=1;endline=24;md5=08e7a70b127f4100ff2cd7d629147d8d \
                     file://sbc/sbc.h;beginline=1;endline=26;md5=0f57d0df22b0d40746bdd29805a4361b"
 
 DEPENDS = "libsndfile1"
-- 
2.7.4


