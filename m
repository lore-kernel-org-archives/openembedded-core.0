Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 751C07951C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 08:07:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7N87E5G010259
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 01:07:14 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 23 Aug 2018 01:07:13 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Aug 2018 16:11:46 +0800
Message-ID: <1ef4dd31b77f519c2655c508d891824d06c4817e.1535011880.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1535011880.git.Qi.Chen@windriver.com>
References: <cover.1535011880.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] util-linux: upgrade 2.32 -> 2.32.1
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
X-List-Received-Date: Thu, 23 Aug 2018 08:07:13 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../util-linux/{util-linux_2.32.bb => util-linux_2.32.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.32.bb => util-linux_2.32.1.bb} (84%)

diff --git a/meta/recipes-core/util-linux/util-linux_2.32.bb b/meta/recipes-core/util-linux/util-linux_2.32.1.bb
similarity index 84%
rename from meta/recipes-core/util-linux/util-linux_2.32.bb
rename to meta/recipes-core/util-linux/util-linux_2.32.1.bb
index 4af7f87..a616d85 100644
--- a/meta/recipes-core/util-linux/util-linux_2.32.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.32.1.bb
@@ -15,8 +15,8 @@ SRC_URI += "file://configure-sbindir.patch \
             file://display_testname_for_subtest.patch \
             file://avoid_parallel_tests.patch \
 "
-SRC_URI[md5sum] = "e0d8a25853f88cd15ff557e5d8cb4ea7"
-SRC_URI[sha256sum] = "6c7397abc764e32e8159c2e96042874a190303e77adceb4ac5bd502a272a4734"
+SRC_URI[md5sum] = "9e5b1b8c1dc99455bdb6b462cf9436d9"
+SRC_URI[sha256sum] = "86e6707a379c7ff5489c218cfaf1e3464b0b95acf7817db0bc5f179e356a67b2"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
 
-- 
1.9.1


