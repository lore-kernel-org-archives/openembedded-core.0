Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 49FF372A85
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 07:29:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T7Tuvc027169
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 00:29:57 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 29 Apr 2015 00:29:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Apr 2015 00:29:54 -0700
Message-ID: <a45ced86a68b142178e2d475c5073808ef3a5e31.1430292533.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1430292533.git.liezhi.yang@windriver.com>
References: <cover.1430292533.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] git: 2.3.5 -> 2.3.7
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
X-List-Received-Date: Wed, 29 Apr 2015 07:29:57 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../git/{git_2.3.5.bb => git_2.3.7.bb}             |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/git/{git_2.3.5.bb => git_2.3.7.bb} (41%)

diff --git a/meta/recipes-devtools/git/git_2.3.5.bb b/meta/recipes-devtools/git/git_2.3.7.bb
similarity index 41%
rename from meta/recipes-devtools/git/git_2.3.5.bb
rename to meta/recipes-devtools/git/git_2.3.7.bb
index f7e6af1..61248c0 100644
--- a/meta/recipes-devtools/git/git_2.3.5.bb
+++ b/meta/recipes-devtools/git/git_2.3.7.bb
@@ -1,9 +1,9 @@
 require git.inc
 
-SRC_URI[tarball.md5sum] = "8101cd7497ee64d1ed07d12541826a30"
-SRC_URI[tarball.sha256sum] = "ab88b66b71bcf1918d57f2cb9d4f4763a63d6628c8c69ab331ba77263da1f096"
-SRC_URI[manpages.md5sum] = "209ed840bb155bc6fc129675ee7bb0a2"
-SRC_URI[manpages.sha256sum] = "56a1661df8c405b1ca54ee61c6e2327af517a0e14b686abc16480f02fec69819"
+SRC_URI[tarball.md5sum] = "370cc33cc0a77a1242b95cc703228162"
+SRC_URI[tarball.sha256sum] = "250ebf19c758bcf848f23f42bc632282ba8828b8965a306ad006bfb36ac1499a"
+SRC_URI[manpages.md5sum] = "4c3b585c74bd937b80e04cba6db71da2"
+SRC_URI[manpages.sha256sum] = "079fcd6b8dad124960578fe91964a1185c99cdf024149ad50bde141600b21628"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.7.9.5


