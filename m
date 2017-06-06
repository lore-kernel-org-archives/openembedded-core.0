Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DF956780B0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 11:00:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v568Y8CR002491
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Jun 2017 01:34:53 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 6 Jun 2017 01:34:43 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Jun 2017 16:36:18 +0800
Message-ID: <1b631aef61ad9366a9c2cfdbed69d53581aba3aa.1496738086.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1496738086.git.Qi.Chen@windriver.com>
References: <cover.1496738086.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] util-linux: upgrade to 2.29.2
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
X-List-Received-Date: Tue, 06 Jun 2017 11:00:12 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../util-linux/{util-linux_2.29.1.bb => util-linux_2.29.2.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.29.1.bb => util-linux_2.29.2.bb} (86%)

diff --git a/meta/recipes-core/util-linux/util-linux_2.29.1.bb b/meta/recipes-core/util-linux/util-linux_2.29.2.bb
similarity index 86%
rename from meta/recipes-core/util-linux/util-linux_2.29.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.29.2.bb
index 1395b47..11303f8 100644
--- a/meta/recipes-core/util-linux/util-linux_2.29.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.29.2.bb
@@ -16,8 +16,8 @@ SRC_URI += "file://configure-sbindir.patch \
             file://avoid_parallel_tests.patch \
             file://uuid-test-error-api.patch \
 "
-SRC_URI[md5sum] = "0cbb6d16ab9c5736e5649ef1264bee6e"
-SRC_URI[sha256sum] = "0ce40600b934ec2fecfa6bfc4efe6982d051ba96c2832b05201347aec582f54f"
+SRC_URI[md5sum] = "63c40c2068fcbb7e1d5c1d281115d973"
+SRC_URI[sha256sum] = "accea4d678209f97f634f40a93b7e9fcad5915d1f4749f6c47bee6bf110fe8e3"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
 
-- 
1.9.1


