Return-Path: <andrej.valek@siemens.com>
X-Greylist: delayed 1849 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 21 Jul 2017 15:30:07 UTC
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 2172978378
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 15:30:07 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v6LExI90000964
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 16:59:18 +0200
Received: from dev.sbt.siemens.com ([163.242.56.100])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v6LExI1L019205;
	Fri, 21 Jul 2017 16:59:18 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id BA88A11E9882;
	Fri, 21 Jul 2017 16:59:17 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jul 2017 16:59:03 +0200
Message-Id: <1500649143-16678-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] libpcre: upgrade 8.40 -> 8.41
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
X-List-Received-Date: Fri, 21 Jul 2017 15:30:09 -0000

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-support/libpcre/{libpcre_8.40.bb => libpcre_8.41.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.40.bb => libpcre_8.41.bb} (95%)

diff --git a/meta/recipes-support/libpcre/libpcre_8.40.bb b/meta/recipes-support/libpcre/libpcre_8.41.bb
similarity index 95%
rename from meta/recipes-support/libpcre/libpcre_8.40.bb
rename to meta/recipes-support/libpcre/libpcre_8.41.bb
index 8563cd1..2f6d8c2 100644
--- a/meta/recipes-support/libpcre/libpcre_8.40.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.41.bb
@@ -14,8 +14,8 @@ SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar.bz2 \
            file://Makefile \
 "
 
-SRC_URI[md5sum] = "41a842bf7dcecd6634219336e2167d1d"
-SRC_URI[sha256sum] = "00e27a29ead4267e3de8111fcaa59b132d0533cdfdbdddf4b0604279acbcf4f4"
+SRC_URI[md5sum] = "c160d22723b1670447341b08c58981c1"
+SRC_URI[sha256sum] = "e62c7eac5ae7c0e7286db61ff82912e1c0b7a0c13706616e94a7dd729321b530"
 
 S = "${WORKDIR}/pcre-${PV}"
 
-- 
2.1.4


