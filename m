Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8521E731BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 01:49:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6F1ne6q005437
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 18:49:40 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 14 Jul 2016 18:49:39 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jul 2016 09:49:35 +0800
Message-ID: <8e013c3d685df8fabf8cf5365cb47b1d4e92ee58.1468547302.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1468547302.git.Qi.Chen@windriver.com>
References: <cover.1468547302.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] byacc: upgrade to 20160606
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
X-List-Received-Date: Fri, 15 Jul 2016 01:49:39 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/byacc/{byacc_20160324.bb => byacc_20160606.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/byacc/{byacc_20160324.bb => byacc_20160606.bb} (74%)

diff --git a/meta/recipes-extended/byacc/byacc_20160324.bb b/meta/recipes-extended/byacc/byacc_20160606.bb
similarity index 74%
rename from meta/recipes-extended/byacc/byacc_20160324.bb
rename to meta/recipes-extended/byacc/byacc_20160606.bb
index cf1576e..98129d0 100644
--- a/meta/recipes-extended/byacc/byacc_20160324.bb
+++ b/meta/recipes-extended/byacc/byacc_20160606.bb
@@ -7,6 +7,6 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=74533d32ffd38bca4cbf1f1305f8bc60"
 require byacc.inc
 
-SRC_URI[md5sum] = "bde0463c6c03f059b1e6e9c5579cbe49"
-SRC_URI[sha256sum] = "178e08f7ab59edfb16d64902b7a9d78592d2d8d3ee30ab7a967188d969589b5a"
 
+SRC_URI[md5sum] = "d527c811b360f04a8c5f5a0a90625966"
+SRC_URI[sha256sum] = "cc8fdced486cb70cec7a7c9358de836bfd267d19d6456760bb4721ccfea5ac91"
-- 
1.9.1


