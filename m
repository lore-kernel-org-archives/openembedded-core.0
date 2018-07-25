Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8CA9E6025E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 13:16:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6PDGg40017821
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 06:16:42 -0700 (PDT)
Received: from l1.corp.ad.wrs.com (128.224.124.169) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 25 Jul 2018 06:16:29 -0700
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jul 2018 16:06:39 +0300
Message-ID: <1532523999-8955-1-git-send-email-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] lsof: upgrade 4.89 -> 4.91
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
X-List-Received-Date: Wed, 25 Jul 2018 13:16:41 -0000
Content-Type: text/plain

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-extended/lsof/{lsof_4.89.bb => lsof_4.91.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lsof/{lsof_4.89.bb => lsof_4.91.bb} (93%)

diff --git a/meta/recipes-extended/lsof/lsof_4.89.bb b/meta/recipes-extended/lsof/lsof_4.91.bb
similarity index 93%
rename from meta/recipes-extended/lsof/lsof_4.89.bb
rename to meta/recipes-extended/lsof/lsof_4.91.bb
index 14546db23c..0128de4a6e 100644
--- a/meta/recipes-extended/lsof/lsof_4.89.bb
+++ b/meta/recipes-extended/lsof/lsof_4.91.bb
@@ -15,8 +15,8 @@ SRC_URI = "http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/uni
            file://lsof-remove-host-information.patch \
           "
 
-SRC_URI[md5sum] = "1b9cd34f3fb86856a125abbf2be3a386"
-SRC_URI[sha256sum] = "81ac2fc5fdc944793baf41a14002b6deb5a29096b387744e28f8c30a360a3718"
+SRC_URI[md5sum] = "148ed410cb52e08c2adc0c60f480f11f"
+SRC_URI[sha256sum] = "c9da946a525fbf82ff80090b6d1879c38df090556f3fe0e6d782cb44172450a3"
 
 LOCALSRC = "file://${WORKDIR}/lsof_${PV}/lsof_${PV}_src.tar"
 
-- 
2.17.1


