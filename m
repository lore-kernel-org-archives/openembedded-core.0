Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1011B75762
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 09:44:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t519i6p6019420
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Jun 2015 02:44:07 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 1 Jun 2015 02:44:06 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Jun 2015 17:44:12 +0800
Message-ID: <c77dfb129a0c43459415e90cf944fb3220936665.1433151775.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1433151775.git.Qi.Chen@windriver.com>
References: <cover.1433151775.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] util-linux: upgrade to 2.26.2
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
X-List-Received-Date: Mon, 01 Jun 2015 09:44:06 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../util-linux/{util-linux_2.26.1.bb => util-linux_2.26.2.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.26.1.bb => util-linux_2.26.2.bb} (86%)

diff --git a/meta/recipes-core/util-linux/util-linux_2.26.1.bb b/meta/recipes-core/util-linux/util-linux_2.26.2.bb
similarity index 86%
rename from meta/recipes-core/util-linux/util-linux_2.26.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.26.2.bb
index 58bc90d..fc7dc6e 100644
--- a/meta/recipes-core/util-linux/util-linux_2.26.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.26.2.bb
@@ -15,8 +15,8 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://fix-parallel-build.patch \
             ${OLDHOST} \
 "
-SRC_URI[md5sum] = "2308850946766677f3fabe0685e85de8"
-SRC_URI[sha256sum] = "22dc1c957262e2cbdfb4d524a63d5cd4f219d3ac9b5eab570fc771076799bb6e"
+SRC_URI[md5sum] = "9bdf368c395f1b70325d0eb22c7f48fb"
+SRC_URI[sha256sum] = "0e29bda142528a48a0a953c39ff63093651a4809042e1790fbd6aa8663fd9666"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
 
-- 
1.9.1


