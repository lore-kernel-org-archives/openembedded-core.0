Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A482A71E68
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 05:37:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1K5bNd8024470
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 21:37:23 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 19 Feb 2015 21:37:23 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Feb 2015 21:37:19 -0800
Message-ID: <1480f116a943114fff3d942b54a6807d51e0dd2a.1424410597.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1424410597.git.liezhi.yang@windriver.com>
References: <cover.1424410597.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] python-git: 0.3.3 -> 0.3.6
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
X-List-Received-Date: Fri, 20 Feb 2015 05:37:22 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{python-git_0.3.3.bb => python-git_0.3.6.bb}   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-git_0.3.3.bb => python-git_0.3.6.bb} (85%)

diff --git a/meta/recipes-devtools/python/python-git_0.3.3.bb b/meta/recipes-devtools/python/python-git_0.3.6.bb
similarity index 85%
rename from meta/recipes-devtools/python/python-git_0.3.3.bb
rename to meta/recipes-devtools/python/python-git_0.3.6.bb
index 860c37b..80cdd7c 100644
--- a/meta/recipes-devtools/python/python-git_0.3.3.bb
+++ b/meta/recipes-devtools/python/python-git_0.3.6.bb
@@ -11,8 +11,8 @@ DEPENDS = "python-gitdb"
 
 SRC_URI = "http://pypi.python.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "c9fdde02c476c11168fd620659496aba"
-SRC_URI[sha256sum] = "08193acf4e22b57a471cde3748ebce7c17e0f15f1e5042db74ca2c5e9e3e4db5"
+SRC_URI[md5sum] = "87404ab9e0fcee81e660e932b3d9f2c6"
+SRC_URI[sha256sum] = "f3f42ca085eedbd3a9956b5e639de58bbe77a119f6b3d5c3af27669a2322c4a9"
 
 S = "${WORKDIR}/GitPython-${PV}"
 
-- 
1.7.9.5


