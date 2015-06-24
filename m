Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8F79875AF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 08:55:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5O8tSjP005618
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 01:55:28 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 24 Jun 2015 01:55:28 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jun 2015 01:55:21 -0700
Message-ID: <4398ed94a2a2dea64f629817086328055e75dc44.1435135356.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1435135356.git.liezhi.yang@windriver.com>
References: <cover.1435135356.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] git: 2.4.2 -> 2.4.4
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
X-List-Received-Date: Wed, 24 Jun 2015 08:55:29 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../git/{git_2.4.2.bb => git_2.4.4.bb}             |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/git/{git_2.4.2.bb => git_2.4.4.bb} (41%)

diff --git a/meta/recipes-devtools/git/git_2.4.2.bb b/meta/recipes-devtools/git/git_2.4.4.bb
similarity index 41%
rename from meta/recipes-devtools/git/git_2.4.2.bb
rename to meta/recipes-devtools/git/git_2.4.4.bb
index 0bb92a2..1834310 100644
--- a/meta/recipes-devtools/git/git_2.4.2.bb
+++ b/meta/recipes-devtools/git/git_2.4.4.bb
@@ -1,9 +1,9 @@
 require git.inc
 
-SRC_URI[tarball.md5sum] = "80e127b1bde921479d1a6c3fa697e385"
-SRC_URI[tarball.sha256sum] = "8edd564051fb776a41b4c475ed2d6105de82b674b8903a9efafe8a0633e4876e"
-SRC_URI[manpages.md5sum] = "b52251e6f859a54bf5d5a3b7682fbfbf"
-SRC_URI[manpages.sha256sum] = "114b22518dd71cc1a16018b0ff198a5ee1e6b2239381dfd6a6b9994f3da89661"
+SRC_URI[tarball.md5sum] = "f122606aee328de3e1019cde720cb0aa"
+SRC_URI[tarball.sha256sum] = "a5d9e3e340a3e5a297092430752f61a9ae5b8b5e4ac042b0341d17189e653456"
+SRC_URI[manpages.md5sum] = "285b126907d59647248577a7df01c44c"
+SRC_URI[manpages.sha256sum] = "15afc42909078909ca7a48d73b7cb358b37f734b81fc3a0c6438be183f05480f"
 
 EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes \
                  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-- 
1.7.9.5


