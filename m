Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0F4CE6FF5D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 02:20:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5C2Klvj008567
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2016 19:20:48 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.144) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sat, 11 Jun 2016 19:20:47 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 10:21:03 +0800
Message-ID: <1a589b2c341fdb4da7217b594f9a1ce86e3e5350.1465697985.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1465697985.git.Qi.Chen@windriver.com>
References: <cover.1465697985.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/9] byacc: upgrade to 20160324
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
X-List-Received-Date: Sun, 12 Jun 2016 02:20:47 -0000
Content-Type: text/plain

The license checksum is changed, but license type remains the same.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../byacc/{byacc_20150711.bb => byacc_20160324.bb}                 | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/byacc/{byacc_20150711.bb => byacc_20160324.bb} (58%)

diff --git a/meta/recipes-extended/byacc/byacc_20150711.bb b/meta/recipes-extended/byacc/byacc_20160324.bb
similarity index 58%
rename from meta/recipes-extended/byacc/byacc_20150711.bb
rename to meta/recipes-extended/byacc/byacc_20160324.bb
index e5b5451..cf1576e 100644
--- a/meta/recipes-extended/byacc/byacc_20150711.bb
+++ b/meta/recipes-extended/byacc/byacc_20160324.bb
@@ -4,8 +4,9 @@
 # Setting to PD as this is what the upstream has it as.
 
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=c52fb2d1b3f75b3b7534927807a1b714"
+LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=74533d32ffd38bca4cbf1f1305f8bc60"
 require byacc.inc
 
-SRC_URI[md5sum] = "2700401030583c4e9169ac7ea7d08de8"
-SRC_URI[sha256sum] = "c354e4ee14c4a1bf11e55dde9275011d14887ef066406a088b6fa56caf039248"
+SRC_URI[md5sum] = "bde0463c6c03f059b1e6e9c5579cbe49"
+SRC_URI[sha256sum] = "178e08f7ab59edfb16d64902b7a9d78592d2d8d3ee30ab7a967188d969589b5a"
+
-- 
1.9.1


