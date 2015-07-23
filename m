Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C2A3776168
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 02:09:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6N29lBS026828
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 19:09:47 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Wed, 22 Jul 2015 19:09:46 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jul 2015 10:10:44 +0800
Message-ID: <ff03be1a9cf8ba24abe3d0de85b59788e37e3834.1437617250.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437617250.git.Qi.Chen@windriver.com>
References: <cover.1437617250.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] byacc: upgrade to 20150711
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
X-List-Received-Date: Thu, 23 Jul 2015 02:09:48 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-extended/byacc/{byacc_20141128.bb => byacc_20150711.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/byacc/{byacc_20141128.bb => byacc_20150711.bb} (58%)

diff --git a/meta/recipes-extended/byacc/byacc_20141128.bb b/meta/recipes-extended/byacc/byacc_20150711.bb
similarity index 58%
rename from meta/recipes-extended/byacc/byacc_20141128.bb
rename to meta/recipes-extended/byacc/byacc_20150711.bb
index 15c14c9..e5b5451 100644
--- a/meta/recipes-extended/byacc/byacc_20141128.bb
+++ b/meta/recipes-extended/byacc/byacc_20150711.bb
@@ -4,8 +4,8 @@
 # Setting to PD as this is what the upstream has it as.
 
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=f186cf0d59bac042b75830396ec389a3"
+LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=c52fb2d1b3f75b3b7534927807a1b714"
 require byacc.inc
 
-SRC_URI[md5sum] = "acb0ff0fb6cc414a6b50c799794b2425"
-SRC_URI[sha256sum] = "f517fc21f08c1a1f010177357df58fc64eb1131011e5dcd48c19fe44c47198d0"
+SRC_URI[md5sum] = "2700401030583c4e9169ac7ea7d08de8"
+SRC_URI[sha256sum] = "c354e4ee14c4a1bf11e55dde9275011d14887ef066406a088b6fa56caf039248"
-- 
1.9.1


