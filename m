Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2738C76214
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 09:07:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6O971Ai000705
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 02:07:01 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Fri, 24 Jul 2015 02:06:50 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jul 2015 17:08:01 +0800
Message-ID: <e2834cf1206c3cbd109458a93156bba6aa208a2f.1437728803.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437728803.git.Qi.Chen@windriver.com>
References: <cover.1437728803.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/3] diffstat: upgrade to 1.60
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
X-List-Received-Date: Fri, 24 Jul 2015 09:07:01 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/diffstat/{diffstat_1.59.bb => diffstat_1.60.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/diffstat/{diffstat_1.59.bb => diffstat_1.60.bb} (84%)

diff --git a/meta/recipes-devtools/diffstat/diffstat_1.59.bb b/meta/recipes-devtools/diffstat/diffstat_1.60.bb
similarity index 84%
rename from meta/recipes-devtools/diffstat/diffstat_1.59.bb
rename to meta/recipes-devtools/diffstat/diffstat_1.60.bb
index f599622b..29c32a8 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.59.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.60.bb
@@ -11,8 +11,8 @@ SRC_URI = "ftp://invisible-island.net/diffstat/diffstat-${PV}.tgz \
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "1dc7bc48ce846a0686a1af0d091ff8fb"
-SRC_URI[sha256sum] = "267d1441b8889cbefbb7ca7dfd4a17f6c8bc73bc114904c74ecad945a3dbf270"
+SRC_URI[md5sum] = "ba889da4c06b547aa2d78fa96800ae6f"
+SRC_URI[sha256sum] = "2032e418b43bae70d548e32da901ebc4ac12972381de1314bebde0b126fb0123"
 
 S = "${WORKDIR}/diffstat-${PV}"
 
-- 
1.9.1


