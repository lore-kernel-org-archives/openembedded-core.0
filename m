Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4657E6EFFF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 05:33:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2O5XoPb021407
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 23 Mar 2014 22:33:51 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Sun, 23 Mar 2014 22:33:50 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Mar 2014 13:39:28 +0800
Message-ID: <c4b687132dcd976635a375f994f66b3a6b9242f9.1395639299.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1395639298.git.liezhi.yang@windriver.com>
References: <cover.1395639298.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 3/3] local.conf.sample.extended: update it for the archiver
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
X-List-Received-Date: Mon, 24 Mar 2014 05:33:53 -0000
Content-Type: text/plain

Add the filter license comment for archiver.bbclass.

[YOCTO #5740]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/local.conf.sample.extended | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index aa01917..048aa8b 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -214,9 +214,17 @@
 # 6) the recipe (.bb and .inc):
 #ARCHIVER_MODE[recipe] = "1"
 #
-# Whether output the .src.rpm package:
+# 7) Whether output the .src.rpm package:
 #ARCHIVER_MODE[srpm] = "1"
 #
+# 8) Filter the license, the recipe whose license in
+#    COPYLEFT_LICENSE_INCLUDE will be included, and in
+#    COPYLEFT_LICENSE_EXCLUDE will be excluded.
+#    COPYLEFT_LICENSE_INCLUDE = 'GPL* LGPL*'
+#    COPYLEFT_LICENSE_EXCLUDE = 'CLOSED Proprietary'
+# 9) The recipe type that will be archived:
+#    COPYLEFT_RECIPE_TYPES = '<type1> <type2> ...'
+#    The type can be: target native nativesdk cross crosssdk cross-canadian.
 
 # Remove the old image before the new one generated to save disk space
 #RM_OLD_IMAGE = "1"
-- 
1.8.3.1


