Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C5F66E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 09:07:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3E97F1b010247
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 02:07:15 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 02:07:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Apr 2015 02:07:11 -0700
Message-ID: <cac6d67a574be6d54e347e8cb21ab26c646d59d0.1429002381.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429002381.git.liezhi.yang@windriver.com>
References: <cover.1429002381.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] python-git: 0.3.6 -> 1.0.0
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
X-List-Received-Date: Tue, 14 Apr 2015 09:07:14 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{python-git_0.3.6.bb => python-git_1.0.0.bb}   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-git_0.3.6.bb => python-git_1.0.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python-git_0.3.6.bb b/meta/recipes-devtools/python/python-git_1.0.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python-git_0.3.6.bb
rename to meta/recipes-devtools/python/python-git_1.0.0.bb
index 80cdd7c..eea1543 100644
--- a/meta/recipes-devtools/python/python-git_0.3.6.bb
+++ b/meta/recipes-devtools/python/python-git_1.0.0.bb
@@ -11,8 +11,8 @@ DEPENDS = "python-gitdb"
 
 SRC_URI = "http://pypi.python.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "87404ab9e0fcee81e660e932b3d9f2c6"
-SRC_URI[sha256sum] = "f3f42ca085eedbd3a9956b5e639de58bbe77a119f6b3d5c3af27669a2322c4a9"
+SRC_URI[md5sum] = "c3833aad16d5660436e284d597ec1bec"
+SRC_URI[sha256sum] = "c1b3e6fdd209040b6b1cb32ecbff989eeb2fb31b4e7078c3342d71ae8ef7352b"
 
 S = "${WORKDIR}/GitPython-${PV}"
 
-- 
1.7.9.5


