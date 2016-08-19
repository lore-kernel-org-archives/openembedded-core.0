Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 55010760AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 08:00:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7J80SNu026560
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 01:00:28 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 19 Aug 2016 01:00:26 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Aug 2016 16:00:37 +0800
Message-ID: <6d6ac37f04cc87ccbf7f38bb63837e8604067023.1471593530.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1471593530.git.Qi.Chen@windriver.com>
References: <cover.1471593530.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] util-linux: upgrade to 2.28.1
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
X-List-Received-Date: Fri, 19 Aug 2016 08:00:28 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../util-linux/{util-linux_2.28.bb => util-linux_2.28.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.28.bb => util-linux_2.28.1.bb} (86%)

diff --git a/meta/recipes-core/util-linux/util-linux_2.28.bb b/meta/recipes-core/util-linux/util-linux_2.28.1.bb
similarity index 86%
rename from meta/recipes-core/util-linux/util-linux_2.28.bb
rename to meta/recipes-core/util-linux/util-linux_2.28.1.bb
index 27fa88b..f232cb9 100644
--- a/meta/recipes-core/util-linux/util-linux_2.28.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.28.1.bb
@@ -16,8 +16,8 @@ SRC_URI += "file://configure-sbindir.patch \
             file://avoid_parallel_tests.patch \
             file://uuid-test-error-api.patch \
 "
-SRC_URI[md5sum] = "e534e6ccc49107e5d31c329af798ef7d"
-SRC_URI[sha256sum] = "395847e2a18a2c317170f238892751e73a57104565344f8644090c8b091014bb"
+SRC_URI[md5sum] = "e2d863efaf4fd330a42c5efe9f1b02b4"
+SRC_URI[sha256sum] = "3ece4ea4a34ef786b68f5c415e848390424232abd1ee00f7ee5bddc30657b60f"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
 
-- 
1.9.1


