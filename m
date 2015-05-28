Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 554817568E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 09:57:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t4S9vSfj007549
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 02:57:28 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 May 2015 02:57:28 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 May 2015 02:57:21 -0700
Message-ID: <2bbf36fae34b4815d447ace766e603d06e2f5ddc.1432805258.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1432805258.git.liezhi.yang@windriver.com>
References: <cover.1432805258.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/9] python-git: 1.0.0 -> 1.0.1
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
X-List-Received-Date: Thu, 28 May 2015 09:57:28 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{python-git_1.0.0.bb => python-git_1.0.1.bb}   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-git_1.0.0.bb => python-git_1.0.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python-git_1.0.0.bb b/meta/recipes-devtools/python/python-git_1.0.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python-git_1.0.0.bb
rename to meta/recipes-devtools/python/python-git_1.0.1.bb
index eea1543..a78d7c8 100644
--- a/meta/recipes-devtools/python/python-git_1.0.0.bb
+++ b/meta/recipes-devtools/python/python-git_1.0.1.bb
@@ -11,8 +11,8 @@ DEPENDS = "python-gitdb"
 
 SRC_URI = "http://pypi.python.org/packages/source/G/GitPython/GitPython-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "c3833aad16d5660436e284d597ec1bec"
-SRC_URI[sha256sum] = "c1b3e6fdd209040b6b1cb32ecbff989eeb2fb31b4e7078c3342d71ae8ef7352b"
+SRC_URI[md5sum] = "4659644b42c41e5e5170c0cd83ed6422"
+SRC_URI[sha256sum] = "9c88c17bbcae2a445ff64024ef13526224f70e35e38c33416be5ceb56ca7f760"
 
 S = "${WORKDIR}/GitPython-${PV}"
 
-- 
1.7.9.5


