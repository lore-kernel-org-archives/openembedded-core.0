Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 23F4E7FA14
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 19:55:11 +0000 (UTC)
IronPort-SDR: iZZFjSJB4g3fBlr8n2xVk8SPQv8iU1N8QxV9we1D/N7LS5pQQII1jIyTBO1T9BENGlAbxiYjfK
	pZmTji08rO2KCeE7BuT67hJynOpShOx03902W7QZsFupTqrOQPYfoq+LPL1gPQSsRgPl4DdNb+
	fXA8rftszH16DkkyoxQYXn/q528/7JcLom25+2qDVbcli3OzLu+MR7mlCiyvDBpK6JYy7pmuCE
	jjZoWS4r+BbVkTnIVokpA8LS39ZeOe05B+cAu7qm6SdpsU2PynLDASrvoVV2unffcSPFdcmMuC
	nok=
X-IronPort-AV: E=Sophos;i="5.69,285,1571695200"; 
   d="scan'208";a="3245802"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Axis-NonUser-Spam: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 20:55:04 +0100
Message-Id: <20191206195504.19361-4-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206195504.19361-1-pkj@axis.com>
References: <20191206195504.19361-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [zeus][PATCH 4/4] libpng: Remove duplicate license information
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
X-List-Received-Date: Fri, 06 Dec 2019 19:55:12 -0000
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The LICENSE file contains all the license information so there is no
need to also include it from the png.h file (and additionally some
lines were left out from the latter).

License-Update: Remove duplicate license information
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/libpng/libpng_1.6.37.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
index 2ed87a8437..78f3248d73 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
@@ -2,9 +2,7 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b0085051bf265bac2bfc38bc89f50000\
-                    file://png.h;endline=144;md5=8acd23d544623816b097e07be0139509\
-                    "
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b0085051bf265bac2bfc38bc89f50000"
 DEPENDS = "zlib"
 
 LIBV = "16"
-- 
2.21.0


