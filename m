Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5648373CC9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 08:31:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3A8VXpC016199
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 01:31:33 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 01:31:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Apr 2015 01:31:29 -0700
Message-ID: <9c09efd348229a8dd1ac6ad2388beed38c504802.1428654657.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1428654657.git.liezhi.yang@windriver.com>
References: <cover.1428654657.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] git: 2.3.1 -> 2.3.5
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
X-List-Received-Date: Fri, 10 Apr 2015 08:31:32 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../git/{git_2.3.1.bb => git_2.3.5.bb}             |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/git/{git_2.3.1.bb => git_2.3.5.bb} (41%)

diff --git a/meta/recipes-devtools/git/git_2.3.1.bb b/meta/recipes-devtools/git/git_2.3.5.bb
similarity index 41%
rename from meta/recipes-devtools/git/git_2.3.1.bb
rename to meta/recipes-devtools/git/git_2.3.5.bb
index ebece81..f7e6af1 100644
--- a/meta/recipes-devtools/git/git_2.3.1.bb
+++ b/meta/recipes-devtools/git/git_2.3.5.bb
@@ -1,9 +1,9 @@
 require git.inc
 
-SRC_URI[tarball.md5sum] = "a6673b9c297ff16cd573c4ff0bba34af"
-SRC_URI[tarball.sha256sum] = "a447b8912ab6e9efd05bdd2e4bbb1e7f55498b0d2b92e03319c06efea7b6e46f"
-SRC_URI[manpages.md5sum] = "aed07476a8323fa0be964a310f4be402"
-SRC_URI[manpages.sha256sum] = "89b4c81306fe77ea745292586efba42507bacced079e3ca015e85fbe244d13b8"
+SRC_URI[tarball.md5sum] = "8101cd7497ee64d1ed07d12541826a30"
+SRC_URI[tarball.sha256sum] = "ab88b66b71bcf1918d57f2cb9d4f4763a63d6628c8c69ab331ba77263da1f096"
+SRC_URI[manpages.md5sum] = "209ed840bb155bc6fc129675ee7bb0a2"
+SRC_URI[manpages.sha256sum] = "56a1661df8c405b1ca54ee61c6e2327af517a0e14b686abc16480f02fec69819"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.7.9.5


