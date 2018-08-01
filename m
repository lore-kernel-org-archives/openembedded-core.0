Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B56678D9E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2018 08:03:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7183mAq006604
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2018 01:03:48 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 01:03:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2018 16:14:03 +0800
Message-ID: <c0da057ccada9bedb9e5318332694f30c7506bd5.1533111205.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1533111205.git.liezhi.yang@windriver.com>
References: <cover.1533111205.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] python3-testtools: 2.2.0 -> 2.3.0
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
X-List-Received-Date: Wed, 01 Aug 2018 08:03:47 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/python/python-testtools.inc                     | 4 ++--
 .../python/{python3-testtools_2.2.0.bb => python3-testtools_2.3.0.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-testtools_2.2.0.bb => python3-testtools_2.3.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-testtools.inc b/meta/recipes-devtools/python/python-testtools.inc
index fe1d49a..1011c98 100644
--- a/meta/recipes-devtools/python/python-testtools.inc
+++ b/meta/recipes-devtools/python/python-testtools.inc
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c9d3e8ba7141c83bfef190e0b9379a"
 
 inherit pypi
 
-SRC_URI[md5sum] = "adef817b07ba24fd6d807fd41a4f1ef4"
-SRC_URI[sha256sum] = "80f606607a6e4ce4d0e24e5b786562aa42c581906f3c070607a4265f3da65810"
+SRC_URI[md5sum] = "0f0feb915497816cb99e39437494217e"
+SRC_URI[sha256sum] = "5827ec6cf8233e0f29f51025addd713ca010061204fdea77484a2934690a0559"
 
 DEPENDS += " \
     ${PYTHON_PN}-pbr \
diff --git a/meta/recipes-devtools/python/python3-testtools_2.2.0.bb b/meta/recipes-devtools/python/python3-testtools_2.3.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-testtools_2.2.0.bb
rename to meta/recipes-devtools/python/python3-testtools_2.3.0.bb
-- 
2.7.4


