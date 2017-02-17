Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 55E587730D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 10:59:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1HAxHWq023473
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 02:59:17 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 17 Feb 2017 02:59:17 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Feb 2017 18:59:25 +0800
Message-ID: <35cadd45b64f4f70e8538cc431589684482a6a65.1487329062.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1487329062.git.Qi.Chen@windriver.com>
References: <cover.1487329062.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] util-linux: upgrade to 2.29.1
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
X-List-Received-Date: Fri, 17 Feb 2017 10:59:17 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../util-linux/{util-linux_2.29.bb => util-linux_2.29.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.29.bb => util-linux_2.29.1.bb} (86%)

diff --git a/meta/recipes-core/util-linux/util-linux_2.29.bb b/meta/recipes-core/util-linux/util-linux_2.29.1.bb
similarity index 86%
rename from meta/recipes-core/util-linux/util-linux_2.29.bb
rename to meta/recipes-core/util-linux/util-linux_2.29.1.bb
index 80638bd..1395b47 100644
--- a/meta/recipes-core/util-linux/util-linux_2.29.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.29.1.bb
@@ -16,8 +16,8 @@ SRC_URI += "file://configure-sbindir.patch \
             file://avoid_parallel_tests.patch \
             file://uuid-test-error-api.patch \
 "
-SRC_URI[md5sum] = "07b6845f48a421ad5844aa9d58edb837"
-SRC_URI[sha256sum] = "2c59ea67cc7b564104f60532f6e0a95fe17a91acb870ba8fd7e986f273abf9e7"
+SRC_URI[md5sum] = "0cbb6d16ab9c5736e5649ef1264bee6e"
+SRC_URI[sha256sum] = "0ce40600b934ec2fecfa6bfc4efe6982d051ba96c2832b05201347aec582f54f"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
 
-- 
1.9.1


