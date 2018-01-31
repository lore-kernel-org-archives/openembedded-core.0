Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5994378883
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 07:48:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0V7mQVr007554
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 23:48:30 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 30 Jan 2018 23:48:24 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Jan 2018 02:48:12 -0500
Message-ID: <2529a9ac30f4d5df038e819fd4974e7b812fd1f6.1517383469.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1517383469.git.hongxu.jia@windriver.com>
References: <cover.1517383469.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] help2man-native: 1.47.4 -> 1.47.5
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
X-List-Received-Date: Wed, 31 Jan 2018 07:48:31 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../help2man/{help2man-native_1.47.4.bb => help2man-native_1.47.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/help2man/{help2man-native_1.47.4.bb => help2man-native_1.47.5.bb} (79%)

diff --git a/meta/recipes-devtools/help2man/help2man-native_1.47.4.bb b/meta/recipes-devtools/help2man/help2man-native_1.47.5.bb
similarity index 79%
rename from meta/recipes-devtools/help2man/help2man-native_1.47.4.bb
rename to meta/recipes-devtools/help2man/help2man-native_1.47.5.bb
index 64dc32c..2dd6d38 100644
--- a/meta/recipes-devtools/help2man/help2man-native_1.47.4.bb
+++ b/meta/recipes-devtools/help2man/help2man-native_1.47.5.bb
@@ -6,8 +6,8 @@ DEPENDS = "autoconf-native automake-native"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "544aca496a7d89de3e5d99e56a2f03d3"
-SRC_URI[sha256sum] = "d4ecf697d13f14dd1a78c5995f06459bff706fd1ce593d1c02d81667c0207753"
+SRC_URI[md5sum] = "1c886063c9e0ab463906de804596aa2f"
+SRC_URI[sha256sum] = "7ca60b2519fdbe97f463fe2df66a6188d18b514bfd44127d985f0234ee2461b1"
 
 inherit autotools native
 
-- 
2.8.1


