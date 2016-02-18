Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB6162134
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 05:28:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1I5SYlC013552
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 21:28:34 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 17 Feb 2016 21:28:34 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Feb 2016 13:29:01 +0800
Message-ID: <95da21c395ed7848afb3816345dd02ddd4abac6c.1455772181.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1455772181.git.Qi.Chen@windriver.com>
References: <cover.1455772181.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] diffstat: upgrade to 1.61
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
X-List-Received-Date: Thu, 18 Feb 2016 05:28:34 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/diffstat/{diffstat_1.60.bb => diffstat_1.61.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/diffstat/{diffstat_1.60.bb => diffstat_1.61.bb} (85%)

diff --git a/meta/recipes-devtools/diffstat/diffstat_1.60.bb b/meta/recipes-devtools/diffstat/diffstat_1.61.bb
similarity index 85%
rename from meta/recipes-devtools/diffstat/diffstat_1.60.bb
rename to meta/recipes-devtools/diffstat/diffstat_1.61.bb
index 25ba4da..0ec41c3 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.60.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.61.bb
@@ -11,8 +11,8 @@ SRC_URI = "ftp://invisible-island.net/diffstat/diffstat-${PV}.tgz \
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "ba889da4c06b547aa2d78fa96800ae6f"
-SRC_URI[sha256sum] = "2032e418b43bae70d548e32da901ebc4ac12972381de1314bebde0b126fb0123"
+SRC_URI[md5sum] = "c048a32d55d8bd6724f382baf41f325f"
+SRC_URI[sha256sum] = "25359e0c27183f997b36c9202583b5dc2df390c20e22a92606af4bf7856a55ee"
 
 S = "${WORKDIR}/diffstat-${PV}"
 
-- 
1.9.1


