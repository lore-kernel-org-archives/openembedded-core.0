Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DD898746A1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:47:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2U6l1gS014126
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Mar 2018 23:47:01 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 29 Mar 2018 23:47:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Mar 2018 02:46:34 -0400
Message-ID: <55bc65dc8465a619a551d50fb3158d1e1f5b7a87.1522392229.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1522392229.git.hongxu.jia@windriver.com>
References: <cover.1522392229.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] man-db: upgrade 2.8.1 -> 2.8.2
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
X-List-Received-Date: Fri, 30 Mar 2018 06:47:01 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/man-db/{man-db_2.8.1.bb => man-db_2.8.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-db/{man-db_2.8.1.bb => man-db_2.8.2.bb} (90%)

diff --git a/meta/recipes-extended/man-db/man-db_2.8.1.bb b/meta/recipes-extended/man-db/man-db_2.8.2.bb
similarity index 90%
rename from meta/recipes-extended/man-db/man-db_2.8.1.bb
rename to meta/recipes-extended/man-db/man-db_2.8.2.bb
index 528903d..87c91e8 100644
--- a/meta/recipes-extended/man-db/man-db_2.8.1.bb
+++ b/meta/recipes-extended/man-db/man-db_2.8.2.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://docs/COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343
                     file://docs/COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz"
-SRC_URI[md5sum] = "51842978e06686286421f9498d1009b7"
-SRC_URI[sha256sum] = "a6aec641ca3d9942b054cc0e9c3f05cb46a3a992bc0006795755e2fed1357f3e"
+SRC_URI[md5sum] = "300788c0939a3b41d50302b04f730fa3"
+SRC_URI[sha256sum] = "45bdff87df888ddd93dc2a68abca91a2012d6e08333a8fc7c0dfefe9cbde0c5c"
 
 DEPENDS = "libpipeline gdbm groff-native"
 
-- 
2.8.1


