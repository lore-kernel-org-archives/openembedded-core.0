Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 89A017F357
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 18:16:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x8RIGq6p019011
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 11:16:52 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 27 Sep 2019 11:16:52 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Sep 2019 11:16:51 -0700
Message-ID: <20190927181651.72996-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] bash-completion: add image feature
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
X-List-Received-Date: Fri, 27 Sep 2019 18:16:51 -0000
Content-Type: text/plain

Create bc-pkgs image feature to load *-bash-completion packages
into an image.  The packages are created by the bash-completion
bbclass but are currently never referenced.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/classes/core-image.bbclass        | 1 +
 meta/classes/populate_sdk_base.bbclass | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index a9a2cec..2805695 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -30,6 +30,7 @@
 # - dev-pkgs            - development packages (headers, etc.) for all installed packages in the rootfs
 # - dbg-pkgs            - debug symbol packages for all installed packages in the rootfs
 # - doc-pkgs            - documentation packages for all installed packages in the rootfs
+# - bc-pkgs             - bash-completion packages for relevant packages in the rootfs
 # - ptest-pkgs          - ptest packages for all ptest-enabled recipes
 # - read-only-rootfs    - tweaks an image to support read-only rootfs
 # - splash              - bootup splash screen
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 9a3a2b4..bf8d7db 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -8,6 +8,7 @@ COMPLEMENTARY_GLOB[doc-pkgs] = '*-doc'
 COMPLEMENTARY_GLOB[dbg-pkgs] = '*-dbg'
 COMPLEMENTARY_GLOB[src-pkgs] = '*-src'
 COMPLEMENTARY_GLOB[ptest-pkgs] = '*-ptest'
+COMPLEMENTARY_GLOB[bc-pkgs] = '*-bash-completion'
 
 def complementary_globs(featurevar, d):
     all_globs = d.getVarFlags('COMPLEMENTARY_GLOB')
-- 
2.7.4


