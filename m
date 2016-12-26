Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4143171E0C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2016 08:09:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBQ89JsR010776
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2016 00:09:20 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 26 Dec 2016 00:09:19 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Dec 2016 16:10:34 +0800
Message-ID: <ca764bbf717c216d58b7622911621e928615189e.1482739038.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1482739038.git.Qi.Chen@windriver.com>
References: <cover.1482739038.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] byacc: upgrade to 20161202
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
X-List-Received-Date: Mon, 26 Dec 2016 08:09:18 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/byacc/{byacc_20160606.bb => byacc_20161202.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/byacc/{byacc_20160606.bb => byacc_20161202.bb} (74%)

diff --git a/meta/recipes-extended/byacc/byacc_20160606.bb b/meta/recipes-extended/byacc/byacc_20161202.bb
similarity index 74%
rename from meta/recipes-extended/byacc/byacc_20160606.bb
rename to meta/recipes-extended/byacc/byacc_20161202.bb
index 98129d0..755f8ab 100644
--- a/meta/recipes-extended/byacc/byacc_20160606.bb
+++ b/meta/recipes-extended/byacc/byacc_20161202.bb
@@ -8,5 +8,5 @@ LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=74533d32ffd38bca4cbf1f13
 require byacc.inc
 
 
-SRC_URI[md5sum] = "d527c811b360f04a8c5f5a0a90625966"
-SRC_URI[sha256sum] = "cc8fdced486cb70cec7a7c9358de836bfd267d19d6456760bb4721ccfea5ac91"
+SRC_URI[md5sum] = "48ef38447f2cc864c70ef864b26cf817"
+SRC_URI[sha256sum] = "30dc58cfcdb708eea7ba022db29b41d2d392f20727491b956954366f2f2117f0"
-- 
1.9.1


