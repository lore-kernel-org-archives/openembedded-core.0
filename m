Return-Path: <Jibin.Xu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 59C3674598
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 08:53:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4L8rJmV024403
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 01:53:35 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 21 May 2018 01:53:09 -0700
From: Jibin Xu <jibin.xu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 May 2018 01:53:06 -0700
Message-ID: <20180521085306.112262-1-jibin.xu@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH] wget: upgrade 1.19.4 -> 1.19.5
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
X-List-Received-Date: Mon, 21 May 2018 08:53:44 -0000
Content-Type: text/plain

Signed-off-by: Jibin Xu <jibin.xu@windriver.com>
---
 meta/recipes-extended/wget/{wget_1.19.4.bb => wget_1.19.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/wget/{wget_1.19.4.bb => wget_1.19.5.bb} (60%)

diff --git a/meta/recipes-extended/wget/wget_1.19.4.bb b/meta/recipes-extended/wget/wget_1.19.5.bb
similarity index 60%
rename from meta/recipes-extended/wget/wget_1.19.4.bb
rename to meta/recipes-extended/wget/wget_1.19.5.bb
index fb7cce5a20..e37d8c7847 100644
--- a/meta/recipes-extended/wget/wget_1.19.4.bb
+++ b/meta/recipes-extended/wget/wget_1.19.5.bb
@@ -3,7 +3,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
           "
 
-SRC_URI[md5sum] = "a2a2c1dc4ac5003fc25a8e60b4a9464e"
-SRC_URI[sha256sum] = "93fb96b0f48a20ff5be0d9d9d3c4a986b469cb853131f9d5fe4cc9cecbc8b5b5"
+SRC_URI[md5sum] = "2db6f03d655041f82eb64b8c8a1fa7da"
+SRC_URI[sha256sum] = "b39212abe1a73f2b28f4c6cb223c738559caac91d6e416a6d91d4b9d55c9faee"
 
 require wget.inc
-- 
2.13.0


